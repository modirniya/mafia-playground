import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mafia_playground/core/constant/objects.dart';
import 'package:mafia_playground/data/model/header_body_container.dart';
import 'package:mafia_playground/data/repos/member_repo.dart';
import 'package:mafia_playground/data/source/member_function.dart';

void main() {
  var datasource = MemberFirebaseFunction(
      client: http.Client(), host: FunctionAccessPoint.emulator);
  var repo = MemberRepo(datasource: datasource);

  test('MemberFirebaseFunction getMember() Emulator', () async {
    const authId = '9df4dcd4-226b-4128-a14d-aaa47e485d66';
    var container = HeadersBodyContainer.getMemberContainer(authId: authId);
    var response = await datasource.get(container: container);
    expect(response.uuid?.isNotEmpty, true);
  });

  test('FirebaseRepo getMember()  Emulator', () async {
    const authId = '45655d68-4d35-40c0-9332-c01b9a6e30cb';
    var response = await repo.getMember(authId: authId);
    expect(response.isRight(), true);
  });
}
