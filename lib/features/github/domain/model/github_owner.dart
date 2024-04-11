import 'package:equatable/equatable.dart';

class GithubOwner extends Equatable {
  const GithubOwner({
    this.id = -1,
    this.name = "",
    this.avatarUrl = "",
    this.description = "",
  });

  final int id;
  final String name;
  final String avatarUrl;
  final String description;

  @override
  List<Object?> get props => [
        id,
        name,
        avatarUrl,
        description,
      ];

  factory GithubOwner.fromMap(Map<String, dynamic> map) {
    return GithubOwner(
      id: map['id'] as int? ?? -1,
      name: map['login'] as String? ?? "",
      avatarUrl: map['avatar_url'] as String? ?? "",
      description: map['bio'] as String? ?? "",
    );
  }
}
