import 'dart:convert';

class BanListData {
  final int code;
  final List<BanListDataResult> replyResult;

  BanListData({required this.code, required this.replyResult});

  factory BanListData.fromJson(Map<String, dynamic> parsedJson) {

    var resultStr = parsedJson['result'];
    var list = jsonDecode(resultStr) as List;

    List<BanListDataResult> resultList = list.map((i) => BanListDataResult.fromJson(i)).toList();

    return BanListData(
        code : parsedJson['code'],
        replyResult : resultList
    );
  }
}

class BanListDataResult<List> {
  final int? ban_index;
  final String? banned_user;
  final String? report_user;
  final String? report_time;
  final String? report_desc;

  BanListDataResult({
    this.ban_index,
    this.banned_user,
    this.report_user,
    this.report_time,
    this.report_desc,
  });

  factory BanListDataResult.fromJson(Map<String, dynamic> parsedJson) {
    return BanListDataResult(
      ban_index: parsedJson['ban_index'],
      banned_user: parsedJson['banned_user'],
      report_user: parsedJson['report_user'],
      report_time: parsedJson['report_time'],
      report_desc: parsedJson['report_desc'],
    );
  }

  Map<String, dynamic> toJson() => {
    'ban_index': ban_index,
    'banned_user' : banned_user,
    'report_user' : report_user,
    'report_time' : report_time,
    'report_desc' : report_desc,
  };
}