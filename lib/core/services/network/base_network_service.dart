import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatansoft_case/app/common/widgets/circle_animation.dart';
import 'package:vatansoft_case/core/services/network/general_response.dart';
import 'package:vexana/vexana.dart';

import '../../variables/enums.dart';
import '../../variables/standart_measurement_units.dart';

class BaseNetworkService extends GetxService {
  INetworkManager networkManager = NetworkManager<GeneralResponse>(
    options: BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
    isEnableLogger: true,
    skippingSSLCertificate: true,
  );
  // Page state control
  final Rx<PageStates> _state = PageStates.loaded.obs;
  PageStates get state => _state.value;
  set state(PageStates val) => _state.value = val;

  @override
  void onInit() async {
    ever(
      _state,
      (PageStates value) {
        switch (value) {
          case PageStates.busy:
            Get.dialog(
                Padding(
                    padding: EdgeInsets.all(StandartMeasurementUnits.extraHighPadding * 3),
                    child: CircleAnimation(imagePath: Images.portalRNM.path)),
                barrierColor: Colors.white.withOpacity(0.6),
                barrierDismissible: false);
            break;
          case PageStates.loaded:
            if (Get.isOverlaysOpen) Get.back();
            break;
          case PageStates.error:
            if (Get.isOverlaysOpen) Get.back();
            break;
          case PageStates.initial:
            if (Get.isOverlaysOpen) Get.back();
            break;
        }
      },
    );
    super.onInit();
  }
}
