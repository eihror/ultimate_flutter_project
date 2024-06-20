import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_flutter_project/core/extension/context_extension.dart';
import 'package:ultimate_flutter_project/core/routes/app_routes.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_bloc.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_event.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_side_effect.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_state.dart';

class GithubUsersScreen extends StatelessWidget {
  const GithubUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GithubUsersBloc>()..add(OnInitScreen()),
      child: BlocListener<GithubUsersBloc, GithubUsersUiState>(
        listenWhen: (previous, next) =>
            previous.uiSideEffect != next.uiSideEffect,
        listener: _handleUiSideEffect,
        child: _handleUiScreen,
      ),
    );
  }

  void _handleUiSideEffect(BuildContext context, GithubUsersUiState state) {
    switch (state.uiSideEffect) {
      case (NavigateToGithubUserRepos sideEffect):
        {
          context.pushNamed(
            AppRoutes.githubRepos.name,
            extra: <String, dynamic>{
              'username': sideEffect.username,
            },
          );
        }
    }
  }

  Widget get _handleUiScreen {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: BlocBuilder<GithubUsersBloc, GithubUsersUiState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: context
                          .read<GithubUsersBloc>()
                          .userNameTextEditingController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(),
                        hintText: context.i18n.screenGithubUserListSearchTerm,
                      ),
                    );
                  },
                ),
              ),
            ),
            const Divider(
              height: 16,
              color: Colors.transparent,
            ),
            Expanded(
              child: BlocBuilder<GithubUsersBloc, GithubUsersUiState>(
                buildWhen: (previous, next) =>
                    previous.githubOwnerList != next.githubOwnerList,
                builder: (context, state) {
                  return ListView.separated(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final repo = state.githubOwnerList[index];
                      return ListTile(
                        contentPadding: const EdgeInsetsDirectional.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.black),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(repo.avatarUrl),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.star_border,
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                        title: Text(
                          repo.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: repo.description.isNotEmpty
                            ? Text(repo.description)
                            : null,
                        onTap: () {
                          context.read<GithubUsersBloc>().add(
                                ClickedOnGithubUserTile(
                                  username: repo.name,
                                ),
                              );
                        },
                      );
                    },
                    itemCount: state.githubOwnerList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      height: 8,
                      color: Colors.transparent,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
