class PageModel {
  final int page;
  PageModel({this.page});
  String get imageUrl => 'assets/images/quran/image$page.png';
}
