import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constans/image/image_constans.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => DefaultTabController(
          length: 2,
          child: Scaffold(
            key: value.scaffoldState,
            body: SafeArea(
              child: Column(
                children: [
                  buildAnimatedContainerTabBar(context),
                  buildContainerTabBar(context),
                  Expanded(
                      flex: 6,
                      child: Padding(
                        padding: context.paddingNormal,
                        child: buildForm(value, context),
                      ))
                ],
              ),
            ),
          )),
    );
  }

  AnimatedContainer buildAnimatedContainerTabBar(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      color: Colors.white,
      child: Center(child: Image.asset(ImageConstans.instance!.hotDog)),
    );
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(left: context.width * 0.1, right: context.width * 0.1, bottom: context.width * 0.01),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
        labelStyle: context.textTheme.headlineSmall,
        unselectedLabelStyle: context.textTheme.headlineSmall,
        indicatorColor: Colors.yellow,
        indicatorWeight: 5,
        labelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [Text("Login"), Text("SingUp")]);
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          const Spacer(),
          buildTextForgot(),
          const Spacer(flex: 6),
          buildMaterialButtonLogin(context, value),
          buildWrapForgot(),
          const Spacer(),
        ],
      ),
    );
  }

  Align buildTextForgot() => const Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password",
          textAlign: TextAlign.end,
        ),
      );

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) => Observer(builder: (_) {
        return TextFormField(
          controller: viewModel.passwordController,
          validator: (value) => value!.isNotEmpty ? null : "This field req",
          obscureText: viewModel.isLockOpen,
          decoration: InputDecoration(
              labelText: "PASSWORD",
              labelStyle: context.textTheme.subtitle1,
              icon: buildContainerIconField(context, Icons.password),
              suffix: InkWell(onTap: () {
                viewModel.isLockOverChage();
              }, child: Observer(builder: (_) {
                return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open_outlined);
              }))),
        );
      });

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isNotEmpty ? null : "it's nedd email",
      decoration: InputDecoration(labelText: "EMAIL", labelStyle: context.textTheme.subtitle1, icon: buildContainerIconField(context, Icons.email)),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(
        icon,
        color: context.colors.onBackground,
      ),
    );
  }

  Widget buildMaterialButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return MaterialButton(
          padding: context.paddingNormal,
          shape: StadiumBorder(),
          color: context.colors.onError,
          onPressed: viewModel.isLoading
              ? null
              : () {
                  viewModel.fetchLoginService();
                },
          child: Center(
              child: Text(
            "Enter To App",
            style: context.textTheme.bodyMedium,
          )));
    });
  }

  Wrap buildWrapForgot() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [Text("Don't have a account"), TextButton(onPressed: () {}, child: Text("Sing Up"))],
    );
  }
}
