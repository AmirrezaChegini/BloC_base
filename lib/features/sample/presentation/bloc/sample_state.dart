import 'package:bloc_base/core/status/base_status.dart';
import 'package:equatable/equatable.dart';

class SampleState extends Equatable {
  final BaseStatus getSampleStatus;

  const SampleState({
    this.getSampleStatus = const BaseInit(),
  });

  SampleState copyWith({
    BaseStatus? getSampleStatus,
  }) {
    return SampleState(
      getSampleStatus: getSampleStatus ?? this.getSampleStatus,
    );
  }

  @override
  List<Object?> get props => [
        getSampleStatus,
      ];
}
