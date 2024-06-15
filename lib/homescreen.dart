import 'package:employee_list/api/fetch_employee.dart';
import 'package:employee_list/detailscreen.dart';
import 'package:employee_list/models/employee_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Employee>> _futureEmployees;

  @override
  void initState() {
    super.initState();
    _futureEmployees = EmployeeService().fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeDummy'),
      ),
      body: FutureBuilder<List<Employee>>(
        future: _futureEmployees,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No employees found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final employee = snapshot.data![index];
                return ListTile(
                  title: Text(employee.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(employee.age.toString()),
                      Text(employee.salary.toString())
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EmployeeDetailsScreen(employee: employee),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
