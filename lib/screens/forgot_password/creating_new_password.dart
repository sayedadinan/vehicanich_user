import 'package:flutter/material.dart';
import 'package:vehicanich/utils/app_colors.dart';
import 'package:vehicanich/utils/app_custom_button.dart';
import 'package:vehicanich/utils/app_textfields.dart';
import 'package:vehicanich/utils/mediaquery.dart';
import 'package:vehicanich/widgets/forgot_screen_widgets/forgot_text.dart';

class CreateNewpasswordscreen extends StatelessWidget {
  const CreateNewpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myappallcolor().appbackgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Mymediaquery().mediaqueryheight(0.2, context)),
            Forgotpagetexts(
              text: 'Create new password',
              fontsize: Mymediaquery().mediaquerywidth(0.04, context),
              fontweight: FontWeight.w600,
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
            Forgotpagetexts(
              text:
                  "Your new password must be unique from those\npreviously used.",
              fontsize: Mymediaquery().mediaquerywidth(0.02, context),
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.07, context)),
            const Inputfield(
              label: 'New Password',
              hinttext: '',
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
            const Inputfield(
              label: 'Confirm Password',
              hinttext: '',
            ),
            SizedBox(height: Mymediaquery().mediaqueryheight(0.04, context)),
            CustomButton(
              color: Myappallcolor().buttonforgroundcolor,
              buttontextcolor: Myappallcolor().colorwhite,
              fontSize: Mymediaquery().mediaqueryheight(0.02, context),
              function: () => print('ad'),
              text: 'Reset Password',
            ),
          ],
        ),
      ),
    );
  }
}
