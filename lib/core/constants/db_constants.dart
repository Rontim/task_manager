class DBConstants {
  // Database name
  static const String databaseName = 'task_manager.db';

  // ---------- User Table ----------
  static const String userTable = 'users';
  static const String userId = 'id';
  static const String userName = 'name';
  static const String userEmail = 'email';
  static const String userUpdatedAt = 'updated_at';

  static const String createUserTable = '''
    CREATE TABLE $userTable (
      $userId INTEGER PRIMARY KEY AUTOINCREMENT,
      $userName TEXT,
      $userEmail TEXT,
      $userUpdatedAt TEXT
    );
  ''';

  // ---------- Task Table ----------
  static const String taskTable = 'tasks';
  static const String taskId = 'id';
  static const String taskTitle = 'title';
  static const String taskDescription = 'description';
  static const String taskCompleted = 'completed';
  static const String taskUpdatedAt = 'updated_at';
  static const String taskUserId = 'user_id'; // Foreign key to User table
  static const String taskCategoryId =
      'category_id'; // Foreign key to Category table
  static const String taskPriorityId =
      'priority_id'; // Foreign key to Priority table

  static const String createTaskTable = '''
    CREATE TABLE $taskTable (
      $taskId INTEGER PRIMARY KEY AUTOINCREMENT,
      $taskTitle TEXT,
      $taskDescription TEXT,
      $taskCompleted INTEGER,
      $taskUpdatedAt TEXT,
      $taskUserId INTEGER,
      $taskCategoryId INTEGER,
      $taskPriorityId INTEGER,
      FOREIGN KEY ($taskUserId) REFERENCES $userTable($userId) ON DELETE CASCADE,
      FOREIGN KEY ($taskCategoryId) REFERENCES $categoryTable($categoryId) ON DELETE SET NULL,
      FOREIGN KEY ($taskPriorityId) REFERENCES $priorityTable($priorityId) ON DELETE SET NULL
    );
  ''';

  // ---------- Category Table ----------
  static const String categoryTable = 'categories';
  static const String categoryId = 'id';
  static const String categoryName = 'name';

  static const String createCategoryTable = '''
    CREATE TABLE $categoryTable (
      $categoryId INTEGER PRIMARY KEY AUTOINCREMENT,
      $categoryName TEXT
    );
  ''';

  // ---------- Notification Table ----------
  static const String notificationTable = 'notifications';
  static const String notificationId = 'id';
  static const String notificationTime = 'time'; // Time for the reminder
  static const String notificationTaskId =
      'task_id'; // Foreign key to Task table

  static const String createNotificationTable = '''
    CREATE TABLE $notificationTable (
      $notificationId INTEGER PRIMARY KEY AUTOINCREMENT,
      $notificationTime TEXT,
      $notificationTaskId INTEGER,
      FOREIGN KEY ($notificationTaskId) REFERENCES $taskTable($taskId)
    );
  ''';

  // ---------- Priority Table ----------
  static const String priorityTable = 'priorities';
  static const String priorityId = 'id';
  static const String priorityName = 'name'; // High, Medium, Low

  static const String createPriorityTable = '''
    CREATE TABLE $priorityTable (
      $priorityId INTEGER PRIMARY KEY AUTOINCREMENT,
      $priorityName TEXT
    );
  ''';
}
