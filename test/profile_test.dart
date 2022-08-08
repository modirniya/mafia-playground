import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mafia_playground/core/constant/objects.dart';
import 'package:mafia_playground/data/model/header_body_container.dart';
import 'package:mafia_playground/data/repos/profile_repo.dart';
import 'package:mafia_playground/data/source/profile_function.dart';

void main() {
  var datasource = ProfileFirebaseFunction(
      client: http.Client(), host: FunctionAccessPoint.emulator);
  var repo = ProfileRepo(datasource: datasource);

  test('ProfileRepo postProfile()', () async {
    const uuid = '9df4dcd4-226b-4128-a14d-aaa47e485d66';
    final res = await repo.setProfile(uuid: uuid, name: 'Parham m.n', language: 'FA', region: "IR");
    expect(res.isRight(), true);
  });

  test('ProfileFirebaseFunction getProfile() Emulator', () async {
    const uuid = '9df4dcd4-226b-4128-a14d-aaa47e485d66';
    final container = HeadersBodyContainer.getProfileContainer(uuid: uuid);
    final response = await datasource.get(container: container);
    expect(response.name?.isNotEmpty, true);
  });

  test('ProfileRepo getProfile() Emulator', () async {
    const uuid = '9df4dcd4-226b-4128-a14d-aaa47e485d66';
    final response = await repo.getProfile(uuid: uuid);
    expect(response.isRight(), true);
  });
}
