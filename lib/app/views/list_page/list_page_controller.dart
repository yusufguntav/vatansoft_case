import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/views/list_page/list_page_service.dart';
import 'package:vatansoft_case/core/utils/utils.dart';

import '../../../core/models/character_list_model.dart';
import '../../../core/models/character_model.dart';

enum FilterFields {
  name,
  type,
  species,
  genders,
  status,
}

class ListPageController extends GetxController {
  //Controllers
  final Map<FilterFields, TextEditingController> _controllerList = {
    FilterFields.name: TextEditingController(),
    FilterFields.species: TextEditingController(),
    FilterFields.type: TextEditingController(),
    FilterFields.genders: TextEditingController(),
    FilterFields.status: TextEditingController(),
  };
  Map<FilterFields, TextEditingController> get controllerList => _controllerList;

  //Has more data control
  final Rx<bool> _hasMoreData = true.obs;
  bool get hasMoreData => _hasMoreData.value;
  set hasMoreData(bool value) => _hasMoreData.value = value;
  //Scroll controller
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final RxList<CharacterModel> _characters = <CharacterModel>[].obs;
  List<CharacterModel> get characters => _characters;

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;
  resetPageNumber() {
    _pageNumber = 1;
  }

  //TODO page number yapısını kontrol edersin
  incrementPageNumber() {
    _pageNumber++;
  }

  final _networkService = Get.find<ListPageService>();
  @override
  void onInit() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        incrementPageNumber();
        await getCharacters();
      }
    });
    super.onInit();
  }

  @override
  void onReady() async {
    await getCharacters();
    super.onReady();
  }

  @override
  void onClose() {
    _scrollController.dispose();
    super.onClose();
  }

  Future getCharacters() async {
    errorHandler(
      tryMethod: () async {
        if (!hasMoreData) return;
        CharacterListModel? characterList = await _networkService.getCharactersPageByPage(
            _pageNumber,
            controllerList[FilterFields.name]?.text,
            controllerList[FilterFields.species]?.text,
            controllerList[FilterFields.type]?.text,
            controllerList[FilterFields.genders]?.text.toLowerCase(),
            controllerList[FilterFields.status]?.text.toLowerCase());
        if (characterList == null) {
          _hasMoreData.value = false;
          return;
        }
        for (var character in characterList.results ?? []) {
          _characters.add(CharacterModel.fromJson(character.toJson()));
        }
      },
    );
  }
}
