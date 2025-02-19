// ignore_for_file: public_member_api_docs, sort_constructors_first
class BaseResponseApi {
  bool? success;
  String? messages;
  dynamic data;
  BaseResponseApi({
    this.success,
    this.messages,
    this.data,
  });
  // @override
  // String toString() {
  //   return 'BaseResponseApi(success: $success, messages: $messages, data: $data)';
  // }

  BaseResponseApi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    messages = json['messages'];
    data = json['data'] ?? json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['messages'] = messages;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}
