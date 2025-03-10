import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hygienic_tank/models/list_of_pending_work_response.dart';

class WorkDetailScreen extends StatelessWidget {
  final CompletedWork work;

  const WorkDetailScreen({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Details - ${work.workId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow("Work ID", work.workId),
                _buildDetailRow("Work Date",
                    DateFormat('yyyy-MM-dd').format(work.workDate)),
                _buildDetailRow("Total Amount", "₹ : ${work.totalAmount}"),
                _buildDetailRow(
                    "Payment Status", work.paymentStatus.toString()),
                _buildDetailRow("Tank Type", work.tankType.toString()),
                _buildDetailRow("Address", work.address.toString()),
                _buildDetailRow("Landmark", work.landmark.toString()),
                _buildDetailRow("Location", work.location.toString()),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
