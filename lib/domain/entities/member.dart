import 'package:equatable/equatable.dart';

class Member extends Equatable {
  final String authId;
  final String uuid;

  const Member({required this.authId, required this.uuid});

  @override
  List<Object?> get props => [uuid];
}
