List<String> usernames = ["Tim12", "Hallo5", "Holga7"];

String? validUsername(String? input) {
  if (input == null) {
    return "Bitte einen Username eingeben";
  }
  if(validateUsernameRules(input!)){
    return null;
  } else {
    return "Ein neuen Benutzername eingeben mit mehr als 4 Stellen.";
  }

}

bool validateUsernameRules(String input){
  if (input.length < 4) {
    return false;
  }
  if (usernames.contains(input)) {
    return false;
  }
  return true;
}