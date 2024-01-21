import 'package:flutter/material.dart';

import '../../../../core/conponent/list-view/indicator_list_view.dart';

class OnBoardIndicator extends StatelessWidget {
  const OnBoardIndicator({super.key, required this.itemCount, required this.curretnIndex});
  final int itemCount;
  final int curretnIndex;

  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
      currenIndex: curretnIndex,
      itemCount: itemCount,
      onListItem: (index) {
        return FlutterLogo();
      },
    );
  }
}
