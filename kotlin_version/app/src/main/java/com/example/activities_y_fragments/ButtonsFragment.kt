// Archivo: ButtonsFragment.kt
package com.example.activities_y_fragments // Reemplaza si tu package es diferente

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.example.activities_y_fragments.databinding.FragmentButtonsBinding

class ButtonsFragment : Fragment() {

    // 1. Configuración de View Binding
    private var _binding: FragmentButtonsBinding? = null
    private val binding get() = _binding!!

    // 2. Obtención del ViewModel compartido
    private val sharedViewModel: SharedViewModel by activityViewModels()

    // 3. Inflar el layout usando View Binding
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        _binding = FragmentButtonsBinding.inflate(inflater, container, false)
        return binding.root
    }

    // 4. Configurar los listeners una vez que la vista ha sido creada
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Listener para el botón normal
        binding.btnNormal.setOnClickListener {
            // Informamos al ViewModel que este botón fue presionado
            sharedViewModel.setLastButtonPressed("Botón Normal")
            // Mostramos un resultado inmediato en este fragment
            binding.txtButtonResult.text = "Se presionó el Botón Normal"
        }

        // Listener para el botón de imagen
        binding.btnImage.setOnClickListener {
            // Informamos al ViewModel que este botón fue presionado
            sharedViewModel.setLastButtonPressed("Botón de Imagen")
            // Mostramos un resultado inmediato en este fragment
            binding.txtButtonResult.text = "Se presionó el Botón de Imagen"
        }
    }

    // 5. Limpiar la referencia al binding para evitar fugas de memoria
    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}