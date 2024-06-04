import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:teachers_dashboard/screens/inbox.dart';
import 'package:teachers_dashboard/screens/studentsList.dart';
import 'package:teachers_dashboard/screens/uploadAssignment.dart';
import 'package:teachers_dashboard/screens/whiteNotice.dart';
import 'package:teachers_dashboard/user_model.dart';
import 'package:http/http.dart'as http;


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  bool isLoading = true;

  List<addStudentModel> stdata = [];
  List<TeacherList> techaerList = [];

  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Dashborad",style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications,color: Colors.white,),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
         const Padding(
           padding: EdgeInsets.only(right: 8.0),
           child: CircleAvatar(
             backgroundImage: AssetImage('images/profile.jpeg'),
               ),
         )

             //IconButton
          ], //<Widget>[]
          backgroundColor: Color(0xff080637),
          elevation: 50.0,


          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
        ),
      drawer:  Drawer(
        backgroundColor: Colors.white,
          child:  SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// Header of the Drawer
                    Material(
                      color:  Color(0xff080637),
                      child: InkWell(
                        onTap: (){
                          /// Close Navigation drawer before
                          Navigator.pop(context);

                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top,
                              bottom: 24
                          ),
                          child:  const Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('images/profile.jpeg'),
                                radius: 52,


                              ),
                              SizedBox(height: 12,),
                              Text('Rafaqat Ali',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white
                                ),),
                              Text('mrdeveloper1437@gmail.com',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white
                                ),),

                            ],
                          ),
                        ),
                      ),
                    ),

                    Column(
                        children:  [
                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpladAssignment()));
                            },
                            title: const Text('Upload Assginments',),),
                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpladAssignment()));
                            },
                            title: const Text('Assignments List'),),
                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const StudnetsList()));
                            },
                            title: const Text('Students List'),),
                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const White_Notice()));
                            },
                            title: const Text('White Notice'),),
                          const Divider(color: Colors.black45,),

                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>InboxScreen()));
                            },
                            title: const Text('Inbox'),),

                        ]
                    )
                  ]
              )
          )
      ),
      body:  Stack(
        children: [
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left:14.0,),
              child: Container(
                height: 100.0,
                         child: Text('Upcoming Lectures',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ),
            ),
          ),
          Positioned(
                top: 320,
                  left: 0,
                  right: 0,
                  bottom: 0,
                    child: Container(
                      width:MediaQuery.of(context).size.width,
                      height: 100,

                      child:  SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: items.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = items[index] as Map;
                                return Card(
                                  elevation: 10,
                                  child: ListTile(
                                    title: Text(item['title']),
                                    trailing: Text(item['description']),
                                    leading: CircleAvatar(child: Text('${index+1}')),



                                    // title: Text(
                                    //     techaerList[index].teacherSubName),
                                    // subtitle: Text(techaerList[index].date),
                                    // trailing:  Text(techaerList[index].time),
                                    // leading: Text('1'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                              ),
                  ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              color: const Color(0xff080637),
              height: 200,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("images/bg4.jpg"),
              //         fit: BoxFit.fill)),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 50,left: 20),
                    // color: Color(0xFF3b5999).withOpacity(.85),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Hello",
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                color: Colors.yellow[700],
                              ),
                              children: [
                                TextSpan(
                                  text:" Teacher Name,",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow[700],
                                  ),
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(

                               "Wellcome"
                               " to Teacher Mnanagement",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ),
          Positioned(
            top: 150,
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.teal.shade50,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      spreadRadius: 1.5,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Container(
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Text('47%',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                                    Text('in progress',style: TextStyle(fontSize: 10.0,),)
                                  ]
                                )
                              )

                          ),
                          SizedBox(width: 7,),

                          Column(
                            children: [
                              Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.purple.shade100,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(.3),
                                          spreadRadius: 1.5,
                                          blurRadius: 10,
                                        )
                                      ]),
                                  child: Container(
                                      child: const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Text('77%',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                                            Text('in progress',style: TextStyle(fontSize: 10.0,),)
                                          ]
                                      )
                                  )
                              ),

                            ],
                          ),
                          SizedBox(width: 7,),
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade200,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      spreadRadius: 1.5,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Container(
                                  child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Text('3',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                                      ]
                                  )



                              )

                          ),
                          SizedBox(width: 7,),
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade400,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      spreadRadius: 1.5,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Container(
                                  child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Text('5',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                                      ]
                                  )



                              )
                          ),
                        ],
                      ),

                      Padding(
                       padding: const EdgeInsets.only(left: 10.0,top: 8.0),
                       child: Row(
                         children: [
                           Container(
                             height: 90,
                             width: 90,
                               child:Text('Assignmet'),

                           ),
                           const SizedBox(width: 10,),

                           Container(
                             height: 90,
                             width: 90,
                             child:const Text('Courses',style: TextStyle(fontSize: 17.0),),

                           ),
                           SizedBox(width: 7,),

                           Container(
                             height: 90,
                             width: 90,
                             child:Text('Leave'),

                           ),
                           SizedBox(width: 7,),

                           Container(
                             height: 90,
                             width: 90,
                             child:Text('Absent'),

                           ),
                         ],
                       ),
                     ),
                    ],
                  ),
                ),
            ),
          ),




        ],
      )

    );
  }
  Future<void> fetchData() async{
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;
      final result = json['items']as List ;
      setState(() {
        items = result;
      });

    }
    setState(() {
      isLoading = false;
    });

  }

}
