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

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'prioridade': prioridade,
    'status': status,
  };

  factory Tarefa.fromJson(Map<String, dynamic> json) => Tarefa(
    id: json['id'],
    nome: json['nome'],
    prioridade: json['prioridade'],
    status: json['status'],
  );
}
