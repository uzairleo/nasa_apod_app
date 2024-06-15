class Urls {
  static const String _baseUrl = "https://api.nasa.gov";

  static const String getApods = "$_baseUrl/planetary/apod";
  static get baseUrl => _baseUrl;
}
