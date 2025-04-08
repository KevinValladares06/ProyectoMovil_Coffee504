import 'dart:ui';
import 'package:coffee_504/screens/pantalla_carrito.dart';
import 'package:coffee_504/screens/promos.dart';
import 'package:coffee_504/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_504/screens/BebidasCalientes.dart';
import 'package:coffee_504/screens/BebidasFrias.dart';
import 'package:coffee_504/screens/Postres.dart';
import 'package:coffee_504/screens/productos.dart';
import 'package:coffee_504/widgets/navigation.dart';

class menuproyecto extends StatefulWidget {
  const menuproyecto({Key? key}) : super(key: key);

  @override
  _menuproyectoState createState() => _menuproyectoState();
}

class _menuproyectoState extends State<menuproyecto> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredProducts = [];
  bool showSuggestions = false;

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = [];
        showSuggestions = false;
      } else {
        List<Map<String, dynamic>> matches =
            allProducts
                .where(
                  (product) => product['nombre'].toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .toList();

        List<Map<String, dynamic>> exactMatch =
            matches
                .where(
                  (product) =>
                      product['nombre'].toLowerCase() == query.toLowerCase(),
                )
                .toList();

        if (exactMatch.isNotEmpty) {
          filteredProducts = exactMatch;
        } else {
          filteredProducts = matches.take(4).toList();
        }

        showSuggestions = filteredProducts.isNotEmpty;
      }
    });
  }

  void _navigateToProduct(BuildContext context, Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => product['screen']),
    );
    setState(() {
      searchController.clear();
      filteredProducts = [];
      showSuggestions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 185, 159),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
          },
        ),
        title: const Text('Menú Principal'),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 185, 159),

      body: Column(
        children: [
          _buildBanner(),
          const SizedBox(height: 10),
          _buildSearchBar(),
          if (showSuggestions) _buildSuggestionsList(),
          const SizedBox(height: 10),
          _buildCategoryTitle(),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildCategoryCard(
                  context,
                  'Bebidas Calientes',
                  'assets/images/bebcalientemenu.png',
                  BebidasCalientes(),
                ),
                _buildCategoryCard(
                  context,
                  'Bebidas Frías',
                  'assets/images/bebfriamenu.png',
                  BebidasFrias(),
                ),
                _buildCategoryCard(
                  context,
                  'Postres',
                  'assets/images/postresmenu.png',
                  Postres(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => BebidasCalientes()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => PantallaCarrito()),
              );
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

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 105,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cafebanner1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Buscar...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: _filterProducts,
      ),
    );
  }

  Widget _buildSuggestionsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.brown.shade300),
        ),
        child: Column(
          children:
              filteredProducts.map((product) {
                return ListTile(
                  title: Text(product['nombre']),
                  subtitle: Text(product['categoria']),
                  onTap: () => _navigateToProduct(context, product),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Text(
            'Categorías',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.brown[400],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String imagePath,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
