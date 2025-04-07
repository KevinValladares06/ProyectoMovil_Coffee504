import 'package:flutter/material.dart';
import 'package:coffee_504/carrito.dart';
import 'package:coffee_504/widgets/icono_carrito.dart';
import 'package:coffee_504/pantalla_carrito.dart';

class BebidasCalientes extends StatefulWidget {
  const BebidasCalientes({Key? key}) : super(key: key);

  @override
  State<BebidasCalientes> createState() => _BebidasCalientesState();
}

class _BebidasCalientesState extends State<BebidasCalientes> {
  final List<Map<String, dynamic>> productos = [
    {
      'nombre': 'Café Espresso',
      'imagen': 'assets/images/Espresso.png',
      'descripcion':
          'Un café concentrado y de sabor intenso, elaborado con granos finamente molidos y agua caliente a presión.',
      'tamano': '120ml',
      'precio': 60.00,
    },
    {
      'nombre': 'Cappuccino',
      'imagen': 'assets/images/Capuchino.png',
      'descripcion':
          'Una combinación clásica de espresso, leche vaporizada y una generosa capa de espuma de leche.',
      'tamano': '250ml',
      'precio': 110.00,
    },
    {
      'nombre': 'Latte',
      'imagen': 'assets/images/CafeLatte.png',
      'descripcion':
          'Una mezcla armoniosa de espresso y abundante leche vaporizada, con una fina capa de espuma en la superficie.',
      'tamano': '300ml',
      'precio': 85.00,
    },
    {
      'nombre': 'Americano',
      'imagen': 'assets/images/Americano.png',
      'descripcion':
          'Una versión más suave del espresso, lograda al agregar agua caliente, lo que reduce su intensidad sin perder su sabor característico.',
      'tamano': '250ml',
      'precio': 50.00,
    },
    {
      'nombre': 'Chocolate Caliente',
      'imagen': 'assets/images/ChocolateCaliente.png',
      'descripcion':
          'Una bebida cremosa y reconfortante, preparada con cacao puro y leche caliente.',
      'tamano': '120ml',
      'precio': 120.00,
    },
    {
      'nombre': 'Matcha Latte',
      'imagen': 'assets/images/MatchaLatte.png',
      'descripcion':
          'Elaborado con té verde matcha en polvo, batido con agua caliente y combinado con leche vaporizada para una textura suave y cremosa.',
      'tamano': '250ml',
      'precio': 150.00,
    },
    {
      'nombre': 'Mocha',
      'imagen': 'assets/images/Mocha.png',
      'descripcion':
          'Un delicioso equilibrio entre el amargor del espresso y la dulzura del chocolate caliente.',
      'tamano': '300ml',
      'precio': 80.00,
    },
    {
      'nombre': 'Té Chai Latte',
      'imagen': 'assets/images/TeChaiLatte.png',
      'descripcion':
          'Una exótica mezcla de té negro infusionado con especias como canela, jengibre, clavo y cardamomo.',
      'tamano': '250ml',
      'precio': 140.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bebidas Calientes'),
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
              setState(() {}); // actualizar contador al regresar
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
          'Bebidas Calientes',
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

                    setState(() {}); // actualizar contador después de agregar
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
