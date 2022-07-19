import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final int id;
  final String name;
  final String originalName;
  final String profilePath;
  final String character;

  const Actor({
    required this.id,
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.character,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        originalName,
        profilePath,
        character,
      ];
}
