import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Student_Dashboard extends StatefulWidget {
  const Student_Dashboard({super.key});

  @override
  State<Student_Dashboard> createState() => _Student_DashboardState();
}

class _Student_DashboardState extends State<Student_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:
        AppBar(

          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
        ),
        drawer:  Drawer(
            child:  SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /// Header of the Drawer
                      Material(
                        color: Colors.blueAccent,
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
                            child:  Column(
                              children: [
                                CircleAvatar(
                                  child:Image.asset('images/chatAppNine.png') ,
                                  radius: 52,


                                ),
                                SizedBox(height: 12,),
                                const Text('Rafaqat Ali',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white
                                  ),),
                                const Text('mrdeveloper1437@gmail.com',
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
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpladAssignment()));
                              },
                              title: const Text('Upload Assginments',),),
                            ListTile(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpladAssignment()));
                              },
                              title: const Text('Assignments List'),),
                            ListTile(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>StudnetsList()));
                              },
                              title: const Text('Students List'),),
                            ListTile(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>White_Notice()));
                              },
                              title: const Text('White Notice'),),
                            const Divider(color: Colors.black45,),

                            ListTile(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>InboxScreen()));
                              },
                              title: const Text('Inbox'),),

                          ]
                      )
                    ]
                )
            )
        ),

        body: const Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
              children:[
                Row(
                    children:[
                      Text(' Student Dashborad',style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                    ]
                ),
                Row(

                )

              ]
          ),
        )

    );
  }
}
