import 'package:get/get.dart';
import 'package:vexana/vexana.dart';

import '../../../core/constants/endpoints.dart';
import '../../../core/models/character_list_model.dart';
import '../../../core/services/network/base_network_service.dart';
import '../../../core/variables/enums.dart';

class ListPageService extends GetxService {
  final _networkService = Get.find<BaseNetworkService>();

  Future getCharactersPageByPage(
      int pageNumber, String? name, String? species, String? type, String? gender, String? status) async {
    final response = await _networkService.networkManager.send<CharacterListModel, CharacterListModel>(
        "${Endpoints.character.path}?page=$pageNumber${name != null && name != "" ? "&name=$name" : ""}${species != null && species != "" ? "&species=$species" : ""}${type != null && type != "" ? "&type=$type" : ""}${gender != null && gender != "" ? "&gender=$gender" : ""}${status != null && status != "" ? "&status=$status" : ""}",
        parseModel: CharacterListModel(),
        method: RequestType.GET);
    if (response.error != null) {
      _networkService.state = PageStates.error;
    }

    return response.data;
  }
}
