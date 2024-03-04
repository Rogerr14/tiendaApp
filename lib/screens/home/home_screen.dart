import 'package:comisariato/models/products_models.dart';
import 'package:comisariato/services/producto_provider.dart';
import 'package:comisariato/utils/constants/constants.dart';
import 'package:comisariato/utils/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: fondoColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 20,
        title: const Text(
          'TIENDA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: fondoColor,
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: _ProducstList(),
    );
  }
}

class _ProducstList extends StatelessWidget {
  final productProvider = ProductProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productProvider.readProduct(),
      builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final product = snapshot.data;

          return ListView.builder(
              itemCount: product!.length,
              itemBuilder: (context, index) => _itemList(product[index]));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _itemList(ProductModel producto) {
    return ListTile(
      title: Text('${producto.title}- ${producto.value}'),
      subtitle: Text(producto.id),
      onTap: (){  },
    );
  }
}




//TODO : MenuItems
