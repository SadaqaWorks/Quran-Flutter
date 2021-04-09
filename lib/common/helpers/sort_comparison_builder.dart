import 'package:quiver/collection.dart';

/// <summary>
/// Sort direction
/// </summary>
enum SortDirection {
  /// <summary>
  /// Sort items ascending
  /// </summary>
  Ascending,

  /// <summary>
  /// Sort items descending
  /// </summary>
  Descending
}

class SortExpression<T> {
  late SortDirection sortDirection;

  // int compareTo(T x, T y) {
  //   return x.compareTo(y);
  // }
  late Comparable Function(T) expression;
}

class SortComparisonBuilder<T> extends DelegatingList<SortExpression<T>> {
  List<SortExpression<T>> _list = [];

  ascending(Comparable Function(T) expression) {
    _list.add(
      SortExpression()
        ..sortDirection = SortDirection.Ascending
        ..expression = (t) {
          var tt = expression(t);
          return tt;
        },
    );
  }

  thenByAscending(Comparable Function(T) expression) {
    _list.add(
      SortExpression()
        ..sortDirection = SortDirection.Ascending
        ..expression = (t) {
          var tt = expression(t);
          return tt;
        },
    );
  }

  descending(Comparable Function(T) expression) {
    _list.add(
      SortExpression()
        ..sortDirection = SortDirection.Descending
        ..expression = (t) {
          var tt = expression(t);
          return tt;
        },
    );
  }

  thenByDescending(Comparable Function(T) expression) {
    _list.add(
      SortExpression()
        ..sortDirection = SortDirection.Descending
        ..expression = (t) {
          var tt = expression(t);
          return tt;
        },
    );
  }

  int getCompareTo(T x, T y) {
    for (var item in _list) {
      if (x == null && y == null) {
        continue;
      }

      if (x == null) {
        return -1;
      }

      if (y == null) {
        return 1;
      }

      var xItem = item.expression(x);
      var yItem = item.expression(y);
      if (xItem == null && yItem == null) {
        continue;
      }

      if (xItem == null) {
        return -1;
      }

      if (yItem == null) {
        return 1;
      }

      var result = xItem.compareTo(yItem);
      if (result == 0) {
        continue;
      }

      return item.sortDirection == SortDirection.Descending ? -result : result;
    }

    return 0;
  }

  @override
  List<SortExpression<T>> get delegate => _list;
}
