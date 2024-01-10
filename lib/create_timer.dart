import 'package:flutter/material.dart';
import 'package:test_apexive/time_sheet.dart';

class CreateTimer extends StatefulWidget {
  CreateTimer({super.key});

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  String selectedValue = 'Option 1';
  String selectedValue2 = 'Option 1';
  String selectedValue3 = 'Option 1';
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
          leading: const Icon(
            Icons.chevron_left,
            size: 34,
          ),
          title: const Text("Create Timer"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Option 2'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 3',
                    child: Text('Option 3'),
                  ),
                ],
              ),
              DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Option 2'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 3',
                    child: Text('Option 3'),
                  ),
                ],
              ),
              DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Option 2'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Option 3',
                    child: Text('Option 3'),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeSheetPage(),
                      ));
                },
                child: Container(
                  height: 48,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.1599999964237213),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Create Timer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
