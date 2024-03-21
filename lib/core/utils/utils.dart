import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO Exception daha iyi bir hale getir
Future<R?> errorHandler<R>({required Future<R?> Function() tryMethod, Future<R>? Function()? onErr}) async {
  try {
    return await tryMethod();
  } catch (exception) {
    debugPrint("Error:$exception");
    return onErr != null ? onErr() : Get.dialog(const AlertDialog(content: Text('Something went wrong')));
  }
}
