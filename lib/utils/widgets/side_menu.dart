import 'package:comisariato/config/menu/menu_items.dart';
import 'package:comisariato/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return  Theme(data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: Colors.white)
      ), child: 
    NavigationDrawer(
      
      surfaceTintColor: Colors.white,
      indicatorColor: const  Color.fromARGB(255, 151, 180, 194),
      backgroundColor: fondoColor,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
         Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
            child: const Text('Main'),
          ),
           ...appMenuItems.sublist(0).map(
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title, style: const TextStyle(color: Colors.white),),
                ),
              ),
      ],
    ));
  }
}
