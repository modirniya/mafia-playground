import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mafia_playground/domain/entities/member.dart';

import '../../../data/repos/member_repo.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  final MemberRepo repo;

  MemberCubit({required this.repo}) : super(MemberLoading());

  void getMember({required String authId}) async {
    final response = await repo.getMember(authId: authId);
    emit(response.fold((failure) => MemberServiceFailure(),
        (member) => MemberRecognized(member: member)));
  }
}
