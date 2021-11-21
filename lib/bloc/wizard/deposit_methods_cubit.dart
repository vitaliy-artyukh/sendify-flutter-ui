import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendify/models/deposit_method.dart';

class DepositMethodCubit extends Cubit<DepositMethod?> {
  late List<DepositMethod> methods;
  DepositMethodCubit(this.methods) : super(null);

  void updateMethod(DepositMethod depositMethod) {
    if (depositMethod == state) {
      return;
    }

    emit(depositMethod);
  }
}
