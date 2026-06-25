import 'dart:convert';
import 'dart:io';
import 'package:modulo_d1_v1/service/taskEntry.dart';
import 'package:modulo_d1_v1/service/taskList.dart';
import 'package:path_provider/path_provider.dart';

String _statusParaTexto(int status) {
  switch (status) {
    case 0:
      return 'A Fazer';
    case 1:
      return 'Em Progresso';
    case 2:
      return 'Concluído';
    default:
      return 'Desconhecido';
  }
}

Future<String> exportarTarefasCSV() async {
  final buffer = StringBuffer();

  buffer.writeln(
    'Nome da Atividade, Status Atual, Nível de Prioridade',
  );

  for (final tarefa in tarefas) {
    final nome = '"${tarefa.nome.replaceAll('"', '""')}"';
    final status = _statusParaTexto(tarefa.status);
    final prioridade = tarefa.prioridade;
    buffer.writeln('$nome, $status, $prioridade');
  }

  final directory = await getExternalStorageDirectory();
  final agora = DateTime.now();
  final timestamp = '${agora.year}${agora.month.toString().padLeft(2, '0')}${agora.day.toString().padLeft(2, '0')}_${agora.hour.toString().padLeft(2, '0')}${agora.minute.toString().padLeft(2, '0')}${agora.second.toString().padLeft(2, '0')}';
  final file = File('${directory!.path}/tarefas_kanban_$timestamp.csv');
  await file.writeAsString(buffer.toString(), encoding: utf8);

  return file.path;
}
