import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  final Color bgColor = const Color(0xFFFFF1F4); // ชมพูครีม
  final Color primaryColor = const Color(0xFFF48FB1); // ชมพูแมว

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.pets, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "สถานที่ท่องเที่ยวที่อยากไป",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PlaceCard(
          imageUrl:
              "https://i0.wp.com/flyingwhale.me/wp-content/uploads/2019/09/69739743_2709705019040532_8888561529197166592_o.jpg?resize=768%2C514&ssl=1",
          title: "เกาะอาโอชิมะ (Aoshima – Cat Island)",
          location: "จังหวัดเอฮิเมะ ประเทศญี่ปุ่น",
          rating: 4.7,
          description:
              "เกาะเล็ก ๆ ที่มีแมวอาศัยอยู่มากกว่าคน\n"
              "เดิมเป็นชุมชนชาวประมง ปัจจุบันมีประชากรน้อยมาก\n"
              "แมวถูกเลี้ยงไว้เพื่อควบคุมหนูในเรือประมง\n"
              "ไม่มีร้านค้าใหญ่หรือโรงแรมบนเกาะ\n"
              "เหมาะสำหรับคนรักแมวและการท่องเที่ยวแบบเรียบง่าย",
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final double rating;
  final String description;

  const PlaceCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// รูปภาพ + ไอคอนแมว
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.network(
                  imageUrl,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.pets,
                          size: 16, color: Colors.pinkAccent),
                      SizedBox(width: 4),
                      Text(
                        "Cat Island",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ชื่อ + Rating
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// Location
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 18, color: Colors.pinkAccent),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// รายละเอียด
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
