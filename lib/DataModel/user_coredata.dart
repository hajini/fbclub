import 'package:fbclub/DataModel/userinfo_core.dart';
import 'package:localstorage/localstorage.dart';
import 'banlist_data.dart';

class UserCoreData {
  static UserInfoCoreResult data = UserInfoCoreResult();
  static List<BanListDataResult> banList = [];

  final LocalStorage storage = LocalStorage('localstorage_app');

  Future<String> saveUserCoreDataToLocal() async {
    await storage.ready;
    final userCoreData = UserCoreData.data.toJson();
    storage.setItem('userCoreData', userCoreData);

    //차단 리스트 가져오기 - api 구현 필요
    // Future<BanListData?> reportData = ReportAPI().getBanList(UserInfoAPI.data.id ?? '');
    // reportData.then((value) {
    //   if (value == null) {
    //     print('차단리스트가 없거나, 로딩 에러입니다.');
    //   }
    // });
    return 'Save completed.';
  }

  Future<bool> getUserCoreDataFromLocal() async {
    await storage.ready;
    var item = storage.getItem('userCoreData');
    if (item != null) {
      UserCoreData.data = UserInfoCoreResult.fromJson(item);
      print('Success to get UserCoreData, ${UserCoreData.data.name}');
      return true;
    } else {
      return false;
    }
  }

  Future<String> removeUserCoreDataFromLocal() async {

    await storage.ready;
    storage.deleteItem('userCoreData');
    UserCoreData.data = UserInfoCoreResult();
    UserCoreData.banList = []; // 차단리스트 로컬에서 삭제함
    return 'remove complete';
  }
}