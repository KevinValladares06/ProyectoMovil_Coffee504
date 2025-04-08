import 'package:coffee_504/screens/BebidasCalientes.dart';
import 'package:coffee_504/screens/menuproyecto.dart';
import 'package:coffee_504/screens/pantalla_carrito.dart';
import 'package:coffee_504/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:coffee_504/Styles/app_styles.dart';

class PromocionesPage extends StatefulWidget {
  const PromocionesPage({Key? key}) : super(key: key);

  @override
  _promocionespageState createState() => _promocionespageState();
}

class _promocionespageState extends State<PromocionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 185, 159),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 185, 159),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => menuproyecto()),
            );
          },
        ),
        title: const Text('Promociones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PantallaCarrito(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/banner.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Ofertas Especiales del Mes',
              style: AppTextStyles.sectionTitle,
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Image.asset('assets/images/promo1.png', fit: BoxFit.cover),
                Image.asset('assets/images/promo2.png', fit: BoxFit.cover),
                Image.asset('assets/images/promo3.png', fit: BoxFit.cover),
                Image.asset('assets/images/promo4.png', fit: BoxFit.cover),
              ],
            ),

            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondaryBrown.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(255, 96, 39, 29).withOpacity(0.5),
                ),
              ),
              child: const Text(
                'Promociones sujetas a cambio y solo válidas en la tienda.',
                style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 96, 39, 29),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: 3,
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => PantallaCarrito()),
              );
              break;
            case 3:
              break;
          }
        },
      ),
    );
  }
}
