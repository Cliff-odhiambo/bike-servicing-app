import 'package:flutter/material.dart';

class MechanicCard extends StatelessWidget {
  final String shopName;
  final String location;
  final double rating;
  final String distance;
  final VoidCallback? onTap;

  const MechanicCard({
    super.key,
    required this.shopName,
    required this.location,
    required this.rating,
    required this.distance,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [

          Row(
            children: [

              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.pedal_bike,
                  size: 38,
                  color: Color(0xFF2F80ED),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      shopName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 18,
                        ),

                        const SizedBox(width: 4),

                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(width: 18),

                        const Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.red,
                        ),

                        const SizedBox(width: 4),

                        Text(distance),

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F80ED),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Book Service",
              ),
            ),
          ),

        ],
      ),
    );
  }
}