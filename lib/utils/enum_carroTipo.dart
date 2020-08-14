import 'package:flutter/foundation.dart';

enum CarroTipo { CLASSICOS, ESPORTIVOS, LUXO }

extension SelectedCars on CarroTipo {
  String get name => describeEnum(this);

  String get type {
    switch (this) {
      case CarroTipo.CLASSICOS:
        return "classicos";
      case CarroTipo.ESPORTIVOS:
        return "esportivos";
      case CarroTipo.LUXO:
        return "luxo ";
    }
  }
}
