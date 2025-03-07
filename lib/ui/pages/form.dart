import 'package:farm_form/domain/entities/category.dart';
import 'package:farm_form/domain/entities/farm_type.dart';
import 'package:farm_form/ui/pages/widgets/auth/AuthField.dart';
import 'package:farm_form/ui/pages/widgets/auth/Header.dart';
import 'package:farm_form/ui/pages/widgets/auth/authfield_skeleton.dart';
import 'package:farm_form/ui/pages/widgets/auth/custom_dropdown_formfield.dart';
import 'package:farm_form/ui/pages/widgets/logout_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/ui/button/basic_reactive_button.dart';
import '../../core/hive/hive.dart';
import '../../core/theme/app_pallete.dart';

import '../../domain/use_case/farm_use_case.dart';
import '../bloc/button/button_state.dart';
import '../bloc/button/button_state_cubit.dart';
import '../bloc/categories/crops_cubit.dart';
import '../bloc/categories/crops_display_state.dart';
import '../bloc/farm_types/farm_type_cubit.dart';
import '../bloc/farm_types/farm_type_display_state.dart';

class FormScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const FormScreen(),
  );

  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with SingleTickerProviderStateMixin{
  final nameController = TextEditingController();
  final national_idController = TextEditingController();
  final cropController = TextEditingController();
  final locationController = TextEditingController();
  final farmtypeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _rotationAnimation;
  double _opacity = 0.0;

  CropEntity? _selectedCrop;
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
      appBar: AppBar(
        actions: [
          LogoutButton()
        ],
      ),
      body:MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (context) => ButtonStateCubit()
          ),
          BlocProvider(
            create: (context) => CropsDisplayCubit()..displayCrops(),
          ),
          BlocProvider(
            create: (context) => FarmTypeDisplayCubit()..displayFarmType(), // Add your second provider
          ),
        ],

    child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),

        child: AnimatedOpacity(
          opacity: _opacity, // Fade-in opacity
          duration: const Duration(seconds: 1), // Duration of the fade-in effect
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                const Header(
                  heading: "Enter farm details",
            
                ),
                const SizedBox(height: 20.0),
                AuthField(
                  hintText: 'enter farm name',
                  controller: nameController,
                ),
                SizedBox(height: 20.0),
                AuthField(
            
                  hintText: 'enter national ID',
                  controller: national_idController,
                ),
                SizedBox(height: 20.0),
                AuthField(

                  hintText: 'enter location',
                  controller: locationController ,
                ),
                const SizedBox(height: 20.0),
                _Crops(cropController),
                const SizedBox(height: 20.0),
                _FarmType(farmtypeController),
                const SizedBox(height: 20.0),
                BasicReactiveButton(
                    content: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child:Text(
                        'Add farm',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    onPressed: () {
                      int? storedId = MainBoxMixin().getData(MainBoxKeys.id);

                      if (storedId == null) {

                        return;
                      }
                      context.read <ButtonStateCubit > ().execute(
                          usecase: FarmUseCase(),
                          params: CreateFarmReq(
                              nationalId: national_idController.text.trim(),
                              crop: int.parse(cropController.text),
                              farmType: int.parse(farmtypeController.text.trim()),
                              farmerName: nameController.text.trim(),
                              createdBy: int.parse(storedId.toString()),
                              location: locationController.text.trim()

                          )
                      );
                    }
                )

              ],
            ),
          ),
        ),
      ),)
    );
  }

  Widget _Crops(TextEditingController controller) {
    return Container(
      height: 56.0,
      child: BlocBuilder<CropsDisplayCubit, CropsDisplayState>(
        builder: (context, state) {
          if (state is CropsLoading) {
            return AuthFieldSkeleton(); // Fixed missing return
          }
          if (state is CropsLoaded) {
            return CustomDropdownField<CropEntity>(
              hintText: "Select Crop",
              options: state.Crops,
              controller: controller,
              onChanged: (value) {
                if (value != null) {
                  controller.text = value.id;
                }
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}





Widget _FarmType(TextEditingController controller) {
  return Container(
    height: 56.0,
    child: BlocBuilder<FarmTypeDisplayCubit, FarmTypeDisplayState>(
      builder: (context, state) {
        if (state is FarmTypeLoading) {
          return AuthFieldSkeleton(); // Fixed missing return
        }
        if (state is FarmTypeLoaded) {
          return CustomDropdownField<FarmTypeEntity>(

            hintText: "Select Farm Type",
            options: state.FarmType,
            controller: controller,
            onChanged: (value) {
              if (value != null) {
                controller.text = value.id;
              }
            },
          );
        }
        return Container();
      },
    ),
  );
}
