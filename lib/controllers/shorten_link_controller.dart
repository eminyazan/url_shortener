
import 'package:get/get.dart';

import '../models/shorten_link_model.dart';
import '../services/local_database_service.dart';
import '../services/network_service.dart';

class ShortenLinkController extends GetxController {
  final NetworkService _networkService = NetworkService();
  final LocalDatabaseService _localDatabaseService=LocalDatabaseService();

  Future<ShortenLink?> fetchShortLink(String longUrl) async {
    ApiResponse? response = await _networkService.getShortLink(longUrl);
    if (response != null) {
      await _localDatabaseService.addHistory(response.result);
      return response.result;
    }
  }
}
