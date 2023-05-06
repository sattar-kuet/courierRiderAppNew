import 'package:courier_rider/page/Welcome/method/method.dart';
import 'package:courier_rider/utility/localdb.dart';
import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  void systemInformationAction() async {
    WelcomeMethod.dbNameAction();
  }

  void loginStatusAction(BuildContext context) async {
    print(LocalDB.getToken);
    if (LocalDB.getToken != null) {
      WelcomeMethod.checkTokenStatus().then(
        (bool value) {
          if (value == true) {
            Future.delayed(
                const Duration(seconds: 2),
                () => Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false));
          } else {
            Future.delayed(
              const Duration(seconds: 2),
              () => Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false),
            );
          }
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false),
      );
    }
  }
}
