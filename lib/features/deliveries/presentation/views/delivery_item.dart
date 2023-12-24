import 'package:flutter/material.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryItem extends StatelessWidget {
  final DeliveryEntity delivery;

  const DeliveryItem({
    super.key,
    required this.delivery,
  });

  Future<void> _showCodeInputDialog(BuildContext context) async {
    String enteredCode = ''; // Variable to store the entered code
    return showDialog(
      context: context,
      barrierDismissible: true, // Dialog can be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close), // Close icon
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              const Text('کد تحویل مرسوله را وارد کنید'), // Dialog title
            ],
          ), // Dialog title
          content: TextFormField(
            maxLength: 4, // Allowing only 4 characters
            keyboardType: TextInputType.number, // Numeric keyboard
            onChanged: (value) {
              enteredCode = value; // Store the entered code
            },
            decoration: const InputDecoration(
              hintText: '0000', // Placeholder text
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle the confirm button press
                if (enteredCode.length == 4) {
                  // If the entered code is 4 characters
                  // You can add your logic here, e.g., validate the code
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  // Show an error or prompt the user to enter a valid code
                }
              },
              child: const Text('تایید'), // Confirm button text
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.white,
        elevation: 5,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            delivery.receiverName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF31569A)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${delivery.city}, ${delivery.region}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            delivery.address,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          final url = 'tel:${delivery.receiverPhone}';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        _showCodeInputDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF31569A),
                        onPrimary: Colors.white,
                      ),
                      child: const Text('تحویل'),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: delivery.isCod ? Colors.red : Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: delivery.isCod ? Colors.red : Colors.grey,
                ),
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  'COD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
