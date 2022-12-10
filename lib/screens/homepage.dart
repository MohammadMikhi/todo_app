import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color yellowColor = const Color(0xffd1a617);
  final TextEditingController _taskNameCont = TextEditingController();
  final TextEditingController _taskDescCont = TextEditingController();
  final TextEditingController _taskEstCont = TextEditingController();
  final List<ToDo> toDos = <ToDo>[];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        backgroundColor: yellowColor,
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              shrinkWrap: true,
              children: toDos.map((ToDo todo) {
                return ToDoItem(toDoItem: todo);
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: formKey,
                  child: Container(
                    height: height * 0.7,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            maxLength: 25,
                            controller: _taskNameCont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Task Name'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: TextFormField(
                            maxLines: null,
                            controller: _taskDescCont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Task Description'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            controller: _taskEstCont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Time Estimation'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    addToDoItem(
                                        _taskNameCont.text,
                                        _taskDescCont.text,
                                        int.parse(_taskEstCont.text));
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Add Task'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
        backgroundColor: yellowColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addToDoItem(String name, String desc, int est) {
    setState(() {
      toDos.add(ToDo(name: name, taskDesc: desc, taskEst: est));
      _taskNameCont.clear();
      _taskDescCont.clear();
      _taskEstCont.clear();
    });
  }
}
