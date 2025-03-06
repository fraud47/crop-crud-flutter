
import 'package:farm_form/core/common/toast/ContextExtensions.dart';
import 'package:farm_form/ui/pages/sign_up.dart';
import 'package:farm_form/ui/pages/widgets/auth/AuthField.dart';
import 'package:farm_form/ui/pages/widgets/auth/Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../core/theme/app_pallete.dart';
import '../bloc/sign_in/sign_in_bloc.dart';
import 'main_screen/main_scren_wrapper.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static route() => MaterialPageRoute(
    builder: (context) => const SignIn(),
  );

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn>with SingleTickerProviderStateMixin  {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _rotationAnimation;
  double _opacity = 0.0; // Initial opacity for fade-in

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Animation duration
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Start from off the screen on the left
      end: Offset(-2.0, 0.0),    // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,  // You can change the curve as needed
    ));
    _rotationAnimation = Tween<double>(
      begin: 0.0,   // Start with no rotation
      end: 2 * 4.0, // Full 360-degree rotation (2 * π)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,  // Customize the curve
    ));
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Change opacity to 1.0 to fade in the content
      });
    });

    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Scaffold(
              body:BlocConsumer<SignInBloc, SignInState>(

                  listener: (context, state) {
                    if (state is SignInFailure) {

                      context.notify(
                          state.message,
                          isError: true
                      );
                    } else if (state is SignInSuccess) {

                      context.notify('Sign in Success');

                      Navigator.pushAndRemoveUntil(
                        context,
                        MainScreenWrapper.route(),
                            (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignInLoading){

                      CircularProgressIndicator();
                    }
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: AnimatedOpacity(
                        opacity: _opacity, // Fade-in opacity
                        duration: Duration(seconds: 1), // Duration of the fade-in effect
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: SlideTransition(
                                  position: _animation,
                                  child: RotationTransition(
                                    turns: _rotationAnimation,
                                    child: Image(
                                      image: AssetImage("images/leaf.png"),
                                      width: 70,
                                    ),
                                  ),
                                ),
                              ),
                              const Header(
                                heading: "Sign in to FarmForm",
                                subHeading: "Analyze your farm in on place.",
                              ),
                              SizedBox(height: 20.0),
                              AuthField(
                                hintText: 'enter email',
                                controller: emailController,
                              ),
                              SizedBox(height: 20.0),
                              AuthField(
                                isObscureText: true,
                                hintText: 'enter password',
                                controller: passwordController,
                              ),
                          
                              SizedBox(height: 20.0),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: (){
                                if (formKey.currentState!.validate()) {
                                context.read<SignInBloc>().add(
                                SigningInEvent(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                ),
                                );
                                  }},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    "Sign in",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      color: AppPallete.whiteColor,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Don't have an account",
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: AppPallete.black
                                  ),),
                                  TextButton(onPressed: ()=>Navigator.push(context,
                                      Signup.route()), child: Text("Register",
                                    style:  Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: AppPallete.black,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    );

                  }));
        });
  }}




