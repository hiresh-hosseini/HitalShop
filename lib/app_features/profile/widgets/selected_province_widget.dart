import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_data/responses/province_response.dart';

class SelectedProvinceWidget extends StatelessWidget {
  const SelectedProvinceWidget(
      {super.key, required this.provinces, required this.onSelectedProvince});

  final List<Province> provinces;

  final Function(Province province) onSelectedProvince;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: provinces.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onSelectedProvince(provinces[index]);
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(provinces[index].name ?? '')),
            ),
          );
        });
  }
}
