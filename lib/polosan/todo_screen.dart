// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // List dataTodo = [...dataTodox];
  SupabaseClient supabaseClient = Supabase.instance.client;
  List dataTodo = [];

  @override
  void initState() {
    super.initState();
    doFetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          doOpenForm();
          doFetchData();
          //looping array of string
        },
        // var dataTodo = [...dataTodox];
        // dataTodo.sort((a, b) => a['id'].compareTo(b['id']));
        child: ListView.builder(
          itemCount: dataTodo.length,
          itemBuilder: (context, index) {
            var todo = dataTodo[index];
            bool status = todo['status'];

            return Animate(
              effects: const [FadeEffect(), ShakeEffect()],
              autoPlay: true,
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: ListTile(
                  leading: InkWell(
                    onTap: () async {
                      await supabaseClient.from('my_todo').update({'status': !status}).match({'id': todo['id']});
                      doRefresh();
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
                  subtitle: Text(todo['id'].toString(), style: TextStyle(decoration: status ? TextDecoration.lineThrough : TextDecoration.none)),
                  trailing: IconButton(
                    onPressed: () async {
                      final response = await supabaseClient.from('my_todo').delete().match({'id': todo['id']});
                      if (response != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response.status.toString()),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil dihapus'),
                          ),
                        );
                      }
                      doRefresh();
                    },
                    icon: Animate(
                      effects: const [ShakeEffect()],
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void doFetchData() {
    supabaseClient.from('my_todo').select().then((value) {
      dataTodo = value as List;
      setState(() {
        dataTodo.sort((a, b) => a['id'].compareTo(b['id']));
      });
    });
  }

  void doOpenForm() {
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
                  onPressed: () async {
                    await supabaseClient.from('my_todo').insert(
                      {
                        'nama': namaController.text,
                        'deskripsi': deskripsiController.text,
                        'status': false,
                      },
                    );
                    doRefresh();
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

  void doRefresh() {
    doFetchData();
  }
}
