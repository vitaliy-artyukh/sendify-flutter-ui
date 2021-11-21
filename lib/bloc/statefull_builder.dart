import 'package:flutter/material.dart';

typedef Disposer = void Function();

class StatefulBuilderExt extends StatefulWidget {
  const StatefulBuilderExt({
    Key? key,
    required this.builder,
    required this.dispose,
  }) : super(key: key);

  final StatefulWidgetBuilder builder;
  final Disposer dispose;

  @override
  _StatefulBuilderStateExt createState() => _StatefulBuilderStateExt();
}

class _StatefulBuilderStateExt extends State<StatefulBuilderExt> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }
}
