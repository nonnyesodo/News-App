String bearerToken = '';

class ApiHeaders {
  static Map<String, String> get unauthenticatedHeader =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  static Map<String, String> get authenticatedHeader => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken'
      };
}
