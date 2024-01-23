String? validPasswordLength(String? input) {
  if (input == null) {
    return "Bitte ein Passwort eingeben.";
  }
  if(validatePasswordRules(input!)){
    return null;
  } else {
    return "Bitte ein Passwort mit mehr als 6 Stellen eingeben.";
  }

}

bool validatePasswordRules(String input){
  if (input.length < 6) {
    return false;
  }
  return true;
}