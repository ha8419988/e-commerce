class Api {
  //nha 192.168.1.223
  //cty1 192.168.1.15
  //cty2 192.168.1.11
  static const hostConnection = 'http://192.168.1.11/api_clothes_store';
  static const hostConnectionUser = '$hostConnection/user';

  static const singUp = '$hostConnection/user/singup.php';
  static const validateEmail = '$hostConnection/user/validate_email.php';
  static const login = '$hostConnection/user/login.php';
}
