// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_feed_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuildFeedViewModel on _BuildFeedViewModelBase, Store {
  Computed<HouseModel>? _$sliderHouseComputed;

  @override
  HouseModel get sliderHouse =>
      (_$sliderHouseComputed ??= Computed<HouseModel>(() => super.sliderHouse,
              name: '_BuildFeedViewModelBase.sliderHouse'))
          .value;

  late final _$houseModelsAtom =
      Atom(name: '_BuildFeedViewModelBase.houseModels', context: context);

  @override
  List<HouseModel> get houseModels {
    _$houseModelsAtom.reportRead();
    return super.houseModels;
  }

  @override
  set houseModels(List<HouseModel> value) {
    _$houseModelsAtom.reportWrite(value, super.houseModels, () {
      super.houseModels = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_BuildFeedViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getListAllAsyncAction =
      AsyncAction('_BuildFeedViewModelBase.getListAll', context: context);

  @override
  Future<void> getListAll() {
    return _$getListAllAsyncAction.run(() => super.getListAll());
  }

  late final _$_BuildFeedViewModelBaseActionController =
      ActionController(name: '_BuildFeedViewModelBase', context: context);

  @override
  void _chaangeLoading() {
    final _$actionInfo = _$_BuildFeedViewModelBaseActionController.startAction(
        name: '_BuildFeedViewModelBase._chaangeLoading');
    try {
      return super._chaangeLoading();
    } finally {
      _$_BuildFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
houseModels: ${houseModels},
isLoading: ${isLoading},
sliderHouse: ${sliderHouse}
    ''';
  }
}
