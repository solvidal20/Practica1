// Archivo: SummaryActivity.kt
package com.example.activities_y_fragments // Reemplaza si tu package es diferente

import android.content.Intent
import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.example.activities_y_fragments.databinding.ActivitySummaryBinding

class SummaryActivity : AppCompatActivity() {

    private lateinit var binding: ActivitySummaryBinding
    // Obtenemos el ViewModel para poder usar su función de reinicio
    private val sharedViewModel: SharedViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 1. Inflar el layout con ViewBinding
        binding = ActivitySummaryBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // 2. Recibir TODOS los datos del Intent
        val userText = intent.getStringExtra("USER_TEXT") ?: "N/A"
        val isChecked = intent.getBooleanExtra("CHECKBOX_STATE", false)
        val radioOption = intent.getStringExtra("RADIO_OPTION") ?: "N/A"
        val isSwitchedOn = intent.getBooleanExtra("SWITCH_STATE", false)
        val lastButton = intent.getStringExtra("LAST_BUTTON") ?: "Ninguno"
        val progressStarted = intent.getBooleanExtra("PROGRESS_STARTED", false)

        // 3. Poblar la UI de la tarjeta con todos los datos recibidos
        binding.txtSummaryText.text = "Texto ingresado: $userText"
        binding.txtSummaryCheckbox.text = "Opción aceptada: ${if (isChecked) "Sí" else "No"}"
        binding.txtSummaryRadio.text = "Preferencia: $radioOption"
        binding.txtSummarySwitch.text = "Notificaciones: ${if (isSwitchedOn) "Activadas" else "Desactivadas"}"
        binding.txtSummaryButton.text = "Último botón: $lastButton"
        binding.txtSummaryProgress.text = "Progreso iniciado: ${if (progressStarted) "Sí" else "No"}"

        // Lógica para los íconos
        val checkboxIcon = if (isChecked) android.R.drawable.checkbox_on_background else android.R.drawable.checkbox_off_background
        binding.imgSummaryCheckbox.setImageResource(checkboxIcon)

        val switchIcon = if (isSwitchedOn) R.drawable.ic_notifications_active else R.drawable.ic_notifications_off
        binding.imgSummarySwitch.setImageResource(switchIcon)

        // 4. Programar el botón de compartir
        binding.btnShareSummary.setOnClickListener {
            val summaryString = """
                ¡Resumen de mi App!
                - Texto: $userText
                - Aceptado: ${if (isChecked) "Sí" else "No"}
                - Preferencia: $radioOption
                - Notificaciones: ${if (isSwitchedOn) "Activadas" else "Desactivadas"}
                - Último botón: $lastButton
                - Progreso iniciado: ${if (progressStarted) "Sí" else "No"}
            """.trimIndent()

            val shareIntent = Intent().apply {
                action = Intent.ACTION_SEND
                putExtra(Intent.EXTRA_TEXT, summaryString)
                type = "text/plain"
            }
            startActivity(Intent.createChooser(shareIntent, "Compartir resumen con..."))
        }

        // 5. Programar el botón de reiniciar
        binding.btnRestart.setOnClickListener {
            // Reiniciamos todos los datos en el ViewModel
            sharedViewModel.resetAllData()

            // Creamos un Intent para volver a MainActivity
            val intent = Intent(this, MainActivity::class.java).apply {
                // Estas "banderas" limpian las pantallas anteriores y evitan crear una nueva MainActivity
                flags = Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP
                // Enviamos una señal para que sepa que debe ir al primer fragment
                putExtra("GO_TO_FRAGMENT", R.id.nav_textfields)
            }
            startActivity(intent)
            finish() // Cierra la SummaryActivity para que no quede en el historial
        }
    }
}