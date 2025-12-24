class Urls {
  static String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static String registrationUrls = "$_baseUrl/registration";
  static String loginUrls = "$_baseUrl/login";
  static String createTaskUrls = "$_baseUrl/createTask";
  static String taskCountUrls = "$_baseUrl/taskStatusCount";
  static String newTaskUrls = "$_baseUrl/listTaskByStatus/New";
  static String progressTaskUrls = "$_baseUrl/listTaskByStatus/Progress";
  static String completedTaskUrls = "$_baseUrl/listTaskByStatus/Completed";
  static String cancelledTaskUrls = "$_baseUrl/listTaskByStatus/Cancelled";
  static String updateProfileUrls = "$_baseUrl/ProfileUpdate";
  static String deleteTaskUrls(String taskId) => "$_baseUrl/deleteTask/$taskId";

  static String taskListUrls(String type) => "$_baseUrl/listTaskByStatus/$type";
  static String changeStatus(String taskId, String status) =>
      "$_baseUrl/updateTaskStatus/$taskId/$status";
}
