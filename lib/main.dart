// import 'package:flutter/material.dart';
// import 'api_service.dart'; // Import ApiService class
// import 'order_info_widget.dart'; // Import the new file

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Swiggy Order Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: const OrderListPage(),
//     );
//   }
// }

// class OrderListPage extends StatefulWidget {
//   const OrderListPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _OrderListPageState createState() => _OrderListPageState();
// }

// class _OrderListPageState extends State<OrderListPage> {
//   List<dynamic> orders = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchOrders();
//   }

//   Future<void> fetchOrders() async {
//     try {
//       List<dynamic> fetchedOrders = await ApiService.fetchOrders();
//       setState(() {
//         orders = fetchedOrders;
//       });
//     } catch (e) {
//       print('Error fetching orders: $e');
//       // Handle error (e.g., show error message)
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Swiggy Orders'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(
//               height: 200,
//               child: Center(
//                 child: Image.asset(
//                   'packages/deliverytemplate/assets/images/delivery.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const DeliveryStatusBar(),
//             const SizedBox(height: 8),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: orders.length,
//               itemBuilder: (context, index) {
//                 var order = orders[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       buildOrderInfoRow('Order ID', order['order_number'].toString(), Icons.receipt),
//                       buildOrderInfoRow('Status', order['status'], Icons.assignment_turned_in),
//                       buildOrderInfoRow('Delivery Boy', order['delivery_boy_name'], Icons.person),
//                       buildOrderInfoRow('Phone', order['phone_number'], Icons.phone),
//                       buildOrderInfoRow('Delivery Item', order['deliveryitem'], Icons.shopping_bag),
//                       buildOrderInfoRow('Delivery Time', order['deliverytime'], Icons.access_time),
//                       buildOrderInfoRow('Location', order['location'], Icons.location_on),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 16),
//             Center(
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'You might be also intrested in ',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Wrap(
//                       spacing: 16,
//                       runSpacing: 16,
//                       children: [
//                         buildCategoryBox('Food 1', 'packages/deliverytemplate/assets/images/food1.jpg', '5.99'),
//                         buildCategoryBox('Food 2', 'packages/deliverytemplate/assets/images/food2.jpg', '6.99'),
//                         buildCategoryBox('Food 3', 'packages/deliverytemplate/assets/images/food3.jpg', '7.99'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DeliveryStatusBar extends StatelessWidget {
//   const DeliveryStatusBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Spacer(flex: 1),
//             _buildStatusCircle("Ordered", Colors.green, true),
//             _buildFlexibleLine(),
//             _buildStatusCircle("Preparing", Colors.green, true),
//             _buildFlexibleLine(),
//             _buildStatusCircle("Out for Delivery", Colors.green, true),
//             _buildFlexibleLine(),
//             _buildStatusCircle("Delivered", Colors.orange, false),
//             const Spacer(flex: 1),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const SizedBox(width: 16),
//             _buildStatusLabel("Ordered"),
//             _buildStatusLabel("Preparing"),
//             _buildStatusLabel("Out for Delivery"),
//             _buildStatusLabel("Delivered"),
//             const SizedBox(width: 16),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildStatusCircle(String stage, Color color, bool showTick) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Icon(
//           Icons.circle,
//           color: color,
//           size: 24,
//         ),
//         if (showTick)
//           const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 14,
//           ),
//       ],
//     );
//   }

//   Widget _buildStatusLabel(String stage) {
//     return Text(
//       stage,
//       style: const TextStyle(
//         color: Colors.black, // Adjust text color as needed
//         fontSize: 12,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }

//   Widget _buildFlexibleLine() {
//     return Flexible(
//       child: Container(
//         alignment: Alignment.center,
//         child: Container(
//            // Adjust the margin to move the line upwards
//           height: 2, // Adjust the height as needed
//           color: Colors.green, // Adjust the color as needed
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'api_service.dart'; // Import ApiService class
 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiggy Order Tracker',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const OrderListPage(),
    );
  }
}

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  List<dynamic> orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      List<dynamic> fetchedOrders = await ApiService.fetchOrders();
      setState(() {
        orders = fetchedOrders;
      });
    } catch (e) {
    
      // Handle error (e.g., show error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swiggy Orders'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Image.asset(
                  'packages/deliverytemplate/assets/images/delivery.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const DeliveryStatusBar(),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                var order = orders[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildOrderInfoRow('Order ID', order['order_number'].toString(), Icons.receipt),
                      buildOrderInfoRow('Status', order['status'], Icons.assignment_turned_in),
                      buildOrderInfoRow('Delivery Boy', order['delivery_boy_name'], Icons.person),
                      buildOrderInfoRow('Phone', order['phone_number'], Icons.phone),
                      buildOrderInfoRow('Delivery Item', order['deliveryitem'], Icons.shopping_bag),
                      buildOrderInfoRow('Delivery Time', order['deliverytime'], Icons.access_time),
                      buildOrderInfoRow('Location', order['location'], Icons.location_on),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'You might also be interested in ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildCategoryBox('Food 1', 'packages/deliverytemplate/assets/images/food1.jpg', '5.99'),
                          buildCategoryBox('Food 2', 'packages/deliverytemplate/assets/images/food2.jpg', '6.99'),
                          buildCategoryBox('Food 3', 'packages/deliverytemplate/assets/images/food3.jpg', '7.99'),
                          buildCategoryBox('Food 4', 'packages/deliverytemplate/assets/images/food4.jpg', '8.99'),
                          buildCategoryBox('Food 5', 'packages/deliverytemplate/assets/images/food5.jpg', '9.99'),
                          buildCategoryBox('Food 6', 'packages/deliverytemplate/assets/images/food6.jpg', '10.99'),
                        ].map((box) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: box,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildOrderInfoRow(String label, String value, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                size: 24,
                color: Colors.orange,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryBox(String title, String imagePath, String price) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart, color: Colors.orange),
                onPressed: () {
                  // Add to cart functionality here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeliveryStatusBar extends StatelessWidget {
  const DeliveryStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            _buildStatusCircle("Ordered", Colors.green, true),
            _buildFlexibleLine(),
            _buildStatusCircle("Preparing", Colors.green, true),
            _buildFlexibleLine(),
            _buildStatusCircle("Out for Delivery", Colors.green, true),
            _buildFlexibleLine(),
            _buildStatusCircle("Delivered", Colors.orange, false),
            const Spacer(flex: 1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 16),
            _buildStatusLabel("Ordered"),
            _buildStatusLabel("Preparing"),
            _buildStatusLabel("Out for Delivery"),
            _buildStatusLabel("Delivered"),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusCircle(String stage, Color color, bool showTick) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: 24,
        ),
        if (showTick)
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 14,
          ),
      ],
    );
  }

  Widget _buildStatusLabel(String stage) {
    return Text(
      stage,
      style: const TextStyle(
        color: Colors.black, // Adjust text color as needed
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildFlexibleLine() {
    return Flexible(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          height: 2, // Adjust the height as needed
          color: Colors.green, // Adjust the color as needed
        ),
      ),
    );
  }
}


