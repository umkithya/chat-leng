// // ignore_for_file: implementation_imports

// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:meta/meta.dart';
// import 'package:go_router/src/typedefs.dart' ;
// // // import 'package:go_router/go_router.dart';
// // // import 'package:go_router/go_router.dart';
// // import 'package:go_router/src/path_utils.dart';
// // import 'package:go_router/src/state.dart';

// @immutable
// abstract class RouteBase {
//   const RouteBase._({
//     this.routes = const <RouteBase>[],
//   });

//   final List<RouteBase> routes;
// }

// class RouteBinding extends RouteBase {
//   RouteBinding({
//     required this.path,
//     this.name,
//     this.builder,
//     // this.builder=(context, state) => ,
//     this.pageBuilder,
//     this.parentNavigatorKey,
//     this.redirect,
//     super.routes = const <RouteBase>[],
//   })  : assert(path.isNotEmpty, 'GoRoute path cannot be empty'),
//         assert(name == null || name.isNotEmpty, 'GoRoute name cannot be empty'),
//         assert(pageBuilder != null || redirect != null,
//             'builder, pageBuilder, or redirect must be provided'),
//         super._() {
//     // cache the path regexp and parameters
//     _pathRE = patternToRegExp(path, pathParameters);
//   }

//   final String? name;

//   final String path;

//   final GoRouterPageBuilder? pageBuilder;

//   final GoRouterWidgetBuilders? builder;

//   final GoRouterRedirect? redirect;

//   final GlobalKey<NavigatorState>? parentNavigatorKey;

//   RegExpMatch? matchPatternAsPrefix(String loc) =>
//       _pathRE.matchAsPrefix(loc) as RegExpMatch?;

//   Map<String, String> extractPathParams(RegExpMatch match) =>
//       extractPathParameters(pathParameters, match);

//   @internal
//   final List<String> pathParameters = <String>[];

//   @override
//   String toString() {
//     return 'GoRoute(name: $name, path: $path)';
//   }

//   late final RegExp _pathRE;
// }

// typedef GoRouterWidgetBuilders = GetBuilder;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../get_extends/binding_builder.dart';

class BindingRouter<T extends GetxController> extends GoRoute {
  final Widget Function(BuildContext context, GoRouterState state)? page;
  final Bindings? binding;
  final void Function()? initState;
  final T? init;
  BindingRouter(
    this.init, {
    this.initState,
    required super.path,
    this.page,
    super.name,
    this.binding,
    super.parentNavigatorKey,
    super.redirect,
    super.routes = const <RouteBase>[],
  }) : super(builder: (a, n) {
          return BindBuilder(
              init: init,
              initState: (_) {
                initState?.call();
                binding?.dependencies();
              },
              builder: () => page!(a, n));
        });
}
