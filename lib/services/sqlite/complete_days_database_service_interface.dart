/// Manages the days a user marked as "completed".
///
/// These days are marked with a checkmark in the calendar overview.
abstract class CompleteDaysDatabaseServiceInterface {
  /// Returns whether [date] is completed.
  Future<bool> isDateCompleted(DateTime date);

  /// Inserts [date] if it was non already marked as completed.
  Future<void> insert(DateTime date);

  /// Removes [date] if it was previously marked as completed.
  Future<void> remove(DateTime date);

  /// Returns all completed days.
  Future<List<DateTime>> get completedDays;
}
