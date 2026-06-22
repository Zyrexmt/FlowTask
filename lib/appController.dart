import 'package:flutter/material.dart';
import 'package:modulo_d1_v1/pages/cadastroAtvPage.dart';
import 'package:modulo_d1_v1/pages/homePage.dart';
import 'package:modulo_d1_v1/pages/kanbanPage.dart';

class Appcontroller extends StatelessWidget {
  const Appcontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      routes: {
        '/home': (context) => const HomePage(),
        '/cadastro-atividade': (context) => const CadastrarAtividade(),
        '/kanban': (context) => const KanbanPage(),
      }, initialRoute: '/home',
    );
  }
}