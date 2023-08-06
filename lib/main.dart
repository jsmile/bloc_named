import 'package:bloc_named/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

// CounterCubit close() 를 위해 StatefulWidget 으로 변경
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 병렬 sub-tree 에서 동일한 Cubit 인스턴스를 사용하기 위해 properties 로 선언 및 초기화
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Named Route',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          primarySwatch: Colors.blue),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const MyHomePage(title: 'Flutter Named Route Home Page'),
            ),
        '/counter': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ShowMeCounter(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
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
