class Tarefa {
  int id;
  String nome;
  String prioridade;
  int status;

  Tarefa({
    required this.id,
    required this.nome,
    required this.prioridade,
    this.status = 0,
  });

  @override
  String toString() {
    return 'Tarefa(id: $id, nome: $nome, prioridade: $prioridade, status: $status)';
  }
}
