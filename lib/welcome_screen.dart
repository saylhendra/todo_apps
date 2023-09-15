import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_preloved/controller.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List> todo = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Selamat Datang'),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          doOpenForm(context, ref);
          ref.invalidate(todoProvider);
        },
        child: todo.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            data: (dataTodo) {
              return ListView.builder(
                itemCount: dataTodo.length,
                itemBuilder: (context, index) {
                  final todo = dataTodo[index];
                  bool status = todo['status'];

                  return ListTile(
                    leading: InkWell(
                      onTap: () async {
                        await ref.watch(supabaseClientProvider).from('my_todo').update({'status': !status}).match({'id': todo['id']});
                        ref.invalidate(todoProvider);
                      },
                      child: CircleAvatar(
                        backgroundColor: status ? Colors.green : Colors.purple,
                        child: Icon(
                          status ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(todo['nama'], style: TextStyle(decoration: status ? TextDecoration.lineThrough : TextDecoration.none)),
                    subtitle: Text(todo['deskripsi'], style: TextStyle(decoration: status ? TextDecoration.lineThrough : TextDecoration.none)),
                    trailing: IconButton(
                      onPressed: () {
                        doDelete(context, ref, todo);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  void doOpenForm(BuildContext context, WidgetRef ref) {
    var namaController = TextEditingController();
    var deskripsiController = TextEditingController();
    showDialog(
      context: context,
      builder: (dialContext) => Dialog(
        //create form todo
        child: Form(
          key: GlobalKey<FormState>(debugLabel: 'formTodoKey'),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Tambah Data'),
                const SizedBox(height: 16),
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Kegiatan',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: deskripsiController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Deskripsi',
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    doSimpan(
                      context,
                      ref,
                      namaController: namaController,
                      deskripsiController: deskripsiController,
                    );
                    Navigator.pop(dialContext);
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void doSimpan(
    BuildContext context,
    WidgetRef ref, {
    required TextEditingController namaController,
    required TextEditingController deskripsiController,
  }) async {
    await ref.watch(supabaseClientProvider).from('my_todo').insert(
      {
        'nama': namaController.text,
        'deskripsi': deskripsiController.text,
      },
    );
    ref.invalidate(todoProvider);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan'),
      ),
    );
  }

  void doDelete(BuildContext context, WidgetRef ref, todo) async {
    final response = await ref.watch(supabaseClientProvider).from('my_todo').delete().match({'id': todo['id']});
    if (response.data != null) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.status.toString()),
        ),
      );
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data berhasil dihapus'),
        ),
      );
      ref.invalidate(todoProvider);
    }
  }
}
