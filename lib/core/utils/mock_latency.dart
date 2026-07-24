import 'dart:math';

final _random = Random();

/// Artificial network delay so shimmers/loaders are visible — architecture.md §8.
Future<void> simulateLatency() {
  final ms = 300 + _random.nextInt(501); // 300-800ms
  return Future<void>.delayed(Duration(milliseconds: ms));
}
