# Instalación de Herramientas
<img width="1355" height="721" alt="image" src="https://github.com/user-attachments/assets/7de0b2f0-461a-425a-beb0-72722c493d39" />
Github: <img width="947" height="656" alt="image" src="https://github.com/user-attachments/assets/b01c581d-bf1d-474b-883e-7aa21dafb84b" />
<img width="1194" height="559" alt="image" src="https://github.com/user-attachments/assets/9987c145-c3e4-401a-af6d-00f562fc105f" />
EDITOR:
<img width="1920" height="1032" alt="studio64_9kpNHnbyJl" src="https://github.com/user-attachments/assets/a4d8c746-5755-470c-a8cf-25e2e3514572" />


# Aplicación UI con Flutter: Elementos de Interfaz de Usuario
## Elaborado por: Beltrán Vidal Sol Jarelly

Este proyecto es una aplicación en Flutter que muestra la interacción entre diferentes Widgets para representar elementos básicos de la interfaz de usuario (UI). La aplicación contiene una estructura jerárquica que muestra cinco pantallas diferentes, cada una representando un tipo de Elemento UI.

Esta aplicación es una reimplementación de una versión nativa de Kotlin (disponible en este mismo repositorio), demostrando cómo los conceptos de Android Nativo (como Activities, Fragments y ViewModels) se traducen a la arquitectura de Flutter (Widgets, Pages y State Management con Provider).

📱 Pantalla Principal
La Activity Principal (Pantalla principal) contiene un menú de navegación inferior (BottomNavigationBar) con botones que permiten acceder a las diferentes pantallas de la aplicación.

<img width="298" height="655" alt="studio64_z1qkfa0za2" src="https://github.com/user-attachments/assets/4d39c5ef-7f66-4770-bd41-281912b6ba80" />

🧩 Pantallas (Equivalentes a Fragments)
Cada "fragmento" de la versión de Kotlin está representado por un Widget de página en Flutter. Cada uno de estos Widgets muestra un tipo de elemento UI.

1. TextFields (EditText)
Una pantalla que demuestra la entrada de texto del usuario. El texto ingresado aquí se comparte con otras pantallas usando un ChangeNotifier (UiData).

<img width="300" height="650" alt="studio64_Nh7POqdDK5" src="https://github.com/user-attachments/assets/32e11615-fa92-42e7-9a60-ef68faba88c2" />


2. Botones (Button, ImageButton)
Muestra un ElevatedButton (botón normal) y un IconButton (botón de imagen). Al presionarlos, se actualiza el estado global indicando cuál fue el último botón presionado.

<img width="299" height="653" alt="studio64_GTOxzK5gBn" src="https://github.com/user-attachments/assets/5d225b42-45a5-403b-b9a4-ca294e21595e" />


3. Elementos de selección (CheckBox, RadioButton, Switch)
Contiene un CheckboxListTile, varios RadioListTile y un SwitchListTile. Todas las selecciones del usuario se actualizan en tiempo real en el estado compartido de la aplicación.

<img width="302" height="654" alt="studio64_L91u0H9PIq" src="https://github.com/user-attachments/assets/ac57a863-1dd2-46df-861d-9ff98e91db8c" />


4. Listas (RecyclerView o ListView)
Demuestra una lista larga y desplazable de elementos. En Flutter, esto se implementa de manera eficiente usando un ListView.builder, que es el equivalente directo del RecyclerView de Android.

<img width="297" height="651" alt="studio64_Chczd5gksA" src="https://github.com/user-attachments/assets/d99b0cac-e358-45d6-be44-259a03cf4563" />


5. Elementos de información (TextView, ImageView, ProgressBar)
Esta pantalla consume datos de las otras pantallas (como el texto ingresado) y también muestra widgets de información como un LinearProgressIndicator (ProgressBar) y un Icon (ImageView).

Desde aquí, el usuario puede navegar a una pantalla de resumen final.

<img width="300" height="655" alt="studio64_XLMbBBtszl" src="https://github.com/user-attachments/assets/8e0d8d85-c25e-44b3-8abb-1028c9961f5a" />

🚀 Cómo empezar (Versión Flutter)
Asegúrate de tener el SDK de Flutter instalado.

Abre la carpeta flutter_version en tu editor (Android Studio).

Configura el SDK de Flutter en tu editor si te lo pide.

Ejecuta flutter pub get en la terminal (o usa el botón "Pub get") para descargar las dependencias.

Selecciona un dispositivo (emulador, web o teléfono físico).

¡Ejecuta la aplicación!

