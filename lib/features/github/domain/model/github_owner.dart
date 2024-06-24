import 'package:equatable/equatable.dart';
import 'package:ultimate_flutter_project/database/entity/github_owner_entity.dart';

class GithubOwner extends Equatable {
  const GithubOwner({
    this.id = -1,
    this.name = "",
    this.avatarUrl = "",
    this.description = "",
    this.isFavorite = false,
  });

  factory GithubOwner.fromMap(Map<String, dynamic> map) {
    return GithubOwner(
      id: map['id'] as int? ?? -1,
      name: map['login'] as String? ?? "",
      avatarUrl: map['avatar_url'] as String? ?? "",
      description: map['bio'] as String? ?? "",
    );
  }

  factory GithubOwner.fromEntity(GithubOwnerEntity entity) => GithubOwner(
        id: entity.id,
        name: entity.name ?? "",
        avatarUrl: entity.avatarUrl ?? "",
        description: entity.description ?? "",
        isFavorite: true,
      );

  final int id;
  final String name;
  final String avatarUrl;
  final String description;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        id,
        name,
        avatarUrl,
        description,
      ];

  GithubOwner copyWith({
    int? id,
    String? name,
    String? avatarUrl,
    String? description,
    bool? isFavorite,
  }) {
    return GithubOwner(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is GithubOwner &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          avatarUrl == other.avatarUrl &&
          description == other.description &&
          isFavorite == other.isFavorite;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      avatarUrl.hashCode ^
      description.hashCode ^
      isFavorite.hashCode;
}
