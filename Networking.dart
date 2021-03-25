import 'package:dio/dio.dart';
import 'Employee.dart';

class Network {
  Dio dio = Dio();
  Future<List<Employee>> getAllEmployees() async {
    return dio.get('http://dummy.restapiexample.com/api/v1/employees').then((response) {
      // print(response.toString().length);
      List<Employee> employees = (response.data['data'] as List)
          .map((employee) => Employee.fromJson(employee))
          .toList();
      return employees;
    });
  }

  Future<Employee> addEmployee(Employee employee) {
    dio.options.headers.putIfAbsent("Accept", () {
      return "application/json";
    });
    print(employee.toJson());
    return dio.post("http://dummy.restapiexample.com/api/v1/create", data: employee.toJson()).then((response) {
      print(response);
      Employee emp = new Employee.fromJson(response.data['data'] as Map);
      return emp;
    }).catchError((error){
      print(error);
    });
  }
}