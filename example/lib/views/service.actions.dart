import 'package:flutter/material.dart';

class ServiceAction extends StatelessWidget {
  const ServiceAction({
    super.key,
    this.onCreate,
    this.onGetOne,
    this.onGetAll,
    this.onUpdate,
    this.onDelete,
  });
  final VoidCallback? onCreate;
  final VoidCallback? onGetOne;
  final VoidCallback? onGetAll;
  final VoidCallback? onUpdate;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton(onPressed: onCreate, child: const Text("Create")),
        FilledButton(onPressed: onGetOne, child: const Text("Get One")),
        FilledButton(onPressed: onGetAll, child: const Text("Get All")),
        FilledButton(onPressed: onUpdate, child: const Text("Update")),
        FilledButton(onPressed: onDelete, child: const Text("Delete")),
      ]
          .map((e) => Padding(padding: const EdgeInsets.all(8.0), child: e))
          .toList(),
    );
  }
}
