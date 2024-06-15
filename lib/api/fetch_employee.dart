import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:employee_list/models/employee_model.dart';

class EmployeeService {
  static const String proxyUrl = 'https://cors-anywhere.herokuapp.com/';
  static const String url = 'https://aamras.com/dummy/EmployeeDetails.json';

  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(proxyUrl + url));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('employees')) {
          List<dynamic> employeeData = data['employees'];
          List<Employee> employees =
              employeeData.map((json) => Employee.fromJson(json)).toList();
          return employees;
        } else {
          throw Exception('Invalid JSON structure: Missing "employees" key');
        }
      } else {
        throw Exception(
            'Failed to load employees with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load employees: $e');
    }
  }
}
