// Archivo: InfoFragment.kt
package com.example.activities_y_fragments // Reemplaza con tu package name si es diferente

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.example.activities_y_fragments.databinding.FragmentInfoBinding

class InfoFragment : Fragment() {

    private var _binding: FragmentInfoBinding? = null
    private val binding get() = _binding!!

    private val sharedViewModel: SharedViewModel by activityViewModels()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        _binding = FragmentInfoBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Lógica del ViewModel Compartido (sin cambios)
        sharedViewModel.sharedText.observe(viewLifecycleOwner) { text ->
            binding.txtSharedText.text = if (text.isNullOrEmpty()) {
                "No hay texto compartido"
            } else {
                getString(R.string.shared_text_format, text)
            }
        }

        // Lógica de la ProgressBar (sin cambios)
        binding.btnStartProgress.setOnClickListener {
            sharedViewModel.setProgressBarStarted(true)
            Thread {
                for (i in 1..100) {
                    Thread.sleep(50)
                    activity?.runOnUiThread {
                        binding.progressBar.progress = i
                        binding.txtProgress.text = getString(R.string.progress_format, i)
                    }
                }
            }.start()
        }

        // Lógica del ícono de información (sin cambios)
        binding.imageView.setOnClickListener {
            if (binding.txtImageInfo.visibility == View.VISIBLE) {
                // Si ya está visible, lo ocultamos
                binding.txtImageInfo.visibility = View.GONE
            } else {
                // Si está oculto, lo hacemos visible y CAMBIAMOS EL TEXTO
                binding.txtImageInfo.visibility = View.VISIBLE
                binding.txtImageInfo.text = "Este es un ícono de información. Representa detalles adicionales sobre la aplicación."
            }

            // Animación opcional para darle un toque visual
            it.animate().scaleX(1.1f).scaleY(1.1f).setDuration(150).withEndAction {
                it.animate().scaleX(1.0f).scaleY(1.0f).setDuration(150).start()
            }.start()
        }

        // --- Lógica para lanzar la nueva Activity de resumen (CORREGIDA) ---
        binding.btnShowSummary.setOnClickListener {
            val intent = Intent(requireActivity(), SummaryActivity::class.java).apply {
                // Obtenemos todos los datos del ViewModel
                val currentText = sharedViewModel.sharedText.value ?: "No se ha ingresado texto"
                val isChecked = sharedViewModel.checkBoxState.value ?: false
                val radioOption = sharedViewModel.radioOption.value ?: "Ninguno seleccionado"
                val isSwitchedOn = sharedViewModel.switchState.value ?: false

                // Añadimos todos los datos al Intent
                putExtra("USER_TEXT", currentText)
                putExtra("CHECKBOX_STATE", isChecked)
                putExtra("RADIO_OPTION", radioOption)
                putExtra("SWITCH_STATE", isSwitchedOn)
                putExtra("LAST_BUTTON", sharedViewModel.lastButtonPressed.value ?: "Ninguno")
                putExtra("PROGRESS_STARTED", sharedViewModel.progressBarStarted.value ?: false)
            }
            startActivity(intent)
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}