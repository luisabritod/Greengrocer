import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/services/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({super.key, required this.order});

  final OrdersModel order;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //title
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pix payment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //qr code
                QrImageView(
                  data: 'https://pub.dev/packages/qr_flutter',
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                //expiration date
                Text(
                  'Expires in: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),

                //total
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Total: ${utilsServices.priceToCurrency(order.total)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //copy and paste button
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                      color: CustomColors.primaryGreen,
                    ),
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Copy PIX',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  icon: Icon(
                    Icons.copy,
                    color: CustomColors.primaryGreen,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
