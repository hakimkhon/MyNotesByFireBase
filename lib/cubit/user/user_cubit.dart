import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotesfire/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());
}
