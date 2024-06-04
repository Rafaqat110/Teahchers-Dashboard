import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import '../user_model.dart';



class StudnetsList extends StatefulWidget {
  const StudnetsList({super.key});

  @override
  State<StudnetsList> createState() => _StudnetsListState();
}

class _StudnetsListState extends State<StudnetsList> {

  List<addStudentModel> users = [];



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),

          onPressed: fetchUser),

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),



      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Studnets List"),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {

                final user = users[index];
                final name = user.name.first;
                final email = user.stRollNo;
                final nat = user.stSemester;
                return Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text(name),
                    subtitle: Text(email),
                    trailing: Text(nat),
                    leading: CircleAvatar(
                      backgroundColor: Colors.black45,
                        child: Text('${index+1}',style: TextStyle(color: Colors.white),)),
                    //
                    // title: Text(stdata[index].stName),
                    // trailing: Text(stdata[index].stRollNo),
                    // subtitle: Text(stdata[index].stSection),
                    // leading: Text(stdata[index].stSemester),
                  ),
                );
              },
            ),
            
            
          ],
        ),
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context)  async {
    TextEditingController studentNameController = TextEditingController();
    TextEditingController studentRollnOController = TextEditingController();
    TextEditingController studenSectionController = TextEditingController();
    TextEditingController studentSemesterController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:  const Text('Add Students List'),
            content: Column(
              children: [
                Flexible(
                  child: TextField(
                    controller: studentNameController,

                    decoration: const InputDecoration(hintText: "Enter Student Name"),
                  ),
                ),
                Flexible(child: TextField(
                  controller: studentRollnOController,

                  decoration: const InputDecoration(hintText: "Enter Student Roll No"),
                ),),
                Flexible(child: TextField(
                  controller: studentSemesterController,

                  decoration: const InputDecoration(hintText: "Enter Student Semester"),
                ),),
                Flexible(child: TextField(
                  controller: studenSectionController,

                  decoration: const InputDecoration(hintText: "Enter Student Section"),
                ),),


              ],
            ),
            actions: [
              Flexible(
                child: TextButton(
                  child:  Text('SUBMIT'),
                  onPressed: () {
                    setState(() {
                      // stdata.add(addStudentModel(
                      //     stName: studentNameController.text,
                      //     stRollNo: studentRollnOController.text,
                      //     stSection: studenSectionController.text,
                      //     stSemester: studentSemesterController.text));
                
                    });
                
                
                    // addItem(subjectNameController.text);
                
                
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });

  }


  void fetchUser() async{
    print('fetch user called');
   const url = 'https://randomuser.me/api/?results=50';
   final uri = Uri.parse(url);
   final response = await http.get(uri);
   final body = response.body;
   final json = jsonDecode(body);
   final results = json['results'] as List<dynamic>;
   final transformed =results.map((e) {
     final name = UserName(
         title: e['name']['title'],
         first: e['name']['first'],
         last: e['name']['last'],
         );

     return addStudentModel(
         stName: e['gender'],
         stRollNo: e['email'],
         stSection: e['phone'],
         stSemester: e['nat'],
         name: name,
     );
   }).toList();
   setState(() {
     users  =transformed;
   });
   print('completed');




  }


}
