class RequestModel {
  final String id;
  final String riderId;
  final String providerId;

  final String serviceType;
  final String bikeType;
  final String issueDescription;
  final String pickupLocation;

  final String status;

  final double estimatedPrice;

  final DateTime createdAt;
  final DateTime? acceptedAt;
  final DateTime? completedAt;

  final DateTime preferredDateTime;

  RequestModel({
    required this.id,
    required this.riderId,
    required this.providerId,
    required this.serviceType,
    required this.bikeType,
    required this.issueDescription,
    required this.pickupLocation,
    required this.status,
    required this.estimatedPrice,
    required this.createdAt,
    this.acceptedAt,
    this.completedAt,
    required this.preferredDateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "riderId": riderId,
      "providerId": providerId,
      "serviceType": serviceType,
      "bikeType": bikeType,
      "issueDescription": issueDescription,
      "pickupLocation": pickupLocation,
      "status": status,
      "estimatedPrice": estimatedPrice,
      "preferredDateTime": preferredDateTime.toIso8601String(),
      "createdAt": createdAt.toIso8601String(),
      "acceptedAt": acceptedAt?.toIso8601String(),
      "completedAt": completedAt?.toIso8601String(),
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map["id"] ?? "",
      riderId: map["riderId"] ?? "",
      providerId: map["providerId"] ?? "",
      serviceType: map["serviceType"] ?? "",
      bikeType: map["bikeType"] ?? "",
      issueDescription: map["issueDescription"] ?? "",
      pickupLocation: map["pickupLocation"] ?? "",
      status: map["status"] ?? "",
      estimatedPrice: (map["estimatedPrice"] as num?)?.toDouble() ?? 0,
      preferredDateTime: map["preferredDateTime"] != null
          ? DateTime.parse(map["preferredDateTime"])
          : DateTime.now(),
      createdAt: DateTime.parse(map["createdAt"]),
      acceptedAt: map["acceptedAt"] != null
          ? DateTime.parse(map["acceptedAt"])
          : null,
      completedAt: map["completedAt"] != null
          ? DateTime.parse(map["completedAt"])
          : null,
    );
  }
}