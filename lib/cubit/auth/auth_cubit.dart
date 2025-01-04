
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotesfire/cubit/auth/auth_state.dart';
import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/model/network_response.dart';
import 'package:mynotesfire/data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthRepository read) : super(AuthState.initial());

  final AuthRepository _authRepository = AuthRepository();
  final TextEditingController _emailConstroller = TextEditingController();
  final TextEditingController _passwordConstroller = TextEditingController();
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await _authRepository.registerUser(
      email: _emailConstroller.text,
      password: _passwordConstroller.text,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(formsStatus: FormsStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
