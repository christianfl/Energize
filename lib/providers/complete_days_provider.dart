import '../services/sqlite/complete_days_database_service_interface.dart';
import 'log_provider.dart';

/// Provider for everything related to completed days.
class CompleteDaysProvider {
  final CompleteDaysDatabaseServiceInterface _db;
  final LogProvider _logger;

  CompleteDaysProvider({
    required CompleteDaysDatabaseServiceInterface db,
    required LogProvider logger,
  }) : _db = db,
       _logger = logger;

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

    _logger.info('Unmarked day as complete: $date');
  }

  /// Marks [date] as completed.
  Future<void> markCompleted(DateTime date) async {
    await _db.insert(date);

    _logger.info('Marked day as complete: $date');
  }
}
