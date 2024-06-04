import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../user_model.dart';




class UpladAssignment extends StatefulWidget {
  const UpladAssignment({super.key});

  @override
  State<UpladAssignment> createState() => _UpladAssignmentState();
}

class _UpladAssignmentState extends State<UpladAssignment> {

  List<ListItem> items = [

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        
          onPressed: (){
          _displayDialog(context);
        
      }),

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),



      body:  SingleChildScrollView(

        child:  ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              child: ListTile(
                title: Text(items[index].subjectName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0)),
                trailing: Text(items[index].courseName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                subtitle: Text('${items[index].startdate}  To  ${items[index].enddate}',style: TextStyle(fontWeight: FontWeight.bold),),
              ),


            );
          },
        ),


      ),
    );
  }
  Future<void> _displayDialog(BuildContext context)  async {

    final _formKey = GlobalKey<FormState>();


    TextEditingController subjectNameController = TextEditingController();
    TextEditingController topicNameController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:  const Text('Add Assignment Details'),
            content:  Form(
              key: _formKey,
              child: Column(

                children: [
                  TextFormField(
                    controller: subjectNameController,
                    decoration: const InputDecoration(

                        hintText: "Enter Subject Name"),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Name";
                      }else{
                        return null;
                      }
                    },

                  ),
                  TextFormField(
                    controller: topicNameController,
                    decoration: const InputDecoration(
                        hintText: "Enter Topic Name"),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Name";
                      }else{
                        return null;
                      }
                    },

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        child: TextFormField(
                          controller: startDateController,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.purple),
                              hintText: "Start Date"),
                         onTap: ()async{
                                DateTime? startdatetime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if(startdatetime!=null){
                                  String startformatDate = DateFormat('yyyy-MM-dd').format(startdatetime);

                                  setState(() {
                                    startDateController.text = startformatDate;
                                  });

                                }
                              },

                        ),
                      ),
                      Container(
                        width: 120,
                        child: TextFormField(
                          controller: endDateController,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.purple),
                              hintText: "End Date"),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Name";
                            }else{
                              return null;
                            }
                          },
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
                                endDateController.text = formatDate;
                              });

                            }
                          },

                        ),

                      ),
                    ],
                  ),


                ],
              ),
            ),
            actions: [
              TextButton(
                child:  Text('SUBMIT'),
                onPressed: () {
                    setState(() {
                       if(_formKey.currentState!.validate()) {
                         items.add(
                             ListItem(
                             subjectName: subjectNameController.text,
                             courseName: topicNameController.text,
                           startdate: startDateController.text,
                               enddate: endDateController.text,

                         ));
                       }
                    });





                  // addItem(subjectNameController.text);


                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

  }

}

