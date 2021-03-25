import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Employee.dart';
import 'NewEmployee.dart';
import 'Networking.dart';

class EmployeesList extends StatefulWidget {
  @override
  _EmployeesListState createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  Future<List<Employee>> employees;

  @override
  void initState() {
    super.initState();
    setState(() {
      employees = Network().getAllEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
      ),
      body: FutureBuilder<List<Employee>>(
        future: employees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text('${snapshot.data[i].employee_name}'),
                      subtitle: Row(
                        children: <Widget>[
                          Text('Salary: ${snapshot.data[i].employee_salary}'),
                          SizedBox(
                            width: 100,
                          ),
                          Text('Age: ${snapshot.data[i].employee_age}'),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('Sorry there is an error');
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Employees(),
            ),
          );
          setState(() {
            employees = Network().getAllEmployees();
          });
        },
      ),
    );
  }
}