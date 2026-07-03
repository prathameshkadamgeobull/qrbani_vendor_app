import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_event.dart';
import 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitial(0)) {

    on<ChangeDrawerItem>((event, emit) {
      emit(DrawerInitial(event.index));
    });

  }
}