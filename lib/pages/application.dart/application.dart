import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';
import 'package:patient_app_fit4002/common/widgets/widgets.dart';
import 'package:patient_app_fit4002/pages/account/account.dart';
import 'package:patient_app_fit4002/pages/chat/chat.dart';
import 'package:patient_app_fit4002/pages/home/home.dart';
import 'package:patient_app_fit4002/pages/main/main.dart';
import 'package:patient_app_fit4002/pages/record/record.dart';



class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // current tab page number
  int _page = 0;
  // tab page title
  final List<String> _tabTitles = [
    'Welcome',
    'Chat',
    'Record',
    'Account'
  ];
  // page controller
  late PageController _pageController;

  // bottom navigation
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.home,
        color: AppColors.secondaryText,
      ),
      label: 'main',
      backgroundColor: AppColors.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.chat,
        color: AppColors.secondaryText,
      ),
      label: 'chat',
      backgroundColor: AppColors.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.notes,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.notes,
        color: AppColors.secondaryText,
      ),
      label: 'record',
      backgroundColor: AppColors.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.person,
        color: AppColors.secondaryText,
      ),
      label: 'my',
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // tab switch animation
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab page change
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  // initialised or dispose page
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // top navigation
  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        );
  }

  // page content
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(),
        // MainPage(),
        ChatPage(),
        RecordPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // bottom navigation
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(duSetHeight(42)),
        child: _buildAppBar(),
      ),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
