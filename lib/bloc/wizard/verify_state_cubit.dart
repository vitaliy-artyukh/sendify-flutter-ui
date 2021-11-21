import 'package:flutter_bloc/flutter_bloc.dart';

enum VerifyState { prepare, enterCode, verified }

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyState.prepare);

  void requestCode() {
    emit(VerifyState.enterCode);
  }

  void successConfirmation() {
    emit(VerifyState.verified);
  }
}
