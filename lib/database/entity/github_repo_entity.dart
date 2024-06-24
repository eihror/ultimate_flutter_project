import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

@Entity(tableName: 'repo', primaryKeys: ['id'])
class GithubRepoEntity extends Equatable {
  const GithubRepoEntity({
    this.id = -1,
    this.name = "",
    this.fullName = "",
    this.description = "",
    this.ownerLogin = "",
    this.ownerId = -1,
    this.htmlUrl = "",
  });

  factory GithubRepoEntity.fromRepo({
    required GithubRepo value,
  }) =>
      GithubRepoEntity(
        id: value.id,
        name: value.name,
        description: value.description,
        fullName: value.fullName,
        ownerLogin: value.ownerLogin,
        ownerId: value.ownerId,
        htmlUrl: value.htmlUrl,
      );

  final int id;
  final String name;
  @ColumnInfo(name: "full_name")
  final String fullName;
  final String description;
  @ColumnInfo(name: "owner_login")
  final String ownerLogin;
  @ColumnInfo(name: "owner_id")
  final int ownerId;
  @ColumnInfo(name: "html_url")
  final String htmlUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        fullName,
        description,
        ownerLogin,
        ownerId,
        htmlUrl,
      ];
}
