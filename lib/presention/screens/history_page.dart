import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _buildHistoryContent( context),
    );
  }

  Widget _buildHistoryContent(
    BuildContext context,
  ) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          _tableCellContent('X-ray', isHeader: true),
          _tableCellContent('PDF', isHeader: true),
        ]),
        for (int i = 0; i < 3; i++)
          TableRow(children: [
            _tableCellContent(Icons.photo),
            _tableCellContent('Download PDF', isButton: true, context: context),
          ]),
      ],
    );
  }

  Widget _tableCellContent(dynamic content,
      {bool isHeader = false, bool isButton = false, BuildContext? context}) {
    if (isHeader) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(content, style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    } else if (isButton) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Placeholder for your download PDF functionality
          },
          child: Text(content),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(content), // Assuming content is an IconData for icons
      );
    }
  }
}
