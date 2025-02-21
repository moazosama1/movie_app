import 'gravatar.dart';
import 'tmdb.dart';

class Avatar {
  Gravatar? gravatar;
  Tmdb? tmdb;

  Avatar({this.gravatar, this.tmdb});

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        gravatar: json['gravatar'] == null
            ? null
            : Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
        tmdb: json['tmdb'] == null
            ? null
            : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'gravatar': gravatar?.toJson(),
        'tmdb': tmdb?.toJson(),
      };
}
