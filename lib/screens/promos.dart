import 'package:coffee_504/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class PromocionesPage extends StatelessWidget {
  const PromocionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBrown,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Promociones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
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
            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'lib/assets/banner.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Título sección
            const Text(
              'Ofertas Especiales del Mes',
              style: AppTextStyles.sectionTitle,
            ),
            const SizedBox(height: 12),

            // Promociones
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Image.asset('lib/assets/promo1.png', fit: BoxFit.cover),
                Image.asset('lib/assets/promo2.png', fit: BoxFit.cover),
                Image.asset('lib/assets/promo3.png', fit: BoxFit.cover),
                Image.asset('lib/assets/promo4.png', fit: BoxFit.cover),
              ],
            ),

            const SizedBox(height: 24),

            // Aviso legal
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondaryBrown.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primaryBrown.withOpacity(0.5),
                ),
              ),
              child: const Text(
                'Promociones sujetas a cambio y solo válidas en la tienda.',
                style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: AppColors.primaryBrown,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
