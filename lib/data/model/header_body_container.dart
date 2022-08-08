class HeadersBodyContainer {
  final Map<String, String>? headers;
  final Map<String, dynamic>? body;

  HeadersBodyContainer({required this.headers, this.body});

  static HeadersBodyContainer getMemberContainer({required String authId}) {
    return HeadersBodyContainer(headers: {'authId': authId}, body: null);
  }

  static HeadersBodyContainer getProfileContainer({required String uuid}) {
    return HeadersBodyContainer(headers: {'uuid': uuid}, body: null);
  }

  static HeadersBodyContainer postProfileContainer(
      {required String uuid,
      required String name,
      required String language,
      required String region}) {
    return HeadersBodyContainer(headers: {
      'uuid': uuid,
      'name': name,
      'language': language,
      'region': region
    });
  }
}
