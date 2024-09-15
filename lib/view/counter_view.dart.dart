import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:counter_app/view/counter_button.dart';
import 'package:counter_app/cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            _buildDisplayCounterValueMethod(),
            const Spacer(),
            _buildIncAndDecButtonSection(context),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  BlocBuilder _buildDisplayCounterValueMethod() {
    return BlocBuilder<CounterCubit, int>(builder: (_, state) {
      return Text(state.toString(), style: const TextStyle(fontSize: 80));
    });
  }

  Row _buildIncAndDecButtonSection(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CounterButton(
          icon: Icons.remove_circle,
          onPressed: () => _onPressed(true, ctx),
        ),
        CounterButton(
          icon: Icons.add_circle,
          onPressed: () => _onPressed(false, ctx),
        ),
      ],
    );
  }

  void _onPressed(bool val, BuildContext ctx) {
    if (val) {
      ctx.read<CounterCubit>().decrement();
    } else {
      ctx.read<CounterCubit>().increment();
    }
  }
}
