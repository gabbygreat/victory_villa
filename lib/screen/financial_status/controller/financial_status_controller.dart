import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/networking/networking.dart';

final financialStatusProvider = FutureProvider.autoDispose<Map<String, List>?>(
    (_) => GetCalls.getFinancialStatus());
