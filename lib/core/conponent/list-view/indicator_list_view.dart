import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class IndicatorListView extends StatelessWidget {
  const IndicatorListView({super.key, required this.itemCount, required this.onListItem, required this.currenIndex});
  final int itemCount;
  final Widget Function(int index) onListItem;
  final int currenIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) => buildPadding(context, index),
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(padding: context.paddingLow, child: buildCircleAvatar(index, context));
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCurrentIndex(index) ? Colors.black : Colors.blue,
      radius: isCurrentIndex(index) ? context.width * 0.03 : context.width * 0.015,
      child: AnimatedOpacity(
        opacity: currenIndex == index ? 1 : 0,
        duration: context.lowDuration,
        child: onListItem(index),
      ),
    );
  }

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => currenIndex == index;
}
