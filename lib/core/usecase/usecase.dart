import 'package:bloc_base/core/error_handler/my_exception.dart';
import 'package:bloc_base/core/utils/data_state.dart';

abstract class UseCase<T, P> {
  Future<DataState<T, MyException>> call(P params);
}

class NoParams {}
