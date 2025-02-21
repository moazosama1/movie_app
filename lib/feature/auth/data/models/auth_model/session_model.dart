class SessionModel {
  bool? success;
  String? sessionId;

  SessionModel({this.success, this.sessionId});

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        success: json['success'] as bool?,
        sessionId: json['session_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'session_id': sessionId,
      };
}
