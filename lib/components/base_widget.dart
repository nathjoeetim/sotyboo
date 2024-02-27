import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T viewModel;
  final void Function(T)? initViewModel;
  final bool singleInstanceModel;

  const BaseWidget.value(
      {super.key, required this.builder, required this.viewModel, this.initViewModel})
      : singleInstanceModel = true;

  const BaseWidget({
    Key? key,
    required this.builder,
    required this.viewModel,
    this.initViewModel,
  })  : singleInstanceModel = false,
        super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    if (widget.initViewModel != null) {
      widget.initViewModel!(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.singleInstanceModel
        ? ChangeNotifierProvider<T>.value(
            value: model,
            child: Consumer<T>(
              builder: widget.builder,
            ),
          )
        : ChangeNotifierProvider<T>(
            create: (context) => model,
            child: Consumer<T>(
              builder: widget.builder,
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
