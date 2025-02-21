class RequestTokenModel {
  bool? success;
  String? expiresAt;
  String? requestToken;

  RequestTokenModel({this.success, this.expiresAt, this.requestToken});

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      RequestTokenModel(
        success: json['success'] as bool?,
        expiresAt: json['expires_at'] as String?,
        requestToken: json['request_token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'expires_at': expiresAt,
        'request_token': requestToken,
      };
}
