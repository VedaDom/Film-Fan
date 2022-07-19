import '../../constants.dart';
import '../../domain/entities/actor.dart';

class ActorModel extends Actor {
  const ActorModel({
    required super.id,
    required super.name,
    required super.originalName,
    required super.profilePath,
    required super.character,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
      name: json['name'],
      originalName: json['original_name'],
      profilePath: json['profile_path'] ?? Constants.PROFILE_PLACEHOLDER,
      character: json['character'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['profile_path'] = profilePath;
    data['character'] = character;
    return data;
  }
}
