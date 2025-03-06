import 'package:flutter/cupertino.dart';

import 'ToastsService.dart';

extension ContextExtensions<T> on BuildContext{
  void notify(String message, {bool isError= false})=>isError
      ?ToastsService.showError(message, this)
      :ToastsService.showSuccess(message,this);
}