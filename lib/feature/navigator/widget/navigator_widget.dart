import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/quran/model/sura.dart';
import 'package:quran_reader/feature/navigator/provider/navigator_provider.dart';
import 'package:quran_reader/generated/l10n.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NavigatorWidget extends StatefulWidget {
  @override
  _NavigatorWidgetState createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  NavigatorType _selectedNavigatorType = NavigatorType.sura;
  int _selectedNavigatorIndex = 0;

  int? _selectedSuraIndex;
  int? _selectedJuzIndex;
  int? _selectedPageIndex;

  late Map<int, Widget> _indexTitles;

  late AutoScrollController _scrollController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _indexTitles = <int, Widget>{
      0: Text(S.of(context).surah),
      1: Text(S.of(context).juzz),
      2: Text(S.of(context).pages),
    };

    _scrollController = AutoScrollController(
        //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),

        //choose vertical/horizontal
        axis: Axis.vertical,

        //this given value will bring the scroll offset to the nearest position in fixed row height case.
        //for variable row height case, you can still set the average height, it will try to get to the relatively closer offset
        //and then start searching.
        suggestedRowHeight: 50);
  }

  @override
  void initState() {
    super.initState();
  }

  void _selectedItem(BuildContext context) {
    if (_selectedNavigatorType == NavigatorType.sura) {
      context
          .read(navigatorViewProvider.notifier)
          .suraSelected(_selectedSuraIndex ?? 0);
    }
    if (_selectedNavigatorType == NavigatorType.juz) {
      context
          .read(navigatorViewProvider.notifier)
          .juzSelected(_selectedJuzIndex ?? 0);
    }
    if (_selectedNavigatorType == NavigatorType.page) {
      context
          .read(navigatorViewProvider.notifier)
          .pageSelected(_selectedPageIndex ?? 0);
    }
  }

  void _confirmed(BuildContext context) {
    _selectedItem(context);
    context.read(navigatorViewProvider.notifier).confirmSelected();
  }

  void _goToElement(int index) async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await _scrollController.scrollToIndex(index,
          preferPosition: AutoScrollPosition.begin);
      _scrollController.highlight(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Container(
              child: _widgetList(context),
            ),
          )),
          SizedBox(
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl(
              children: _indexTitles,
              groupValue: _selectedNavigatorIndex,
              onValueChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _selectedNavigatorIndex = value;
                    _selectedSuraIndex = null;
                    _selectedJuzIndex = null;
                    _selectedPageIndex = null;
                    if (value == 0) {
                      _selectedNavigatorType = NavigatorType.sura;
                    }
                    if (value == 1) {
                      _selectedNavigatorType = NavigatorType.juz;
                    }
                    if (value == 2) {
                      _selectedNavigatorType = NavigatorType.page;
                    }

                    context
                        .read(navigatorViewProvider.notifier)
                        .navigatorSelected(_selectedNavigatorType);
                  });
                }
              },
            ),
          ),
          OutlinedButton(
            onPressed: () {
              _confirmed(context);
            },
            child: Text('Confirm'),
          )
        ]));
  }

  Widget _widgetList(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(navigatorViewProvider);
        return state.maybeWhen(loadSuraList: (value, selected) {
          return _widgetSuraList(context, value, selected);
        }, loadJuzList: (value, selected) {
          return _widgetJuzList(context, value, selected);
        }, loadPageList: (value, selected) {
          return _widgetPageList(context, value, selected);
        }, orElse: () {
          return Container();
        });
      },
    );
  }

  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: _scrollController,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
//Sura
  Widget _widgetSuraList(
      BuildContext context, List<Sura> list, int selectedIndex) {
    if (_selectedSuraIndex == null) {
      _selectedSuraIndex = selectedIndex;
      _goToElement(selectedIndex);
    }

    return ListView.separated(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _widgetSuraItem(context, list[index], index,
              (index == (_selectedSuraIndex ?? selectedIndex)));
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  Widget _widgetSuraItem(
      BuildContext context, Sura sura, int index, bool selected) {
    return _wrapScrollTag(
      index: index,
      child: InkWell(
          onTap: () {
            setState(() {
              _selectedSuraIndex = index;
            });
            _selectedItem(context);
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sura.title),
                selected ? Text('selcted') : Text('un selcted')
              ],
            ),
          )),
    );
  }

  //Juz
  Widget _widgetJuzList(
      BuildContext context, List<int> list, int selectedIndex) {
    if (_selectedJuzIndex == null) {
      _selectedJuzIndex = selectedIndex;
      _goToElement(selectedIndex);
    }

    return ListView.separated(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _widgetJuzItem(
              context, index, (index == (_selectedJuzIndex ?? selectedIndex)));
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  Widget _widgetJuzItem(BuildContext context, int index, bool selected) {
    return _wrapScrollTag(
        index: index,
        child: InkWell(
            onTap: () {
              setState(() {
                _selectedJuzIndex = index;
              });
              _selectedItem(context);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index + 1}'),
                  selected ? Text('selcted') : Text('un selcted')
                ],
              ),
            )));
  }

  //Page
  Widget _widgetPageList(
      BuildContext context, List<int> list, int selectedIndex) {
    if (_selectedPageIndex == null) {
      _selectedPageIndex = selectedIndex;
      _goToElement(selectedIndex);
    }

    return ListView.separated(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _widgetPageItem(
              context, index, (index == (_selectedPageIndex ?? selectedIndex)));
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  Widget _widgetPageItem(BuildContext context, int index, bool selected) {
    return _wrapScrollTag(
        index: index,
        child: InkWell(
            onTap: () {
              setState(() {
                _selectedPageIndex = index;
              });
              _selectedItem(context);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index + 1}'),
                  selected ? Text('selcted') : Text('un selcted')
                ],
              ),
            )));
  }
}
