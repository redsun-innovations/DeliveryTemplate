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
                      _buildOrderInfoRow('Order ID', order['order_number'].toString(), Icons.receipt),
                      _buildOrderInfoRow('Status', order['status'], Icons.assignment_turned_in),
                      _buildOrderInfoRow('Delivery Boy', order['delivery_boy_name'], Icons.person),
                      _buildOrderInfoRow('Phone', order['phone_number'], Icons.phone),
                      _buildOrderInfoRow('Delivery Item', order['deliveryitem'], Icons.shopping_bag),
                      _buildOrderInfoRow('Delivery Time', order['deliverytime'], Icons.access_time),
                      _buildOrderInfoRow('Location', order['location'], Icons.location_on),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Other Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _buildCategoryBox('Food 1', 'packages/deliverytemplate/assets/images/food1.jpg', '5.99'),
                        _buildCategoryBox('Food 2', 'packages/deliverytemplate/assets/images/food2.jpg', '6.99'),
                        _buildCategoryBox('Food 3', 'packages/deliverytemplate/assets/images/food3.jpg', '7.99'),
                      ],
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

  Widget _buildOrderInfoRow(String label, String value, IconData iconData) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
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
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildCategoryBox(String name, String imageAsset, String rate) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4.0),
          Text(
            '\$$rate',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.orange,
            ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatusCircle("Ordered", Colors.orange),
        _buildStatusCircle("Preparing", Colors.orange),
        _buildStatusCircle("Out for Delivery", Colors.green),
        _buildStatusCircle("Delivered", Colors.orange),
      ],
    );
  }

  Widget _buildStatusCircle(String stage, Color color) {
    return Column(
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          stage,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
