import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/source/launches_remote_data_source.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'launches_remote_data_source_test.mocks.dart' as mockClient;


const String fakeSuccessResponse = '[{"launch_year":"2006","success":false},{"launch_year":"2007","success":true}]';


@GenerateMocks([Client])
void main() {

  final client = mockClient.MockClient();

  final source = LaunchesRemoteDataSource(client);

  test("When response success, then launches response is returned", () async {
    LaunchesResponse expectedOutput = LaunchesResponse(
        [
          const Launch(
              launchYear: "2006",
              success: false
          ),
          const Launch(
              launchYear: "2007",
              success: true
          )
        ]
    );

    when(client.get(source.API)).thenAnswer((realInvocation) async => Response(fakeSuccessResponse, 200));

    LaunchesResponse launches = await source.getLaunches();

    expect(launches, expectedOutput);
  });

  test("When response is not 200, then source throws an Exception", () async {
    when(client.get(source.API)).thenAnswer((realInvocation) async => Response("Fake Error RESPONSE", 404));

    expect(await source.getLaunches(), throwsException);
  });
}
