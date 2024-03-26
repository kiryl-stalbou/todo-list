import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../l10n/lk.dart';
import '../../../../utils/common/text_validators.dart';
import '../../../../utils/mixins/localization_state_mixin.dart';
import '../../../../utils/mixins/theme_state_mixin.dart';
import '../../../_widgets/appbars/static_appbar.dart';
import '../../../_widgets/common/hide_keyboard_area.dart';
import '../../../_widgets/common/paddings.dart';
import '../../../_widgets/common/spacers.dart';
import '../../../_widgets/interactive/bottom_button.dart';
import '../../../_widgets/interactive/tap_detector.dart';
import '../../../_widgets/interactive/validatable/validatable_form.dart';
import '../../../_widgets/interactive/validatable/validatable_text_field.dart';
import '../../../_widgets/scaffolds/app_scaffold.dart';
import '../signin_controller.dart';

class MobileSignInScreen extends StatefulWidget {
  const MobileSignInScreen({super.key});

  @override
  State<MobileSignInScreen> createState() => _MobileSignInScreenState();
}

class _MobileSignInScreenState extends State<MobileSignInScreen> with SignInControllerMixin, LocalizationStateMixin, ThemeStateMixin {
  @override
  Widget build(BuildContext context) => AppScaffold(
        resizeToAvoidBottomInset: true,
        top: const StaticAppBar(),
        bottom: BottomButton(
          onTap: onSignInTap,
          child: Text(s.key(Lk.signinButton)),
        ),
        body: HideKeyboardArea(
          child: ValidatableForm(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                Text(
                  s.key(Lk.signin),
                  style: textTheme.titleLarge,
                ),

                const VSpacer(Insets.l),

                ValidatableTextField(
                  maxLength: 320,
                  controller: emailController,
                  margin: AppPadding.horizontal,
                  validator: TextValidator.email,
                  label: s.key(Lk.email),
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                ),

                const VSpacer(Insets.l),

                ValidatableTextField(
                  label: s.key(Lk.password),
                  prefixIcon: Icons.password_rounded,
                  autofillHints: const [AutofillHints.password],
                  keyboardType: TextInputType.visiblePassword,
                  validator: TextValidator.notEmpty,
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  margin: AppPadding.horizontal,
                ),

                const VSpacer(Insets.xl),

                TapDetector(
                  onTap: onSignUpTap,
                  child: Text(
                    s.key(Lk.signinDontHaveAcc),
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
