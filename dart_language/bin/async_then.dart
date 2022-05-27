///
/// 'Then' can be called after any Future function. If it returns a value, it can be accessed from onValue property
/// 'catchError' is called in case the 
///   - whenComplete
/// 


///
/// This task will return a string after the delay
/// 
Future<String> performDelayedTask(int delay) {
  return Future.delayed(Duration(seconds: delay), () => 'Delayed task completed');
}

/// 
/// This function will wait for the Future to complete before calling it
/// 
Future<String> printDelayedTaskAsync(int delay, String id) async {
  String taskResult = await performDelayedTask(delay);
  return 'ID $id: $taskResult';
}

///
/// This function should return a String, but will throw an error
/// 
Future failedTask(int delay, String id) async {
  return Future.delayed(Duration(seconds: delay), () => throw Error());
}

void main() async {
  printDelayedTaskAsync(7, 'A').then((value) => print(value));
  print('Called after Future A, but should print out before');

  await printDelayedTaskAsync(2, 'B').then((value) => print(value));
  print('Called after Future B, and should print out after due to Await');

  printDelayedTaskAsync(1, 'C').then((value) => print(value)).whenComplete(() => print('This should print only when Future C is completed'));
  
  printDelayedTaskAsync(1, 'D').then((value) async {
    print(value);
    await Future.delayed(Duration(seconds: 2), () => print('An additional delay on Future D for whatever reason'));
  }).whenComplete(() => print('This should print only when Future D is completed'));

  failedTask(2, 'D').catchError((onError) => print('Something went wrong: ${onError.toString()}'));

}