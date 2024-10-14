class AssignmentData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate,
      this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData('Biology', 'Teacher_name', '17 Nov 2021', 'AN', 'Pending'),
  AssignmentData('Physics', 'Teacher_name', '11 Nov 2021', 'FN', 'Pending'),
  AssignmentData(
      'Chemistry', 'Teacher_name', '27 Oct 2021', 'AN', 'Not Submitted'),
  AssignmentData('Mathematics', 'Teacher_name', '17 Sep 2021', 'FN', 'Pending'),
];
