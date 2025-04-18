import 'package:energize/services/sqlite/complete_days_database_service_interface.dart';

class CompleteDaysDatabaseServiceMock
    implements CompleteDaysDatabaseServiceInterface {
  final List<DateTime> _completeDays = [];

  @override
  Future<bool> isDateCompleted(DateTime date) async {
    return _completeDays.contains(date);
  }

  @override
  Future<void> insert(DateTime date) async {
    _completeDays.add(date);
  }

  @override
  Future<void> remove(DateTime date) async {
    _completeDays.removeWhere((element) => element == date);
  }

  @override
  Future<List<DateTime>> get completedDays async {
    return _completeDays;
  }
}
