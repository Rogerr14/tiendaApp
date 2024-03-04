import 'package:comisariato/services/producto_provider.dart';
import 'package:flutter/material.dart';

import 'package:comisariato/utils/validator/validator_forms.dart' as utils;
import 'package:comisariato/utils/constants/constants.dart';
import 'package:comisariato/utils/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static String name = 'productsScreen';
  ProductsScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    // final productoProvider = context.watch<ProductProvider>();
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final avaliableController = TextEditingController();
    //print(nameController.text);
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        backgroundColor: fondoColor,
        elevation: 20,
        centerTitle: true,
        title: const Text('Producto'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_size_select_actual),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _crearNombe(nameController),
                _crearPrecio(priceController),
                _CrearDisponible(avaliableController),
                _crearBoton(nameController, priceController,
                    avaliableController, productProvider),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombe(TextEditingController nameController) {
    return SizedBox(
      width: 280,
      child: TextFormField(
        //validacion al campo
        controller: nameController,

        validator: (value) {
          if (value!.trim().isEmpty) {
            return 'El campo esta vacio';
          }
          if (value.trim().length < 3) {
            return 'Ingrese un nombre valido';
          } else {
            return null;
          }
        },

        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          label: Text('Producto'),
        ),
      ),
    );
  }

  Widget _crearPrecio(TextEditingController priceController) {
    return SizedBox(
      width: 280,
      child: TextFormField(
        controller: priceController,
        keyboardType:
            const TextInputType.numberWithOptions(signed: false, decimal: true),
        decoration: const InputDecoration(
          label: Text('Precio'),
        ),
        validator: (value) {
          if (utils.isNumeric(value!)) {
            return null;
          } else {
            return 'Solo numeros';
          }
        },
      ),
    );
  }

  Widget _crearBoton(
    TextEditingController nameController,
    TextEditingController priceController,
    TextEditingController avaliableController,
    ProductProvider productProvider,
  ) {
    return ElevatedButton.icon(
      //estilo del boton
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(15),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      icon: const Icon(
        Icons.save_rounded,
        color: Colors.white,
      ),
      label: const Text(
        'Guardar',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _submit(nameController, priceController, avaliableController,
            productProvider);
      },
    );
  }

  _submit(
      TextEditingController nameController,
      TextEditingController priceController,
      TextEditingController avaliableController,
      ProductProvider productProvider) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final String title = nameController.text;
      final double? value = double.tryParse(priceController.text);
      final bool avaliable = bool.parse(avaliableController.text);
      productProvider.createProduct(title, value!, avaliable);
    }
  }
}

class _CrearDisponible extends StatefulWidget {
  final TextEditingController availableController;

  const _CrearDisponible(this.availableController);

  @override
  State<_CrearDisponible> createState() => __CrearDisponibleState();
}

class __CrearDisponibleState extends State<_CrearDisponible> {
  late bool _valor;

  @override
  void initState() {
    super.initState();
    // Inicializar el valor del switch con el valor del TextEditingController si está presente, de lo contrario, inicializar con false
    _valor = widget.availableController.text.isEmpty
        ? false
        : bool.parse(widget.availableController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _valor,
      title: const Text('Disponible'),
      onChanged: (value) {
        setState(() {
          _valor = value;

          // Actualizar el valor del TextEditingController cuando cambia el SwitchListTile
          widget.availableController.text = value.toString();
        });
      },
    );
  }
}
