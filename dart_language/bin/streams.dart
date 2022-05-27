import 'dart:async';

///
/// Simple example of how StreamController intereacts with stream listener and events
///
void concept(){

  // Set up a StreamController
  StreamController controller = StreamController();

  // Create a stream
  Stream stream = controller.stream;

  // Configure the stream to listen to events in the controller
  stream.listen((event) {
    print('Event: $event');
  }).onDone(() {
    print('Controller is closed');
   });

  // Add events to stream
  controller.sink.add('New event');
  controller.sink.add(123);
  controller.sink.add([1, 54, 7]);
  controller.sink.add(true);
  controller.close();

  print('Start monitor');
}


void main() {
  concept();
}