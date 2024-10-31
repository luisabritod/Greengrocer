String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID-CREDENTIALS':
      return 'Invalid credentials';
    case 'Inavalid session token':
      return 'Invalid token';
    default:
      return 'An error occurred';
  }
}
