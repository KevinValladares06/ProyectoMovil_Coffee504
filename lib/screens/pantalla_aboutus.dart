import 'package:coffee_504/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coffee_504/Styles/app_styles.dart';
import 'package:coffee_504/widgets/section_card.dart';

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
      backgroundColor: const Color.fromARGB(255, 225, 185, 159),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 185, 159),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Sobre Nosotros'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bienvenida()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Image.asset('assets/images/logocoffe.png', height: 150),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 225, 185, 159),
                    Color.fromARGB(255, 225, 185, 159),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                '¡Dulces momentos, auténtico sabor!',
                style: AppTextStyles.slogan.copyWith(
                  color: const Color.fromARGB(255, 88, 53, 47),
                ),
                textAlign: TextAlign.center,
              ),
            ),

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
