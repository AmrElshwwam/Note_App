import 'package:get/get.dart';

String? validInputSignin(String val, int min, int max, String type) {
  if (val.isEmpty) return "Can't Be Empty";

  if (val.length < min) return "Can't Be Less Than $min Characters";

  if (val.length > max) return "Can't Be Larger Than $max Characters";

  if (type == "email" && !GetUtils.isEmail(val)) {
    return "Not Valid Email";
  }

  if (type == "password") {
    if (val.length < 6) return "Password must be at least 6 characters";
  }

  return null;
}
