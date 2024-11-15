import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_data/responses/province_response.dart';

class SelectedCityWidget extends StatelessWidget {
  const SelectedCityWidget(
      {super.key, required this.cities, required this.onSelectedCity});

  final List<City> cities;

  final Function(City city) onSelectedCity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onSelectedCity(cities[index]);
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
              child: Center(child: Text(cities[index].name ?? '')),
            ),
          );
        });
  }
}
