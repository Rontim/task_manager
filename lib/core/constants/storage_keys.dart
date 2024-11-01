class StorageKeys {
  // User authentication keys
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String isLoggedIn = 'is_logged_in';

  // User information
  static const String userName = 'user_name';
  static const String userEmail = 'user_email';

  // Task management flags
  static const String unsyncedTasks =
      'unsynced_tasks'; // Tracks tasks that need syncing
  static const String currentCategory =
      'current_category'; // Stores last selected category

  // Notification preferences
  static const String notificationEnabled =
      'notification_enabled'; // Enable or disable notifications

  // Task priority settings
  static const String defaultPriority =
      'default_priority'; // Default priority for new tasks
}
