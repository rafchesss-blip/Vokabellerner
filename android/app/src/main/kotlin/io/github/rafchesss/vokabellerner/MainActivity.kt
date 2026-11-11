package io.github.rafchesss.vokabellerner

import android.content.ActivityNotFoundException
import android.content.ClipData
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.net.Uri
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.io.File

class MainActivity : FlutterActivity() {
    // KI-Apps, die beim Scannen zur Auswahl stehen (Paketname → Name).
    private val aiApps = linkedMapOf(
        "com.openai.chatgpt" to "ChatGPT",
        "com.google.android.apps.bard" to "Gemini",
        "com.anthropic.claude" to "Claude",
        "com.microsoft.copilot" to "Copilot",
        "ai.perplexity.app.android" to "Perplexity",
        "com.deepseek.chat" to "DeepSeek",
        "ai.mistral.chat" to "Le Chat",
        "ai.x.grok" to "Grok",
    )

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "vokabeltrainer/ai")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "installedApps" -> result.success(installedAiApps())
                    "share" -> {
                        val ok = share(
                            call.argument<String>("package")!!,
                            call.argument<String>("image")!!,
                            call.argument<String>("text")!!,
                        )
                        result.success(ok)
                    }
                    "openStore" -> {
                        openStore(call.argument<String>("package")!!)
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun sendIntent() = Intent(Intent.ACTION_SEND).setType("image/*")

    /**
     * KI-Apps für die Auswahl: installierte (die ein geteiltes Bild annehmen)
     * mit Symbol. ChatGPT und Gemini werden auch angeboten, wenn sie fehlen –
     * dann zum Installieren (`missing`).
     */
    private fun installedAiApps(): List<Map<String, Any>> {
        val pm = packageManager
        val suggested = setOf("com.openai.chatgpt", "com.google.android.apps.bard")
        return aiApps.mapNotNull { (pkg, name) ->
            val installed = pm.queryIntentActivities(
                sendIntent().setPackage(pkg),
                PackageManager.MATCH_DEFAULT_ONLY,
            ).isNotEmpty()
            when {
                installed -> mapOf(
                    "package" to pkg,
                    "name" to name,
                    "icon" to try {
                        pngOf(pm.getApplicationIcon(pkg))
                    } catch (_: Exception) {
                        ByteArray(0)
                    },
                    "missing" to false,
                )
                pkg in suggested -> mapOf(
                    "package" to pkg,
                    "name" to name,
                    "icon" to ByteArray(0),
                    "missing" to true,
                )
                else -> null
            }
        }
    }

    private fun pngOf(drawable: android.graphics.drawable.Drawable): ByteArray {
        val size = 96
        val bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)
        drawable.setBounds(0, 0, size, size)
        drawable.draw(Canvas(bitmap))
        return ByteArrayOutputStream().use {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, it)
            it.toByteArray()
        }
    }

    /** Schickt Foto und Anleitung direkt an die gewählte App. */
    private fun share(pkg: String, imagePath: String, text: String): Boolean {
        val dir = File(cacheDir, "ai_share").apply { mkdirs() }
        val image = File(dir, "vokabeln.jpg")
        File(imagePath).copyTo(image, overwrite = true)
        val uri: Uri = FileProvider.getUriForFile(this, "$packageName.aishare", image)

        val intent = sendIntent()
            .setPackage(pkg)
            .putExtra(Intent.EXTRA_STREAM, uri)
            .putExtra(Intent.EXTRA_TEXT, text)
            .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        intent.clipData = ClipData.newUri(contentResolver, "Vokabeln", uri)
        return try {
            startActivity(intent)
            true
        } catch (_: ActivityNotFoundException) {
            false
        }
    }

    private fun openStore(pkg: String) {
        try {
            startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=$pkg")))
        } catch (_: ActivityNotFoundException) {
            startActivity(
                Intent(
                    Intent.ACTION_VIEW,
                    Uri.parse("https://play.google.com/store/apps/details?id=$pkg"),
                ),
            )
        }
    }
}
