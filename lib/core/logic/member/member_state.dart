part of 'member_cubit.dart';

abstract class MemberState extends Equatable {
  const MemberState();
}

class MemberLoading extends MemberState {
  @override
  List<Object> get props => [];
}

class MemberRecognized extends MemberState {
  final Member member;

  const MemberRecognized({required this.member});

  @override
  List<Object?> get props => [member];
}

class MemberServiceFailure extends MemberState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
