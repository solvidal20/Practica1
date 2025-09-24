package com.example.activities_y_fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.widget.addTextChangedListener
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import com.example.activities_y_fragments.databinding.FragmentTextFieldsBinding

class TextFieldsFragment : Fragment() {

    private var _binding: FragmentTextFieldsBinding? = null
    private val binding get() = _binding!!

    private val sharedViewModel: SharedViewModel by activityViewModels()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentTextFieldsBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Actualiza el ViewModel en tiempo real mientras el usuario escribe.
        binding.editText.addTextChangedListener { text ->
            sharedViewModel.setSharedText(text.toString())
        }

        // El botón ahora solo muestra un resultado local en este fragment.
        binding.btnSubmit.setOnClickListener {
            val text = binding.editText.text.toString()
            binding.txtResult.visibility = View.VISIBLE
            binding.txtResult.text = "Texto actual: $text"
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}