import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/features/home/admin/dashboard/repository/batch_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../dashboard/controller/batch_state_pod.dart';

@RoutePage(
  deferredLoading: true,
)
class AddBatchPage extends ConsumerStatefulWidget {
  const AddBatchPage({super.key});

  @override
  ConsumerState<AddBatchPage> createState() => _AddBatchPageState();
}

class _AddBatchPageState extends ConsumerState<AddBatchPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Batch',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: const DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Column(
              children: [
                BatchTab(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() == true) {
            var x = await ref.read(batchRepositoryProvider).addBatch(
                  ref.read(batchControllerProvider),
                );

            if (!mounted) return;
            if (x) {
              ref.read(batchControllerProvider.notifier).reset();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Batch Added Successfully'),
                ),
              );
              context.router.pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong'),
                ),
              );
            }
          }
        },
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}

class BatchTab extends ConsumerWidget {
  const BatchTab({super.key});
  static final TextEditingController _startDateController =
      TextEditingController();
  static final TextEditingController _endDateController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var batchController = ref.watch(batchControllerProvider);
    _startDateController.text = batchController.startDate != null
        ? DateFormat('dd-MM-yyyy').format(batchController.startDate!)
        : "";
    _endDateController.text = batchController.endDate != null
        ? DateFormat('dd-MM-yyyy').format(batchController.endDate!)
        : "";
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          const Icon(
            Icons.group_add,
            size: 64,
          ),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill required fields';
              }
              return null;
            },
            onChanged: (value) =>
                ref.read(batchControllerProvider.notifier).setBatchName(value),
            decoration: const InputDecoration(
              labelText: 'Batch name',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Fee Type',
              prefixIcon: Icon(Icons.money),
            ),
            value: ref.watch(batchControllerProvider).feeType,
            items: feeType.map((e) {
              return DropdownMenuItem(
                value: e.values.first,
                child: Text(e.values.first),
              );
            }).toList(),
            onChanged: (value) {
              ref
                  .read(batchControllerProvider.notifier)
                  .setFeeType(value.toString());
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _startDateController,
            // initialValue:
            //     ref.watch(batchControllerProvider).startDate.toString(),

            decoration: const InputDecoration(
              labelText: 'Start Date',
              prefixIcon: Icon(Icons.calendar_today),
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now().add(
                  const Duration(days: 30),
                ),
                firstDate: DateTime(2000),
                lastDate: DateTime.now().add(
                  const Duration(days: 3000),
                ),
              );
              if (date != null && date != DateTime.now()) {
                var selectedDate = DateFormat('dd-MM-yyyy').format(date);
                _startDateController.text = selectedDate;
                ref.read(batchControllerProvider.notifier).setStartDate(date);
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _endDateController,
            // initialValue: ref.watch(batchControllerProvider).endDate != null
            //     ? ref.watch(batchControllerProvider).endDate.toString()
            //     : "",
            onChanged: (value) {},
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now().add(
                  const Duration(days: 3000),
                ),
              );
              if (date != null && date != DateTime.now()) {
                var selectedDate = DateFormat('dd-MM-yyyy').format(date);
                _endDateController.text = selectedDate;
                ref.read(batchControllerProvider.notifier).setEndDate(date);
              }
            },
            decoration: const InputDecoration(
              labelText: 'End Date',
              prefixIcon: Icon(Icons.calendar_today),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: ref.watch(batchControllerProvider).fees.toString(),
            onChanged: (value) => ref
                .read(batchControllerProvider.notifier)
                .setFees(double.parse(value)),
            decoration: const InputDecoration(
              labelText: 'Fee',
              prefixIcon: Icon(Icons.currency_rupee),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
