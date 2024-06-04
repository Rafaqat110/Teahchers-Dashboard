import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import '../services.dart';
import '../user_model.dart';
import 'package:http/http.dart'as http;


class Teacherslist extends StatefulWidget {
  const Teacherslist({super.key});

  @override
  State<Teacherslist> createState() => _TeacherslistState();
}

class _TeacherslistState extends State<Teacherslist> {

  bool isLoading = true;
  TextEditingController teacherSubNameController = TextEditingController();
  TextEditingController timePicker = TextEditingController();
  TextEditingController datePicker = TextEditingController();


  List items = [];

  List<TeacherList> techaerList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: (){
                  _displayDialog(context);

                  },
                child: const Text("Add Lectures"))

          ]
        ),


        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          }
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white38,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          _displayDialog(context);


        }
      ),
      extendBody: true,
      body:  Visibility(
        visible: isLoading,
        child: Center(
            child: CircularProgressIndicator()
        ),
        replacement: RefreshIndicator(
          onRefresh: fetchData,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Add Lectures",style: TextStyle(fontSize: 20.0),),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index] as Map;
                    return Card(
                      elevation: 10,
                      child: ListTile(

                        title: Text(item['title']),
                        trailing: Text(item['description']),
                        leading: CircleAvatar(child: Text('${index+1}')),





                        //     techaerList[index].teacherSubName),
                        // subtitle: Text(techaerList[index].date),
                        // trailing:  Text(techaerList[index].time),

                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      
      
    );
  }



  Future<void> _displayDialog(BuildContext context)  async {

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:  const Text('Add Lectures'),
            content: Column(
              children: [
                TextFormField(
                  controller: teacherSubNameController,
                  decoration:  InputDecoration(
                      hintText: "Enter Subject Name",

                  ),
                ),
                TextFormField(
                  controller: datePicker,
                  decoration: const InputDecoration(
                      hintText: "Set Date",
                      hintStyle: TextStyle(color: Colors.purple)
                  ),
                  onTap: ()async{
                    DateTime? datetime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                    );
                    if(datetime!=null){
                      String formatDate = DateFormat('yyyy-MM-dd').format(datetime);

                    setState(() {
                      datePicker.text = formatDate;
                    });

                    }




                  },
                ),

                TextFormField(
                  controller: timePicker,
                  decoration: const InputDecoration(
                      hintText: "Set Time",
                      hintStyle: TextStyle(color: Colors.purple)

                  ),
                  onTap: ()async{
                    var time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now());

                    if(time !=null){
                      timePicker.text = time.format(context);
                    }
                  },

                ),

              ],
            ),
            actions: [
              TextButton(
                child:  Text('SUBMIT'),
                onPressed: () {
                  submitData();
                  // setState(() {
                  //   techaerList.add(
                  //       TeacherList(
                  //       teacherSubName: teacherSubNameController.text,
                  //         date: datePicker.text,
                  //         time: timePicker.text,
                  //      ));
                  //
                  // });


                  // addItem(subjectNameController.text);


                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

  }


  Future<void> submitData() async{
    final title =teacherSubNameController.text;
    final description = timePicker.text;


    final body = {
        "title": title,
        "description": description,
        "is_completed": false,
      };
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri,body: jsonEncode(body),
    headers: {
      'Content-type':'application/json'
        },
    );
    if(response.statusCode == 201){
      teacherSubNameController.text='';
      datePicker.text='';


      print('creation success');
    }
    else{
      print('creation failed');
    }
    print(response.statusCode);
    print(response.body);



  }

  Future<void> fetchData() async{
    final response = await Services.fetchDatas();
    if(response != null){

      setState(() {
        items = response;
      });

    }else{
      showErrorMessage('Something wwnt Wrong');
    }
    setState(() {
      isLoading = false;
    });

  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
