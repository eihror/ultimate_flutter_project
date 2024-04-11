import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_bloc.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_event.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_state.dart';

class GithubUsersScreen extends StatelessWidget {
  const GithubUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GithubUsersBloc>()..add(OnInitScreen()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(
                builder: (context) {
                  return TextFormField(
                    controller: context
                        .read<GithubUsersBloc>()
                        .userNameTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  );
                },
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
                      itemBuilder: (context, index) {
                        final repo = state.githubOwnerList[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(repo.avatarUrl),
                          ),
                          title: Text(repo.name),
                          subtitle: repo.description.isNotEmpty
                              ? Text(repo.description)
                              : null,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: state.githubOwnerList.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
