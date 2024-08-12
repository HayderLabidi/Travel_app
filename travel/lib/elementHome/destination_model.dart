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
      id: 2,
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
      description:
          "Nusa Penida adalah sebuah pulau kecil yang berada sebelah tenggara pulau Bali, dan terpisah oleh selat Badung. Di dekat pulau ini, trdapat 2 pulau kecil lain, yaitu pulau Nusa Lembangan da pulau Nusa Ceningan",
      rate: 4.6),
  Destination(
      id: 7,
      price: random.nextInt(95) + 23,
      name: "Gunung Kerinci",
      image: [
        "mountain/kerinci.jpeg",
        "mountain/kerinci2.jpg",
        "mountain/kerinci3.jpg",
        "mountain/kerinci4.jpg",
      ],
      review: random.nextInt(300) + 25,
      category: "popular",
      location: "Jambi, Indonesia",
      description:
          "Gunung Kerinci (juga dieja 'Kerintji', dan dikenal sebagai Gunung Gadang, Merapi) adalah gunung tertinggi di Sumatra, gunung berapi tertinggi di Indonesia, dan puncak tertinggi di Indonesia di luar Papua. Gunung Kerinci terletak tepat di perbatasan antara Provinsi Sumatera Barat dengan Provinsi Jambi, di Pegunungan Bukit Barisan, dekat pantai barat, dan terletak sekitar 130 km sebelah selatan Padang Provinsi Sumatra Barat. Gunung ini juga menjadi batas antara wilayah Etnis Minangkabau dengan Suku Kerinci yang dikelilingi hutan lebat Taman Nasional Kerinci Seblat dan merupakan habitat harimau sumatra dan badak sumatra.",
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
          "Pantai Tangsi atau yang lebih dikenal dengan Pantai Pink dari Pulau Lombok terletak di desa Sekaroh, kecamatan Jerowaru, kabupaten Lombok Timur adalah sebuah destinasi wisatawan yang menarik dan patut untuk dikunjungi karena keunikannya.[1][2] Pantai ini merupakan salah satu dari tujuh pantai di dunia yang memiliki pasir pantai berwarna pink, dan satu dari dua pantai di Indonesia yang memiliki pasir pantai berwarna pink.",
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
          "Gunung Rinjani adalah gunung yang berlokasi di Pulau Lombok, Nusa Tenggara Barat. Gunung yang merupakan gunung berapi kedua tertinggi di Indonesia dengan ketinggian 3.726 mdpl serta terletak pada lintang 8º25' LS dan 116º28' BT ini merupakan gunung favorit bagi pendaki Indonesia karena keindahan pemandangannya. Gunung ini merupakan bagian dari Taman Nasional Gunung Rinjani yang memiliki luas sekitar 41.330 ha dan ini akan diusulkan penambahannya sehingga menjadi 76.000 ha ke arah barat dan timur.",
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
          "The Mandalika Project covers 1,175 hectares of coastal land in Kuta, South Lombok, and will, when complete, be home to more than 16,000 hotel rooms, a waterpark, a 27-hole golf course, 1,500 villas, and an international-standard motor-racing circuit. The estimated cost of the venture is believed to exceed US\$3 billion.",
      rate: 4.4),
  Destination(
      id: 9,
      name: "Gunung Semeru",
      review: random.nextInt(300) + 25,
      category: "popular",
      price: random.nextInt(95) + 23,
      image: [
        "mountain/semeru.jpg",
        "mountain/semeru2.jpg",
        "mountain/semeru3.jpg",
        "mountain/semeru4.jpg",
      ],
      location: "Jawa Timur, Indonesia",
      description:
          "Semeru, or Mount Semeru (Indonesian: Gunung Semeru), is an active volcano in East Java, Indonesia. It is located in a subduction zone, where the Indo-Australian plate subducts under the Eurasia plate. It is the highest mountain on the island of Java. The name 'Semeru' is derived from Meru, the central world mountain in Hinduism, or Sumeru, the abode of gods. This stratovolcano is also known as Mahameru, meaning 'The Great Mountain' in Sanskrit.",
      rate: 4),
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
          "Gunung Lawu (Hanacaraka:ꦒꦸꦤꦸꦁ​ꦭꦮꦸ) (3.265 MDPL) terletak di Pulau Jawa, Indonesia, tepatnya di perbatasan Provinsi Jawa Tengah dan Jawa Timur. Gunung Lawu terletak di antara tiga kabupaten yaitu Kabupaten Karanganyar, Jawa Tengah, Kabupaten Ngawi, dan Kabupaten Magetan, Jawa Timur. Status gunung ini adalah gunung api 'istirahat' (diperkirakan terakhir meletus pada tanggal 28 November 1885) dan telah lama tidak aktif, terlihat dari rapatnya vegetasi serta puncaknya yang tererosi. Di lerengnya terdapat kepundan kecil yang masih mengeluarkan uap air (fumarol) dan belerang (solfatara). Gunung Lawu mempunyai kawasan hutan Dipterokarp Bukit, hutan Dipterokarp Atas, hutan Montane, dan hutan Ericaceous. Gunung Lawu adalah sumber inspirasi dari nama kereta api Argo Lawu, kereta api eksekutif yang melayani Solo Balapan-Gambir.",
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
          "Indonesia Timur merupakan bagian Indonesia yang memiliki banyak pilihan untuk berwisata pantai. Banyak destinasi yang bisa dieksplor di wilayah ini salah satunya adalah Pantai Ora. Pantai yang terletak di pulau Seram, Kecamatan Seram Utara, Kabupaten Maluku Tengah ini memiliki keindahan pantai yang menakjubkan didukung dengan pasir putih bersih dan laut berwarna biru kehijauan yang jernih, bahkan kamu bisa melihat indahnya terumbu karang dari jarak yang tidak jauh dari permukaan.\nDengan keindahan bawah laut yang dihadirkan di Pantai Ora, tidak heran jika tempat ini menjadi lokasi yang tepat untuk snorkeling dan diving, karena hanya menyelam sedalam 2-3 meter, kamu sudah bisa menikmati terumbu karang dan ikan berwarna warni. Sering disebut sebagai Maldives versi Indonesia, pantai ini memang memiliki sensasi yang sama layaknya kamu berada di Maladewa karena pantai ini juga menyediakan cottage indah yang dibangun persis di atas permukaan laut, lho!",
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
          "Gunung Merbabu (Hanacaraka:ꦒꦸꦤꦸꦁ​ꦩꦼꦂꦧꦧꦸ) adalah gunung api yang bertipe Strato (lihat Gunung Berapi) yang terletak secara geografis pada 7,5° LS dan 110,4° BT. Secara administratif gunung ini berada di wilayah Kabupaten Magelang di lereng sebelah barat dan Kabupaten Boyolali di lereng sebelah timur dan selatan, Kabupaten Semarang di lereng sebelah utara, Provinsi Jawa Tengah.\nGunung Merbabu dikenal melalui naskah-naskah masa pra-Islam sebagai Gunung Damalung atau Gunung Pam(a)rihan. Di lerengnya pernah terdapat pertapaan terkenal dan pernah disinggahi oleh Bujangga Manik pada abad ke-15. Menurut etimologi, 'merbabu' berasal dari gabungan kata 'meru' (gunung) dan 'abu' (abu). Nama ini baru muncul pada catatan-catatan Belanda.",
      rate: 4.4),
  Destination(
      review: random.nextInt(300) + 25,
      id: 15,
      name: "Pantai Togean",
      category: "popular",
      image: [
        "beach/togean-beach.jpg",
        "beach/togean-beach2.jpg",
        "beach/togean-beach3.jpg",
      ],
      price: random.nextInt(95) + 23,
      location: "Sulawesi Utara, Indonesia",
      description:
          "Tomini Bay merupakan teluk terbesar yang ada di Indonesia yang memiliki luas 6.000.000 hektar dan memiliki 90 pulau dengan keindahannya. Tomini Bay yang terletak di Sulawesi Utara ini bisa menjadi salah satu pilihan untuk kamu yang ini menikmati pilihan pantai dengan hamparan pasir putih dan laut biru yang jernih. Kamu bisa melihat keindahan terumbu karang langsung dari daratan bagaikan kaca, bahkan jika kamu melihat foto-foto kapal di Tomini Bay, kapal tersebut bagaikan melayang saking jernihnya air laut.\nTempat ini juga merupakan destinasi pantai di Indonesia yang tepat untuk kamu yang hobi snorkeling atau diving karena Tomini Bay terkenal memiliki keindahan bawah laut yang menakjubkan, kamu juga bisa melihat ikan-ikan kecil yang indah walau belum menyelam karena jernihnya air laut. Ada setidaknya 200 diving spot yang bisa menjadi pilihan. Kamu juga bisa menemukan 3 jenis biota laut yang hanya ada 3 di Gorontalo di antaranya adalah Karang Salvador Dali dan Kipas Laut Biru.",
      rate: 4.4),
];
