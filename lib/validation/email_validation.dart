String? validEmail(String? input) {
  if (input == null) {
    return "Bitte eine E-Mail eingeben";
  }
  if(validateEmailRules(input!)){
    return null;
  } else {
    return "Bitte eine valide E-Mail eingeben.";
  }

}

bool validateEmailRules(String input){
  if (!input!.contains("@")) {
    return false;
  }
  return true;
}