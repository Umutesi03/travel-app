class Destination{
  final String name;
  final String location;
  final String description;
  final String image;
  final double price;
  final double rating;
  final String category;
  final String duration;


  Destination({
  required this.name,
  required this.location,
  required this.description,
  required this.image,
  required this.price,
  required this.rating,
  required this.category,
  required this.duration
  });
}


final List<Destination> destinations = [
  Destination(
    name: "Volcanoes National Park",
    location: "Musanze, Northern Rwanda",
    description:
        "Home to the endangered mountain gorillas, Volcanoes National Park is one of Africa's most extraordinary wildlife destinations. Trek through bamboo forests to encounter gorilla families in their natural habitat. The park also features the Dian Fossey Gorilla Fund and golden monkey tracking experiences.",
    image: "assets/images/volcanoes.jpg",
    price: 1500,
    rating: 4.9,
    category: "Nature",
    duration: "2-3 Days",
  ),
  Destination(
    name: "Lake Kivu",
    location: "Rubavu, Western Rwanda",
    description:
        "Lake Kivu is one of Africa's Great Lakes, stretching along Rwanda's western border with the DRC. The lakeside city of Rubavu offers beautiful beaches, boat trips to islands, fresh fish restaurants, and stunning sunset views over the water surrounded by green hills.",
    image: "assets/images/lake_kivu.jpg",
    price: 800,
    rating: 4.7,
    category: "Lakes",
    duration: "2-4 Days",
  ),
  Destination(
    name: "Nyungwe Forest",
    location: "Rusizi, Southern Rwanda",
    description:
        "Nyungwe National Park is one of Africa's oldest and most biodiverse rainforests. Walk the famous canopy walkway suspended 70 meters above the forest floor, track chimpanzees and colobus monkeys, and explore waterfalls and tea plantations surrounding the forest.",
    image: "assets/images/nyungwe.jpg",
    price: 1200,
    rating: 4.8,
    category: "Nature",
    duration: "2-3 Days",
  ),
  Destination(
    name: "Akagera National Park",
    location: "Eastern Rwanda",
    description:
        "Akagera is Rwanda's only savanna park and home to the Big Five — lion, leopard, elephant, buffalo, and rhino. Enjoy game drives across rolling hills and lakes, boat safaris on Lake Ihema, and incredible birdwatching with over 500 species recorded in the park.",
    image: "assets/images/akagera.jpg",
    price: 1100,
    rating: 4.8,
    category: "Safari",
    duration: "2-3 Days",
  ),
  Destination(
    name: "Kigali City",
    location: "Kigali, Central Rwanda",
    description:
        "Kigali is one of Africa's cleanest, safest, and most modern capitals. Visit the Kigali Genocide Memorial, explore the vibrant Kimironko market, enjoy world-class restaurants and nightlife in Kimihurura, and experience the unique blend of Rwandan culture and modern development.",
    image: "assets/images/kigali.jpg",
    price: 600,
    rating: 4.6,
    category: "City",
    duration: "2-3 Days",
  ),
  Destination(
    name: "Lake Burera & Ruhondo",
    location: "Burera, Northern Rwanda",
    description:
        "The twin lakes of Burera and Ruhondo sit at high altitude in northern Rwanda, surrounded by dramatic volcanic mountains and terraced green hillsides. Kayaking, boat rides, and village walks offer a peaceful and authentic Rwandan countryside experience.",
    image: "assets/images/lake_burera.jpg",
    price: 700,
    rating: 4.5,
    category: "Lakes",
    duration: "1-2 Days",
  ),
  Destination(
    name: "Musanze Caves",
    location: "Musanze, Northern Rwanda",
    description:
        "The Musanze Caves are a network of underground lava tubes stretching over 2 kilometers, formed by ancient volcanic activity from the Virunga mountains. The caves hold great cultural and historical significance for Rwanda and offer a unique underground adventure experience.",
    image: "assets/images/musanze_caves.jpg",
    price: 400,
    rating: 4.4,
    category: "Adventure",
    duration: "Half Day",
  ),
  Destination(
    name: "Gishwati-Mukura Forest",
    location: "Ngororero, Western Rwanda",
    description:
        "Gishwati-Mukura is Rwanda's newest and smallest national park, formed by joining two forest fragments. It is home to chimpanzees, golden monkeys, and hundreds of bird species. The park represents Rwanda's remarkable conservation and reforestation success story.",
    image: "assets/images/gishwati.jpg",
    price: 900,
    rating: 4.5,
    category: "Nature",
    duration: "1-2 Days",
  ),
];

final List<String> categories = [
  "All",
  "Nature",
  "Safari",
  "Lakes",
  "City",
  "Adventure",
];