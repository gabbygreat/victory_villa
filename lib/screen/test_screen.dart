import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeRefreshProvider = FutureProvider<DateTime>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return DateTime.now();
});

final diplayedTimer = Provider<StateProvider<AsyncValue<DateTime>>>((ref) {
  final _diplayedTimer = StateProvider<AsyncValue<DateTime>>((ref) {
    return const AsyncLoading();
  });
  ref.listen(timeRefreshProvider, (previous, next) {
    if (next is AsyncData<DateTime>) {
      ref.read(_diplayedTimer.state).update((state) => next);
    }
  });
  return _diplayedTimer;
});

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Center(
        child: TimeDisplayer(),
      )),
    );
  }
}

class TimeDisplayer extends ConsumerWidget {
  const TimeDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(ref.watch(diplayedTimer));

    return Column(
      children: [
        time.when(
            data: (data) => Text(data.toString()),
            error: (e, _) => Text(e.toString()),
            loading: () => const CircularProgressIndicator()),
        IconButton(
            onPressed: () => ref.refresh(timeRefreshProvider),
            icon: const Icon(Icons.refresh))
      ],
    );
  }
}
