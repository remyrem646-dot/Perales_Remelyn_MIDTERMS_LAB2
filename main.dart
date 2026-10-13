import 'dart:io';

class Student {
  String fullName, idNumber;
  double grade1, grade2, grade3;

  Student(
      this.fullName, 
      this.idNumber, 
      this.grade1, 
      this.grade2, 
      this.grade3
      );

  double computeGrade() {
    return (grade1 + grade2 + grade3) / 3;
  }

  void displayGrades() {
    List<double> grades = [grade1, grade2, grade3];

    print('\n--- SUBJECT GRADES ---');

    for (int i = 0; i < grades.length; i++) {
      print('Subject ${i + 1}: ${grades[i].toStringAsFixed(2)}');
    }
  }
}

void main() {
  print('================================');
  print('   STUDENT GRADES COMPUTATION ');
  print('================================');

  stdout.write('Enter full name: ');
  String fullName = stdin.readLineSync() ?? '';

  stdout.write('Enter ID number: ');
  String idNumber = stdin.readLineSync() ?? '';

  double readGrade(int subject) {
    while (true) {
      stdout.write('Enter grade for Subject $subject (0-100): ');
      String input = stdin.readLineSync() ?? '';
      double? grade = double.tryParse(input);

      if (grade != null && grade >= 0 && grade <= 100) {
        return grade;
      }

      print('Invalid input. Please enter a number from 0 to 100.');
    }
  }

  double grade1 = readGrade(1);
  double grade2 = readGrade(2);
  double grade3 = readGrade(3);

  Student student = Student(
    fullName,
    idNumber,
    grade1,
    grade2,
    grade3,
  );

  double average = student.computeGrade();

  print('\n================================');
  print('        STUDENT REPORT');
  print('================================');
  print('Full Name: ${student.fullName}');
  print('ID Number: ${student.idNumber}');

  student.displayGrades();

  print('\nAverage Grade: ${average.toStringAsFixed(2)}');

  if (average >= 75) {
    print('Status: Passed');
  } else if (average >= 70) {
    print('Status: Conditional');
  } else {
    print('Status: Failed');
  }
  print('================================');
}