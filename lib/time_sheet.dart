import 'package:flutter/material.dart';
import 'package:test_apexive/timer_details.dart';

class TimeSheetPage extends StatefulWidget {
  const TimeSheetPage({super.key});

  @override
  State<TimeSheetPage> createState() => _TimeSheetPageState();
}

class _TimeSheetPageState extends State<TimeSheetPage> {
  // Default selected value
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
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Time Sheet"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.upcoming,
                  size: 50,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_box,
                  size: 50,
                ))
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TimerDetailsPage(),
                      ));
                },
                child: ListViewCell(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ListViewCell extends StatelessWidget {
  const ListViewCell({
    super.key,
  });

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
              color: Color(0xFFFFC629),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'iOS app deployment',
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
              Row(
                children: [
                  Icon(Icons.cases_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'SO056 - Booqio V2',
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
              Row(
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
                  const Text(
                    '00:30',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.10,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(onPressed: () {}, icon: Icon(Icons.play_circle))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
