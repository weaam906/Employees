import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Employee.dart';
import 'Networking.dart';

class Employees extends StatefulWidget {
  Employees({Key key}) : super(key: key);

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  String name,age;
 // void addPressed() {
  //    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Employee'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: buildBody(),
        ),
      ),
    );
  }

 Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        TextField(decoration: InputDecoration(hintText: 'Employee Name'),
          onChanged: (value) {setState(() {name = value;});},),
        SizedBox(height: 10),
        TextField(decoration: InputDecoration(hintText: 'Employee Age'),
          onChanged: (value) {setState(() {age = value;});},),
        SizedBox(height: 20),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(minWidth: 120,padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),color: Colors.grey.shade100,
                       onPressed: (){
   Employee emp = Employee();
   emp.employee_name = name;
   emp.employee_age = age;
   if(name == null)
   {
   Fluttertoast.showToast(msg: "Enter the Name", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIos: 1);
   }
  else if(age == null)
   {
   Fluttertoast.showToast(msg: "Enter the Age", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIos: 1);
   }
   else
   {
   Fluttertoast.showToast(msg: "A new employee is successfully added", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER,timeInSecForIos: 1);
   Network().addEmployee(emp).then((value){
   setState(() {});
   Navigator.pop(context);
   });
   }
                         },
                  child: Text('ADD',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),),
                ),
        )
      ],
    );
 }
}
