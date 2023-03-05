import 'package:flutter/material.dart';

class KykeyBottomNavBar extends StatefulWidget {
  final int selectedPage;
  final Function(int page) onChangePage;

  const KykeyBottomNavBar({
    Key? key,
    required this.selectedPage,
    required this.onChangePage,
  }) : super(key: key);

  @override
  State<KykeyBottomNavBar> createState() => _KykeyBottomNavBarState();
}

class _KykeyBottomNavBarState extends State<KykeyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navBarItem(
            icon: Icons.home_outlined,
            index: 0,
          ),
          _navBarItem(
            icon: Icons.lock_outline,
            index: 1,
          ),
          Container(
            height: 1,
          ),
          _navBarItem(
            icon: Icons.security,
            index: 2,
          ),
          _navBarItem(
            icon: Icons.person_outline,
            index: 3,
          ),
        ],
      ),
    );
  }

  _navBarItem({
    required IconData icon,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => widget.onChangePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: index == widget.selectedPage
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
          const SizedBox(height: 4),
          if (index == widget.selectedPage)
            Container(
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            )
        ],
      ),
    );
  }
}
