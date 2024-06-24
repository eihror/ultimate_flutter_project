import 'package:equatable/equatable.dart';
import 'package:ultimate_flutter_project/database/entity/github_repo_entity.dart';

class GithubRepo extends Equatable {
  const GithubRepo({
    this.id = -1,
    this.name = "",
    this.fullName = "",
    this.description = "",
    this.ownerId = -1,
    this.ownerLogin = "",
    this.htmlUrl = "",
    this.isFavorite = false,
  });

  factory GithubRepo.fromMap(Map<String, dynamic> map) {
    final owner = map['owner'] as Map<String, dynamic>?;

    return GithubRepo(
      id: map['id'] as int? ?? -1,
      name: map['name'] as String? ?? "",
      fullName: map['full_name'] as String? ?? "",
      description: map['description'] as String? ?? "",
      ownerId: owner?['id'] ?? -1,
      ownerLogin: owner?['login'] ?? "",
      htmlUrl: map['html_url'] as String? ?? "",
    );
  }

  factory GithubRepo.fromEntity(GithubRepoEntity entity) => GithubRepo(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        fullName: entity.fullName,
        ownerLogin: entity.ownerLogin,
        ownerId: entity.ownerId,
        htmlUrl: entity.htmlUrl,
        isFavorite: true,
      );

  final int id;
  final String name;
  final String fullName;
  final String description;
  final String ownerLogin;
  final int ownerId;
  final String htmlUrl;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        id,
        name,
        fullName,
        description,
        ownerId,
        ownerLogin,
        htmlUrl,
        isFavorite,
      ];
}
