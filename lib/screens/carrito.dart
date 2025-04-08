class Carrito {
  static final List<Map<String, dynamic>> _items = [];
  static List<Map<String, dynamic>> get items => List.unmodifiable(_items);
  static void agregarProducto(Map<String, dynamic> producto) {
    final index = _items.indexWhere(
      (item) => item['nombre'] == producto['nombre'],
    );

    if (index != -1) {
      _items[index]['cantidad'] = (_items[index]['cantidad'] ?? 1) + 1;
    } else {
      final nuevoProducto = Map<String, dynamic>.from(producto);
      nuevoProducto['cantidad'] = 1;
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

  static void sumarCantidad(String nombre) {
    final index = _items.indexWhere((item) => item['nombre'] == nombre);
    if (index != -1) {
      _items[index]['cantidad'] += 1;
    }
  }

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

  static void eliminarProducto(String nombre) {
    _items.removeWhere((item) => item['nombre'] == nombre);
  }

  static void limpiar() {
    _items.clear();
  }
}
