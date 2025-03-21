import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../machines/model/machines_model.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../product/_variables/database.variables.dart';
import '../../../../product/_widget/card/empty_card.dart';
import '../../statisctic_detail/view/statistics_detail_view.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredKeys =
        machinesBox.keys.cast<int>().where((key) {
          final model = machinesBox.get(key);
          final query = _searchQuery.toLowerCase();
          return model!.name!.toLowerCase().contains(query) ||
              model.code!.toLowerCase().contains(query) ||
              model.location!.toLowerCase().contains(query);
        }).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
                _buildSearchBar(),
                const SizedBox(height: 16),
                if (machinesBox.keys.isEmpty)
                  _buildInsightCard("Your machines list is empty"),
                if (machinesBox.keys.isNotEmpty)
                  _buildInsightCard(
                    "Your machines list is ${filteredKeys.length} showing",
                  ),
                const SizedBox(height: 16),
                _buildList(filteredKeys),
                const SizedBox(height: 80), // Space for bottom navigation
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Statistics',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search machines...',
        hintStyle: const TextStyle(
          fontFamily: 'SF Pro Display', // Matching font from the image
          color: Colors.grey,
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
      style: const TextStyle(
        fontFamily: 'SF Pro Display', // Matching font from the image
      ),
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
    );
  }

  Widget _buildInsightCard(String message) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          message,
          style: const TextStyle(
            fontFamily: 'SF Pro Display', // Matching font from the image
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<int> keys) {
    if (keys.isEmpty) return const EmmptyCardWidget();

    return ValueListenableBuilder(
      valueListenable: machinesBox.listenable(),
      builder: (context, Box<MachinesModel> box, child) {
        return Observer(
          builder: (_) {
            return Padding(
              padding: EdgeInsets.only(bottom: context.height * 0.025),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: keys.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final model = machinesBox.get(keys[index])!;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  StatisticsDetailView(uuid: model.uuid!),
                        ),
                      );
                    },
                    child: _buildStyledMachineCard(
                      name: model.name ?? "!",
                      location: model.location ?? "!",
                      code: model.code ?? "!",
                      date: model.date ?? "!",
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  // Styled version of your MachinesCardWidget that matches the UI in the image
  Widget _buildStyledMachineCard({
    required String name,
    required String location,
    required String code,
    required String date,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.precision_manufacturing,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily:
                          'SF Pro Display', // Matching font from the image
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: TextStyle(
                      fontFamily:
                          'SF Pro Display', // Matching font from the image
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  code,
                  style: const TextStyle(
                    fontFamily:
                        'SF Pro Display', // Matching font from the image
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily:
                        'SF Pro Display', // Matching font from the image
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
