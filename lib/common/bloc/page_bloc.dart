import 'package:hydrated_bloc/hydrated_bloc.dart';

class PageBloc extends HydratedBloc<int, int> {
  int _counter = 0;

  @override
  int get initialState => super.initialState ?? 0;

  @override
  int fromJson(Map<String, dynamic> json) {
    try {
      return json['value'] as int;
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<int> mapEventToState(int index) async* {
    _counter = index;
    yield _counter;
  }

  @override
  Map<String, int> toJson(int state) {
    try {
      return {'value': state};
    } catch (_) {
      return null;
    }
  }
}
