class Task {

  String content;
  DateTime timestamp;
  bool done;

  // For the unnamed constructor, data is provided separately
  Task({required this.content, required this.timestamp, required this.done,});

  // Factory constructor to allow creating an object from a Map
  factory Task.fromMap(Map taskMap) {
    return Task(content: taskMap['content'], timestamp: taskMap['timestamp'], done: taskMap['done']);
  }

  // Method to parse the object information to a Map
  Map toMap() {
    return {
      'content': content,
      'timestamp': timestamp,
      'done': done,
    };
  }
}