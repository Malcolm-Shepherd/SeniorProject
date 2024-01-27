class RouteInfo {
  String routeName = '';
  String weatherType = '';
  String fromLocation = '';
  String toLocation = '';

  RouteInfo(String name, String weather, String from, String to) {
    routeName = name;
    weatherType = weather;
    fromLocation = from;
    toLocation = to;
  }
}
