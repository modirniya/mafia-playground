part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileReceived extends ProfileState {
  final Profile profile;

  const ProfileReceived({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileNotFound extends ProfileState {
  @override
  List<Object?> get props => [];
}
