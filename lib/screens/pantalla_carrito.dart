import 'package:coffee_504/screens/BebidasCalientes.dart';
import 'package:coffee_504/screens/menuproyecto.dart';
import 'package:coffee_504/screens/promos.dart';
import 'package:coffee_504/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:coffee_504/screens/carrito.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({Key? key}) : super(key: key);

  @override
  State<PantallaCarrito> createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  final GlobalKey<AnimatedListState> _listaKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final productos = Carrito.items;

    double subtotal = 0;
    for (var p in productos) {
      double precio = p['precio'] ?? 0.0;
      int cantidad = p['cantidad'] ?? 1;
      subtotal += precio * cantidad;
    }

    double isv = subtotal * 0.15;
    double total = subtotal + isv;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: const Color.fromARGB(255, 225, 185, 159),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 185, 159),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            productos.isEmpty
                ? const Center(child: Text('🛒 El carrito está vacío'))
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumen de Productos:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: AnimatedList(
                        key: _listaKey,
                        initialItemCount: productos.length,
                        itemBuilder: (context, index, animation) {
                          final producto = productos[index];
                          return SizeTransition(
                            sizeFactor: animation,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          producto['imagen'],
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              producto['nombre'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            const Text('Cantidad:'),
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.remove_circle_outline,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      Carrito.restarCantidad(
                                                        producto['nombre'],
                                                      );
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.brown[100],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    '${producto['cantidad']}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.green,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      Carrito.sumarCantidad(
                                                        producto['nombre'],
                                                      );
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Lps. ${(producto['precio'] * producto['cantidad']).toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete_outline,
                                              color: const Color.fromARGB(
                                                255,
                                                194,
                                                47,
                                                21,
                                              ),
                                              size: 30,
                                            ),
                                            tooltip: 'Eliminar',
                                            onPressed: () {
                                              final removedItem =
                                                  productos[index];
                                              setState(() {
                                                Carrito.eliminarProducto(
                                                  removedItem['nombre'],
                                                );
                                              });
                                              _listaKey.currentState!.removeItem(
                                                index,
                                                (
                                                  context,
                                                  animation,
                                                ) => SizeTransition(
                                                  sizeFactor: animation,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          bottom: 12,
                                                        ),
                                                    child: Card(
                                                      elevation: 4,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              15,
                                                            ),
                                                      ),
                                                      child: ListTile(
                                                        title: Text(
                                                          removedItem['nombre'],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                duration: const Duration(
                                                  milliseconds: 500,
                                                ),
                                              );
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor: const Color(
                                                    0xFFD7CCC8,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  content: Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.delete,
                                                        color: Color.fromARGB(
                                                          255,
                                                          200,
                                                          67,
                                                          19,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Text(
                                                          'Producto eliminado del carrito',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                  255,
                                                                  96,
                                                                  39,
                                                                  29,
                                                                ),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  duration: const Duration(
                                                    seconds: 2,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(color: Color.fromARGB(255, 96, 39, 29)),
                    Text('Subtotal: Lps. ${subtotal.toStringAsFixed(2)}'),
                    Text('ISV (15%): Lps. ${isv.toStringAsFixed(2)}'),
                    Text(
                      'Total: Lps. ${total.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: const Color(0xFFD7CCC8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              content: Row(
                                children: const [
                                  Icon(
                                    Icons.local_cafe,
                                    color: Color.fromARGB(255, 96, 39, 29),
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      '¡Compra realizada con éxito!',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 96, 39, 29),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                          setState(() {
                            Carrito.limpiar();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            96,
                            39,
                            29,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                        ),
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Realizar compra',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => menuproyecto()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => BebidasCalientes()),
              );
              break;
            case 2:
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => PromocionesPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
