import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_apexive/bloc/timer_event.dart';
import 'package:test_apexive/models/timer_model.dart';
import 'package:test_apexive/time_sheet.dart';

import 'bloc/timer_bloc.dart';
import 'bloc/timer_state.dart';

class CreateTimer extends StatefulWidget {
  TimerBloc? timerBloc;

  CreateTimer({super.key, this.timerBloc});

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  String? _selectedProject;
  String? _selectedTask;
  List<String> project = ["IOS", "ANDROID", "FLUTTER", "REACT NATIVE"];
  List<String> task = ["AUTH", "PAYMENT", "SETTINGS", "USER PROFILE"];
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      bloc: widget.timerBloc,
      listener: (context, state) {
        if (state is ProjectState) {
          _selectedProject = state.selectedProject;
        } else if (state is TaskState) {
          _selectedTask = state.selectedTask;
        }else if(state is CreateTimerState){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TimeSheetPage(timerBloc: widget.timerBloc),
              ));
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.chevron_left,
                            size: 34,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Create Timer",
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Color(0xFF0C1D4D),
                            hint: const Text(
                              'Project',
                              style: TextStyle(fontSize: 18),
                            ),
                            value: _selectedProject,
                            onChanged: (newValue) {
                              widget.timerBloc?.add(
                                  ProjectEvent(selectedProject: newValue));
                            },
                            items: project.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.grey,
                            ),
                            iconSize: 40.0,
                            elevation: 16,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Color(0xFF0C1D4D),
                            hint: const Text(
                              'Task',
                              style: TextStyle(fontSize: 18),
                            ),
                            // Not necessary for Option 1
                            value: _selectedTask,
                            onChanged: (newValue) {
                              widget.timerBloc
                                  ?.add(TaskEvent(selectedTask: newValue));
                            },
                            items: task.map((location) {
                              return DropdownMenuItem(
                                value: location,
                                child: Text(location),
                              );
                            }).toList(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.grey,
                            ),
                            iconSize: 40.0,
                            elevation: 16,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: descController,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              width: 4,
                              color: Colors.grey, // Set the border color here
                            ),
                          ),
                        ),
                        maxLines:
                            null, // Allows the text field to expand vertically as needed
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          widget.timerBloc?.add(CreateTimerEvent(
                              timerModel: TimerModel(
                                  description: descController.text,
                                  project: _selectedProject,
                                  task: _selectedTask)));
                        },
                        child: Container(
                          height: 48,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
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
            ),
          );
        },
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem<String>(value: item, child: Text(item));
  }
}
