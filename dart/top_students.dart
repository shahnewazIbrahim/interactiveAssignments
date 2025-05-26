void printTopStudents(Map<String, int> studentScores) {
  for (var entry in studentScores.entries) {
    if (entry.value > 80) {
      print(entry.key);
    }
  }
}

void main() {
  Map<String, int> students = {
    'Alice': 75,
    'Bob': 82,
    'Charlie': 91,
    'Diana': 65,
    'Evan': 88,
    'Fiona': 79,
    'George': 93,
    'Hannah': 80,
    'Ian': 85,
    'Jenny': 77
  };

  print('Students who scored above 80:');
  printTopStudents(students);
}
