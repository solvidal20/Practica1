// Archivo: lib/pages/lists_page.dart
import 'package:flutter/material.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Usamos un Column para poder poner elementos arriba de la lista.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los textos a la izquierda
        children: [
          // 2. Título que pediste
          Text(
            'Listas',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),

          // 3. Descripción que pediste
          Text(
            'Las listas muestran elementos en forma de lista desplazable. Perfectas para mostrar múltiples ítems.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          // 4. "Lo que ya está": tu lista, pero envuelta en Expanded
          //    para que ocupe el resto del espacio sin dar error.
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Card( // Usamos Card para un mejor aspecto visual
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.label,
                      color: Colors.deepPurple,
                    ),
                    title: Text('Ítem número ${index + 1}'),
                    subtitle: Text('Esta es la descripción del ítem.'),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Hiciste tap en el ítem ${index + 1}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}