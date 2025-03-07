import 'package:farm_form/domain/use_case/crop_upload_use_case.dart';
import 'package:farm_form/domain/use_case/farm_type_upload_use_case.dart';
import 'package:farm_form/ui/pages/widgets/auth/AuthField.dart';
import 'package:farm_form/ui/pages/widgets/auth/Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/ui/button/basic_reactive_button.dart';
import '../bloc/button/button_state_cubit.dart';

class FarmDetails extends StatefulWidget {
  const FarmDetails({super.key});

  @override
  State<FarmDetails> createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> with SingleTickerProviderStateMixin {



  final cropController = TextEditingController();
  final farmtypeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _rotationAnimation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Animation duration
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Start from off the screen on the left
      end: Offset(-2.5, 0.0),    // End at the original position
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

    // Start the animation when the widget is first built
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
    alignment: Alignment.center,

    child: AnimatedOpacity(
    opacity: _opacity, // Fade-in opacity
    duration: const Duration(seconds: 1), // Duration of the fade-in effect
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    const Header(
    heading: "Farm admin panel",

    ),
    const SizedBox(height: 20.0),

      AuthField(
        hintText: 'Upload crop name',
        controller: cropController,
      ),
      SizedBox(height: 20.0),
      BasicReactiveButton(
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:Text(
              'Add crop name',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          onPressed: () {
            context.read <ButtonStateCubit > ().execute(
                usecase: CropUseCase(),
                params: CreateCropReq(
                  name: cropController.text.trim(),
                )
            );
            cropController.clear();
          }
      ),
    SizedBox(height: 20.0),
              AuthField(hintText: 'Upload farm type',
                controller: farmtypeController,),
      SizedBox(height: 20.0),
      BasicReactiveButton(
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:Text(
              'Add farm type',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          onPressed: () {

            context.read <ButtonStateCubit > ().execute(
                usecase: FarmTypeUseCase(),
                params: CreateFarmTypeReq(
                  name: farmtypeController.text.trim(),
                )
            );
            farmtypeController.clear();
          }
      ),


        ],
      )))));
  }
}
