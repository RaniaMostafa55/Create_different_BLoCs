import 'package:create_different_blocs/core/theme.dart';
import 'package:create_different_blocs/views/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/bloc_builder_listener_view/counter_view.dart';
import 'views/counter_bloc/counter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: light,
          darkTheme: dark,
          themeMode:
              (state is DarkModeState) ? ThemeMode.dark : ThemeMode.light,
          home: BlocProvider(
            create: (context) => CounterBloc(),
            child: CounterView(),
          ),
        );
      },
    );
  }
}
