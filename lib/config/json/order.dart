class Order {
  final String id;
  final String address;
  final String status;
  final String aadhar;
  final String pan;
  final String driversLicense;
  final String name;
  final String vehicleType;
  final String packageType;
  double latitude;
  double longitude;

  Order({
    required this.id,
    required this.address,
    required this.status,
    required this.aadhar,
    required this.pan,
    required this.driversLicense,
    required this.name,
    required this.vehicleType,
    required this.packageType,
    required this.latitude,
    required this.longitude,
  });
}