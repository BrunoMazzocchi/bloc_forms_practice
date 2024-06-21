import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocBloc(),
      child: const _CounterBloCView(),
    );
  }
}

class _CounterBloCView extends StatelessWidget {
  const _CounterBloCView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterBlocBloc>().add(CounterReset()),
              icon: const Icon(Icons.refresh_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            const SizedBox(height: 20),
            BlocBuilder<CounterBlocBloc, CounterBlocState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<CounterBlocBloc, CounterBlocState>(
              builder: (context, state) {
                return Text(
                  'Transaction count: ${state.transactionCount}',
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'incrementBy3',
            onPressed: () {
              context.read<CounterBlocBloc>().add(const IncrementBy(3));
            },
            tooltip: 'Increment times 3',
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              context.read<CounterBlocBloc>().add(Decrement());
            },
            tooltip: 'Decrement',
            child: const Text('-'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<CounterBlocBloc>().add(Increment());
            },
            tooltip: 'Increment',
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}