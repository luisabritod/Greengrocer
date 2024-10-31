String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID-CREDENTIALS':
      return 'Invalid credentials';
    default:
      return 'An error occurred';
  }
}
