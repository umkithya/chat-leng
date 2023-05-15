import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Complies with `GetStateUpdater`
///
/// This mixin's function represents a `GetStateUpdater`, and might be used
/// by `BindBuilder()`, `SimpleBuilder()` (or similar) to comply
/// with [GetStateUpdate] signature. REPLACING the [StateSetter].
/// Avoids the potential (but extremely unlikely) issue of having
/// the Widget in a dispose() state, and abstracts the
/// API from the ugly fn((){}).
mixin GetStateUpdaterMixin<T extends StatefulWidget> on State<T> {
  // To avoid the creation of an anonym function to be GC later.
  // ignore: prefer_function_declarations_over_variables

  /// Experimental method to replace setState((){});
  /// Used with GetStateUpdate.
  void getUpdate() {
    if (mounted) setState(() {});
  }
}

typedef GetControllerBuilder<T extends DisposableInterface> = Widget Function();

class BindBuilder<T extends GetxController> extends StatefulWidget {
  final GetControllerBuilder builder;
  final bool global;
  final Object? id;
  final String? tag;
  final bool autoRemove;
  final bool assignId;
  final Bindings? binding;
  final Object Function(T value)? filter;
  final void Function(BindBuilderState<T> state)? initState,
      dispose,
      didChangeDependencies;
  final void Function(BindBuilder oldWidget, BindBuilderState<T> state)?
      didUpdateWidget;
  final T? init;

  const BindBuilder({
    Key? key,
    this.init,
    this.global = true,
    required this.builder,
    this.autoRemove = true,
    this.assignId = false,
    this.initState,
    this.filter,
    this.tag,
    this.dispose,
    this.id,
    this.didChangeDependencies,
    this.didUpdateWidget,
    this.binding,
  }) : super(key: key);
  @override
  BindBuilderState<T> createState() => BindBuilderState<T>();
}

class BindBuilderState<T extends GetxController> extends State<BindBuilder<T>>
    with GetStateUpdaterMixin {
  T? controller;
  bool? _isCreator = false;
  VoidCallback? _remove;
  Object? _filter;

  @override
  void initState() {
    // _BindBuilderState._currentState = this;
    super.initState();
    widget.binding!.dependencies();
    widget.initState?.call(this);

    var isRegistered = GetInstance().isRegistered<T>(tag: widget.tag);
    debugPrint('isRegistered=$isRegistered');
    if (widget.init != null) {
      if (widget.global) {
        if (isRegistered) {
          if (GetInstance().isPrepared<T>(tag: widget.tag)) {
            _isCreator = true;
          } else {
            _isCreator = false;
          }
          controller = GetInstance().find<T>(tag: widget.tag);
        } else {
          controller = widget.init;
          _isCreator = true;
          GetInstance().put<T>(controller!, tag: widget.tag);
        }
      } else {
        controller = widget.init;
        _isCreator = true;
        controller?.onStart();
      }
    }

    if (widget.filter != null) {
      _filter = widget.filter!(controller!);
    }

    _subscribeToController();
  }

  /// Register to listen Controller's events.
  /// It gets a reference to the remove() callback, to delete the
  /// setState "link" from the Controller.
  void _subscribeToController() {
    _remove?.call();
    _remove = (widget.id == null)
        ? controller?.addListener(
            _filter != null ? _filterUpdate : getUpdate,
          )
        : controller?.addListenerId(
            widget.id,
            _filter != null ? _filterUpdate : getUpdate,
          );
  }

  void _filterUpdate() {
    var newFilter = widget.filter!(controller!);
    if (newFilter != _filter) {
      _filter = newFilter;
      getUpdate();
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('dispose');
    widget.dispose?.call(this);
    if (_isCreator! || widget.assignId) {
      if (widget.autoRemove && GetInstance().isRegistered<T>(tag: widget.tag)) {
        GetInstance().delete<T>(tag: widget.tag);
      }
    }

    _remove?.call();

    controller = null;
    _isCreator = null;
    _remove = null;
    _filter = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.didChangeDependencies?.call(this);
  }

  @override
  void didUpdateWidget(BindBuilder oldWidget) {
    super.didUpdateWidget(oldWidget as BindBuilder<T>);
    // to avoid conflicts when modifying a "grouped" id list.
    if (oldWidget.id != widget.id) {
      _subscribeToController();
    }
    widget.didUpdateWidget?.call(oldWidget, this);
  }

  @override
  Widget build(BuildContext context) {
    // return _InheritedGetxController<T>(
    //   model: controller,
    //   child: widget.builder(controller),
    // );
    return widget.builder();
  }
}

// extension FindExt on BuildContext {
//   T find<T extends GetxController>() {
//     return BindBuilder.of<T>(this, rebuild: false);
//   }
// }

// extension ObserverEtx on BuildContext {
//   T obs<T extends GetxController>() {
//     return BindBuilder.of<T>(this, rebuild: true);
//   }
// }
