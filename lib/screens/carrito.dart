class Carrito {
  // Lista que almacena productos con su cantidad
  static final List<Map<String, dynamic>> _items = [];

  // Obtener los productos del carrito (copia protegida)
  static List<Map<String, dynamic>> get items => List.unmodifiable(_items);

  // Agregar producto al carrito
  static void agregarProducto(Map<String, dynamic> producto) {
    final index = _items.indexWhere(
      (item) => item['nombre'] == producto['nombre'],
    );

    if (index != -1) {
      // Ya existe → aumentar cantidad
      _items[index]['cantidad'] = (_items[index]['cantidad'] ?? 1) + 1;
    } else {
      // Nuevo producto → agregar con cantidad = 1
      final nuevoProducto = Map<String, dynamic>.from(producto);
      nuevoProducto['cantidad'] = 1;

      // Asegurarse de que el precio sea numérico
      if (nuevoProducto['precio'] is String) {
        nuevoProducto['precio'] =
            double.tryParse(
              nuevoProducto['precio'].toString().replaceAll(
                RegExp(r'[^0-9.]'),
                '',
              ),
            ) ??
            0.0;
      }

      _items.add(nuevoProducto);
    }
  }

  // Aumentar cantidad de un producto
  static void sumarCantidad(String nombre) {
    final index = _items.indexWhere((item) => item['nombre'] == nombre);
    if (index != -1) {
      _items[index]['cantidad'] += 1;
    }
  }

  // Disminuir cantidad o eliminar si llega a 0
  static void restarCantidad(String nombre) {
    final index = _items.indexWhere((item) => item['nombre'] == nombre);
    if (index != -1) {
      if (_items[index]['cantidad'] > 1) {
        _items[index]['cantidad'] -= 1;
      } else {
        _items.removeAt(index);
      }
    }
  }

  // Eliminar un producto por nombre
  static void eliminarProducto(String nombre) {
    _items.removeWhere((item) => item['nombre'] == nombre);
  }

  // Limpiar carrito por completo
  static void limpiar() {
    _items.clear();
  }
}
