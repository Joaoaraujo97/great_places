import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const google_api_key = 'AIzaSyAA9UtqqQ9ZicL_ssLth06K5J1CryMHhIs';

class LocationUtil {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$google_api_key';
  }

  static Future<String> getAddressForm(LatLng position) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$google_api_key');
    final response = await http.get(url);
    return json
        .decode(response.body)['results'][0]['formatted_address']
        .toString();
  }
}
