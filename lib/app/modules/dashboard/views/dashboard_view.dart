// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/modules/favorite/views/favorite_view.dart';
import 'package:propertio_getx/app/modules/home/views/home_view.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:propertio_getx/app/modules/profile/views/profile_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final List<Widget> pages = [
    HomeView(),
    KprView(),
    FavoriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Image.asset('assets/lg_propertio_home.png'),
              ),
              // drawer: SideBar(forDashboard: true),
              body: pages[controller.tabIndex],
              bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.credit_card),
                      label: 'KPR',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline_rounded),
                      label: 'Favorit',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_4_outlined),
                      label: 'Profil',
                    ),
                  ],
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.tabIndex,
                  onTap: controller.changeTabIndex,
                  unselectedItemColor: secondaryColor,
                  selectedItemColor: primaryColor),
            ));
  }
}

class KprView extends StatelessWidget {
  const KprView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'KprView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class AgentView extends StatelessWidget {
  const AgentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'AgentView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class VerisonPage extends StatefulWidget {
  const VerisonPage({Key? key}) : super(key: key);

  @override
  State<VerisonPage> createState() => _VerisonPageState();
}

class _VerisonPageState extends State<VerisonPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PackageInfoPlus example'),
        elevation: 4,
      ),
      body: ListView(
        children: <Widget>[
          _infoTile('App name', _packageInfo.appName),
          _infoTile('Package name', _packageInfo.packageName),
          _infoTile('App version', _packageInfo.version),
          _infoTile('Build number', _packageInfo.buildNumber),
          _infoTile('Build signature', _packageInfo.buildSignature),
          _infoTile(
            'Installer store',
            _packageInfo.installerStore ?? 'not available',
          ),
        ],
      ),
    );
  }
}
