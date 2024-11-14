import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email is required';
  }
  if (!email.isEmail) {
    return 'Invalid email';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is required';
  }
  if (password.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Name is required';
  }
  final names = name.split(' ');
  if (names.length == 1) {
    return 'Please enter your full name';
  }
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Phone is required';
  }
  if (phone.length < 14 || !phone.isPhoneNumber) {
    return 'Invalid phone number';
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'CPF is required';
  }
  if (!cpf.isCpf) {
    return 'Invalid CPF';
  }
  return null;
}
