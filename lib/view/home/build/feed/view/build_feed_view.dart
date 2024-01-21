import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../_product/_widgets/card/build_column_user.dart';
import '../model/house_model.dart';
import '../viewmodel/build_feed_view_model.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppbar(),
        body: DefaultTabController(
            length: 4,
            child: Observer(builder: (_) {
              return viewModel.isLoading
                  ? buildCenter()
                  : viewModel.houseModels == null || viewModel.houseModels.isEmpty
                      ? Center(
                          child: Text("NotFount"),
                        )
                      : buildListViewRecommended(viewModel, context);
            })),
      ),
    );
  }

  ListView buildListViewRecommended(BuildFeedViewModel viewModel, BuildContext context) {
    return ListView(
      children: [
        buildTabBar(),
        buildSizedBoxLatesPageViev(context, viewModel),
        Text(
          "Recommended",
          style: context.textTheme.headline5!.copyWith(),
        ),
        buildListViewBottom(viewModel)
      ],
    );
  }

  ListView buildListViewBottom(BuildFeedViewModel viewModel) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
          height: context.dynamicHeight(0.15),
          child: Card(
            child: Row(
              children: [
                Expanded(flex: 3, child: Image.network("${viewModel.houseModels[index].image}")),
                Expanded(flex: 9, child: buildObserber(viewModel, index))
              ],
            ),
          )),
      itemCount: viewModel.houseModels.length,
      shrinkWrap: true,
    );
  }

  Observer buildObserber(BuildFeedViewModel viewModel, int index) {
    return Observer(builder: (_) {
      return BuildUserCard(
        model: viewModel.houseModels[index],
        isLiked: viewModel.likeItems.contains(viewModel.houseModels[index].id),
        onPressedLikedId: (id) {
          viewModel.onLikeItemPressed(id);
        },
      );
    });
  }

  SizedBox buildSizedBoxLatesPageViev(BuildContext context, BuildFeedViewModel viewModel) {
    return SizedBox(
        height: context.dynamicHeight(0.3),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.95),
          itemBuilder: (context, index) => buildStackFloaty(context, viewModel.houseModels[index], viewModel),
          itemCount: 4,
        ));
  }

  TabBar buildTabBar() {
    return TabBar(tabs: [
      Tab(
        text: "Latest",
      ),
      Tab(
        text: "Decorative",
      ),
      Tab(
        text: "Music",
      ),
      Tab(
        text: "Latest",
      )
    ]);
  }

  Center buildCenter() => Center(
        child: CircularProgressIndicator(),
      );

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.format_align_left), onPressed: () {}),
      actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
    );
  }

  Widget buildStackFloaty(BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(right: context.lowValue),
      child: Stack(
        children: [
          Positioned.fill(
              bottom: 100,
              child: Image.network(
                "${model.image}",
                fit: BoxFit.fill,
              )),
          Positioned(top: 130, left: 10, right: 10, child: buildCardSrtackFloaty(context, model, viewModel))
        ],
      ),
    );
  }

  Card buildCardSrtackFloaty(BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Observer(builder: (_) {
          return BuildUserCard(
            model: model,
            isLiked: viewModel.likeItems.contains(model.id),
            onPressedLikedId: (id) {
              viewModel.onLikeItemPressed(id);
            },
          );
        }),
      ),
    );
  }
}
