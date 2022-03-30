import 'package:diacritic/diacritic.dart';

class StringUtil {
  static String lpad(String valueToPad, String filler, int size) {
    while (valueToPad.length < size) {
      valueToPad = filler + valueToPad;
    }
    return valueToPad;
  }

  static String rpad(String valueToPad, String filler, int size) {
    while (valueToPad.length < size) {
      valueToPad = valueToPad + filler;
    }
    return valueToPad;
  }

  static String removeAccents(String texto) {
    try {
      texto = removeDiacritics(texto);
      return texto;
    } on Exception {
      return texto;
    }
  }
}
