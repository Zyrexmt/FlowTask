import 'package:flutter/material.dart';
import 'package:modulo_d1_v1/service/taskEntry.dart';
import 'package:modulo_d1_v1/service/taskList.dart';

class KanbanPage extends StatefulWidget {
  const KanbanPage({super.key});

  @override
  State<KanbanPage> createState() => _KanbanPageState();
}

class _KanbanPageState extends State<KanbanPage> {
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
            SizedBox(height: 30),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          _topCard(
                            'To do',
                            'A Fazer',
                            Color(0xffededed),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff333333),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.zero,
                            ),
                            height: 500,
                            width: 130,
                            child: ListView.builder(
                              itemCount: tarefas
                                  .where((t) => t.status == 0)
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final itens = tarefas
                                    .where((t) => t.status == 0)
                                    .toList();
                                return _card(itens[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          _topCard(
                            'Doing',
                            'Em Andamento',
                            Color(0xffededed),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff333333),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.zero,
                            ),
                            height: 500,
                            width: 130,
                            child: ListView.builder(
                              itemCount: tarefas
                                  .where((t) => t.status == 1)
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final itens = tarefas
                                    .where((t) => t.status == 1)
                                    .toList();
                                return _card(itens[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          _topCard(
                            'Done',
                            'Concluído',
                            Color(0xffededed),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff333333),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.zero,
                            ),
                            height: 500,
                            width: 130,
                            child: ListView.builder(
                              itemCount: tarefas
                                  .where((t) => t.status == 2)
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final itens = tarefas
                                    .where((t) => t.status == 2)
                                    .toList();
                                return _card(itens[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed('/cadastro-atividade');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffa2ded0),
                      foregroundColor: Color(0xff333333),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          8,
                        ),
                        side: BorderSide(
                          color: Color(0xff333333),
                          width: 1.5,
                        ),
                      ),
                      fixedSize: Size(300, 45),
                    ),
                    child: Text(
                      'NOVA TAREFA',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(Tarefa tarefa) {
    Color cor;
    switch (tarefa.prioridade) {
      case 'Baixa':
        cor = Colors.green;
        break;
      case 'Média':
        cor = Colors.yellow;
        break;
      case 'Alta':
        cor = Colors.red;
        break;
      default:
        cor = Colors.grey;
    }

    return Card(
      color: cor,
      child: SizedBox(
        width: 110,
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  tarefa.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffededed),
                  ),
                  margin: EdgeInsets.only(left: 2, bottom: 3),
                  child: IconButton(
                    onPressed: () {
                      if (tarefa.status > 0) {
                        setState(() => tarefa.status--);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Não é possível retroceder mais o status dessa atividade',
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 20),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffededed),
                  ),
                  margin: EdgeInsets.only(right: 2, bottom: 3),
                  child: IconButton(
                    onPressed: () {
                      if (tarefa.status < 2) {
                        setState(() => tarefa.status++);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Não é possível avaçar mais o status dessa atividade',
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _topCard(String titulo, String subtitulo, Color cor) {
    return Container(
      alignment: Alignment.center,
      width: 130,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff333333), width: 1.5),
        borderRadius: BorderRadius.horizontal(),
        color: cor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitulo,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
