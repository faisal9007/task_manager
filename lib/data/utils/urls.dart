class Urls {
  static String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static String registrationUrls = "$_baseUrl/registration";
  static String loginUrls = "$_baseUrl/login";
  static String createTaskUrls = "$_baseUrl/createTask";
  static String taskCountUrls = "$_baseUrl/taskStatusCount";
  static String newTaskUrls = "$_baseUrl/listTaskByStatus/New";
  static String taskListUrls(String type) => "$_baseUrl/listTaskByStatus/$type";
}
