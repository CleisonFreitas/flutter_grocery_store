import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatter {
  const MaskFormatter._();

  static MaskTextInputFormatter phoneFormatter() {
    return MaskTextInputFormatter(
      mask: '(##) #####-####', // Format for Brazil: (99) 99999-9999
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter zipCodeFormatter() {
    return MaskTextInputFormatter(
      mask: '##.###-###', // Format for Brazil: 60.332-060
      filter: {"#": RegExp(r'[0-9]')},
    );
  }
}
