import 'package:employee_list/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${employee.name}'),
            Text('Age: ${employee.age.toString()}'),
            Text('Salary: ${employee.salary.toString()}'),
          ],
        ),
      ),
    );
  }
}
