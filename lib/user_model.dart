
class ListItem {
  String subjectName;
  String courseName;
  final String? startdate;
  final String? enddate;


  ListItem({
    required this.subjectName,
    required this.courseName,
    required this.startdate,
    required this.enddate
    });
}

class addStudentModel{
  String stName;
  String stRollNo;
  String stSection;
  String stSemester;
  final UserName name;

  addStudentModel({
    required this.stName,
    required this.stRollNo,
    required this.stSection,
    required this.stSemester,
    required this.name,



  });
}

class TeacherList{
  String teacherSubName;
  String date;
  String time;

  TeacherList({required this.teacherSubName,required this.time,required this.date});
}



class UserModel{
  String? uid;
  String? name;
  String? email;
  String? password;
  String? phone;

  UserModel ({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.phone});


  //recieving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map ['name'],
      email: map ['email'],
      password: map ['password'],
      phone: map ['phone'],
    );
  }

//sending data to our server
  Map <String, dynamic> toMap(){

    return {

      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    };

  }
}
class UserName{
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title, required this.first,required this.last,


  });
}