import 'package:flutter/material.dart';
import '../../../services/supabase_client.dart';
import '../data/products_repo.dart';

class ProductsPage extends StatefulWidget { const ProductsPage({super.key}); @override State<ProductsPage> createState()=>_ProductsPageState(); }
class _ProductsPageState extends State<ProductsPage> {
  late Future<List<Product>> _future;
  bool _inited = false;

  Future<void> _ensureInit() async {
    if (_inited) return;
    // Troque pelos valores do seu projeto
    await Sb.init(url: const String.fromEnvironment('SUPABASE_URL', defaultValue: 'https://engvllvzkexjpzbhbyzt.supabase.co'),
                  anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVuZ3ZsbHZ6a2V4anB6YmhieXp0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MzExNjcsImV4cCI6MjA3NTEwNzE2N30.A_8d8nvqcOSooIDpkiH5CzPXmFIB6u5_lmPDwSi_EUI'));
    _inited = true;
  }

  @override void initState() {
    super.initState();
    _future = _load();
  }

  Future<List<Product>> _load() async {
    await _ensureInit();
    return ProductsRepo().list();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (c, s){
        final items = s.data ?? <Product>[];
        if (s.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());
        return RefreshIndicator(
          onRefresh: () async => setState(()=>_future = _load()),
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __)=> const Divider(height: 1),
            itemBuilder: (_, i){
              final p = items[i];
              return ListTile(
                title: Text(p.name),
                trailing: Text('R\$ ${p.price.toStringAsFixed(2)}'),
              );
            },
          ),
        );
      },
    );
  }
}
