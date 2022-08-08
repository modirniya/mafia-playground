import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoading()) {
    final auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((event) {
      if (auth.currentUser != null) {
        final uid = auth.currentUser!.uid;
        emit(Authenticated(authId: uid));
      } else {
        emit(AuthenticationRequired());
      }
    });
  }
}
