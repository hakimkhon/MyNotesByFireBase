import 'package:mynotesfire/data/enums/forms_status.dart';
import 'package:mynotesfire/data/model/user_model.dart';

class UserState {
  final String errorText;
  final String statusMessage;
  final FormsStatus formsStatus;
  final UserModel userModel;

  UserState({
    required this.errorText,
    required this.statusMessage,
    required this.formsStatus,
    required this.userModel,
  });

  UserState copyWith({
    String? errorText,
    String? statusMessage,
    FormsStatus? formsStatus,
    UserModel? userModel,
  }) {
    return UserState(
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? "",
      formsStatus: formsStatus ?? this.formsStatus,
      userModel: userModel ?? this.userModel,
    );
  }

  factory UserState.initial() {
    return UserState(
      formsStatus: FormsStatus.pure,
      errorText: "",
      statusMessage: "",
      userModel: UserModel.initial(),
    );
  }
}
