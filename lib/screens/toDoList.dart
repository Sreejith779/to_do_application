import 'package:flutter/material.dart';
import 'package:to_do_application/model/addData.dart';

class ToDOList extends StatefulWidget {
  const ToDOList({super.key});

  @override
  State<ToDOList> createState() => _ToDOListState();
}

class _ToDOListState extends State<ToDOList> {
  final taskController = TextEditingController();
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title: Text("ToDo List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: addingData.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.02,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(child: Text(addingData[index].title)),
                        PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text("Update"),
                                                actions: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        labelText: "Task",
                                                        filled: true),
                                                    controller: taskController,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextField(
                                                    decoration: const InputDecoration(
                                                        labelText: "Date",
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                        prefixIcon: Icon(Icons
                                                            .calendar_month)),
                                                    readOnly: true,
                                                    onTap: () {
                                                      _selectDate();
                                                    },
                                                    controller: dateController,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {

                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text("Submit"))
                                                ],
                                              ));
                                    },
                                    child: Text("Edit")),
                                TextButton(
                                    onPressed: () {}, child: Text("Delete")),
                              ],
                            ))
                          ],
                          child: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });

      void updatetData() {
        final enteredTitle = taskController.text.trim();
        final enteredDate = dateController.text.toString();
        if (enteredTitle.isEmpty || enteredDate == null) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Invalid input"),
                  ));
          return;
        }
        final DateTime parsedDate = DateTime.parse(enteredDate);

        void dataAdding(AddData taskAdded) {
          setState(() {
            addingData.add(taskAdded);
          });
        }

        final taskAdded = AddData(title: enteredTitle, dateTime: parsedDate);
        dataAdding(taskAdded);
      }
    }
  }
}
