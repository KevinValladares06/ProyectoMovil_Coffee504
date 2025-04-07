import 'package:flutter/material.dart';
import 'package:coffee_504/carrito.dart';
import 'package:coffee_504/widgets/icono_carrito.dart';
import 'package:coffee_504/pantalla_carrito.dart';

class Postres extends StatefulWidget {
  const Postres({Key? key}) : super(key: key);

  @override
  State<Postres> createState() => _PostresState();
}

class _PostresState extends State<Postres> {
  final List<Map<String, dynamic>> productos = [
    {
      'nombre': 'Tiramisú',
      'imagen': 'assets/images/Tiramisu.png',
      'descripcion': 'Postre italiano con café, licor, mascarpone y cacao.',
      'tamano': 'Pequeño',
      'precio': 120.00,
    },
    {
      'nombre': 'Cheesecake',
      'imagen': 'assets/images/Cheesecake.png',
      'descripcion': 'Pastel cremoso de queso sobre base de galleta.',
      'tamano': 'Pequeño',
      'precio': 130.00,
    },
    {
      'nombre': 'Brownie de Chocolate',
      'imagen': 'assets/images/BrowniedeChocolate.png',
      'descripcion': 'Pastel húmedo con chocolate, nueces y azúcar.',
      'tamano': 'Pequeño',
      'precio': 110.00,
    },
    {
      'nombre': 'Macarons',
      'imagen': 'assets/images/Macarons.png',
      'descripcion': 'Galletas francesas de almendra con rellenos variados.',
      'tamano': 'Variado',
      'precio': 250.00,
    },
    {
      'nombre': 'Pastel de Limón',
      'imagen': 'assets/images/PasteldeLimon.png',
      'descripcion': 'Pastel ácido y fresco con glaseado de limón.',
      'tamano': 'Pequeño',
      'precio': 125.00,
    },
    {
      'nombre': 'Cinnamon Roll',
      'imagen': 'assets/images/CinnamonRoll.png',
      'descripcion': 'Bollo dulce con canela y glaseado de queso crema.',
      'tamano': 'Pequeño',
      'precio': 155.00,
    },
    {
      'nombre': 'Churros',
      'imagen': 'assets/images/Churros.png',
      'descripcion': 'Frituras crujientes con azúcar y chocolate espeso.',
      'tamano': 'Variado',
      'precio': 100.00,
    },
    {
      'nombre': 'Pastel de Zanahoria',
      'imagen': 'assets/images/PasteldeZanahoria.png',
      'descripcion': 'Pastel esponjoso de zanahoria, nueces y especias.',
      'tamano': 'Pequeño',
      'precio': 140.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postres'),
        backgroundColor: const Color.fromARGB(255, 225, 185, 159),
        actions: [
          IconoCarrito(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PantallaCarrito(),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 225, 185, 159),
      body: Column(
        children: [
          Image.asset(
            'assets/images/cafeproductsbanner.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          _buildCategoryTitle(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(context, productos[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle() {
    return Column(
      children: [
        const Text(
          'Postres',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          height: 2,
          width: double.infinity,
          color: const Color.fromARGB(255, 96, 39, 29),
        ),
      ],
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    Map<String, dynamic> producto,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              producto['nombre'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Image.asset(
                producto['imagen'],
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Lps. ${producto['precio'].toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: const Color.fromARGB(255, 96, 39, 29),
                  ),
                  onPressed: () {
                    Carrito.agregarProducto(producto);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${producto['nombre']} agregado al carrito',
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: const Color.fromARGB(255, 96, 39, 29),
                      ),
                    );

                    setState(() {});
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _mostrarDetalles(context, producto),
                    child: Text(
                      'Mostrar Detalles',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: const Color.fromARGB(255, 96, 39, 29),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDetalles(BuildContext context, Map<String, dynamic> producto) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  producto['imagen'],
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                producto['nombre'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(producto['descripcion']),
              const SizedBox(height: 5),
              Text('Tamaño: ${producto['tamano']}'),
              const SizedBox(height: 5),
              Text('Precio: Lps. ${producto['precio'].toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 96, 39, 29),
                  ),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
