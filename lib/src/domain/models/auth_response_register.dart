
import 'package:ceti_labs/src/domain/models/user_register.dart';

class AuthResponseRegister {
    UserRegister user;

    AuthResponseRegister({
        required this.user,
    });

    factory AuthResponseRegister.fromJson(Map<String, dynamic> json) => AuthResponseRegister(
        user: UserRegister.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}



