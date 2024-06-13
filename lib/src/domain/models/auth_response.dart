
import 'package:ceti_labs/src/domain/models/user.dart';

class AuthResponse {
    User user;
    String token;

    AuthResponse({
        required this.user,
        required this.token,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}



