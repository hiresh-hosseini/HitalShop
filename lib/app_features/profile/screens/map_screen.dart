import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:shop/app_core/widgets/appbar_widget.dart';
import 'package:shop/app_core/widgets/button_widget.dart';
import 'package:shop/app_features/profile/controllers/map_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.onSelected});
  final Function(String latlong) onSelected;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopMapController>(
        init: ShopMapController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const AppbarWidget(title: 'انتخاب آدرس روی نقشه'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FlutterMap(
                          mapController: controller.mapController,
                          options: MapOptions(
                            initialCenter: const LatLng(35.7077402,
                                51.1828476), // Center the map over London
                            initialZoom: 9.2,
                            onTap: (tapPosition, point) {
                              controller.addMarkerAtPosition(point);
                              controller.selectedLocation = point;
                            },
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                            ),
                            MarkerLayer(
                              markers: controller.markers,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                    child: ButtonWidget(
                      text: 'ثبت موقعیت مکانی',
                      onPressed: () {
                        onSelected(
                          '${controller.selectedLocation.latitude}, ${controller.selectedLocation.longitude}',
                        );
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
