import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            print(">>> Se dibujó el Bloc - Appbar");
            return Text("Bloc Counter ${state.transactionCount}");
          },
        ),
        actions: [
          IconButton(
              onPressed: () => _resetCounter(context), 
              icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            context.select(
              (CounterBloc value) {
                print(">>> Se dibujó el Bloc");
                return Text("Counter value: ${value.state.counter}");
              },
            ),
            // Text("Counter value: XXXX"),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: const Text("+3"),
              onPressed: () => increaseCounterBy(context, 3)),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
              heroTag: '2',
              child: const Text("+2"),
              onPressed: () => increaseCounterBy(context, 2)),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
              heroTag: '3',
              child: const Text("+1"),
              onPressed: () => increaseCounterBy(context)),
        ],
      ),
    );
  }

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increaseBy(value);
  }

  void _resetCounter( BuildContext context) {
    // context.read<CounterBloc>().add(const CounterReset());
    context.read<CounterBloc>().resetCounter();
  }
}
