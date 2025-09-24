package com.example.activities_y_fragments

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
class SharedViewModel : ViewModel() {

    // Dato de TextFieldsFragment
    private val _sharedText = MutableLiveData<String>()
    val sharedText: LiveData<String> = _sharedText
    fun setSharedText(text: String) { _sharedText.value = text }

    // Datos de SelectionFragment
    private val _checkBoxState = MutableLiveData<Boolean>(false)
    val checkBoxState: LiveData<Boolean> = _checkBoxState
    fun setCheckBoxState(isChecked: Boolean) { _checkBoxState.value = isChecked }

    private val _radioOption = MutableLiveData<String>("Ninguno seleccionado")
    val radioOption: LiveData<String> = _radioOption
    fun setRadioOption(option: String) { _radioOption.value = option }

    // --- DATO QUE FALTABA PARA EL SWITCH ---
    private val _switchState = MutableLiveData<Boolean>(false)
    val switchState: LiveData<Boolean> = _switchState
    fun setSwitchState(isOn: Boolean) { _switchState.value = isOn }

    private val _lastButtonPressed = MutableLiveData<String>("Ninguno")
    val lastButtonPressed: LiveData<String> = _lastButtonPressed
    fun setLastButtonPressed(buttonName: String) { _lastButtonPressed.value = buttonName }

    private val _progressBarStarted = MutableLiveData<Boolean>(false)
    val progressBarStarted: LiveData<Boolean> = _progressBarStarted
    fun setProgressBarStarted(wasStarted: Boolean) { _progressBarStarted.value = wasStarted }

    // --- NUEVO: Función para reiniciar todos los valores ---
    fun resetAllData() {
        _sharedText.value = ""
        _checkBoxState.value = false
        _radioOption.value = "Ninguno seleccionado"
        _switchState.value = false
        _lastButtonPressed.value = "Ninguno"
        _progressBarStarted.value = false
    }
}