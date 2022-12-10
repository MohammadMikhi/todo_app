import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  final String taskName, taskDesc;
  final int taskEst;
  const TaskDetails(
      {super.key,
      required this.taskName,
      required this.taskDesc,
      required this.taskEst});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd1a617),
        title: const Text('Task Details'),
      ),
      body: Container(
        height: height,
        width: width,
        color: const Color(0xff252c4a),
        padding: const EdgeInsets.all(15),
        child: Wrap(children: [
          Card(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Task Name'),
                      SizedBox(
                        width: width * 0.4,
                        child: Text(
                          taskName,
                          maxLines: 100,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Task Description'),
                      SizedBox(
                        width: width * 0.4,
                        child: Text(
                          taskDesc,
                          maxLines: 100,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Task Estimation'),
                      SizedBox(
                        width: width * 0.4,
                        child: Text(
                          taskEst.toString(),
                          maxLines: 100,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
