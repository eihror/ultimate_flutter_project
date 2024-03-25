import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_bloc.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_ui_event.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_ui_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<HomeBloc>()..add(OnInitScreen()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(
                builder: (context) {
                  return TextFormField(
                    controller:
                        context.read<HomeBloc>().userNameTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeUiState>(
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
            ],
          ),
        ),
      ),
    );
  }
}
