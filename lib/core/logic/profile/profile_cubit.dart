import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mafia_playground/domain/entities/profile.dart';

import '../../../data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo repo;

  ProfileCubit({required this.repo}) : super(ProfileLoading());

  void getProfile({required String uuid}) async {
    final profileOrFailure = await repo.getProfile(uuid: uuid);
    profileOrFailure.fold((failure) => ProfileNotFound(),
        (profile) => ProfileReceived(profile: profile));
  }
}
