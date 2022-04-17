// To parse this JSON data, do
//
//     final shortenLink = shortenLinkFromJson(jsonString);

import 'dart:convert';

ApiResponse shortenLinkFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String shortenLinkToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
   required this.ok,
   required this.result,
  });

  bool ok;
  ShortenLink result;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    ok: json["ok"],
    result: ShortenLink.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "result": result.toJson(),
  };
}

class ShortenLink {
  ShortenLink({
  required this.code,
  required this.shortLink,
  required this.fullShortLink,
  required this.shortLink2,
  required this.fullShortLink2,
  required this.shortLink3,
  required this.fullShortLink3,
  required this.shareLink,
  required this.fullShareLink,
  required this.originalLink,
  });

  String code;
  String shortLink;
  String fullShortLink;
  String shortLink2;
  String fullShortLink2;
  String shortLink3;
  String fullShortLink3;
  String shareLink;
  String fullShareLink;
  String originalLink;

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
