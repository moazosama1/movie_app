class Gravatar {
  String? hash;

  Gravatar({this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
        hash: json['hash'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'hash': hash,
      };
}
