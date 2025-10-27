import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/ui_data.dart'; // <-- 1. Importa tu modelo UiData
import 'pages/home_page.dart';   // Importamos la pantalla principal

void main() {
  runApp(
    // Aquí envolvemos toda la aplicación con el Provider.
    // Esto hace que tu clase 'UiData' esté disponible para cualquier
    // widget que la necesite en cualquier parte de la app.
    ChangeNotifierProvider(
      create: (context) => UiData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Demo',
      // Define los colores y estilos de la aplicación
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Le decimos a la aplicación que empiece en nuestra HomePage
      home: const HomePage(),
    );
  }
}
