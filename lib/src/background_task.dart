import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void backgroundTask() {
  print("Callback Dispatcher initialized");
  Workmanager().executeTask((task, inputData) async {
    // Your background task logic
    print("Background task executed: $task");
    return Future.value(true);
  });
}
/* 
?To call the background task:
  Workmanager().registerOneOffTask(
    "uniqueName", // A unique name for the task
    "simpleTask", // The task name, which will be passed to the callbackDispatcher
    inputData: {"key": "value"}, // Optional input data
  );

?To schedule a periodic task:
  Workmanager().registerPeriodicTask(
    'etst',
    'etst',
  );
*/