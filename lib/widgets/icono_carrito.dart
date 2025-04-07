import 'package:flutter/material.dart';
import 'package:coffee_504/carrito.dart';

class IconoCarrito extends StatefulWidget {
  final VoidCallback onPressed;

  const IconoCarrito({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<IconoCarrito> createState() => _IconoCarritoState();
}

class _IconoCarritoState extends State<IconoCarrito>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {}); // Se reconstruye al volver a la app
    }
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Solución del error: se fuerza a .toInt()
    int total = Carrito.items.fold(0, (sum, item) {
      final cantidad = item['cantidad'] ?? 1;
      return (sum + cantidad).toInt(); // ⬅️ Aquí está el fix
    });

    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            widget.onPressed(); // ejecuta la función
            setState(() {}); // actualiza contador después de volver
          },
        ),
        if (total > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$total',
                style: const TextStyle(
                  color: Color.fromARGB(255, 96, 39, 29),
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
