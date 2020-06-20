import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigator_event.dart';

part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  @override
  NavigatorState get initialState => InitialNavigatorState();

  @override
  Stream<NavigatorState> mapEventToState(NavigatorEvent event) async* {
    // TODO: Add your event logic
  }
}
