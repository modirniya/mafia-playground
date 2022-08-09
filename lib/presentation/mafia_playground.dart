import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia_playground/core/logic/auth/auth_cubit.dart';
import 'package:mafia_playground/core/logic/profile/profile_cubit.dart';
import 'package:mafia_playground/presentation/app_frame.dart';

import '../injection_container.dart';

class MafiaPlaygroundApp extends StatelessWidget {
  const MafiaPlaygroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => sl<ProfileCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Mafia Playground',
        home: const AppFrame(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
