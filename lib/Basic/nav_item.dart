import 'package:easy_localization/easy_localization.dart';

class NaveItem {
  final int id;
  final String icon;
  final String label;

  NaveItem({required this.id, required this.icon, required this.label});

}

List<NaveItem> navItems = [
  NaveItem(id: 0, icon: 'assets/icons/temp01.png', label: tr('profile')),
  NaveItem(id: 1, icon: 'assets/icons/temp01.png', label: tr('team')),
  NaveItem(id: 2, icon: 'assets/icons/add.png', label: ''),
  NaveItem(id: 3, icon: 'assets/icons/temp01.png', label: tr('schedules')),
  NaveItem(id: 4, icon: 'assets/icons/temp01.png', label: tr('options'))
];