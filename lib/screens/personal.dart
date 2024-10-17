import 'package:fc_hackathon_2024/screens/tier.dart';
import 'package:fc_hackathon_2024/widgets/history_card.dart';
import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'Personal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/userIcon.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Handle avatar edit
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16), // Space between avatar and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "John Doe",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        // Navigate to another page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TierPage()), // Replace 'AnotherPage()' with your target page
                        );
                      },
                      child: Row(
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Cultivator ', // Normal text
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      'tier', // "tier" styled in green and bold
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5, // Space between text and arrow
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16, // Adjust size to match text
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Email",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "johndoe@example.com",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "+01 23456789",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  HistoryCard(taskName: "Apply Fertilizer", isCompleted: true),
                  HistoryCard(
                    taskName: "Spraying Chemicals",
                    isCompleted: false,
                  ),
                  HistoryCard(taskName: "Lalang Control", isFailed: true)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// const SizedBox(height: 20),
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey[300]!),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       RichText(
//                         text: const TextSpan(
//                           text: 'About ',
//                           style: TextStyle(color: Colors.black, fontSize: 16),
//                           children: [
//                             TextSpan(
//                               text: 'John Doe',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // Handle Edit functionality
//                         },
//                         child: const Text('Edit'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Lorem ipsum dolor sit amet consectetur. Erat auctor a aliquam vel congue luctus. "
//                     "Leo diam cras neque mauris ac arcu elit ipsum dolor sit amet consectetur.",
//                     style: TextStyle(color: Colors.black54),
//                   ),
//                 ],
//               ),
//             ),