
///
/// Print will only happen after the delay
/// 
void firstTask(int delay) {
  Future.delayed(Duration(seconds: delay), () {
    print('First task completed');
  });
}

///
/// Loop will print delayed messages sequentially
/// 
void loopTask(int delay) {
  for (var i = 1; i <= delay; i++) {
    Future.delayed(Duration(seconds: i), () {
      print('Loop task in progress.... ${(i / delay) * 100}% complete');
      if (i == delay) print('Loop task completed');
    });
  }
}

///
/// This task will return a string after the delay
/// 
Future<String> performDelayedTask(int delay) {
  return Future.delayed(Duration(seconds: delay), () => 'Delayed task completed');
}

///
/// This function will call a Future (without waiting)
/// 
void printDelayedTask(int delay) {
  print('Perform delayed task: ${performDelayedTask(delay)}');
}

/// 
/// This function will wait for the Future to complete before calling it
/// 
void printDelayedTaskAsync(int delay) async {
  print('Perform delayed task: ${await performDelayedTask(delay)}');
}

void main() {
  print('Program starting...');

  printDelayedTask(4);
  printDelayedTaskAsync(4);
  firstTask(2);
  loopTask(5);
}
