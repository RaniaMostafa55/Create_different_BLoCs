import 'package:create_different_blocs/widgets/counter_value_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/global_button.dart';
import '../counter_bloc/counter_bloc.dart';

//This class uses bloc_consumer
class CounterViewWithBlocConsumer extends StatefulWidget {
  const CounterViewWithBlocConsumer({super.key});

  @override
  State<CounterViewWithBlocConsumer> createState() =>
      _CounterViewWithBlocConsumerState();
}

class _CounterViewWithBlocConsumerState
    extends State<CounterViewWithBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App (Consumer)"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterDecrement());
                },
                icon: Icons.remove),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is CounterTen) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("You reached value 10")));
                }
              },
              builder: (context, state) {
                return CounterValueText(
                  text:
                      BlocProvider.of<CounterBloc>(context).counter.toString(),
                );
              },
            ),
            GlobalButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
                },
                icon: Icons.add),
          ],
        ),
      ),
    );
  }
}
