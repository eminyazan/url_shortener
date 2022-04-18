import 'package:flutter_test/flutter_test.dart';
import 'package:url_shortener/models/shorten_link_model.dart';

import 'package:url_shortener/services/network_service.dart';

void main() {
  test("Get shorten link from api response", () async {
    String longUrl="https://grisoftbilisim.com.tr";
    ApiResponse? _apiResponse=await NetworkService().getShortLink(longUrl);

    expect(longUrl, _apiResponse!.result.originalLink);

  });

}
