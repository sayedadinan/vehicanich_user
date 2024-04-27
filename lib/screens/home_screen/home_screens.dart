import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich/screens/login_screen/login_screen.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/home_screen_widgets/home_listtile_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => Loginscreen())),
                  (route) => false);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.03, context),
                right: Mymediaquery().mediaquerywidth(0.03, context),
                top: Mymediaquery().mediaqueryheight(0.01, context),
                bottom: Mymediaquery().mediaqueryheight(0.00, context)),
            child: Card(
              color: Myappallcolor().textcolor,
              child: SizedBox(
                height: 130,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.02, context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Mymediaquery().mediaqueryheight(0.02, context)),
                      child: Container(
                        width: 95,
                        height: 93,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                        width: Mymediaquery().mediaquerywidth(0.04, context)),
                    const ListtileText(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
