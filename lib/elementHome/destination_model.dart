import 'dart:math';

Random random = Random();

class Destination {
  final int? id, price, review;
  final List<String>? image;
  final String? name, description, category, location;
  final double? rate;

  Destination(
      {this.name,
      this.price,
      this.id,
      this.category,
      this.description,
      this.review,
      this.image,
      this.rate,
      this.location});
}

List<Destination> destinations = [
  Destination(
      review: random.nextInt(300) + 25,
      id: 2,
      name: "Al-Aksa",
      category: "popular",
      image: [
        "mountain/al-kods.jpg",
        "mountain/kods.jpg",
        "mountain/دعاء-اللهم-انا-نستودعك-المسجد-الأقصى-مكتوب...-780x470-1.jpg",
      ],
      price: random.nextInt(95) + 23,
      location: "Al kods, Pelastine",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4.4),
      Destination(
      id: 15,
      name: "Sidi Bousaid",
      review: random.nextInt(300) + 25,
      category: "popular",
      price: random.nextInt(95) + 23,
      image: [
        "beach/Sidi-Bou-Said.jpg",
        "beach/sidi_bous_said_tunisia.jpg",
        "beach/sidi-bou-said-902754.jpg",
        "beach/Sidi-Bou-Said-Guide.jpg",
        
      ],
      location: "Tunis, Tunisia",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4),
  Destination(
      id: 9,
      name: "Nusa Penida",
      category: 'popular',
      image: [
        "beach/nusa-penida-beach.jpg",
        "beach/nusa-penida-beach2.jpg",
        "beach/nusa-penida-beach3.jpg",
        "beach/nusa-penida-beach4.jpg",
      ],
      location: "Bali, Indonesia",
      review: random.nextInt(300) + 25,
      price: random.nextInt(95) + 23,
      description: "Lo",
      rate: 4.6),
  Destination(
      id: 7,
      price: random.nextInt(95) + 23,
      name: "Gunung Kerinci",
      image: [
        "mountain/Rome-back-small.jpeg",
        "mountain/Rome-Italy_image.jpg",
        "mountain/Rome.jpg",

      ],
      review: random.nextInt(300) + 25,
      category: "popular",
      location: "Roma , Italy",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4),
  Destination(
      id: 3,
      name: "Pink Beach",
      review: random.nextInt(300) + 25,
      price: random.nextInt(95) + 23,
      category: 'recommend',
      image: [
        "beach/pink-beach.jpg",
        "beach/pink-beach2.jpg",
        "beach/pink-beach3.jpg",
      ],
      location: "Lombok, Indonesia",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4.5),
  Destination(
      id: 8,
      name: "Gunung Rinjani",
      review: random.nextInt(300) + 25,
      price: random.nextInt(95) + 23,
      category: "popular",
      image: [
        "mountain/rinjani.jpg",
        "mountain/rinjani2.jpg",
        "mountain/rinjani3.jpg",
      ],
      location: "Lombok, Indonesia ",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4),
  Destination(
      id: 1,
      name: "Kuta Mandalika",
      review: random.nextInt(300) + 25,
      price: random.nextInt(95) + 23,
      category: 'recommend',
      image: [
        "beach/kuta-mandalika-beach.jpeg",
        "beach/kuta-mandalika-beach2.jpg",
        "beach/kuta-mandalika-beach3.jpg",
      ],
      location: "Lombok, Indonesia",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4.4),
  Destination(
      id: 12,
      name: "Gunung Lawu",
      category: "recommend",
      review: random.nextInt(300) + 25,
      price: random.nextInt(95) + 23,
      image: [
        "mountain/lawu.jpg",
        "mountain/lawu2.jpg",
        "mountain/lawu3.jpg",
      ],
      location: "Jawa Timur, Indonesia",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4.4),
  Destination(
      id: 14,
      name: "Pantai Ora",
      review: random.nextInt(300) + 25,
      category: "recommend",
      price: random.nextInt(95) + 23,
      image: [
        "beach/ora-beach.jpg",
        "beach/ora-beach2.jpg",
        "beach/ora-beach3.jpg",
      ],
      location: "Maluku, Indonesia",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4.4),
  Destination(
      id: 13,
      review: random.nextInt(300) + 25,
      price: random.nextInt(95) + 23,
      name: "Gunung Merbabu",
      category: "recommend",
      image: [
        "mountain/merbabu.jpg",
        "mountain/merbabu2.jpg",
        "mountain/merbabu3.jpg",
      ],
      location: "Jawa Tengah, Indonesia",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.",
      rate: 4.4),
];
