import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:haikotek_flutter/services/api/api_error.dart';
import 'package:haikotek_flutter/safety/base_stateful.dart';

import 'package:haikotek_flutter/services/providers/provider_auth.dart';
import 'package:haikotek_flutter/services/providers/providers.dart';

abstract class PageStateful<T extends ConsumerStatefulWidget> extends BaseStateful<T> with ApiError {

  late AuthProvider authProvider;

  @mustCallSuper
  @override
  void initDependencies(WidgetRef ref) {
    super.initDependencies(ref);

    
  }
}
