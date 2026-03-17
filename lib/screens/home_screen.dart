import 'package:flutter/material.dart';
import '../data/travel_data.dart';
import '../widgets/destination_card.dart';
import 'detail_screen.dart';

/// HomeScreen displays a filterable grid of Rwandan travel destinations.
/// Users can browse by category and navigate to destination detail pages.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tracks the currently selected category filter
  String _selectedCategory = 'All';

  static const _primaryGreen = Color(0xFF1B5E20);
  static const _scaffoldBg = Color(0xFFF9FBF9);
  static const _darkText = Color(0xFF1A1A1A);

  /// Returns the filtered list of destinations based on [_selectedCategory].
  List<Destination> get _filteredDestinations {
    if (_selectedCategory == 'All') return destinations;
    return destinations
        .where((d) => d.category == _selectedCategory)
        .toList();
  }

  void _onCategorySelected(String category) {
    setState(() => _selectedCategory = category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _scaffoldBg,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          _buildCategoryFilter(),
          _buildResultsHeader(),
          const SizedBox(height: 10),
          Expanded(child: _buildDestinationsGrid()),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visit Rwanda 🇷🇼',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Discover the Land of a Thousand Hills',
            style: TextStyle(
              fontSize: 11,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: _primaryGreen,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search destinations in Rwanda...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: _primaryGreen),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return _CategoryChip(
              label: category,
              isSelected: category == _selectedCategory,
              onTap: () => _onCategorySelected(category),
            );
          },
        ),
      ),
    );
  }

  Widget _buildResultsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_filteredDestinations.length} Destinations Found',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _darkText,
            ),
          ),
          const Icon(Icons.tune, color: _primaryGreen),
        ],
      ),
    );
  }

  Widget _buildDestinationsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemCount: _filteredDestinations.length,
      itemBuilder: (context, index) {
        final destination = _filteredDestinations[index];
        return DestinationCard(
          destination: destination,
          onTap: () => _navigateToDetail(destination),
        );
      },
    );
  }

  void _navigateToDetail(Destination destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(destination: destination),
      ),
    );
  }
}

/// A single tappable category filter chip.
class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static const _primaryGreen = Color(0xFF1B5E20);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _primaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _primaryGreen),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: _primaryGreen.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : _primaryGreen,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}