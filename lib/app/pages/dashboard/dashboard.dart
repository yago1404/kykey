import 'package:flutter/material.dart';
import 'package:kykey/app/pages/dashboard/generate_password_page.dart';
import 'package:kykey/app/pages/dashboard/home_page.dart';
import 'package:kykey/app/pages/dashboard/password_page.dart';
import 'package:kykey/app/widgets/kykey_bottom_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPage = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _fab(),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: KykeyBottomNavBar(
        selectedPage: currentPage,
        onChangePage: _onChangePage,
      ),
    );
  }

  _body() {
    return PageView(
      controller: pageController,
      onPageChanged: (page) => setState(() {
        currentPage = page;
      }),
      children: const [
        HomePage(),
        PasswordPage(),
        GeneratePasswordPage(),
      ],
    );
  }

  _fab() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  _onChangePage(int page) {
    setState(() {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      currentPage = page;
    });
  }
}
