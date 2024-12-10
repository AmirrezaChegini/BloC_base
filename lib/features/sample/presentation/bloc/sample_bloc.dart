import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_base/core/status/base_status.dart';
import 'package:bloc_base/features/sample/domain/entity/sample_entity.dart';
import 'package:bloc_base/features/sample/domain/usecases/get_sample_usecase.dart';
import 'package:bloc_base/features/sample/presentation/bloc/sample_event.dart';
import 'package:bloc_base/features/sample/presentation/bloc/sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final GetSampleUseCase getSampleUseCase;

  SampleBloc(
    this.getSampleUseCase,
  ) : super(const SampleState()) {
    on<GetSampleEvent>(_getSampleEvent);
  }

  FutureOr<void> _getSampleEvent(event, emit) async {
    await getSampleUseCase(event.sampleParams).then(
      (value) {
        value.fold(
          (data) {
            emit(state.copyWith(getSampleStatus: BaseComplete<SampleEntity>(data)));
          },
          (error) {
            emit(state.copyWith(getSampleStatus: BaseError(error.errorMessage)));
          },
        );
      },
    );
  }
}
