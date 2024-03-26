import 'package:flutter/material.dart';

mixin ScrollObserverStateMixin<S extends StatefulWidget> on State<S> {
  late ScrollNotificationObserverState _scrollNotificationObserverState;
  
  void onScrollNotification(ScrollNotification notification) {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserverState = ScrollNotificationObserver.of(context);
    _scrollNotificationObserverState.addListener(onScrollNotification);
  }

  @override
  void dispose() {
    _scrollNotificationObserverState.removeListener(onScrollNotification);
    super.dispose();
  }
}
