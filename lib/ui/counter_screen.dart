import 'package:bloc_project/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_project/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_project/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              if (state is CounterInit) {
                return AnimatedDefaultTextStyle(
                  style: const TextStyle(fontSize: 45, color: Colors.white),
                  duration: const Duration(seconds: 1),
                  child: Text(
                    '${state.counter}',
                  ),
                );
              }
              if (state is UpdatedCounter) {
                return AnimatedDefaultTextStyle(
                  style: const TextStyle(fontSize: 45, color: Colors.white),
                  duration: const Duration(seconds: 1),
                  child: Text(
                    '${state.counter}',
                  ),
                );
              }

              return const Text('Error',
                  style: TextStyle(fontSize: 30, color: Colors.white));
            }),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                onPressed: () {
                  context.read<CounterBloc>().add(IncreamentPressed());
                },
                child: const Text('+',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {
                  context.read<CounterBloc>().add(DecreamentPressed());
                },
                child: const Text('-',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent),
                onPressed: () {
                  context.read<CounterBloc>().add(ResetButtonPressed());
                },
                child: const Text('Reset',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
