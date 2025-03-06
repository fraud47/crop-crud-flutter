import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/auth/bloc/logout/logout_bloc.dart';
import '../../../core/common/auth/bloc/logout/logout_event.dart';
import '../../../core/common/auth/bloc/logout/logout_state.dart';

class LogoutButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final VoidCallback? onLogoutSuccess;

  const LogoutButton({
    Key? key,
    this.text = 'Logout',
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48.0,
    this.onLogoutSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          // Show loading indicator
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logging out...'),
              duration: Duration(seconds: 1),
            ),
          );
        } else if (state is LogoutSuccess) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logged out successfully'),
              backgroundColor: Colors.green,
            ),
          );

          // Execute callback if provided
          if (onLogoutSuccess != null) {
            onLogoutSuccess!();
          }

          // Navigate to login screen
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/login',
                (route) => false,
          );
        } else if (state is LogoutFailure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout failed: ${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SizedBox(
        width: width,
        height: height,
        child: IconButton(
          onPressed: () {
            // Dispatch logout event
            context.read<LogoutBloc>().add(const LogoutRequested());
          },
          
    icon: BlocBuilder<LogoutBloc, LogoutState>(
            builder: (context, state) {
              if (state is LogoutLoading) {
                return const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Colors.white,
                  ),
                );
              }
              return Icon(Icons.logout_sharp);
            },
          ),
        ),
      ),
    );
  }
}