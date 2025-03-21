import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../product/_variables/database.variables.dart';
import '../../machines/model/machines_model.dart';

class StatisticsDetailView extends StatefulWidget {
  final String uuid;

  const StatisticsDetailView({super.key, required this.uuid});

  @override
  State<StatisticsDetailView> createState() => _StatisticsDetailViewState();
}

class _StatisticsDetailViewState extends State<StatisticsDetailView> {
  int _chartType = 0; // 0: bar, 1: line, 2: stacked bar
  DateTime? _selectedDate;

  String? _selectedDataName; // For filtering by dataName

  // Ekran boyutuna göre font boyutu hesapla
  double _getResponsiveFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 400) {
      return 12; // Küçük ekranlar için
    } else if (width < 600) {
      return 14; // Orta boy ekranlar için
    } else {
      return 16; // Büyük ekranlar için
    }
  }

  // Ayrıntılı bilgi gösteren dialog
  void _showDetailsDialog(BuildContext context, dynamic stat) {
    final successRate = (stat.ok ?? 0) / ((stat.total ?? 1)) * 100;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            stat.dataName ?? "-",
            style: TextStyle(
              fontSize: _getResponsiveFontSize(context) + 4,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date: ${stat.date ?? '-'}",
                style: TextStyle(fontSize: _getResponsiveFontSize(context)),
              ),
              const SizedBox(height: 8),
              Text(
                "Success Rate: ${successRate.toStringAsFixed(1)}%",
                style: TextStyle(fontSize: _getResponsiveFontSize(context)),
              ),
              const SizedBox(height: 16),
              // Modified Pie Chart with center success rate
              SizedBox(
                height: 200, // Grafik yüksekliği
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: (stat.ok ?? 0).toDouble(),
                            color: Colors.green,
                            title: "", // Removed text overlay
                            radius: 60,
                          ),
                          PieChartSectionData(
                            value: (stat.nok ?? 0).toDouble(),
                            color: Colors.red,
                            title: "", // Removed text overlay
                            radius: 60,
                          ),
                        ],
                        centerSpaceRadius: 40, // Ortadaki boşluk
                        sectionsSpace: 2, // Dilimler arası boşluk
                      ),
                    ),
                    // Success rate in center
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${successRate.toStringAsFixed(1)}%",
                          style: TextStyle(
                            fontSize: _getResponsiveFontSize(context) + 4,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Success",
                          style: TextStyle(
                            fontSize: _getResponsiveFontSize(context) - 2,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "OK: ${stat.ok}",
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context),
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "NOK: ${stat.nok}",
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context),
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total: ${stat.total}",
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context),
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Show dataName filter dialog
  void _showDataNameFilterDialog(BuildContext context, List<String> dataNames) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Filter by Data Name",
            style: TextStyle(
              fontSize: _getResponsiveFontSize(context) + 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text("All Data"),
                  selected: _selectedDataName == null,
                  onTap: () {
                    setState(() => _selectedDataName = null);
                    Navigator.pop(context);
                  },
                ),
                ...dataNames.map(
                  (name) => ListTile(
                    title: Text(name),
                    selected: _selectedDataName == name,
                    onTap: () {
                      setState(() => _selectedDataName = name);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final statsRaw =
        statisticsBox.values
            .where((element) => element.uuid == widget.uuid)
            .toList();

    // Apply date filter
    final statsDateFiltered =
        statsRaw
            .where(
              (e) =>
                  _selectedDate == null ||
                  e.date == DateFormat('yyyy-MM-dd').format(_selectedDate!),
            )
            .toList();

    // Apply dataName filter
    final stats =
        statsDateFiltered
            .where(
              (e) =>
                  _selectedDataName == null || e.dataName == _selectedDataName,
            )
            .toList()
          ..sort((a, b) => (a.dataIndex ?? '').compareTo(b.dataIndex ?? ''));

    // Get unique dataNames for filter
    final availableDataNames =
        statsDateFiltered
            .map((e) => e.dataName)
            .where((name) => name != null)
            .toSet()
            .toList()
            .cast<String>();

    final machine = machinesBox.values.firstWhere(
      (element) => element.uuid == widget.uuid,
      orElse: () => MachinesModel(),
    );

    final totalOk = stats.fold<int>(0, (sum, e) => sum + (e.ok ?? 0));
    final totalNok = stats.fold<int>(0, (sum, e) => sum + (e.nok ?? 0));
    final totalCount = stats.fold<int>(0, (sum, e) => sum + (e.total ?? 0));

    // Responsive font boyutları
    final double titleFontSize = _getResponsiveFontSize(context) + 4;
    final double subtitleFontSize = _getResponsiveFontSize(context);
    final double bodyFontSize = _getResponsiveFontSize(context) - 2;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Statistics",
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Filter by dataName button
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.filter_list, color: Colors.black54),
                if (_selectedDataName != null)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed:
                () => _showDataNameFilterDialog(context, availableDataNames),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black54,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  _selectedDate != null
                      ? DateFormat('MMMM').format(_selectedDate!)
                      : DateFormat('MMMM').format(DateTime.now()),
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  ),
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() => _selectedDate = picked);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body:
          stats.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No statistics found",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_selectedDataName != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Current filter: $_selectedDataName",
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.filter_alt_off),
                      label: const Text("Clear Filters"),
                      onPressed: () {
                        setState(() {
                          _selectedDataName = null;
                          _selectedDate = null;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Current filter indicator
                      if (_selectedDataName != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.filter_list,
                                size: 16,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Filtered by: $_selectedDataName",
                                  style: TextStyle(
                                    fontSize: bodyFontSize,
                                    color: Colors.blue[800],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() => _selectedDataName = null);
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Top summary cards
                      Row(
                        children: [
                          _buildStatCard(
                            icon: Icons.check_circle,
                            iconColor: Colors.green,
                            title: "$totalOk",
                            subtitle: "OK Results",
                            flex: 1,
                          ),
                          const SizedBox(width: 16),
                          _buildStatCard(
                            icon: Icons.cancel,
                            iconColor: Colors.red,
                            title: "$totalNok",
                            subtitle: "NOK Results",
                            flex: 1,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Machine info with responsive styling
                      if (machine.name != null)
                        _buildMachineInfo(
                          machine,
                          titleFontSize,
                          subtitleFontSize,
                        ),

                      const SizedBox(height: 24),

                      // Chart section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Success Rate',
                            style: TextStyle(
                              fontSize: subtitleFontSize + 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              if (_selectedDataName != null ||
                                  _selectedDate != null)
                                IconButton(
                                  icon: const Icon(Icons.filter_alt_off),
                                  onPressed: () {
                                    setState(() {
                                      _selectedDataName = null;
                                      _selectedDate = null;
                                    });
                                  },
                                  tooltip: "Clear all filters",
                                ),
                              IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        title: const Text("Chart Type"),
                                        children: [
                                          SimpleDialogOption(
                                            onPressed: () {
                                              setState(() => _chartType = 0);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Bar Chart"),
                                          ),
                                          SimpleDialogOption(
                                            onPressed: () {
                                              setState(() => _chartType = 1);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Line Chart"),
                                          ),
                                          SimpleDialogOption(
                                            onPressed: () {
                                              setState(() => _chartType = 2);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Stacked Chart"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Chart
                      Container(
                        height: 300,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: _buildChart(
                          stats,
                          totalOk,
                          totalNok,
                          totalCount,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Detail cards section title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Detailed Statistics',
                            style: TextStyle(
                              fontSize: subtitleFontSize + 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (availableDataNames.length > 1)
                            TextButton.icon(
                              icon: const Icon(Icons.filter_list, size: 16),
                              label: Text(
                                "Filter",
                                style: TextStyle(fontSize: bodyFontSize),
                              ),
                              onPressed:
                                  () => _showDataNameFilterDialog(
                                    context,
                                    availableDataNames,
                                  ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Card grid - using GridView like in original code
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: stats.length,
                        itemBuilder: (context, index) {
                          final stat = stats[index];
                          final successRate =
                              (stat.ok ?? 0) / ((stat.total ?? 1)) * 100;
                          return GestureDetector(
                            onTap: () => _showDetailsDialog(context, stat),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      stat.dataName ?? "-",
                                      style: TextStyle(
                                        fontSize: subtitleFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Date: ${stat.date ?? '-'}",
                                      style: TextStyle(
                                        fontSize: bodyFontSize,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      "Success: ${successRate.toStringAsFixed(1)}%",
                                      style: TextStyle(
                                        fontSize: bodyFontSize,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "OK: ${stat.ok}",
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "NOK: ${stat.nok}",
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required int flex,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMachineInfo(
    MachinesModel machine,
    double titleFontSize,
    double subtitleFontSize,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          machine.imageUrl != null && machine.imageUrl!.isNotEmpty
              ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  machine.imageUrl!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              )
              : Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.precision_manufacturing,
                  size: 32,
                  color: Colors.blue,
                ),
              ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  machine.name ?? "Unnamed Machine",
                  style: TextStyle(
                    fontSize: subtitleFontSize + 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  machine.location ?? "Unknown Location",
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: Colors.grey[600],
                  ),
                ),
                if (machine.code != null)
                  Text(
                    "Code: ${machine.code}",
                    style: TextStyle(
                      fontSize: subtitleFontSize - 2,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart(List stats, int ok, int nok, int total) {
    switch (_chartType) {
      case 1:
        return LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey[200], strokeWidth: 1);
              },
              drawVerticalLine: false,
            ),
            titlesData: const FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
                left: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots:
                    stats.asMap().entries.map((e) {
                      final successRate =
                          (e.value.ok ?? 0) / ((e.value.total ?? 1)) * 100;
                      return FlSpot(e.key.toDouble(), successRate);
                    }).toList(),
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.1),
                ),
              ),
            ],
          ),
        );
      case 2:
        return BarChart(
          BarChartData(
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey[200], strokeWidth: 1);
              },
              drawVerticalLine: false,
            ),
            titlesData: const FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
                left: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            barGroups:
                stats.asMap().entries.map((e) {
                  final ok = (e.value.ok ?? 0).toDouble();
                  final nok = (e.value.nok ?? 0).toDouble();
                  return BarChartGroupData(
                    x: e.key,
                    barRods: [
                      BarChartRodData(
                        toY: ok + nok,
                        rodStackItems: [
                          BarChartRodStackItem(0, ok, Colors.green),
                          BarChartRodStackItem(ok, ok + nok, Colors.red),
                        ],
                        borderRadius: BorderRadius.zero,
                        width: 16,
                      ),
                    ],
                  );
                }).toList(),
          ),
        );
      default:
        return BarChart(
          BarChartData(
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey[200], strokeWidth: 1);
              },
              drawVerticalLine: false,
            ),
            titlesData: const FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
                left: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            barGroups:
                stats.asMap().entries.map((e) {
                  final index = e.key;
                  final ok = (e.value.ok ?? 0).toDouble();
                  final nok = (e.value.nok ?? 0).toDouble();

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: ok,
                        color: Colors.green,
                        width: 12,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      BarChartRodData(
                        toY: nok,
                        color: Colors.red,
                        width: 12,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                    ],
                    barsSpace: 4,
                  );
                }).toList(),
          ),
        );
    }
  }
}
