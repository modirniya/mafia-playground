import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String language;
  final String region;

  const Profile({
    required this.name,
    required this.language,
    required this.region,
  });



  @override
  List<Object?> get props => [name, language, region];
}
