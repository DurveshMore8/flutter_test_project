import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/01/services/floor_service.dart';
import 'package:flutter_test_project/features/01/widgets/input_field.dart';
import 'package:flutter_test_project/features/01/widgets/snackbar.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final FloorService floorService = FloorService();

  final buildingsController = TextEditingController();
  final floorsController = TextEditingController();
  final parcelsController = TextEditingController();
  final locationController = TextEditingController();
  int distance = 0;

  void handleCalculateClick() {
    List<Map<String, dynamic>> locations = floorService.sortLocations(
      locationController.text,
    );

    if (int.parse(parcelsController.text) != locations.length) {
      showSnackBar(context, 'Parcels should match with locations count.');
    }

    distance = floorService.calculateDistance(
      buildings: int.parse(buildingsController.text),
      floors: int.parse(floorsController.text),
      parcels: int.parse(parcelsController.text),
      locations: locations,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Screen',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(
              controller: buildingsController,
              label: 'No of buildings',
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: floorsController,
              label: 'No of floors',
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: parcelsController,
              label: 'No of parcels',
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: locationController,
              label: 'Locations',
              inputType: TextInputType.text,
              hintText: '1-2, 2-1, 2-4, 3-3',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: handleCalculateClick,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Calculate Distance',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
            if (distance != 0)
              Text(
                'Delivery boy needs to travel $distance units.',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
