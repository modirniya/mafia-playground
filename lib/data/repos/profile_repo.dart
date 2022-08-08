import 'package:dartz/dartz.dart';
import 'package:mafia_playground/core/error/exceptions.dart';
import 'package:mafia_playground/data/model/header_body_container.dart';
import 'package:mafia_playground/data/model/profile_model.dart';
import 'package:mafia_playground/data/source/profile_function.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/profile.dart';

class ProfileRepo {
  late final ProfileFirebaseFunction datasource;

  ProfileRepo({required this.datasource});

  Future<Either<Failure, Profile>> getProfile({required String uuid}) async {
    final container = HeadersBodyContainer.getProfileContainer(uuid: uuid);
    try {
      final res = await datasource.get(container: container);
      final profile = Profile(
          name: res.name!, language: res.language!, region: res.region!);
      return Right(profile);
    } on ServerException {
      return Left(ServerFailure());
    } on ServiceNotFoundException {
      return Left(ServiceNotFoundFailure());
    }
  }

  Future<Either<Failure, Profile>> setProfile(
      {required String uuid,
      required String name,
      required String language,
      required String region}) async {
    final container = HeadersBodyContainer.postProfileContainer(
        uuid: uuid, name: name, language: language, region: region);
    try {
      ProfileModel res = await datasource.post(container: container);
      final profile = Profile(name: res.name!, language: res.language!, region: res.region!);
      return Right(profile);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
