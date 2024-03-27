import 'dart:math' as math show max;

import 'package:flutter/material.dart';

import '../../../constants/curves.dart';
import '../../../constants/durations.dart';

class SliverAutoAnimatedList<T> extends StatefulWidget {
  const SliverAutoAnimatedList({
    required this.builder,
    required this.items,
    super.key,
  });

  final Iterable<T> items;
  final Widget Function(int index, T item) builder;

  @override
  // ignore: library_private_types_in_public_api
  _SliverAutoAnimatedListState<T> createState() => _SliverAutoAnimatedListState<T>();
}

class _SliverAutoAnimatedListState<T> extends State<SliverAutoAnimatedList<T>> {
  final _listKey = GlobalKey<SliverAnimatedListState>();
  late List<T> _items;

  void _removeItem(int index, [Duration duration = AppDurations.animatedListChanged]) {
    final item = _items[index];
    _items.removeAt(index);

    _listKey.currentState?.removeItem(
      index,
      (_, animation) => _buildItem(index, item, animation),
      duration: duration,
    );
  }

  void _addItem(T item) {
    _items.add(item);

    _listKey.currentState?.insertItem(
      _items.length - 1,
      duration: AppDurations.animatedListChanged,
    );
  }

  @override
  void initState() {
    super.initState();
    _items = List.of(widget.items);
  }

  @override
  void didUpdateWidget(covariant SliverAutoAnimatedList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldItems = _items;
    final newItems = List.of(widget.items);

    if (oldItems.length == newItems.length) {
      _items = newItems;

      return;
    }

    var i = 0;
    while (i < math.max(oldItems.length, newItems.length)) {
      if (i >= oldItems.length) {
        _addItem(newItems[i++]);
      } else if (i >= newItems.length || oldItems[i] != newItems[i]) {
        _removeItem(i);
      } else {
        i++;
      }
    }
  }

  @override
  Widget build(BuildContext context) => SliverAnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (_, i, a) => _buildItem(i, _items[i], a),
      );

  Widget _buildItem(int index, T item, Animation<double> animation) {
    final curvedAnimation = CurvedAnimation(
      curve: AppCurves.slide,
      parent: animation,
    );

    return SizeTransition(
      sizeFactor: curvedAnimation,
      child: FadeTransition(
        opacity: curvedAnimation,
        child: widget.builder(index, item),
      ),
    );
  }
}
