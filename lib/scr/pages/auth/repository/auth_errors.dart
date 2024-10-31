String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID-CREDENTIALS':
      return 'Invalid credentials';
    case 'Inavalid session token':
      return 'Invalid token';
    case 'INVALID_FULLNAME':
      return 'Invalid full name';
    case 'INVALID_PHONE':
      return 'Invalid phone number';
    case 'INVALID_CPF':
      return 'Invalid CPF';
    default:
      return 'An error occurred';
  }
}
