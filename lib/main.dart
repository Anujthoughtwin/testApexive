import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_apexive/bloc/timer_bloc.dart';
import 'package:test_apexive/create_timer.dart';

import 'bloc/timer_state.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  TimerBloc timerBloc = TimerBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.transparent,
        ),
      ),
      home:BlocProvider(
        create: (_) => timerBloc,
        child: BlocConsumer<TimerBloc, TimerState>(
          builder: (context, state) {
            return CreateTimer(timerBloc: timerBloc,);
          }, listener: (BuildContext context, TimerState state) {  },
        ),
      ),
    );
  }
}
