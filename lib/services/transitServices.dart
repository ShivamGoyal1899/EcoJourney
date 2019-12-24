import 'dart:async';
import 'dart:convert';

import 'package:EcoJourney/models/transitModel.dart';
import 'package:http/http.dart' as http;

class ApiResponse {
  Future<Transit> getTransit() async {
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=Indian%20Institute%20of%20Technology%20Delhi,%20IIT%20Campus,%20Hauz%20Khas,%20New%20Delhi,%20Delhi%20110016&destination=Miranda%20House%20University%20Of%20Delhi,%20GC%20Narang%20Road,%20University%20Enclave,%20New%20Delhi,%20Delhi%20110007&key=AIzaSyBeV96xzMs51tMytAZgLZZDAAof9i_1kik&&mode=transit&transit_mode=subway';
    final response = await http.get(url);
    return Transit.fromJson(json.decode(response.body));
  }
}
