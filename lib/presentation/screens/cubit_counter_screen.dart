import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubitCubit>(context);
    final counterCubit = context.read<CounterCubit>();
    final transactions = context.watch<CounterCubit>().state; 
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Counter: ${transactions.transactionCount}"),
        actions: [
          IconButton(
              onPressed: () => counterCubit.reset(), 
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              // buildWhen: (previous, current) => previous.counter != current.counter,
              builder: (context, state) {
                print(">>> Me acabo de dibujar!!");
                return Text("Counter value: ${state.counter}");
              }
            ),
            context.select((CounterCubit value) {
              return Text('Counter with selected: ${value.state.counter}');
            }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', 
              child: const Text("+3"), 
              onPressed: () => increasyBy(context, value:3,)
          ),

          const SizedBox(
            height: 20,
          ),

          FloatingActionButton(
              heroTag: '2', 
              child: const Text("+2"), 
              onPressed: () => increasyBy(context, value: 2,)
          ),

          const SizedBox(
            height: 20,
          ),

          FloatingActionButton(
              heroTag: '3', 
              child: const Text("+1"), 
              onPressed: () => increasyBy(context)
          ),
        ],
      ),
    );
  }

  void increasyBy( BuildContext context, {int value = 1} ) {
    final counterCubit = context.read<CounterCubit>();
    counterCubit.increaseBy(value);
  }

}
