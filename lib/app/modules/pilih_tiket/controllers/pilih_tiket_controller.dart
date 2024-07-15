import 'package:get/get.dart';

class PilihTiketController extends GetxController {
  var indexG = 0.obs;
  var indexK = 0.obs;

  void gantiGerbong(int indexGerbongTerpilih) {
    indexG.value = indexGerbongTerpilih;
    gerbong.refresh();
  }

  void reset() {
    gerbong.forEach((element) {
      element.forEach((element) {
        if (element["status"] != "Filled") {
          element.update("status", (value) => "Available");
        }
      });
    });
  }

  void pilihKursi(int indexKursiTerpilih) {
    if (gerbong[indexG.value][indexKursiTerpilih]["status"] == "Available") {
      reset();
      gerbong[indexG.value][indexKursiTerpilih]
          .update("status", (value) => "Selected");
    } else {
      gerbong[indexG.value][indexKursiTerpilih]
          .update("status", (value) => "Available");
    }

    gerbong.refresh();
  }

  var gerbong = List.generate(
    6,
    (indexGerbong) => List<Map<String, dynamic>>.generate(
      75,
      (indexKursi) {
        if (indexGerbong == 0) {
          if (indexKursi >= 24 && indexKursi <= 29 ||
              indexKursi >= 40 && indexKursi <= 44) {
            return {
              "id": "ID-${indexGerbong + 1}-${indexKursi + 1}}",
              "status": "Filled",
            };
          } else {
            return {
              "id": "ID-${indexGerbong + 1}-${indexKursi + 1}}",
              "status": "Available",
            };
          }
        } else if (indexGerbong == 1) {
          if (indexKursi >= 5 && indexKursi <= 15) {
            return {
              "id": "ID-${indexGerbong + 1}-${indexKursi + 1}}",
              "status": "Filled",
            };
          } else {
            return {
              "id": "ID-${indexGerbong + 1}-${indexKursi + 1}}",
              "status": "Available",
            };
          }
        } else {
          return {
            "id": "ID-${indexGerbong + 1}-${indexKursi + 1}}",
            "status": "Available",
          };
        }
      },
    ),
  ).obs;
}
