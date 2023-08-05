import 'package:bloc_named/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = CounterCubit();

    return MaterialApp(
      title: 'Flutter Named Route',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          primarySwatch: Colors.blue),
      routes: {
        '/': (context) => BlocProvider.value(
              value: counterCubit,
              child: const MyHomePage(title: 'Flutter Named Route Home Page'),
            ),
        '/counter': (context) => BlocProvider.value(
              value: counterCubit,
              child: const ShowMeCounter(),
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Show me Counter',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/counter',
                );
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text(
                'Increase Counter',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
            )
          ],
        ),
      ),
    );
  }
}
