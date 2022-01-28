import 'package:test/test.dart';

void main() {
  List<Map<String, dynamic>> data = [
    {"taskName": "Do Assignment 5", "isCompleted": false, "submissionDate": 29},
    {"taskName": "Do Assignment 4", "isCompleted": true, "submissionDate": 26},
    {"taskName": "Do Assignment 3", "isCompleted": true, "submissionDate": 19},
    {"taskName": "Do Assignment 2", "isCompleted": false, "submissionDate": 12},
    {"taskName": "Do Assignment 1", "isCompleted": true, "submissionDate": 5}
  ];
  //List of Items That Only Completed Tasks:
  List<Map<String, dynamic>> Com_Tasks =
      data.where((d) => d["isCompleted"] == true).toList();
  //List of Task With Submission Dates where Submission Dates are between 10 to 20
  List<Map<String, dynamic>> taskWithSub = [];
  taskWithSubmission(taskWithSub, data);
  //List of task name with completed where "isCompleted": true
  List<Map<String, dynamic>> taskWithCom = [];
  taskWithCompStat(taskWithCom, data);
  //Printer Function
  printer_func(Com_Tasks, taskWithSub, taskWithCom);
}

void taskWithSubmission(
    List<Map<String, dynamic>> taskWithSub, List<Map<String, dynamic>> data) {
  int i = 0;
  for (int t = 0; t < data.length; t++) {
    if (data[t]["submissionDate"] >= 10 && data[t]["submissionDate"] <= 20) {
      taskWithSub.add(Map());
    }
  }

  for (Map<String, dynamic> m in data
      .where((d) => d["submissionDate"] >= 10 && d["submissionDate"] <= 20)
      .toList()) {
    taskWithSub[i++].addAll(
        {"taskName": m["taskName"], "submissionDate": m["submissionDate"]});
  }
}

void taskWithCompStat(
    List<Map<String, dynamic>> task, List<Map<String, dynamic>> data) {
  int i = 0;
  for (int t = 0; t < data.length; t++) {
    task.add(Map());
  }

  for (Map<String, dynamic> m in data) {
    if (m["isCompleted"] == true) {
      task[i].addAll({
        "taskName": m["taskName"] + "_Completed",
        "submissionDate": m["submissionDate"],
        "isCompleted": m["isCompleted"]
      });
    } else {
      task[i].addAll({
        "taskName": m["taskName"],
        "submissionDate": m["submissionDate"],
        "isCompleted": m["isCompleted"]
      });
    }
    i++;
  }
}

void printer(dynamic list) {
  print(list);
}

void printer_func(dynamic l1, dynamic l2, dynamic l3) {
  print("\nList of Items That Only Completed Tasks\n");
  l1.forEach(printer);
  print(
      "\nList of Task With Submission Dates where Submission Dates are between 10 to 20\n");
  l2.forEach(printer);
  print(
      "\nList of task name with completed status where \"isCompleted\": true\n");
  l3.forEach(printer);
}
