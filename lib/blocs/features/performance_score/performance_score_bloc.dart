import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/performance_score/performance_score_event.dart';
import 'package:qrbani_vender_app/blocs/features/performance_score/performance_score_state.dart';

import '../../../models/performance_score_model.dart';

class PerformanceScoreBloc
    extends Bloc<PerformanceScoreEvent, PerformanceScoreState> {

  PerformanceScoreBloc()
      : super(
    PerformanceScoreState(
      model: PerformanceScoreModel(
        rating: 3.5,
        status: "Excellent",
        orderCompletion: 98,
        onTimeProcessing: 96,
        customerRating: 4.7,
        responseTime: "Excellent",
      ),
    ),
  ) {

    on<LoadPerformanceScore>((event, emit) {});

    on<ViewDetails>((event, emit) {});
  }
}