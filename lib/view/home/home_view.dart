import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mtcreportview/core/base/view/base_view.dart';
import '../../core/extension/context_extension.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import '../machines/viewmodel/machines_view_model.dart';
import '../../../product/_variables/database.variables.dart';
import '../statitistics/model/statistics_model.dart';
import '../statitistics/viewModel/statistics_view_model.dart';
import '../machines/model/machines_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  final MachinesViewModel machinesViewModel = MachinesViewModel();
  final StatisticsViewModel statisticsViewModel = StatisticsViewModel();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: machinesViewModel,
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MachinesViewModel model) {
        return _scaffold(context);
      },
    );
  }

  Widget _scaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderRadius: 5,
                  borderColor: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(height: context.height * 0.02),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;

    controller?.scannedDataStream.listen((scanData) async {
      if (result == null) {
        setState(() {
          result = scanData;
        });

        controller?.pauseCamera();

        try {
          final jsonMap =
              jsonDecode(scanData.code ?? '') as Map<String, dynamic>;

          final uuid = jsonMap['uuid'] as String;
          final name = jsonMap['name'] as String? ?? "Unknown Machine";
          final location = jsonMap['location'] as String? ?? "Unknown Location";
          final date = jsonMap['date'] as String? ?? "Unknown Date";
          final code = jsonMap['code'] as String? ?? "Unknown Code";

          final isStatistic = jsonMap.containsKey('dataType');

          /// Makine kayıtlı mı?
          final isRegistered = _checkIfMachineExists(uuid);

          if (isStatistic) {
            final dataType = jsonMap['dataType'] as int;
            final dataName = jsonMap['dataName'] as String?;
            final dataIndex = jsonMap['dataIndex'] as String?;
            final ok = jsonMap['ok'] as int? ?? 0;
            final nok = jsonMap['nok'] as int? ?? 0;
            final total = jsonMap['total'] as int? ?? 0;

            if (isRegistered) {
              if (dataType == 1) {
                _addStatistics(
                  uuid,
                  dataName!,
                  dataIndex!,
                  date,
                  ok,
                  nok,
                  total,
                );
              } else if (dataType == 2) {
                _updateStatistics(
                  uuid,
                  dataName!,
                  dataIndex!,
                  date,
                  ok,
                  nok,
                  total,
                );
              }
            } else {
              _showSnackBar(
                "This machine is not registered. Statistics not saved.",
              );
              await _resumeCameraAfterDelay();
            }
          } else {
            /// 👉 Bu sadece makine bilgisi
            if (isRegistered) {
              _showSnackBar("This machine is already registered.");
              await _resumeCameraAfterDelay();
            } else {
              _showMachineNotFoundDialog(uuid, name, location, date, code);
            }
          }
        } catch (e) {
          _showSnackBar("Failed to read QR data: $e");
          await _resumeCameraAfterDelay();
        }
      }
    });
  }

  bool _checkIfMachineExists(String uuid) {
    final allMachines = machinesBox.values.toList();
    final exists = allMachines.any((element) => element.uuid == uuid);

    return exists;
  }

  void _addStatistics(
    String uuid,
    String dataName,
    String dataIndex,
    String date,
    int ok,
    int nok,
    int total,
  ) {
    final existing = statisticsBox.values.where(
      (element) =>
          element.uuid == uuid &&
          element.dataName == dataName &&
          element.date == date,
    );

    final newStat = StatisticsModel(
      uuid: uuid,
      dataName: dataName,
      date: date,
      ok: ok,
      nok: nok,
      total: total,
      dataIndex: dataIndex,
    );

    if (existing.isNotEmpty) {
      // aynı güne ait veri varsa: güncelle
      final key = statisticsBox.keys.firstWhere(
        (k) =>
            statisticsBox.get(k)?.uuid == uuid &&
            statisticsBox.get(k)?.dataName == dataName &&
            statisticsBox.get(k)?.date == date,
      );

      statisticsViewModel.update(key, newStat).then((state) {
        if (state == 1) {
          _showSnackBar("Statistics updated for today.");
        } else {
          _showSnackBar("Failed to update statistics.");
        }
        _resumeCameraAfterDelay();
      });
    } else {
      // aynı güne ait yoksa: yeni ekle
      statisticsViewModel.add(newStat).then((state) {
        if (state == 1) {
          _showSnackBar("Statistics added successfully.");
        } else {
          _showSnackBar("Failed to add statistics.");
        }
        _resumeCameraAfterDelay();
      });
    }
  }

  void _updateStatistics(
    String uuid,
    String dataName,
    String dataIndex,
    String date,
    int ok,
    int nok,
    int total,
  ) {
    final stats =
        statisticsBox.values
            .where((stat) => stat.uuid == uuid && stat.dataName == dataName)
            .toList();

    if (stats.isNotEmpty) {
      final key = statisticsBox.keys.firstWhere(
        (k) =>
            statisticsBox.get(k)?.uuid == uuid &&
            statisticsBox.get(k)?.dataName == dataName,
      );

      final updatedStat = StatisticsModel(
        uuid: uuid,
        dataName: dataName,
        date: date,
        ok: ok,
        nok: nok,
        total: total,
        dataIndex: dataIndex,
      );

      statisticsViewModel.update(key, updatedStat).then((state) {
        if (state == 1) {
          _showSnackBar("Statistics updated successfully.");
        } else {
          _showSnackBar("Failed to update statistics.");
        }
        _resumeCameraAfterDelay();
      });
    } else {
      _showSnackBar("No existing statistics found for update.");
      _resumeCameraAfterDelay();
    }
  }

  void _showMachineNotFoundDialog(
    String uuid,
    String name,
    String location,
    String date,
    String code,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Machine Not Found"),
          content: const Text(
            "This machine is not registered in the system. Would you like to add it?",
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _addNewMachine(uuid, name, location, date, code);
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resumeCameraAfterDelay();
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addNewMachine(
    String uuid,
    String name,
    String location,
    String date,
    String code,
  ) async {
    final newMachine = MachinesModel(
      uuid: uuid,
      name: name,
      location: location,
      date: date,
      code: code,
    );

    await machinesViewModel.add(newMachine).then((state) {
      if (state == 1) {
        _showSnackBar("New machine added successfully.");
      } else {
        _showSnackBar("Failed to add machine.");
      }
      _resumeCameraAfterDelay();
    });
  }

  Future<void> _resumeCameraAfterDelay() async {
    await Future.delayed(const Duration(seconds: 5));
    if (!mounted) return;

    controller?.resumeCamera();
    setState(() => result = null);
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
