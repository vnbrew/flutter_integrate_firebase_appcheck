import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_integrate_firebase_appcheck/categories/bloc/categories_bloc.dart';
import 'package:flutter_integrate_firebase_appcheck/di/di.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<CategoriesBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          bloc: bloc,
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state.firebaseException != null) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.firebaseException!.code),
                    const SizedBox(height: 20),
                    Text(
                      state.firebaseException!.message ??
                          'firebaseException without message',
                    ),
                  ],
                ),
              );
            } else {
              return Stack(
                children: [
                  ListView.separated(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        child: Center(
                          child: Text(state.categories[index].name ?? 'None'),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                  if (state.loading)
                    const Center(child: CircularProgressIndicator.adaptive())
                  else
                    Container()
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<CategoriesBloc, CategoriesState>(
            bloc: bloc,
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  bloc.add(LoadCategories());
                },
                child:
                    Text(state.categories.isNotEmpty ? 'Refresh' : 'Load data'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({
    required this.categories,
    super.key,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = categories.length;
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
