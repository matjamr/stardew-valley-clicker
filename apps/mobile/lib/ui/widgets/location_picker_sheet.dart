import 'package:flutter/material.dart';
import 'package:mobile/game/model/location.dart';

class LocationPickerSheet extends StatelessWidget {
  final LocationArea current;

  const LocationPickerSheet({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          _locationTile(context, LocationArea.farm, Icons.agriculture, 'Farm'),
          _locationTile(context, LocationArea.fishing, Icons.water, 'Fishing'),
          _locationTile(context, LocationArea.barn, Icons.pets, 'Barn'),
          _locationTile(context, LocationArea.mines, Icons.landscape, 'Mines'),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  ListTile _locationTile(
    BuildContext context,
    LocationArea area,
    IconData icon,
    String title,
  ) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFFE7A0)),
      title: Text(title, style: const TextStyle(color: Color(0xFFFFE7A0))),
      selected: current == area,
      onTap: () => Navigator.of(context).pop(area),
    );
  }
}
