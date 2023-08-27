import 'package:flutter/material.dart';
import 'API_common/remote_config.dart';
import 'Tab01/tab01_screen.dart';
import 'Tab02/tab02_screen.dart';
import 'Tab03/tab03_screen.dart';
import 'Tab04/tab04_screen.dart';
import 'Tab05/tab05_screen.dart';
import 'basic/alert_msg.dart';
import 'basic/constants.dart';
import 'basic/nav_item.dart';

class MainScreen extends StatefulWidget {

  static String routeName = '/main_screen';

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;
  bool versionCheck = false;

  @override
  Widget build(BuildContext context) {

    if (!versionCheck) {
      Future<String> version = checkVersion();
      version.then((value) {
        if (value == 'update') {
          showUpdate(
              title: '필수 업데이트', message: '스토어로 이동합니다.', context: context);
        } else if (value == 'recommend') {
          showSelectUpdate(
              title: '최신 업데이트', message: '최신 버전을 설치할까요?', context: context);
        }
        versionCheck = true;
      });
    }

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Tab01Screen(),
          Tab02Screen(),
          Tab03Screen(),
          Tab04Screen(),
          Tab05Screen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        backgroundColor: kBackgroundColor,
        onTap: onTaped,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        items: List.generate(
          navItems.length, (index) => _buildBottomNavigationBarItem(
          icon: navItems[index].icon,
          label: navItems[index].label,
          isActive: navItems[index].id == _selectedIndex ? true : false,
        ),
        ),
      ),
    );
  }

  void onTaped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildBottomNavigationBarItem({
    String? icon,
    String? label,
    bool isActive = false,
    GestureTapCallback? press
  }) {
    return BottomNavigationBarItem(
        icon: SizedBox(
          width: 36,
          height: 36,
          child: IconButton(
              onPressed: press,
              icon: Image.asset(icon ?? 'assets/icons/tab_icons/tab01img.png', color: isActive ? kPrimaryColor : Colors.black,)
          ),
        ),
        label: label
    );
  }

}