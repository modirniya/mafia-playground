import 'package:dartz/dartz.dart';
import 'package:mafia_playground/core/error/failures.dart';
import 'package:mafia_playground/domain/entities/profile.dart';

abstract class ProfileRepoBlueprint {
  Future<Either<Failure, Profile>> getProfile({required String uuid});

  Future<Either<Failure, Unit>> storeProfile(
      {required String uuid, required Profile profile});
}