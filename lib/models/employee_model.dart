class Employee {
  final String name;
  final int age;
  final int salary;

  Employee({required this.name, required this.age, required this.salary});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'] ?? 'Unknown',
      age: json['age'] ?? 0,
      salary: json['salary'] ?? 0,
    );
  }
}
