class Todo {
  int? id;
  String judul;
  String deskripsi;
  bool isDone;

  Todo({
    this.id,
    required this.judul,
    required this.deskripsi,
    required this.isDone,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        judul: json['judul'],
        deskripsi: json['deskripsi'],
        isDone: json['isDone'] ==
            1, // Assuming isDone is stored as 0 or 1 in the database
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'deskripsi': deskripsi,
        'isDone': isDone ? 1 : 0, // Storing as 0 or 1 in the database
      };
}
