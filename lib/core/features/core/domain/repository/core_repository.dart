import 'package:bloc_base/core/error_handler/my_exception.dart';
import 'package:bloc_base/core/features/core/domain/entity/core_entity.dart';
import 'package:bloc_base/core/features/core/domain/usecases/get_core_usecase.dart';
import 'package:bloc_base/core/utils/data_state.dart';

abstract class ICoreRepository {
  Future<DataState<CoreEntity, MyException>> getData({required CoreParams params});
}