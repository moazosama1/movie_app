class GenreItem {
  int? id;
  String? name;

  GenreItem({this.id, this.name});

  factory GenreItem.fromJson(Map<String, dynamic> json) => GenreItem(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
