import '../services/sqlite/complete_days_database_service_interface.dart';

/// Provider for everything related to completed days.
class CompleteDaysProvider {
  final CompleteDaysDatabaseServiceInterface _db;

  CompleteDaysProvider({required CompleteDaysDatabaseServiceInterface db})
      : _db = db;

  /// Returns whether the given [date] is marked as completed.
  Future<bool> isDateCompleted(DateTime date) {
    return _db.isDateCompleted(date);
  }

  /// Returns all days marked as completed.
  Future<List<DateTime>> get completedDays async {
    return _db.completedDays;
  }

  /// Unmarks [date] as completed.
  Future<void> remove(DateTime date) async {
    await _db.remove(date);
  }

  /// Marks [date] as completed.
  Future<void> markCompleted(DateTime date) async {
    await _db.insert(date);
  }
}
