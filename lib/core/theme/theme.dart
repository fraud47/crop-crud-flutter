import 'package:flutter/material.dart';

import 'app_pallete.dart';

class AppTheme{

    static final lightThemeMode = ThemeData.light().copyWith(

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
            letterSpacing: -1.5,
            fontWeight: FontWeight.w600,
              color: AppPallete.darkGrey

          ),
          bodySmall: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18,
            color: AppPallete.darkGrey
          )

        ),
        colorScheme: const ColorScheme(brightness: Brightness.light,

            primary: AppPallete.primary,
            onPrimary: AppPallete.black,
            secondary: AppPallete.black,
            onSecondary: AppPallete.whiteColor,
            error: Colors.redAccent,
            onError: AppPallete.whiteColor,
            background: AppPallete.backgroundColor,
            onBackground: AppPallete.black,
            surface: AppPallete.whiteColor,
            onSurface: AppPallete.black),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style: ButtonStyle(
           padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15,horizontal: 20)),

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

}