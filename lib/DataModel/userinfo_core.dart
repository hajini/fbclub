import 'dart:convert';

class UserInfoCore {
  final int code;
  final List<UserInfoCoreResult> result;

  UserInfoCore({required this.code, required this.result});

  factory UserInfoCore.fromJson(Map<String, dynamic> parsedJson) {

    var resultStr = parsedJson['result'];
    var list = jsonDecode(resultStr) as List;

    List<UserInfoCoreResult> resultList = list.map((i) => UserInfoCoreResult.fromJson(i)).toList();

    return UserInfoCore(
        code : parsedJson['code'],
        result : resultList
    );
  }
}

class UserInfoCoreResult<List> {

  late String? id_key;
  late String? userid;
  late String? name;
  late String? birth;
  late String? gender;
  late String? email;
  late String? cellno;
  late String? id_status;
  late String? createdAt;
  late String? latestloginAt;
  late String? editedAt;

  UserInfoCoreResult({
    this.id_key,
    this.userid,
    this.name,
    this.birth,
    this.gender,
    this.email,
    this.cellno,
    this.id_status,
    this.createdAt,
    this.latestloginAt,
    this.editedAt,
  });



  factory UserInfoCoreResult.fromJson(Map<String, dynamic> parsedJson) {
    return UserInfoCoreResult(
      id_key: parsedJson['id_key'],
      userid: parsedJson['userid'],
      name: parsedJson['name'],
      birth: parsedJson['birth'],
      gender: parsedJson['gender'],
      email: parsedJson['email'],
      cellno: parsedJson['cellno'],
      id_status: parsedJson['id_status'],
      createdAt: parsedJson['createdAt'],
      latestloginAt: parsedJson['latestloginAt'],
      editedAt: parsedJson['editedAt']
    );
  }

  Map<String, dynamic> toJson() => {
    'id_key': id_key,
    'userid' : userid,
    'name' : name,
    'birth' : birth,
    'gender' : gender,
    'email' : email,
    'cellno' : cellno,
    'id_status' : id_status,
    'createdAt' : createdAt,
    'latestloginAt' : latestloginAt,
    'editedAt' : editedAt
  };
}

