import 'package:hive/hive.dart';

import '../common/consts.dart';
import '../models/shorten_link_model.dart';

class LocalDatabaseService {
  Box<ShortenLink> shortenLinks=Hive.box(localDB);

  Future<void> addHistory(ShortenLink shortenLink) async {
    await shortenLinks.addAll([shortenLink]);
  }

  Future<void> deleteFromHistory(int index) async {
    await shortenLinks.deleteAt(index);
  }
}
