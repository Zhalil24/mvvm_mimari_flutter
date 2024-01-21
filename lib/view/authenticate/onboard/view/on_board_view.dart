import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../view-model/on_board_view_model.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewMoodel>(
      viewModel: OnBoardViewMoodel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, OnBoardViewMoodel viewMoodel) => Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: PageView.builder(
                  itemCount: viewMoodel.onBoardItems.length,
                  onPageChanged: (value) {
                    viewMoodel.changeCurrentIndex(value);
                  },
                  itemBuilder: (context, index) => buildColumnBody(context, viewMoodel.onBoardItems[index]),
                ),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewMoodel)),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowFooter(OnBoardViewMoodel viewMoodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: buildListViewCircles(viewMoodel)),
        Expanded(child: Observer(builder: (_) {
          return Visibility(visible: viewMoodel.isLoading, child: CircularProgressIndicator());
        })),
        buildFloatingActionButtonSkip(context, viewMoodel)
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewMoodel viewMoodel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(builder: (_) {
          return OnBoardCircle(isSelected: viewMoodel.currentIndex == index);
        });
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(BuildContext context, OnBoardViewMoodel viewMoodel) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () => viewMoodel.complateToOnBoard(),
      child: Icon(
        Icons.skip_next,
        color: Colors.white,
      ),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        AutoSizeText(
          model.title,
          //burda eksik var unutma !!!!!!!
          style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSecondary),
        ),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: AutoSizeText(
            model.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w200, color: Colors.black),
          ),
        )
      ],
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
