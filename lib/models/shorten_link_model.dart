import 'dart:convert';

import 'package:hive/hive.dart';

part 'shorten_link_model.g.dart';


ApiResponse shortenLinkFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String shortenLinkToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {

  String? error;
  bool ok;
  ShortenLink result;

  ApiResponse({
    required this.ok,
    required this.result,
    this.error,
  });



  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    ok: json["ok"],
    result: ShortenLink.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "result": result.toJson(),
  };
}


@HiveType(typeId: 0)
class ShortenLink {
  @HiveField(0)
  String code;
  @HiveField(1)
  String shortLink;
  @HiveField(2)
  String fullShortLink;
  @HiveField(3)
  String shortLink2;
  @HiveField(4)
  String fullShortLink2;
  @HiveField(5)
  String shortLink3;
  @HiveField(6)
  String fullShortLink3;
  @HiveField(7)
  String shareLink;
  @HiveField(8)
  String fullShareLink;
  @HiveField(9)
  String originalLink;

  ShortenLink({
    required this.fullShortLink,
    required this.code,
    required this.originalLink,
    required this.fullShortLink2,
    required this.fullShareLink,
    required this.fullShortLink3,
    required this.shareLink,
    required this.shortLink,
    required this.shortLink2,
    required this.shortLink3,
  });

  factory ShortenLink.fromJson(Map<String, dynamic> json) => ShortenLink(
    code: json["code"],
    shortLink: json["short_link"],
    fullShortLink: json["full_short_link"],
    shortLink2: json["short_link2"],
    fullShortLink2: json["full_short_link2"],
    shortLink3: json["short_link3"],
    fullShortLink3: json["full_short_link3"],
    shareLink: json["share_link"],
    fullShareLink: json["full_share_link"],
    originalLink: json["original_link"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "short_link": shortLink,
    "full_short_link": fullShortLink,
    "short_link2": shortLink2,
    "full_short_link2": fullShortLink2,
    "short_link3": shortLink3,
    "full_short_link3": fullShortLink3,
    "share_link": shareLink,
    "full_share_link": fullShareLink,
    "original_link": originalLink,
  };
}
