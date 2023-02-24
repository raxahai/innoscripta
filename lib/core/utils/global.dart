class GlobalConstants {
  static Map<String, int> projectType = {
    "scrum": 0,
    "agile": 1,
    "kanban": 2,
    "todo": 4,
    "basic": 5,
  };
}

class StorageKeys {
  static const String userIdKey = 'gs_user_id';
  static const String userTokenKey = 'gs_user_token';
}

final GlobalCache globalCache = GlobalCache();

class GlobalCache {}

final Authenticator authenticator = Authenticator();

class Paths {
// Internal Public Base Url
  static const String baseUrl = 'https://www.getscope.io/gs';

  // Register
  static const String register = '/user/register';

  // login
  static const String login = '/dologin';

  // Forgot Passwrod
  static const String forgotPassword = '/user/new_password';

  static const String resetPassword = '/user/reset_password';

  // Create Project
  static const String createProject = '/project/new';
  static const String getProjects = '/project/list';

  // Create story
  static const String createStory = '/story/new';
  // Get story
  static const String getProjectStories = '/story/project/';

  // Create task
  static const String createTask = '/task/new';

// Create Epic
  static const String createEpic = '/folder/new';

// Get Epics
  static const String getEpics = '/folder/project/';

  // Add comment
  static const String addComment = '/comment/new';

  // get comments
  static const String getComments = '/comment/story/';

  static const String updateStory = '/story/';
}

class Authenticator {
  String? _userId;
  String? _userToken;

  void setUserToken(String token) {
    _userToken = token;
  }

  void setUserId(String token) {
    _userId = token;
  }

  String? getUserId() {
    return _userId;
  }

  String? getUserToken() {
    if (_userToken != null && _userToken != '') {
      return _userToken;
    } else {
      return null;
    }
  }
}
