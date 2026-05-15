import '../models/location.dart';
import '../models/location_fact.dart';

class MockLocation {
  static final List<Location> items = [
    Location(
      name: "Arashiyama Bamboo Grove, Kyoto, Japan",
      url: "https://images.pexels.com/photos/37501475/pexels-photo-37501475.jpeg",
      facts: <LocationFact>[
        LocationFact(
          title: "Summary",
          text:
              "While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sights\'s pleasures extends beyond the visual realm.",
        ),
        LocationFact(
          title: "How to Get There",
          text:
              "Kyoto airport, with several terminals, is located 16 kilometers south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.",
        ),
      ],
    ),

    Location(
      name: "Mount Fuji, Japan",
      url: "https://images.pexels.com/photos/31928372/pexels-photo-31928372.jpeg",
      facts: <LocationFact>[
        LocationFact(
          title: "Summary",
          text: 
              "Mount Fuji is the tallest mountain in Japan, standing at 3,776 meters (12,389 feet). It is an active stratovolcano that last erupted in 1707. Mount Fuji is a popular destination for tourists and climbers, and it is also considered a sacred site in Japanese culture.",
        ),
      ],
    ),

    Location(
      name: "Kiyamizudera Temple, Kyoto, Japan",
      url: "https://images.pexels.com/photos/31193853/pexels-photo-31193853.jpeg",
      facts: <LocationFact>[
        LocationFact(
          title: "Summary",
          text: 
              "Kiyomizudera Temple is a historic Buddhist temple located in Kyoto, Japan. It was founded in 778 and is known for its wooden stage that offers stunning views of the city. The temple is also famous for its cherry blossoms in spring and vibrant foliage in autumn.",
        ),
      ],
    ),

    Location(
      name: "Kinkaku-ji (Golden Pavilion), Kyoto, Japan",
      url: "https://images.pexels.com/photos/31959621/pexels-photo-31959621.jpeg",
      facts: <LocationFact>[
        LocationFact(
          title: "Summary",
          text:
              "Kinkaku-ji (Golden Pavilion) is a famous Buddhist temple in Kyoto, Japan. It was built in 1397 and is covered in gold leaf, giving it a stunning appearance.",
        ),
      ],
    ),

    Location(
      name: "Odaiba, Tokyo, Japan",
      url: "https://images.pexels.com/photos/16813072/pexels-photo-16813072.jpeg",
      facts: <LocationFact>[
        LocationFact(
          title: "Summary",
          text:
              "Odaiba is a popular shopping and entertainment district located on a man-made island in Tokyo Bay, Japan. It features a variety of attractions, including shopping malls, museums, and amusement parks. Odaiba is also known for its stunning views of the Tokyo skyline and the iconic Rainbow Bridge.",  
        ),
      ],
    ),
  ]; 

  static Location fetchAny() {
    return MockLocation.items[0];
  }

  static List<Location> fetchAll() {
    return MockLocation.items;
  }
}