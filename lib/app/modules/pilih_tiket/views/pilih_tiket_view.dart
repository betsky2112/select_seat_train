import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pilih_tiket_controller.dart';

class PilihTiketView extends GetView<PilihTiketController> {
  const PilihTiketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg.png"),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Select Your\nSeat",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333E63),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Commuter Line (A)",
                        ),
                        Text(
                          "Wagon 1 -3A",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF656CEE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemStatus(
                      status: "Available",
                      color: Colors.white,
                    ),
                    ItemStatus(
                      status: "Filled",
                      color: Color(0xFFFF8B2D),
                    ),
                    ItemStatus(
                      status: "Selected",
                      color: Color(0xFF656CEE),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Wagon",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "A",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "B",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "D",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "E",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Obx(
                                    () => Column(
                                      children: List.generate(
                                        controller.gerbong.length,
                                        (index) => GestureDetector(
                                          onTap: () =>
                                              controller.gantiGerbong(index),
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            height: 120,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black38),
                                              color: controller.indexG.value ==
                                                      index
                                                  ? const Color(0xFF656CEE)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text("${index + 1}"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Obx(
                                  () => GridView.builder(
                                    padding: const EdgeInsets.all(10),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 5,
                                    ),
                                    itemCount: controller
                                        .gerbong[controller.indexG.value]
                                        .length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () => controller.pilihKursi(index),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: controller.gerbong[controller
                                                          .indexG.value][index]
                                                      ["status"] ==
                                                  "Available"
                                              ? Colors.white
                                              : controller.gerbong[controller
                                                              .indexG.value]
                                                          [index]["status"] ==
                                                      "Filled"
                                                  ? const Color(0xFFFF8B2D)
                                                  : const Color(0xFF656CEE),
                                          border: Border.all(
                                            color: Colors.black38,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF656CEE),
                      foregroundColor: Colors.white,
                      fixedSize: Size(Get.width * 0.8, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("SELECT YOUR SEAT"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  const ItemStatus({
    super.key,
    required this.status,
    required this.color,
  });

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          status,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
