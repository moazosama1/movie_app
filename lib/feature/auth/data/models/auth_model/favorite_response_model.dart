class FavoriteResponseModel {
  int? statusCode;
  String? statusMessage;

  FavoriteResponseModel({this.statusCode, this.statusMessage});

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteResponseModel(
      statusCode: json['status_code'] as int?,
      statusMessage: json['status_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'status_message': statusMessage,
      };
}
