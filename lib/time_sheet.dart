import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_apexive/bloc/timer_event.dart';
import 'package:test_apexive/create_timer.dart';
import 'package:test_apexive/timer_details.dart';

import 'bloc/timer_bloc.dart';
import 'bloc/timer_state.dart';
import 'models/timer_model.dart';

class TimeSheetPage extends StatefulWidget {
  TimerBloc? timerBloc;

  TimeSheetPage({super.key, this.timerBloc});

  @override
  State<TimeSheetPage> createState() => _TimeSheetPageState();
}

class _TimeSheetPageState extends State<TimeSheetPage> {
  List<TimerModel>? timerList = [];
  TimerBloc timerBloc = TimerBloc();
  @override
  void initState() {
    widget.timerBloc?.add(GetTimerListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      bloc: widget.timerBloc,
      listener: (context, state) {
        if (state is GetTimerListState) {
          timerList?.addAll(state.timerModel ?? []);
        }
      },
      child: BlocBuilder<TimerBloc, TimerState>(
        bloc: widget.timerBloc,
        builder: (context, state) {
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.16, -0.99),
                end: Alignment(0.16, 0.99),
                colors: [Color(0xFF0C1D4D), Color(0xFF214ECC)],
              ),
            ),
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Time Sheet",
                          style: TextStyle(fontSize: 28),
                        ),
                        const Spacer(),

                        Image.asset("assets/up-Down-Arrow.png"),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateTimer(timerBloc: timerBloc),
                              )),
                          child: Image.asset("assets/add.png"),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(
                        //       Icons.upcoming,
                        //       size: 40,
                        //     )),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(
                        //       Icons.add_box,
                        //       size: 40,
                        //     ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: timerList?.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TimerDetailsPage(
                                        timerList: timerList?[index]),
                                  ));
                            },
                            child: ListViewCell(timerList: timerList?[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ListViewCell extends StatefulWidget {
  TimerModel? timerList;

  ListViewCell({super.key, this.timerList});

  @override
  State<ListViewCell> createState() => _ListViewCellState();
}

class _ListViewCellState extends State<ListViewCell> {
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      var timerList = widget.timerList;

      DateTime createdAt = timerList?.createdAt ?? DateTime.now();
      print(createdAt);
      setState(() {
        DateTime a = DateTime(createdAt.year, createdAt.month, createdAt.day,
            createdAt.hour, createdAt.second);
        DateTime b = DateTime.now();
        Duration difference = b.difference(a);
        days = difference.inDays;
        hours = difference.inHours % 24;
        minutes = difference.inMinutes % 60;
        seconds = difference.inSeconds % 60;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 2,
            height: 80,
            decoration: ShapeDecoration(
              color: const Color(0xFFFFC629),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.star),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.timerList?.project ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.cases_outlined),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.timerList?.task ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.timer),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Deadline 07/20/2023',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 48,
            padding:
                const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 8),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Text(
                    '$days:$hours:$minutes:$seconds',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.10,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.play_circle))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
