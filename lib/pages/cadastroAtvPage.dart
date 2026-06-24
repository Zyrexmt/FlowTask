import 'package:flutter/material.dart';
import 'package:modulo_d1_v1/service/taskEntry.dart';
import 'package:modulo_d1_v1/service/taskList.dart';

class CadastrarAtividade extends StatefulWidget {
  const CadastrarAtividade({super.key});

  @override
  State<CadastrarAtividade> createState() =>
      _CadastrarAtividadeState();
}

class _CadastrarAtividadeState extends State<CadastrarAtividade> {
  TextEditingController atividadeNomeController =
      TextEditingController();
  String _atividadeNome = '';
  String? _prioridade = 'Baixa';

  void initState() {
    super.initState();
  }

  Future<void> criarTask() async {
    if (atividadeNomeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Obrigatório dar nome a tarefa.')),
      );
      return;
    }
    _atividadeNome = atividadeNomeController.text.toString().trim();
    tarefas.add(
      Tarefa(
        id: proximoId++,
        nome: _atividadeNome,
        prioridade: _prioridade!,
      ),
    );

    await salvarTarefass();

    atividadeNomeController.clear();
    Navigator.of(context).pushReplacementNamed('/kanban');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededed),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Center(
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff333333),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.horizontal(),
                ),
                height: 300,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 30,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Nome da tarefa',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xff333333),
                            width: 1.5,
                          ),
                        ),
                      ),

                      controller: atividadeNomeController,
                      enabled: true,
                      obscureText: false,
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Prioridade da tarefa',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      value: _prioridade,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xff333333),
                            width: 1.5,
                          ),
                        ),
                      ),
                      items: ['Baixa', 'Média', 'Alta']
                          .map(
                            (p) => DropdownMenuItem(
                              child: Text(p),
                              value: p,
                            ),
                          )
                          .toList(),
                      onChanged: (valor) =>
                          setState(() => _prioridade = valor),
                    ),

                    SizedBox(height: 20),

                    TextButton(
                      onPressed: criarTask,
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
                        fixedSize: Size(double.infinity, 45),
                      ),
                      child: Text(
                        'CADASTRAR',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // SizedBox(height: 30),
                    // TextButton(
                    //   onPressed: () {
                    //     print(tarefas);
                    //   },
                    //   style: TextButton.styleFrom(
                    //     backgroundColor: Color(0xffa2ded0),
                    //     foregroundColor: Color(0xff333333),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadiusGeometry.circular(
                    //         8,
                    //       ),
                    //       side: BorderSide(
                    //         color: Color(0xff333333),
                    //         width: 1.5,
                    //       ),
                    //     ),
                    //     fixedSize: Size(double.infinity, 45),
                    //   ),
                    //   child: Text(
                    //     'TASKS',
                    //     style: TextStyle(
                    //       fontSize: 21,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
