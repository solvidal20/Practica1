// Archivo: lib/screens/summary_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart'; // <-- 1. IMPORTAMOS LA LIBRERÍA
import '../models/ui_data.dart';
import '../main.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uiData = context.watch<UiData>();
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Colors.grey.shade700;
    final Color cardColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de tu Selección'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: cardColor,
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryRow(Icons.edit, 'Texto ingresado:', uiData.inputText, textColor),
                    _buildSummaryRow(Icons.check_box_outline_blank, 'Opción aceptada:', uiData.isChecked ? 'Sí' : 'No', textColor),
                    _buildSummaryRow(Icons.radio_button_checked, 'Preferencia:', uiData.radioOption, textColor),
                    _buildSummaryRow(Icons.notifications_none, 'Notificaciones:', uiData.isSwitchedOn ? 'Activadas' : 'Desactivadas', textColor),
                    _buildSummaryRow(Icons.play_arrow, 'Último botón:', uiData.lastButtonPressed, textColor),
                    _buildSummaryRow(Icons.replay, 'Progreso iniciado:', uiData.wasProgressStarted ? 'Sí' : 'No', textColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // 2. Lógica para compartir SIN .trimIndent()
                final summaryString = """
Resumen de mi App:
- Texto: ${uiData.inputText}
- Aceptado: ${uiData.isChecked ? 'Sí' : 'No'}
- Preferencia: ${uiData.radioOption}
- Notificaciones: ${uiData.isSwitchedOn ? 'Activadas' : 'Desactivadas'}
- Último botón: ${uiData.lastButtonPressed}
- Progreso iniciado: ${uiData.wasProgressStarted ? 'Sí' : 'No'}
""";
                Share.share(summaryString, subject: 'Mi Resumen de UI App');
              },
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text('COMPARTIR RESUMEN', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Provider.of<UiData>(context, listen: false).resetAllData();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'INICIAR NUEVAMENTE',
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 22),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}