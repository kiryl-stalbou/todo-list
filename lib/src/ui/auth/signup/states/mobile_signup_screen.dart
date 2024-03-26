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
import '../signup_controller.dart';

class MobileSignUpScreen extends StatefulWidget {
  const MobileSignUpScreen({super.key});

  @override
  State<MobileSignUpScreen> createState() => _MobileSignUpScreenState();
}

class _MobileSignUpScreenState extends State<MobileSignUpScreen> with SignUpControllerMixin, LocalizationStateMixin, ThemeStateMixin {
  @override
  Widget build(BuildContext context) => AppScaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindBottom: true,
        top: const StaticAppBar(),
        bottom: BottomButton(
          onTap: onSignUpTap,
          fadeBackground: true,
          child: Text(s.key(Lk.signupButton)),
        ),
        body: HideKeyboardArea(
          child: ValidatableForm(
            key: formKey,
            child: ListView(
              children: [
                //

                const VSpacer(Insets.xxl),

                Center(
                  child: Text(
                    s.key(Lk.signup),
                    style: textTheme.titleLarge,
                  ),
                ),

                const VSpacer(Insets.l),

                ValidatableTextField(
                  controller: nameController,
                  margin: AppPadding.horizontal,
                  validator: TextValidator.notEmpty,
                  label: s.key(Lk.name),
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.person_rounded,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
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

                Center(
                  child: TapDetector(
                    onTap: onSignInTap,
                    child: Text(
                      s.key(Lk.signupHaveAcc),
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
