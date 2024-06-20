import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';

@Entity(tableName: 'owner', primaryKeys: ['id'])
class GithubOwnerEntity extends Equatable {
  const GithubOwnerEntity({
    this.id = -1,
    this.name,
    this.avatarUrl,
    this.description,
    this.isFavorite = false,
  });

  factory GithubOwnerEntity.fromOwner({
    required GithubOwner value,
  }) =>
      GithubOwnerEntity(
        id: value.id,
        name: value.name,
        avatarUrl: value.avatarUrl,
        description: value.description,
      );

  final int id;
  final String? name;
  @ColumnInfo(name: "avatar_url")
  final String? avatarUrl;
  final String? description;
  @ColumnInfo(name: "is_favorite")
  final bool isFavorite;

  @override
  List<Object?> get props => [
        id,
        name,
        avatarUrl,
        description,
        isFavorite,
      ];
}
