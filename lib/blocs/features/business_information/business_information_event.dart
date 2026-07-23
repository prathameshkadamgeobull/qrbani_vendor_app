import 'package:equatable/equatable.dart';

abstract class BusinessInformationEvent extends Equatable {
  const BusinessInformationEvent();

  @override
  List<Object?> get props => [];
}

class LoadBusinessInformation extends BusinessInformationEvent {}

class EditBusinessInformation extends BusinessInformationEvent {}