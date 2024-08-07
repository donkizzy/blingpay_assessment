import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/posts_list.dart';
import 'package:blingpay_assesment/features/users/presentation/widgets/users_list.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              AdaptiveTheme.of(context).toggleThemeMode();
            },
            child:  Text(
              'Toggle Theme',
              style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              backgroundColor: shakeSpearBlue,
              labelStyle: const TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 16),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.bodyMedium!.color),
              unselectedBackgroundColor: const Color(0xff666666).withOpacity(0.5),
              radius: 100,
              buttonMargin: const EdgeInsets.only(right: 20,bottom: 20),
              contentCenter: true,
              width: 120,
              height: 65,
              tabs:const [
                Tab(
                  text: 'Post',
                ),
                Tab(
                  text: 'Users',
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PostsList(),
                  UsersList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
