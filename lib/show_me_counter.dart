import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/counter/counter_cubit.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext showMeContext) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // State 를 사용할 수 있는 BlocBuilder() 사용
          builder: (showMeContext, state) {
            return Text(
              '${state.counter}',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 52.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
