import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_flutter_project/core/extension/context_extension.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_bloc.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_event.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_state.dart';

class GithubReposScreen extends StatelessWidget {
  const GithubReposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeExtras =
        GoRouterState.of(context).extra! as Map<String, dynamic>;

    return BlocProvider(
      create: (context) => GetIt.I<GithubReposBloc>()
        ..add(OnInitScreen(username: routeExtras['username'])),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<GithubReposBloc, GithubReposUiState>(
            buildWhen: (previous, next) => previous.username != next.username,
            builder: (BuildContext context, GithubReposUiState state) {
              return Text(
                context.i18n.screenGithubReposListTitle(state.username),
              );
            },
          ),
        ),
        body: BlocBuilder<GithubReposBloc, GithubReposUiState>(
          buildWhen: (previous, next) =>
              previous.githubRepoList != next.githubRepoList,
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final repo = state.githubRepoList[index];
                return ListTile(
                  title: Text(repo.name),
                  subtitle: Text(repo.description),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state.githubRepoList.length,
            );
          },
        ),
      ),
    );
  }
}
