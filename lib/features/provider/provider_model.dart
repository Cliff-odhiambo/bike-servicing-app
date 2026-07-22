class ProviderModel {
  final String id;
  final String ownerId;
  final String shopName;
  final String businessPhone;
  final String location;
  final String experience;
  final String approvalStatus;
  final double rating;
  final int totalJobs;
  final DateTime createdAt;

  ProviderModel({
    required this.id,
    required this.ownerId,
    required this.shopName,
    required this.businessPhone,
    required this.location,
    required this.experience,
    required this.approvalStatus,
    required this.rating,
    required this.totalJobs,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerId': ownerId,
      'shopName': shopName,
      'businessPhone': businessPhone,
      'location': location,
      'experience': experience,
      'approvalStatus': approvalStatus,
      'rating': rating,
      'totalJobs': totalJobs,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      id: map['id'],
      ownerId: map['ownerId'],
      shopName: map['shopName'],
      businessPhone: map['businessPhone'],
      location: map['location'],
      experience: map['experience'],
      approvalStatus: map['approvalStatus'],
      rating: (map['rating'] as num).toDouble(),
      totalJobs: map['totalJobs'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}