import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constans/enums/locale_keys_enum.dart';
import '../../../../core/init/cache/local_manager.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      onPageBuilder: (context, value) => scaffoldBody,
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onDispose: () {},
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: AppBar(
          leading: Text("${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}"),
          actions: [conButtonChangeTheme(context: context)],
        ),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: buildTextNumer,
      );

  FloatingActionButton get floatingActionButtonNumberIncrement => FloatingActionButton(onPressed: () => viewModel.incrementNumber());

  Widget get buildTextNumer => Observer(
        builder: (context) => Text(viewModel.number.toString()),
      );
}

class conButtonChangeTheme extends StatelessWidget {
  const conButtonChangeTheme({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.change_history));
  }
}
