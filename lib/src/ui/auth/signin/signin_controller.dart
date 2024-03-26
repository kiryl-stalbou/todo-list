import 'package:flutter/cupertino.dart';

import '../../../l10n/lk.dart';
import '../../../scopes/app/dependencies/auth/auth.dart';
import '../../../utils/common/text_validators.dart';
import '../../_loading/global/global_loading.dart';
import '../../_widgets/interactive/validatable/validatable_form.dart';

mixin SignInControllerMixin<S extends StatefulWidget> on State<S> {
  late final GlobalLoadingState _globalLoadingState;
  late final AuthState _authState;

  late final passwordController = TextEditingController();
  late final emailController = TextEditingController();
  final formKey = GlobalKey<ValidatableFormState>();

  Future<void> onSignInTap() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final email = clearSpaces(emailController.text);
    final password = clearSpaces(passwordController.text);

    await _globalLoadingState.run(
      context,
      () => _authState.signIn(email, password),
      activeLk: Lk.signinActive,
      successLk: Lk.signinSuccess,
      failedLk: Lk.signinFailed,
    );
  }

  void onSignUpTap() => _authState.showSignUpScreen = true;

  @override
  void initState() {
    super.initState();
    _authState = Auth.of(context);
    _globalLoadingState = GlobalLoading.of(context);
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}