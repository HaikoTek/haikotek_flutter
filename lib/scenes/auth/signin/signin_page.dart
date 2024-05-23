import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haikotek_flutter/app/app_route.dart';
import 'package:haikotek_flutter/utils/app_extension.dart';
import 'package:haikotek_flutter/utils/app_log.dart';
import 'package:haikotek_flutter/safety/page_stateful.dart';

import 'package:haikotek_flutter/services/api/api_error.dart';

import 'package:haikotek_flutter/services/providers/providers.dart';

import './signin_provider.dart';


final pSignInProvider = ChangeNotifierProvider((_) => SignInProvider());

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key, this.title}) : super(key: key);

  final String? title;

    @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends PageStateful<SignInPage> with WidgetsBindingObserver, ApiError {

  late SignInProvider signInProvider;

  @override
  void initDependencies(WidgetRef ref) {
    super.initDependencies(ref);
    signInProvider = ref.read(pSignInProvider);
    authProvider = ref.read(pAuthProvider);
  }

   @override
  void afterFirstBuild(WidgetRef ref) {
    signInProvider.resetState();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.d(state);
  }

  @override
  Future<int> onApiError(dynamic error) async {
    print('Error on API');
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title ?? ''),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    const Text(
                      "Q. Flutter",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "🛠 An useful project structure for creating effectively Flutter applications",
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),
                    buildEmailFormField(),

                    const SizedBox(height: 20),
                    buildPasswordFormField(),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      key: const Key('SignIn'),
                      onPressed: ref.watch(pSignInProvider.select((value) => value.formValid)) 
                        ? () async {
                          final bool? success = await apiCallSafety(() 
                            => authProvider.signIn(signInProvider.emailValue, signInProvider.passwordValue),
                            onStart: () async {

                            },
                            onCompleted: (status, res) async {

                            },
                            onError: (error) async {

                            },
                            skipOnError: true
                          );

                          if(success == true) {
                            ref.navigator()?.pushReplacementNamed(AppRoute.routeHome);
                          }
                          
                        }
                        : null,
                      child: const Text('Sign in'),
                    ),

                    const SizedBox(height: 20),
                  ],
                )
              ),
            ),
          ),
        ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      onChanged: signInProvider.onEmailChangeToValidateForm,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      // onSaved: (newValue) => email = newValue,
      onChanged: signInProvider.onPasswordChangeToValidateForm,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}