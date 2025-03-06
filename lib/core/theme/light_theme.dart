import 'package:flutter/material.dart';

import 'app_pallete.dart';

ThemeData lightMode = ThemeData(
    colorScheme:  ColorScheme.light(
        surface: Colors.white,
        primary: AppPallete.primary,
        secondary: Colors.grey.shade200,
        tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900
    ),
    scaffoldBackgroundColor: AppPallete.whiteColor,


    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
        ),

        errorStyle: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 12
        ),

        hintStyle: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16
        ),
        filled: true,
        fillColor: AppPallete.darkGrey,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(26.0)

        )
    ),



    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily:'Raleway',
            fontSize: 36,
            fontWeight: FontWeight.w600,
            letterSpacing: -1.5,
            color: AppPallete.black
        ),
        titleMedium:TextStyle(
            fontFamily:'Raleway',
            fontSize: 28,
            fontWeight: FontWeight.w700,

        ),
        titleSmall:TextStyle(
          fontFamily:'Raleway',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.5,

        ),
        bodySmall: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18,
            color: AppPallete.darkGrey
        ),
        labelSmall: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppPallete.darkGrey
        ),
        labelMedium: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppPallete.darkGrey
        )

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 20)),

            backgroundColor: WidgetStateProperty
                .all<Color>(AppPallete.primary),
            foregroundColor: WidgetStateProperty.all<Color>(AppPallete.whiteColor)

        )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(

        style: ButtonStyle(

            padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15,horizontal: 20)),


            backgroundColor: WidgetStateProperty
                .all<Color>(AppPallete.transparentColor),
            side:  WidgetStateProperty.resolveWith<BorderSide>(
                    (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                        return const BorderSide(
                            color: AppPallete.primary,
                            width: 1,
                        );
                    }
                    else{
                        return const BorderSide(
                            color: AppPallete.greyColor,
                            width: 1,
                        );
                    }

                }
            ),



            foregroundColor: WidgetStateProperty.all<Color>(AppPallete.black),


        )
    )
);