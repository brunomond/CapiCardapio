class Meal {

  String nome;
  double preco;
  String descricao;
  bool disponivel;

  Meal(this.nome, this.preco, this.descricao, [this.disponivel=true]);

  Map toMap() {
    Map<String, dynamic> map = {
      'nome': nome,
      'preco': preco,
      'descricao': descricao
    };

    return map;

  }

  bool ocultar(){

    this.disponivel = !this.disponivel;

    return this.disponivel;

  }
}