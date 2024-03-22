// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

Widget errorView({
  required ErrorType errorType,
  required Function onRefresh,
}) {
  String errorText = '';

  switch (errorType) {
    case ErrorType.no_internet:
      errorText = 'No Internet Connection!\nTap to retry';

      break;
    case ErrorType.server_error:
      errorText = 'Server error occoured!\nTap to retry';

      break;
    case ErrorType.other:
      errorText = 'An unknown error occoured!\nTap to retry';

      break;
  }

  return Center(
    child: SizedBox(
      width: 300,
      child: InkWell(
        onTap: () => onRefresh(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error),
            const SizedBox(height: 8),
            Text(
              errorText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

enum ErrorType {
  no_internet,
  server_error,

  other,
}
