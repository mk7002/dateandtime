import 'package:dateandtime/models/appmodels/routing_data.dart';

extension StringExtension on String {
  Routing get routingData {
    var uri = Uri.parse(this);
    return Routing(uri.path,uri.queryParameters);
  }
}