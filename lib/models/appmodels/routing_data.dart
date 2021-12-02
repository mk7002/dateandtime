class Routing {
  late final String route;
  late final Map<String, String> queryParameter;

  Routing(this.route, this.queryParameter);

  operator [](String key) => queryParameter == null ? "" : queryParameter[key];
}
