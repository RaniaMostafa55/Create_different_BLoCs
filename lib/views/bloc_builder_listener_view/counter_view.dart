import 'package:create_different_blocs/views/bloc_consumer_view/counter_view.dart';
import 'package:create_different_blocs/widgets/counter_value_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/global_button.dart';
import '../counter_bloc/counter_bloc.dart';
import '../theme_bloc/theme_bloc.dart';

//This class uses bloc_builder & bloc_listener
class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        actions: [
          //A button to toggle app theme
          IconButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(ToggleMode());
              },
              icon: BlocProvider.of<ThemeBloc>(context).darkMode
                  ? Icon(Icons.light_mode)
                  : Icon(Icons.dark_mode))
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterDecrement());
                  },
                  icon: Icons.remove),
              //To show a message when counter reaches 10
              BlocListener<CounterBloc, CounterState>(
                listener: (context, state) {
                  if (state is CounterTen) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("You reached value 10")));
                  }
                },
                //To re-build UI when counter changes
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return CounterValueText(
                      text: BlocProvider.of<CounterBloc>(context)
                          .counter
                          .toString(),
                    );
                  },
                ),
              ),
              GlobalButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(CounterIncrement());
                  },
                  icon: Icons.add),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          //To navigate to a counter page but with bloc_consumer
          GlobalButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => CounterBloc(),
                      child: CounterViewWithBlocConsumer(),
                    );
                  },
                ));
              },
              icon: Icons.navigate_next_outlined)
        ],
      ),
    );
  }
}
