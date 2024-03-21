import 'package:get/get.dart';
import 'package:vexana/vexana.dart';

import '../../../core/constants/endpoints.dart';
import '../../../core/models/character_list_model.dart';
import '../../../core/services/network/base_network_service.dart';
import '../../../core/variables/enums.dart';

class ListPageService extends GetxService {
  final _networkService = Get.find<BaseNetworkService>();

//TODO bu alan ile ilgilenilecek
  Future getCharactersByPageNumber(int pageNumber, String? name) async {
    final response = await _networkService.networkManager.send<CharacterListModel, CharacterListModel>(
        "${Endpoints.character.path}?page=$pageNumber${name != null && name != "" ? "&name=$name" : ""}",
        parseModel: CharacterListModel(),
        method: RequestType.GET);
    if (response.error != null) {
      _networkService.state = PageStates.error;
    }

    return response.data;
  }
}
