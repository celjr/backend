class UsuarioModel {
  int? id;
  String? name;
  String? email;
  String? password;
  bool? isActived;
  DateTime? dtCreated;
  DateTime? dtUpdated;

  UsuarioModel();

  UsuarioModel.create({
    required this.id,
    required this.name,
    required this.email,
    required this.isActived,
    required this.dtCreated,
    required this.dtUpdated,
  });

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel.create(
      id: map['id']?.toInt() ?? 0,
      name: map['nome'] ?? '',
      email: map['email'] ?? '',
      isActived: map['is_ativo'] == 1,
      dtCreated: map['dt_criacao'],
      dtUpdated: map['dt_autalizacao'],
    );
  }
  factory UsuarioModel.fromRequest(Map map) {
    return UsuarioModel()
      ..name = map['name']
      ..email = map['email']
      ..password = map['password'];
  }

  factory UsuarioModel.fromEmail(Map map) {
    return UsuarioModel()
      ..id = map['id'].toInt()
      ..password = map['password'];
  }
  @override
  String toString() {
    return 'UsuarioModel(id: $id, name: $name, email: $email, isActived: $isActived, dtCreated: $dtCreated, dtUpdated: $dtUpdated)';
  }
}
