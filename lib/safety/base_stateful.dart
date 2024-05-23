import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseStateful<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {

  @mustCallSuper
  @protected
  void initDependencies(WidgetRef ref) {}

  @protected
  void afterFirstBuild(WidgetRef ref) {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initDependencies(ref);
  }

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        afterFirstBuild(ref);
      }
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
