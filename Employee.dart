class Employee {
  String id;
  String employee_name;
  String employee_salary;
  String employee_age;
  String profile_image;
  Employee({this.id, this.employee_name, this.employee_age, this.profile_image,this.employee_salary});

  factory Employee.fromJson(Map<String, dynamic> employee) => Employee(
      id: employee['id'].toString(),
      employee_name: employee['employee_name'] ?? "N/A",
      employee_salary: employee['employee_salary'] ?? "N/A",
      employee_age: employee['employee_age'],
      profile_image: employee['profile_image']?? "N/A");

  Map<String, dynamic> toJson() =>
      {'id': id, 'employee_name': employee_name, 'employee_salary': employee_salary, 'employee_age': employee_age, 'profile_image':profile_image};
}