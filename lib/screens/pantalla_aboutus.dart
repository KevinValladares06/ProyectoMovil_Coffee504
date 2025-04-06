import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coffee_504/Styles/app_styles.dart';
import 'package:coffee_504/widgets/section_card.dart';
import 'package:coffee_504/screens/home_screen.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

void _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('No se pudo abrir el enlace: $url');
  }
}

class _AboutUsPageState extends State<AboutUsPage> {
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
        title: const Text('Sobre Nosotros'),
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
        child: Column(
          children: [
            // Header decorativo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryBrown, AppColors.secondaryBrown],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: const [
                  Text('Coffee 504', style: AppTextStyles.header),
                  SizedBox(height: 6),
                  Text(
                    '¡Dulces momentos, auténtico sabor!',
                    style: AppTextStyles.slogan,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Image.asset('assets/images/logocoffe.png', height: 100),
            const SizedBox(height: 8),

            // SOBRE NOSOTROS
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Sobre Nosotros', style: AppTextStyles.sectionTitle),
                  SizedBox(height: 8),
                  Text(
                    'Coffee 504 es una cafetería y pastelería hondureña que nace del amor por el café y los postres artesanales.\n\n'
                    'Nos enfocamos en crear experiencias acogedoras, ofreciendo productos frescos, preparados con pasión.\n\n'
                    'Nuestra misión es endulzar los días de nuestros clientes y compartir los valores de la tradición, calidad y comunidad.',
                    style: AppTextStyles.normalText,
                  ),
                ],
              ),
            ),

            // HORARIOS
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Horarios de Atención',
                    style: AppTextStyles.sectionTitle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: AppSizes.iconSize),
                      const SizedBox(width: 6),
                      const Text('Lunes a Sábado: 8:00 AM - 8:00 PM'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: AppSizes.iconSize),
                      const SizedBox(width: 6),
                      const Text('Domingo: 9:00 AM - 6:00 PM'),
                    ],
                  ),
                ],
              ),
            ),

            // CONTACTO
            SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contacto y Soporte',
                    style: AppTextStyles.sectionTitle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, size: AppSizes.iconSize),
                      const SizedBox(width: 6),
                      const Text('Teléfono: +504 9999-9999'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.email, size: AppSizes.iconSize),
                      const SizedBox(width: 6),
                      const Text('Email tienda: contacto@coffee504.com'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.build, size: AppSizes.iconSize),
                      const SizedBox(width: 6),
                      const Text('Soporte: soporte@coffee504.com'),
                    ],
                  ),
                ],
              ),
            ),

            // REDES SOCIALES
            SectionCard(
              child: Column(
                children: [
                  const Text(
                    'Síguenos en Redes Sociales',
                    style: AppTextStyles.sectionTitle,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:
                            () => _launchURL(
                              'https://www.instagram.com/coffee504',
                            ),
                        child: Image.asset(
                          'assets/images/insta.png',
                          height: AppSizes.socialIconSize,
                          width: AppSizes.socialIconSize,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap:
                            () =>
                                _launchURL('https://www.tiktok.com/@coffee504'),
                        child: Image.asset(
                          'assets/images/tiktok.png',
                          height: AppSizes.socialIconSize,
                          width: AppSizes.socialIconSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
