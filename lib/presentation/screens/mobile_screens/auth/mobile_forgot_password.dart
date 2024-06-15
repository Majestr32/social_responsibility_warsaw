import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/strings.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/themes/theme.dart';
import '../../../../core/validator/field_validator.dart';
import '../../../blocs/forgot_password/forgot_password_bloc.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileForgotPasswordScreen extends StatefulWidget {
  const MobileForgotPasswordScreen({super.key});

  @override
  State<MobileForgotPasswordScreen> createState() =>
      _MobileForgotPasswordScreenState();
}

class _MobileForgotPasswordScreenState
    extends State<MobileForgotPasswordScreen> {
  final ForgotPasswordBloc _bloc = sl<ForgotPasswordBloc>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailNode = FocusNode();

  bool _emailWasFocused = false;
  bool _emailWasUnfocused = false;
  bool get _validateEmail => _emailWasFocused && _emailWasUnfocused;

  @override
  void initState() {
    _emailNode.addListener(_emailFocusChanged);
    super.initState();
  }

  void _emailFocusChanged(){
    if(_emailNode.hasFocus){
      _emailWasFocused = true;
    }else{
      _emailWasUnfocused = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            bloc: _bloc,
            listener: (context, state) {
              state.maybeMap(
                  error: (e) {
                    AppToast.showError(context, e.error.localizedMessageOrDefault(context));
                  },
                  success: (_) {
                    Navigator.pop(context);
                    AppToast.showSuccess(context, AppLocalizations.of(context)!.emailSent);
                  },
                  orElse: () {});
            },
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 55.0, left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.forgotPass,
                          style: AppTheme.themeData.textTheme.headlineLarge,
                        ),
                        Text(
                          AppLocalizations.of(context)!.forgotPassHeader,
                          style: AppTheme.themeData.textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context)!.email,
                          style: AppTheme.themeData.textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Form(
                          key: _formKey,
                          child: AppTextField(
                            focusNode: _emailNode,
                            textController: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: AppLocalizations.of(context)!.enterEmail,
                            validator: !_validateEmail ? (_) => null : Validator(context).validateEmail,
                          ),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        AppElevatedButton(
                            widget: state.maybeMap(
                                loading: (_)=> const SizedBox(width:20,height:20,child: LoadingIndicator(color: Colors.white,)),
                                orElse: ()=>Text(
                                  AppLocalizations.of(context)!.buttonSend,
                                  style: AppTheme.themeData.textTheme.titleSmall!
                                      .copyWith(color: Colors.white),
                                )),
                            text: AppLocalizations.of(context)!.buttonSend, onPressed: () async{
                          if(!_validateEmail){
                            setState(() {
                              _emailWasFocused = true;
                              _emailWasUnfocused = true;
                            });
                            await Future.delayed(Duration(seconds: 1));
                          }
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          _bloc.add(ForgotPasswordEvent.resetPassword(
                              email: _emailController.text));
                        }),
                        const SizedBox(
                          height: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailNode.removeListener(_emailFocusChanged);
    _emailController.dispose();
    _emailNode.dispose();
    super.dispose();
  }
}
