class CommaFormatter {
  String formatToThousands(String number) {
    String priceInText = "";
    int counter = 0;
    for (int i = (number.length - 1); i >= 0; i--) {
      counter++;
      String str = number[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = "$str$priceInText";
      } else if (i == 0) {
        priceInText = "$str$priceInText";
      } else {
        priceInText = ",$str$priceInText";
      }
    }
    return priceInText.trim();
  }
}
