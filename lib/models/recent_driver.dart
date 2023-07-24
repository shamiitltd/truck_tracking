// ignore_for_file: non_constant_identifier_names

class RecentFile {
  final String name, number, status, fleet, last_location, last_known_speed;

  RecentFile(
      {required this.name,
      required this.number,
      required this.status,
      required this.fleet,
      required this.last_location,
      required this.last_known_speed});

  List demoRecentFiles = [
    RecentFile(
        name: "James",
        number: "TRUCK 24",
        status: "active",
        fleet: "East",
        last_location: "FC ROAD",
        last_known_speed: "49"),
    RecentFile(
        name: "Jack",
        number: "TRUCK 25",
        status: "active",
        fleet: "East",
        last_location: "JM ROAD",
        last_known_speed: "39"),
    RecentFile(
        name: "Greer",
        number: "TRUCK 26",
        status: "active",
        fleet: "East",
        last_location: "SINHAGAD ROAD",
        last_known_speed: "60"),
    RecentFile(
        name: "Ryan",
        number: "TRUCK 27",
        status: "active",
        fleet: "East",
        last_location: "Aundh",
        last_known_speed: "65"),
    RecentFile(
        name: "Mario",
        number: "TRUCK 28",
        status: "active",
        fleet: "East",
        last_location: "Baner",
        last_known_speed: "66"),
    RecentFile(
        name: "Steve",
        number: "TRUCK 29",
        status: "active",
        fleet: "East",
        last_location: "NH 4",
        last_known_speed: "80"),
    RecentFile(
        name: "Austin",
        number: "TRUCK 30",
        status: "active",
        fleet: "East",
        last_location: "NH 10",
        last_known_speed: "90"),
  ];
}
