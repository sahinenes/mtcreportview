import 'package:flutter/material.dart';
import '../../machines/model/machines_model.dart';
import '../../../../product/_variables/database.variables.dart';
import '../../statisctic_detail/view/statistics_detail_view.dart';

class MachineDetailsView extends StatelessWidget {
  final String uuid;

  const MachineDetailsView({super.key, required this.uuid});

  @override
  Widget build(BuildContext context) {
    // Find the machine by UUID
    final machine = _findMachineByUuid(uuid);

    if (machine == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Machine Not Found')),
        body: const Center(child: Text('Machine not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(machine.name ?? 'Machine Details'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard(context, machine),
              const SizedBox(height: 24),
              _buildDetailsList(machine),
              const SizedBox(height: 24),
              _buildActionButtons(context, machine),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, MachinesModel machine) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue.shade100,
              child: Icon(
                Icons.precision_manufacturing,
                size: 40,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    machine.name ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Code: ${machine.code ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Added on: ${machine.date ?? 'Unknown date'}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsList(MachinesModel machine) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Machine Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDetailItem('Location', machine.location ?? 'N/A'),
            _buildDetailItem('UUID', machine.uuid ?? 'N/A'),
            _buildDetailItem('URL', machine.url ?? 'N/A'),
            _buildDetailItem('URL', machine.imageUrl ?? 'N/A'),

            //  _buildDetailItemImage('URL', machine.imageUrl ?? ''),

            // Add more details as needed, depending on what's in your MachinesModel
            // For example:
            // _buildDetailItem('Serial Number', machine.serialNumber ?? 'N/A'),
            // _buildDetailItem('Manufacturer', machine.manufacturer ?? 'N/A'),
            // _buildDetailItem('Model', machine.model ?? 'N/A'),
            // _buildDetailItem('Installation Date', machine.installationDate ?? 'N/A'),
            // _buildDetailItem('Last Maintenance', machine.lastMaintenance ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItemImage(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          Expanded(child: Image.network(value)),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, MachinesModel machine) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.bar_chart),
          label: const Text('View Statistics'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          onPressed: () {
            // Navigate to statistics view
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => StatisticsDetailView(uuid: machine.uuid!),
              ),
            );
          },
        ),
      ],
    );
  }

  MachinesModel? _findMachineByUuid(String uuid) {
    for (final key in machinesBox.keys) {
      final machine = machinesBox.get(key);
      if (machine != null && machine.uuid == uuid) {
        return machine;
      }
    }
    return null;
  }
}
