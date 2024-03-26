import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../l10n/lk.dart';
import '../../../../l10n/s.dart';
import '../../../../utils/common/desktop_constraints.dart';
import '../../../../utils/common/text_validators.dart';
import '../../../../utils/mixins/localization_state_mixin.dart';
import '../../../../utils/mixins/theme_state_mixin.dart';
import '../../../_widgets/appbars/static_appbar.dart';
import '../../../_widgets/common/hide_keyboard_area.dart';
import '../../../_widgets/common/paddings.dart';
import '../../../_widgets/common/spacers.dart';
import '../../../_widgets/interactive/app_button.dart';
import '../../../_widgets/interactive/validatable/validatable_form.dart';
import '../../../_widgets/interactive/validatable/validatable_text_field.dart';
import '../../../_widgets/scaffolds/app_scaffold.dart';
import '../signin_controller.dart';

class WebSignInScreen extends StatefulWidget {
  const WebSignInScreen({super.key});

  @override
  State<WebSignInScreen> createState() => _WebSignInScreenState();
}

class _WebSignInScreenState extends State<WebSignInScreen> with SignInControllerMixin, LocalizationStateMixin, ThemeStateMixin {
  @override
  Widget build(BuildContext context) => AppScaffold(
        top: const StaticAppBar(),
        body: HideKeyboardArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //
              Text(
                s.key(Lk.signin),
                style: textTheme.titleLarge,
              ),

              const VSpacer(Insets.l),

              _SignInForm(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),

              const VSpacer(Insets.xl),

              _SignUpButton(onSignUpTap),

              const VSpacer(Insets.xxxl),

              _SignInButton(onSignInTap),
            ],
          ),
        ),
      );
}

class _SignInForm extends StatelessWidget {
  const _SignInForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final Key formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return DesktopConstraints(
      child: ValidatableForm(
        key: formKey,
        child: Column(
          children: [
            //
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
          ],
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton(this.onTap);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final s = S.of(context);

    return TextButton(
      onPressed: onTap,
      child: Text(
        s.key(Lk.signinDontHaveAcc),
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.blue,
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton(this.onTap);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return DesktopConstraints(
      child: AppButton(
        onTap: onTap,
        margin: AppPadding.horizontal,
        child: Text(s.key(Lk.signinButton)),
      ),
    );
  }
}
