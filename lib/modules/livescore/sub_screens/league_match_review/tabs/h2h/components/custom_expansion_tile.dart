import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget> children;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      dense: true,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: title,
          leading: leading,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
