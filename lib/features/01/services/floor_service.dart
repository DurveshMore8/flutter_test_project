class FloorService {
  int calculateDistance({
    required int buildings,
    required int floors,
    required int parcels,
    required List<Map<String, dynamic>> locations,
  }) {
    int distance = 0;

    for (int i = 0; i < locations.length; i++) {
      Map<String, dynamic> location = locations[i];

      bool isNextSameBuilding = false;

      // check if next building exist or not
      if (locations.length - 1 != i) {
        // if next parcel is same build then true else false
        isNextSameBuilding =
            location['building'] == locations[i + 1]['building'];
      }

      if (isNextSameBuilding) {
        // if next parcel is on same building
        distance += (location['floor'] as int);

        if (locations.length - 2 > i) {
          distance += 1;
        }
        continue;
      } else {
        // if next parcel is not on same building
        distance += location['building'] as int;

        distance += ((location['floor'] as int) * 2) - (i);
      }
    }

    // return distance from last building to security gate
    distance += (locations.last['building'] as int);

    return distance;
  }

  List<Map<String, dynamic>> sortLocations(String locations) {
    List<String> pairs = locations.split(', ');

    List<Map<String, dynamic>> buildingFloorList = pairs.map((pair) {
      List<String> parts = pair.split('-');
      return {
        'building': int.parse(parts[0].trim()),
        'floor': int.parse(parts[1].trim())
      };
    }).toList();

    buildingFloorList.sort((a, b) {
      int buildingComparison = a['building'].compareTo(b['building']);
      if (buildingComparison != 0) {
        return buildingComparison;
      } else {
        return a['floor'].compareTo(b['floor']);
      }
    });

    return buildingFloorList;
  }
}
