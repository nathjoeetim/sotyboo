import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/core/home/sportboo_user_provider.dart';
import 'package:sportboo_mobile_client/core/home/tab_navigator.dart';

import '../providers/notification_provider.dart';
import '../theme/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // to prevent the bottom nav bar from displaying in a particular page you are going to
  // rootNavigator: true
  // Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new AuthScreen()));
  @override
  void initState() {

    var sportbooUser = Provider.of<SportbooUserProvider>(context, listen: false).sportbooUser;
    Provider.of<NotificationProvider>(context, listen: false).setupToken(sportbooUser?.accessToken);

    super.initState();
  }

  String _currentTab = 'LiveScore';
  int _selectedIndex = 0;

  List<String> pageKeys = [
    'LiveScore',
    'P2P',
    'Betslip',
    'Wallet',
    'Profile',
  ];

  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'LiveScore': GlobalKey<NavigatorState>(),
    'P2P': GlobalKey<NavigatorState>(),
    'Betslip': GlobalKey<NavigatorState>(),
    'Wallet': GlobalKey<NavigatorState>(),
    'Profile': GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    // If you click on the same tab you are in
    if (tabItem == _currentTab) {
      // Pop all the inner pages till you get to the original Tab Page
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      // navigate to p2p view
      // if (index == 1) {
      //   Navigator.push(
      //     context,
      //     PageRouteBuilder(
      //       pageBuilder: (context, animation, secondaryAnimation) =>
      //       const Text(
      //         'P2P Entry',
      //         style: TextStyle(fontSize: 35),
      //       ),
      //       transitionDuration: const Duration(milliseconds: 500),
      //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //         return FadeTransition(
      //           opacity: animation,
      //           child: child,
      //         );
      //       },
      //     ),
      //   );
      //   return;
      // }

      // Else move to the page you just clicked on
      setState(() {
        _currentTab = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // The WillPopScope widget allows the back button to function properly
    // The app won't close when the back button is pressed, unless we are in the LiveScore screen
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();

        if (isFirstRouteInCurrentTab) {
          if (_currentTab != 'LiveScore') {
            _selectTab('LiveScore', 0);

            return false;
          }
        }

        // Let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator('LiveScore'),
            _buildOffstageNavigator('P2P'),
            _buildOffstageNavigator('Betslip'),
            _buildOffstageNavigator('Wallet'),
            _buildOffstageNavigator('Profile'),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              width: 1.h,
              color: AppColors.tertiary8,
            )),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.tertiary1,
            selectedItemColor: AppColors.primaryBase6,
            unselectedItemColor: AppColors.tertiary8,
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() {
              _selectTab(pageKeys[index], index);
            }),
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/football-bar.png')),
                //activeIcon: ImageIcon(AssetImage('images/home_active.png')),
                label: 'Scores',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/p2p-bar.png')),
                //activeIcon: ImageIcon(AssetImage('images/history_active.png')),
                label: 'P2P',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/bet-slip-bar.png')),
                //activeIcon: ImageIcon(AssetImage('images/wallet_active.png')),
                label: 'Betslip',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/wallet-bar.png')),
                //activeIcon: ImageIcon(AssetImage('images/settings_active.png')),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/profile-bar.png')),
                //activeIcon: ImageIcon(AssetImage('images/settings_active.png')),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
