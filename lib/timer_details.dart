import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/timer_model.dart';

// ignore: must_be_immutable
class TimerDetailsPage extends StatefulWidget {
  TimerModel? timerList;

  TimerDetailsPage({super.key, this.timerList});

  @override
  State<TimerDetailsPage> createState() => _TimerDetailsPageState();
}

class _TimerDetailsPageState extends State<TimerDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {});
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.16, -0.99),
          end: Alignment(0.16, 0.99),
          colors: [Color(0xFF0C1D4D), Color(0xFF214ECC)],
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(controller: _controller, tabs: const [
                Tab(
                  text: "TimeSheet",
                ),
                Tab(
                  text: "Details",
                )
              ]),
              title: const Text("Get to know Apexer - Ivan"),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ]),
          body: TabBarView(controller: _controller, children: [
            TimeSheetTab(timerList: widget.timerList),
            DetailsTab()
          ]),
        ),
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  const DetailsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07999999821186066),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Project',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.40,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 2,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFC629),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Apexive: Content Planning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Deadline ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.40,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '10/11/2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.15,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Assigned to',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.40,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Ivan Zhuikov',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.15,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 136,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07999999821186066),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  // height: 0.10,
                  letterSpacing: 0.25,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 0.10,
                  letterSpacing: 0.10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeSheetTab extends StatefulWidget {
  TimerModel? timerList;

  TimeSheetTab({super.key, this.timerList});

  @override
  State<TimeSheetTab> createState() => _TimeSheetTabState();
}

class _TimeSheetTabState extends State<TimeSheetTab> {
  late Timer timers;
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();

    timers = Timer.periodic(const Duration(seconds: 1), (timer) {
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

  void playNewTimer() {
    timers = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    DateTime date = widget.timerList?.createdAt ?? DateTime.now();
    String time = "${date.hour}:${date.minute}:${date.second}";
    var dateFormatted = DateFormat("dd/MM/yyyy").format(date);
    var day = DateFormat('EEEE').format(date);
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07999999821186066),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.40,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dateFormatted,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Start Time $time',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.40,
                ),
              ),
              Row(
                children: [
                  Text(
                    '$days:$hours:$minutes:$seconds',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.stop_circle,
                        size: 48,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (isPlay == true) {
                            isPlay = false;
                            timers.cancel();
                          } else {
                            isPlay = true;
                            playNewTimer();
                          }
                        });
                      },
                      icon: Icon(
                        isPlay ? Icons.pause_circle : Icons.play_circle,
                        size: 48,
                      ))
                ],
              ),
              const SizedBox(height: 16),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  // height: 0.10,
                  letterSpacing: 0.25,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.timerList?.description ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 0.10,
                  letterSpacing: 0.10,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Completed Records',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.40,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07999999821186066),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Monday ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.40,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '16.06.2023',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Start Time 10:00 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.40,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.1599999964237213),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(64),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '08:00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07999999821186066),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Monday ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.40,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '16.06.2023',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Start Time 10:00 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.40,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.1599999964237213),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(64),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '08:00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 16),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  // height: 0.10,
                  letterSpacing: 0.25,
                ),
              ),
              SizedBox(height: 4),
              const Text(
                'As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 0.10,
                  letterSpacing: 0.10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
