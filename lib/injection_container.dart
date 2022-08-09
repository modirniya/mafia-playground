import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mafia_playground/core/logic/auth/auth_cubit.dart';
import 'package:mafia_playground/core/logic/member/member_cubit.dart';
import 'package:mafia_playground/core/logic/profile/profile_cubit.dart';
import 'package:mafia_playground/data/repos/member_repo.dart';
import 'package:mafia_playground/data/repos/profile_repo.dart';
import 'package:mafia_playground/data/source/member_function.dart';

import 'core/constant/objects.dart';
import 'data/source/profile_function.dart';

final sl = GetIt.instance;
const ap = FunctionAccessPoint.emulator;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit());
  sl.registerLazySingleton<MemberCubit>(() => MemberCubit(repo: sl()));
  sl.registerLazySingleton<ProfileCubit>(() => ProfileCubit(repo: sl()));
  // Repo
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepo(datasource: sl()));
  sl.registerLazySingleton<MemberRepo>(() => MemberRepo(datasource: sl()));
  // Data-source
  sl.registerLazySingleton<ProfileFirebaseFunction>(
      () => ProfileFirebaseFunction(client: sl(), host: ap));
  sl.registerLazySingleton<MemberFirebaseFunction>(
      () => MemberFirebaseFunction(client: sl(), host: ap));
  // 3rd-party
  sl.registerLazySingleton<http.Client>(() => http.Client());
}
