import 'package:intl/intl.dart';

class FormateNumber {
  format(val) {
    int x;
      var f = NumberFormat("#,###,000", "pt_BR");
   // print('$val =  ${val is String}');

     if (val is String && double.tryParse(val) != null) {
        x = int.parse(val);
        return f.format(x);
;    }
     if (val is int) {
    
      x =val;
       return f.format(x);
    }
    return 0;
  }
}
