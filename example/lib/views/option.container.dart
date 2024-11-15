import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({super.key, this.onPressed, this.title});
  final String? title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        height: 200,
        width: 200,
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(title ?? ''),
        ),
      ),
    );
  }
}
