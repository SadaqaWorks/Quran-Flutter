import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/feature/home/model/page_model.dart';
class PageBloc extends HydratedBloc<int, PageModel> {

  @override
  PageModel get initialState => super.initialState ?? PageModel(page: 1);

  @override
  PageModel fromJson(Map<String, dynamic> json) {
    try {
      return PageModel(page: json['value'] as int);
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<PageModel> mapEventToState(int id) async* {
    yield PageModel(page: id);
  }

  @override
  Map<String, int> toJson(PageModel state) {
    try {
      return {'value': state.page};
    } catch (_) {
      return null;
    }
  }
}
