import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'taskEntry.dart';

int proximoId = 1;
List<Tarefa> tarefas = [];

Future<void> salvarTarefass() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(
    'tarefas',
    jsonEncode(tarefas.map((t) => t.toJson()).toList()),
  );
  await prefs.setInt('proximoId', proximoId);
}

Future<void> carregarTarefas() async {
  final prefs = await SharedPreferences.getInstance();
  proximoId = prefs.getInt('proximoId') ?? 1;
  final String? data = prefs.getString('tarefas');
  if (data != null) {
    final List<dynamic> jsonList = jsonDecode(data);
    tarefas = jsonList.map((e) => Tarefa.fromJson(e)).toList();
  }
}
