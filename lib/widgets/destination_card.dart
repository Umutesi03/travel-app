import 'package:flutter/material.dart';
import '../data/travel_data.dart';

class DestinationCard extends StatefulWidget {
  final Destination destination;
  final VoidCallback onTap;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Destination Image
              Positioned.fill(
                child: Image.asset(
                  widget.destination.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF1B5E20),
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Green Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.75),
                      ],
                    ),
                  ),
                ),
              ),

              // Category Badge
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20).withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.destination.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Favorite Icon
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),

              // Bottom Info
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Destination Name
                      Text(
                        widget.destination.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      // Location Row
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xFF81C784),
                            size: 12,
                          ),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              widget.destination.location,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Rating and Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rating
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 13,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                widget.destination.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          // Price
                          Text(
                            "\$${widget.destination.price.toInt()}",
                            style: const TextStyle(
                              color: Color(0xFF81C784),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
