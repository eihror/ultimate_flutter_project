enum AppRoutes {
  splash(name: "splash", path: '/'),
  githubUsers(name: 'githubUsers', path: "/github-users"),
  githubRepos(name: 'githubRepos', path: "/github-repos");

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
