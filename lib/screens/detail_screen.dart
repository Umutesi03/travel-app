import 'package:flutter/material.dart';
import '../data/travel_data.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;

  const DetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image with Back Button
            Stack(
              children: [
                // Large Header Image
                SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: Image.asset(
                    destination.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF1B5E20),
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Gradient Overlay
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),

                // Back Button
                Positioned(
                  top: 45,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF1B5E20),
                        size: 22,
                      ),
                    ),
                  ),
                ),

                // Favorite Button
                Positioned(
                  top: 45,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 22,
                    ),
                  ),
                ),

                // Duration Badge
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B5E20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          destination.duration,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Category Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          destination.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B5E20).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF1B5E20)),
                        ),
                        child: Text(
                          destination.category,
                          style: const TextStyle(
                            color: Color(0xFF1B5E20),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFF1B5E20),
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        destination.location,
                        style: const TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Rating Row
                  RatingWidget(rating: destination.rating),

                  const SizedBox(height: 20),

                  // Divider
                  const Divider(color: Color(0xFFE0E0E0)),

                  const SizedBox(height: 16),

                  // About Section
                  const Text(
                    "About This Place",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    destination.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF555555),
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Highlights Section
                  const Text(
                    "Highlights",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Highlight Items
                  HighlightItem(
                    icon: Icons.nature,
                    label: "Stunning Green Landscapes",
                  ),
                  HighlightItem(
                    icon: Icons.camera_alt,
                    label: "Perfect for Photography",
                  ),
                  HighlightItem(
                    icon: Icons.directions_walk,
                    label: "Guided Tours Available",
                  ),
                  HighlightItem(
                    icon: Icons.hotel,
                    label: "Nearby Accommodation",
                  ),

                  const SizedBox(height: 24),

                  // Price Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B5E20).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF1B5E20).withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Starting From",
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "\$${destination.price.toInt()}",
                              style: const TextStyle(
                                color: Color(0xFF1B5E20),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "per person",
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Duration",
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              destination.duration,
                              style: const TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Book Now Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookingScreen(destination: destination),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5E20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        shadowColor: const Color(0xFF1B5E20).withOpacity(0.5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.book_online, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Book Now",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Rating Widget
class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Stars
        Row(
          children: List.generate(5, (index) {
            if (index < rating.floor()) {
              return const Icon(Icons.star, color: Colors.amber, size: 20);
            } else if (index < rating) {
              return const Icon(Icons.star_half, color: Colors.amber, size: 20);
            } else {
              return const Icon(
                Icons.star_border,
                color: Colors.amber,
                size: 20,
              );
            }
          }),
        ),
        const SizedBox(width: 8),
        Text(
          "$rating / 5.0",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "(128 reviews)",
          style: TextStyle(fontSize: 13, color: Color(0xFF757575)),
        ),
      ],
    );
  }
}

// Custom Highlight Item Widget
class HighlightItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const HighlightItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1B5E20).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF1B5E20), size: 18),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF555555)),
          ),
        ],
      ),
    );
  }
}
