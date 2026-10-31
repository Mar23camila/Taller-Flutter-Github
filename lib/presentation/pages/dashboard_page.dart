import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

// ─── Dashboard principal ───────────────────────────────────────────────────────

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // IndexedStack mantiene el estado de cada pestaña viva
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const _HomeTab(),
          _ProfileTab(onLogout: _goToLogin),
        ],
      ),
      bottomNavigationBar: _DashboardNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  void _goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }
}

// ─── BottomNavigationBar ───────────────────────────────────────────────────────

class _DashboardNavBar extends StatelessWidget {
  const _DashboardNavBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.subtle,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24),
            activeIcon: Icon(Icons.home_rounded, size: 24),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24),
            activeIcon: Icon(Icons.person_rounded, size: 24),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// ─── Pestaña: Inicio ───────────────────────────────────────────────────────────

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  static const List<_CardItem> _items = [
    _CardItem(
      icon: Icons.notifications_outlined,
      iconColor: Color(0xFFE3454F),
      title: 'Nueva misión disponible',
      subtitle: 'Explora el Hotel Lakeview al anochecer.',
      time: 'Hace 5 min',
      tag: 'Misión',
    ),
    _CardItem(
      icon: Icons.warning_amber_outlined,
      iconColor: Color(0xFFE8A838),
      title: 'Zona de peligro detectada',
      subtitle: 'Actividad anormal cerca del Hospital Alchemilla.',
      time: 'Hace 23 min',
      tag: 'Alerta',
    ),
    _CardItem(
      icon: Icons.check_circle_outline,
      iconColor: Color(0xFF4CAF88),
      title: 'Tarea completada',
      subtitle: 'Encontraste el mapa del distrito histórico.',
      time: 'Hace 1 h',
      tag: 'Logro',
    ),
    _CardItem(
      icon: Icons.inventory_2_outlined,
      iconColor: Color(0xFF7B9FD4),
      title: 'Inventario actualizado',
      subtitle: 'Se añadieron 3 objetos nuevos a tu mochila.',
      time: 'Hace 2 h',
      tag: 'Inventario',
    ),
    _CardItem(
      icon: Icons.person_add_alt_1_outlined,
      iconColor: Color(0xFFCEC9C6),
      title: 'Nuevo sobreviviente encontrado',
      subtitle: 'Heather Mason se ha unido a tu grupo.',
      time: 'Ayer',
      tag: 'Personaje',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Encabezado con imagen de fondo ──────────────────────────────
          _HomeHeader(),

          // ── Título sección ───────────────────────────────────────────────
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'Actividad reciente',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ── ListView con 5 Cards ─────────────────────────────────────────
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              itemCount: _items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) => _RecentCard(item: _items[index]),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Encabezado de Inicio ──────────────────────────────────────────────────────

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        SizedBox(
          height: 160,
          width: double.infinity,
          child: Image.asset('assets/silent-hill-f.jpg', fit: BoxFit.cover),
        ),
        // Degradado sobre la imagen
        Container(
          height: 160,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.35),
                AppColors.background.withValues(alpha: 0.92),
              ],
            ),
          ),
        ),
        // Texto de bienvenida
        const Positioned(
          left: 20,
          bottom: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola, Usuario 👋',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Bienvenido de regreso',
                style: TextStyle(color: AppColors.muted, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Modelo de tarjeta ─────────────────────────────────────────────────────────

class _CardItem {
  const _CardItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.tag,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final String tag;
}

// ─── Card de actividad reciente ────────────────────────────────────────────────

class _RecentCard extends StatelessWidget {
  const _RecentCard({required this.item});
  final _CardItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardSurface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono con fondo de color
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: item.iconColor.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: item.iconColor, size: 22),
            ),
            const SizedBox(width: 12),

            // Contenido
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título + hora
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.time,
                        style: const TextStyle(
                          color: AppColors.subtle,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Descripción
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Tag de categoría
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: item.iconColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: item.iconColor.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      item.tag,
                      style: TextStyle(
                        color: item.iconColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Pestaña: Perfil ───────────────────────────────────────────────────────────

class _ProfileTab extends StatelessWidget {
  const _ProfileTab({required this.onLogout});
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar manual
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              color: AppColors.surface,
              child: const Text(
                'Mi Perfil',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(color: Color(0x14FFFFFF), height: 1),

            // Avatar y nombre
            _ProfileHeader(),

            const SizedBox(height: 8),

            // Info del usuario
            _InfoSection(),

            const SizedBox(height: 24),

            // Botón cerrar sesión
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: onLogout,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFFF4D4D),
                    side: const BorderSide(
                      color: Color(0xFF8B1A1A),
                      width: 1.2,
                    ),
                    backgroundColor: const Color(0xFF1E0A0A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  icon: const Icon(Icons.logout_rounded, size: 20),
                  label: const Text('Cerrar sesión'),
                ),
              ),
            ),

            const SizedBox(height: 40),
            const Text(
              'UN LUGAR ENTRE LA NIEBLA Y LAS FLORES',
              style: TextStyle(
                color: Colors.white24,
                fontSize: 9,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ─── Encabezado del perfil ─────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: Column(
        children: [
          // Avatar
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cardSurface,
                  border: Border.all(
                    color: AppColors.accent.withValues(alpha: 0.5),
                    width: 2.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.2),
                      blurRadius: 18,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 50,
                  color: AppColors.muted,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF88),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Nombre
          const Text(
            'Usuario',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),

          // Correo
          const Text(
            'usuario@silenthill.com',
            style: TextStyle(color: AppColors.muted, fontSize: 13),
          ),
          const SizedBox(height: 10),

          // Badge de rol
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.4),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.local_florist, color: AppColors.accent, size: 12),
                SizedBox(width: 5),
                Text(
                  'Sobreviviente',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sección de información ────────────────────────────────────────────────────

class _InfoSection extends StatelessWidget {
  const _InfoSection();

  static const List<_InfoRow> _rows = [
    _InfoRow(Icons.person_outline, 'Nombre completo', 'Usuario'),
    _InfoRow(
      Icons.mail_outline,
      'Correo electrónico',
      'usuario@silenthill.com',
    ),
    _InfoRow(Icons.calendar_today_outlined, 'Miembro desde', 'Octubre 2026'),
    _InfoRow(Icons.place_outlined, 'Ubicación', 'Silent Hill, Maine'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 8, top: 16),
            child: Text(
              'Información de cuenta',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: Column(
              children: List.generate(_rows.length, (i) {
                final isLast = i == _rows.length - 1;
                return Column(
                  children: [
                    _InfoRowTile(row: _rows[i]),
                    if (!isLast)
                      Divider(
                        color: Colors.white.withValues(alpha: 0.06),
                        height: 1,
                        indent: 52,
                      ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow {
  const _InfoRow(this.icon, this.label, this.value);
  final IconData icon;
  final String label;
  final String value;
}

class _InfoRowTile extends StatelessWidget {
  const _InfoRowTile({required this.row});
  final _InfoRow row;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(row.icon, color: const Color(0xFFE7A0A8), size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  row.label,
                  style: const TextStyle(color: AppColors.subtle, fontSize: 10),
                ),
                const SizedBox(height: 1),
                Text(
                  row.value,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
