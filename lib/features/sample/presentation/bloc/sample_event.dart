import 'package:bloc_base/features/sample/domain/usecases/get_sample_usecase.dart';

sealed class SampleEvent {
  const SampleEvent();
}

class GetSampleEvent extends SampleEvent {
  final SampleParams sampleParams;

  const GetSampleEvent(this.sampleParams);
}
