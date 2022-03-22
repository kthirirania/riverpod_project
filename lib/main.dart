import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

final greetingProvider = Provider((ref) => 'Hello Riverpod!');

class IncrementNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value += 1;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod Tutorial'),
        ),
        body: Center(
          child: Text(greeting),
        ),
      ),
    );
  }
}
