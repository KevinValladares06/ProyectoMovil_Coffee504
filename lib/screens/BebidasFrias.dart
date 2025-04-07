import 'package:flutter/material.dart';
import 'package:coffee_504/carrito.dart';
import 'package:coffee_504/widgets/icono_carrito.dart';
import 'package:coffee_504/pantalla_carrito.dart';

class BebidasFrias extends StatefulWidget {
  const BebidasFrias({Key? key}) : super(key: key);

  @override
  State<BebidasFrias> createState() => _BebidasFriasState();
}

class _BebidasFriasState extends State<BebidasFrias> {
  final List<Map<String, dynamic>> productos = [
    {
      'nombre': 'Smoothie de Mango',
      'imagen': 'assets/images/SmoothiedeMango.png',
      'descripcion':
          'Una mezcla fría y espesa de mango, hielo y jugo de frutas.',
      'tamano': '120ml',
      'precio': 130.00,
    },
    {
      'nombre': 'Limonada de Fresa',
      'imagen': 'assets/images/LimonadadeFresa.png',
      'descripcion':
          'Preparada con jugo fresco de limón y fresas trituradas, servida con hielo.',
      'tamano': '180ml',
      'precio': 95.00,
    },
    {
      'nombre': 'Jugo de Naranja con Maracuyá',
      'imagen': 'assets/images/JugodeNaranjaconMaracuya.png',
      'descripcion':
          'Con la dulzura de la naranja y el toque ácido del maracuyá.',
      'tamano': '120ml',
      'precio': 85.00,
    },
    {
      'nombre': 'Frappé de Café',
      'imagen': 'assets/images/FrappeCafe.png',
      'descripcion': 'Hecha con café, hielo, leche y azúcar.',
      'tamano': '160ml',
      'precio': 120.00,
    },
    {
      'nombre': 'Chocolate Frío',
      'imagen': 'assets/images/ChocolateFrio.png',
      'descripcion': 'Preparado con leche fría, cacao y hielo.',
      'tamano': '80ml',
      'precio': 90.00,
    },
    {
      'nombre': 'Iced Matcha Latte',
      'imagen': 'assets/images/IcedMatchaLatte.png',
      'descripcion': 'Té verde matcha, leche fría y hielo.',
      'tamano': '120ml',
      'precio': 100.00,
    },
    {
      'nombre': 'Smoothie de Frutas',
      'imagen': 'assets/images/SmoothiedeFrutas.png',
      'descripcion': 'Con frutas frescas, hielo y yogur o leche.',
      'tamano': '300ml',
      'precio': 80.00,
    },
    {
      'nombre': 'Café Helado',
      'imagen': 'assets/images/CafeHelado.png',
      'descripcion': 'Café enfriado con hielo.',
      'tamano': '120ml',
      'precio': 100.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bebidas Frías'),
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
          'Bebidas Frías',
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
