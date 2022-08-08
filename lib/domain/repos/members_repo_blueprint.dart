import 'package:dartz/dartz.dart';
import 'package:mafia_playground/core/error/failures.dart';
import 'package:mafia_playground/domain/entities/member.dart';

abstract class MembersRepoBlueprint {
  Future<Either<Failure, Member>> getMember({required String authId});
}
