// Archivo: SelectionFragment.kt
package com.example.activities_y_fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.RadioButton
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.example.activities_y_fragments.databinding.FragmentSelectionBinding

class SelectionFragment : Fragment() {

    // 1. Configuración de View Binding
    private var _binding: FragmentSelectionBinding? = null
    private val binding get() = _binding!!

    // 2. Obtención del ViewModel compartido
    private val sharedViewModel: SharedViewModel by activityViewModels()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        _binding = FragmentSelectionBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // 3. Lógica para actualizar el ViewModel en tiempo real
        binding.checkBox.setOnCheckedChangeListener { _, isChecked ->
            sharedViewModel.setCheckBoxState(isChecked)
        }
        binding.radioGroup.setOnCheckedChangeListener { _, checkedId ->
            if (checkedId != -1) {
                val selectedRadioButton: RadioButton = view.findViewById(checkedId)
                sharedViewModel.setRadioOption(selectedRadioButton.text.toString())
            }
        }

        binding.switch1.setOnCheckedChangeListener { _, isChecked ->
            sharedViewModel.setSwitchState(isChecked)
        }

        // 4. Lógica CORREGIDA para el botón "Mostrar seleccion"
        binding.btnShowSelection.setOnClickListener {
            // Obtenemos los datos actuales desde el ViewModel
            val isChecked = sharedViewModel.checkBoxState.value ?: false
            val radioOption = sharedViewModel.radioOption.value ?: "Ninguno seleccionado"
            val isSwitchedOn = sharedViewModel.switchState.value ?: false

            val selectionText = """
                CheckBox: ${if (isChecked) "Sí" else "No"}
                Radio: $radioOption
                Switch: ${if (isSwitchedOn) "ON" else "OFF"}
            """.trimIndent()

            // Mostramos el resultado en el TextView del fragment
            binding.txtSelectionResult.text = selectionText
            binding.txtSelectionResult.visibility = View.VISIBLE
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}