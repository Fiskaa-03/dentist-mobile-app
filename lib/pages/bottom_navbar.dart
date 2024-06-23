import 'package:dentist_app/pages/home.dart';
import 'package:dentist_app/pages/patients.dart';
import 'package:dentist_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:dentist_app/models/user.dart';
import 'package:dentist_app/services/authentication.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, required this.userUid});
  final String userUid;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final AuthenticationService _authenticationService = AuthenticationService();
  UserModel? _user;
  late List<Widget> _widgetOptions;

  int widgetIndex = 0;

  void setWidgetIndex(int widgetIndex) {
    setState(() {
      this.widgetIndex = widgetIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUser();
    _widgetOptions = [
      const Center(child: CircularProgressIndicator()),
      const Center(child: Patients()),
      const Profile()
    ];
  }

  _fetchUser() async {
    final user = await _authenticationService.getUser(widget.userUid);
    setState(() {
      _user = user;
      _widgetOptions[0] = Home(user: _user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(
        widgetIndex: widgetIndex,
        setWidgetIndex: setWidgetIndex,
      ),
      body: _widgetOptions[widgetIndex],
    );
  }
}

class Navbar extends StatelessWidget {
  final int widgetIndex;
  final dynamic setWidgetIndex;

  const Navbar({
    super.key,
    required this.widgetIndex,
    required this.setWidgetIndex,
  });

  @override
  Widget build(BuildContext context) {
    const Color navColor = Color.fromRGBO(210, 210, 210, 1.0);
    const Color activeNavColor = Color.fromRGBO(140, 140, 140, 1.0);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 50,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widgetIndex,
      items: [
        BottomNavigationBarItem(
          tooltip: 'Home',
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            colorFilter: const ColorFilter.mode(
              navColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/home.svg',
            colorFilter: const ColorFilter.mode(
              activeNavColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          tooltip: 'Patients',
          icon: SvgPicture.asset(
            'assets/icons/patients.svg',
            colorFilter: const ColorFilter.mode(
              navColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/patients.svg',
            colorFilter: const ColorFilter.mode(
              activeNavColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          tooltip: 'Profile',
          icon: SvgPicture.asset(
            'assets/icons/profile.svg',
            colorFilter: const ColorFilter.mode(
              navColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/profile.svg',
            colorFilter: const ColorFilter.mode(
              activeNavColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
      ],
      onTap: (widgetIndex) => setWidgetIndex(widgetIndex),
    );
  }
}
