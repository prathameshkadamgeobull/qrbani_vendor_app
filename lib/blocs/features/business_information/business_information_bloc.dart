import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Screens/business_information/repositories/business_information_repository.dart';
import 'business_information_event.dart';
import 'business_information_state.dart';

class BusinessInformationBloc
    extends Bloc<BusinessInformationEvent, BusinessInformationState> {
  final BusinessInformationRepository repository;

  BusinessInformationBloc(this.repository)
      : super(const BusinessInformationState()) {
    on<LoadBusinessInformation>(_loadBusinessInformation);
  }

  Future<void> _loadBusinessInformation(
      LoadBusinessInformation event,
      Emitter<BusinessInformationState> emit,
      ) async {
    emit(state.copyWith(loading: true));

    final business = await repository.getBusinessInformation();

    emit(
      state.copyWith(
        loading: false,
        business: business,
      ),
    );
  }
}