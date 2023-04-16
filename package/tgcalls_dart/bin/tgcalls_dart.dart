import 'package:tgcalls_dart/tgcalls_dart.dart';

void main(List<String> arguments) {
  Lib lib = Lib(
      pathLib:
          "/home/hexaminate/Documents/hexaminate/app/glx/lib/template/tgcalls/native_lib/build/libtgcalls.so");

  var calculate_result = lib.calculate(num1: 10, num2: 5);
  print(calculate_result);

  lib.print(data: 'azka');

  var result = lib.request(data: {"@type": "oke", "ok": "p"});
  print(result);
}
