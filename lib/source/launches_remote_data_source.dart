
import 'dart:convert';

import 'package:http/http.dart';

class LaunchesRemoteDataSource {

  final Client client;

  final Uri API = Uri.parse("https://api.spacexdata.com/v3/launches");

  LaunchesRemoteDataSource(this.client);

  Future<LaunchesResponse> getLaunches({String? year, bool? success} ) async {

    Response response = await client.get(API);

    if (response.statusCode == 200) {
      return LaunchesResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load launches');
    }
  }
}

class LaunchesResponse {
  final List<Launch> launches;

  LaunchesResponse(this.launches);

  factory LaunchesResponse.fromJson(String rawJson) {
    return LaunchesResponse(
        List<Launch>.from(json.decode(rawJson).map((e) => Launch.fromJson(e)))
    );
  }

  @override
  bool operator ==(Object other) {
    for (var i = 0; i < launches.length; i++) {
      if (launches[i] != (other as LaunchesResponse).launches[i]) {
        return false;
      }
    }
    return true;
  }
}

class Launch {
  final String launchYear;
  final bool success;

  const Launch({required this.launchYear, required this.success});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      launchYear: json['launch_year'],
      success: json['success']
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Launch && launchYear == other.launchYear && success == other.success;
  }
}