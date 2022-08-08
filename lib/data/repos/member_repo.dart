import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mafia_playground/core/error/failures.dart';
import 'package:mafia_playground/data/model/header_body_container.dart';
import 'package:mafia_playground/data/source/member_function.dart';
import 'package:mafia_playground/domain/entities/member.dart';

class MemberRepo {
  late final MemberFirebaseFunction datasource;

  MemberRepo({required this.datasource});

  Future<Either<Failure, Member>> getMember({required String authId}) async {
    final container = HeadersBodyContainer.getMemberContainer(authId: authId);
    try {
      final response = await datasource.get(container: container);
      final member = Member(authId: authId, uuid: response.uuid!);
      return Right(member);
    } on TimeoutException {
      return Left(ServerFailure());
    }
  }
}
