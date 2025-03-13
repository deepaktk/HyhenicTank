import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hygienic_tank/models/list_of_pending_work_response.dart';

class CompletedWorkDetailScreen extends StatelessWidget {
  final CompletedWork work;

  const CompletedWorkDetailScreen({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Details - ${work.workId}'),
      ),
      body: SingleChildScrollView(
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
                _buildDetailRow("Work Date", DateFormat('yyyy-MM-dd').format(work.workDate)),
                _buildDetailRow("Total Amount", "\₹ ${work.totalAmount}"),
                _buildDetailRow("Payment Status", work.paymentStatus.toString()),
                _buildDetailRow("Tank Type", work.tankType.toString()),
                _buildDetailRow("Tank Name", work.tankName),
                _buildDetailRow("Tank Volume", "${work.tankVolume} Liters"),
                _buildDetailRow("Address", work.address.toString()),
                _buildDetailRow("Landmark", work.landmark.toString()),
                _buildDetailRow("Location", work.location.toString()),
                _buildDetailRow("Completion Date", work.completionDate.isEmpty ? "N/A" : work.completionDate),
                _buildDetailRow("Remarks", work.remarks.isEmpty ? "No remarks" : work.remarks),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
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
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
