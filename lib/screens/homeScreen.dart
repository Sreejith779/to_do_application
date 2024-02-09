

import 'package:flutter/material.dart';
import 'package:to_do_application/model/addData.dart';
import 'package:to_do_application/model/bannerData.dart';
import 'package:intl/intl.dart';
import 'package:to_do_application/model/toggleButton.dart';
import 'package:to_do_application/screens/toDoList.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 List<bool>togglevalue=[true,false,false,false];
  final taskController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
  taskController.dispose();
  dateController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Hi Natalie"),
              SizedBox(
                height: 5,
              ),
              Text("Welcome back", style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons. home, size: 35)),
            FloatingActionButton(
              onPressed: () {
                showDialog(context: context, builder: (context)=>
           AlertDialog(
             title: const Text("Add Task"),
             actions: [
               TextField(

                 decoration: InputDecoration(

                   border: OutlineInputBorder(

                     borderRadius: BorderRadius.circular(16),
                   ),
                   labelText: "Task",
                   filled: true
                 ),
                 controller: taskController,
               ),
               const SizedBox(
                 height: 5,
               ),

                TextField(
                 decoration: const  InputDecoration(
                   labelText: "Date",
                   border: OutlineInputBorder(
                     borderSide: BorderSide.none
                   ),
                   prefixIcon: Icon(Icons.calendar_month)
                 ),
                 readOnly: true,
                 onTap: (){
                   _selectDate();
                 },
                  controller: dateController,
               ),
               ElevatedButton(onPressed: (){
                 submitData();
                 Navigator.of(context).pop();
               },
                   child:const Text("Submit"))
             ],
           )
                );
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add, size: 35),
            ),
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              ToDOList()));
            }, icon: const Icon(Icons.note_alt_outlined, size: 35)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("My Projects", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                 ToggleButton()
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(

                height: MediaQuery.of(context).size.height * 0.22,
                child: PageView.builder(
                  itemCount: progressData.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: MediaQuery.of(context).size.width * 0.02,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
child: Center(child: Text("In Progress",style: TextStyle(fontWeight: FontWeight.w500),)),
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.width*0.25,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Center(child: Text(progressData[index].title)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Today Activity", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
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
                    child: Column(

                      children: [
                        Center(child: Text(addingData[index].title)),
                        Text(DateFormat.yMd().add_jm().format(addingData[index].dateTime))
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void submitData(){
final enteredTitle = taskController.text.trim();
final enteredDate = dateController.text.toString();
if(enteredTitle.isEmpty || enteredDate == null){
  showDialog(context: context, builder: (context)=>
AlertDialog(title: Text("Invalid input"),
));
  return;

}
final DateTime parsedDate = DateTime.parse(enteredDate);
final taskAdded = AddData(
    title: enteredTitle, dateTime: parsedDate);
dataAdding(taskAdded);
  }
  
  void dataAdding(AddData taskAdded){
 
    setState(() {
      addingData.add(taskAdded);
      
    });
  }

  Future<void>_selectDate()async {
   DateTime? picked =  await showDatePicker(context: context,
        firstDate: DateTime(2000), lastDate: DateTime(2100)
   );
   if(picked!=null){
     setState(() {
       dateController.text = picked.toString().split(" ")[0];
     });
   }

  }
}
