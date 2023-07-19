class NaveItem {
  final int id;
  final String icon;
  final String label;

  NaveItem({required this.id, required this.icon, required this.label});

}

List<NaveItem> navItems = [
  NaveItem(id: 0, icon: 'assets/icons/tab_icons/tab01img.png', label: '스쿼드매니아'),
  NaveItem(id: 1, icon: 'assets/icons/tab_icons/tab02img.png', label: '선수비교'),
  NaveItem(id: 2, icon: 'assets/icons/tab_icons/tab03img.png', label: '매니아톡'),
  NaveItem(id: 3, icon: 'assets/icons/tab_icons/tab04img.png', label: '전적검색'),
  NaveItem(id: 4, icon: 'assets/icons/tab_icons/tab05img.png', label: '시뮬레이터')
];