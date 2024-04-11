import 'package:equatable/equatable.dart';

class GithubRepo extends Equatable {
  const GithubRepo({
    this.id = -1,
    this.name = "",
    this.fullName = "",
    this.description = "",
  });

  final int id;
  final String name;
  final String fullName;
  final String description;

  @override
  List<Object?> get props => [
        id,
        name,
        fullName,
        description,
      ];

  factory GithubRepo.fromMap(Map<String, dynamic> map) {
    return GithubRepo(
      id: map['id'] as int? ?? -1,
      name: map['name'] as String? ?? "",
      fullName: map['full_name'] as String? ?? "",
      description: map['description'] as String? ?? "",
    );
  }
}
