class FavoriteRequestModel {
  String? mediaType;
  int? mediaId;
  bool? favorite;

  FavoriteRequestModel({this.mediaType, this.mediaId, this.favorite});

  factory FavoriteRequestModel.fromJson(Map<String, dynamic> json) {
    return FavoriteRequestModel(
      mediaType: json['media_type'] as String?,
      mediaId: json['media_id'] as int?,
      favorite: json['favorite'] as bool?,
    );
  }

  Map<String, dynamic>? toJson() => {
        'media_type': mediaType,
        'media_id': mediaId,
        'favorite': favorite,
      };
}
