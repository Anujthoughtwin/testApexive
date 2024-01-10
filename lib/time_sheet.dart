import 'package:flutter/material.dart';

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
                        builder: (context) => const TimeSheetPage(),
                      ));
                },
                child: Container(
                  height: 112,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.07999999821186066),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
