// ignore_for_file: must_be_immutable

import 'package:vexana/vexana.dart';

class GeneralResponse extends INetworkModel<GeneralResponse> {
  dynamic data;
  String? message;
  String? token;
  int? status;
  String? resend;
  Map<String, dynamic>? errors;
  bool? isError;
  GeneralResponse({this.data, this.status, this.message, this.isError});

  GeneralResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['description'] ?? json['message'];
    token = (json['data'] is Map<String, dynamic>) ? (json['data']?['token'] ?? "") : "";
    status = json['code'] ?? json['status'];
    errors = json['errors'];
    resend = json['resend'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['data'] = data;
    map['description'] = message;
    map['status'] = status;
    map['errors'] = errors;
    map['resend'] = resend;
    return map;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return GeneralResponse.fromJson(json);
  }

  @override
  String toString() {
    return 'GeneralResponse(status: $status \n message: $message \n data: $data)';
  }
}
