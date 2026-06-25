import 'package:flutter/material.dart';
import 'package:modulo_d1_v1/service/csvExport.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededed),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logomarca.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                color: Color(0xffaed6f1),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),

              child: Text(
                'ORGANIZAÇÃO DE TAREFAS',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 100),
            // BUTTON 1
            _linkButton(
              'Cadastar atividade',
              () => Navigator.of(
                context,
              ).pushReplacementNamed('/cadastro-atividade'),
            ),
            SizedBox(height: 70),
            // BUTTON 2
            _linkButton(
              'Ver Kanban',
              () => Navigator.of(
                context,
              ).pushReplacementNamed('/kanban'),
            ),
            SizedBox(height: 70),
            // BUTTON 3
            _linkButton('Gerar relatório', () async {
              try {
                final caminho = await exportarTarefasCSV();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('CSV exportado para: $caminho'),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao exportar: $e')),
                );
              }
            }),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget _linkButton(String titulo, VoidCallback onPressed) {
  //   return ElevatedButton(
  //     onPressed: onPressed,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.black, width: 1.5),
  //         color: Color(0xffa2ded0),
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       height: 50,
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       margin: EdgeInsets.symmetric(horizontal: 30),
  //       alignment: Alignment.center,

  //       child: Text(
  //         'Gerar relatório',
  //         style: TextStyle(fontSize: 26),
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

  Widget _linkButton(String titulo, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          color: Color(0xffa2ded0),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,

        child: Text(
          titulo,
          style: TextStyle(fontSize: 26),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
