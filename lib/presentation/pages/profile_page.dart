import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  /// Si [embeddedInDashboard] es true, la página se muestra dentro del
  /// BottomNavigationBar del Dashboard (sin AppBar propia).
  const ProfilePage({super.key, this.embeddedInDashboard = false});

  final bool embeddedInDashboard;

  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: embeddedInDashboard
          ? AppBar(
              backgroundColor: AppColors.surface,
              elevation: 0,
              centerTitle: false,
              title: const Text(
                'Mi Perfil',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Divider(
                  color: Colors.white.withValues(alpha: 0.08),
                  height: 1,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Encabezado de perfil ─────────────────────────────────────
            _ProfileHeader(onLogout: () => _logout(context)),

            const SizedBox(height: 8),

            // ── Información del usuario ──────────────────────────────────
            _InfoSection(),

            const SizedBox(height: 20),

            // ── Botón Cerrar sesión ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _LogoutButton(onPressed: () => _logout(context)),
            ),

            const SizedBox(height: 40),

            // ── Pie de página ────────────────────────────────────────────
            const Text(
              'UN LUGAR ENTRE LA NIEBLA Y LAS FLORES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white30,
                fontSize: 9,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ─── Encabezado del perfil ─────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.onLogout});
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.07)),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
      child: Column(
        children: [
          // Avatar circular
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
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
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 56,
                  color: AppColors.muted,
                ),
              ),
              // Badge de estado activo
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF88),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 3),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Nombre
          const Text(
            'Usuario',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 4),

          // Correo
          const Text(
            'usuario@silenthill.com',
            style: TextStyle(color: AppColors.muted, fontSize: 14),
          ),

          const SizedBox(height: 12),

          // Chip de rol/estado
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
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
                Icon(Icons.local_florist, color: AppColors.accent, size: 13),
                SizedBox(width: 5),
                Text(
                  'Sobreviviente',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
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

  final List<_InfoRow> _rows = const [
    _InfoRow(
      icon: Icons.person_outline,
      label: 'Nombre completo',
      value: 'Usuario',
    ),
    _InfoRow(
      icon: Icons.mail_outline,
      label: 'Correo electrónico',
      value: 'usuario@silenthill.com',
    ),
    _InfoRow(
      icon: Icons.calendar_today_outlined,
      label: 'Miembro desde',
      value: 'Octubre 2026',
    ),
    _InfoRow(
      icon: Icons.place_outlined,
      label: 'Ubicación',
      value: 'Silent Hill, Maine',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              'Información de cuenta',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
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
                    _InfoRowWidget(row: _rows[i]),
                    if (!isLast)
                      Divider(
                        color: Colors.white.withValues(alpha: 0.06),
                        height: 1,
                        indent: 54,
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
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}

class _InfoRowWidget extends StatelessWidget {
  const _InfoRowWidget({required this.row});
  final _InfoRow row;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(row.icon, color: const Color(0xFFE7A0A8), size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  row.label,
                  style: const TextStyle(color: AppColors.subtle, fontSize: 11),
                ),
                const SizedBox(height: 1),
                Text(
                  row.value,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 14,
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

// ─── Botón de cerrar sesión ────────────────────────────────────────────────────

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFFFF4D4D),
          side: const BorderSide(color: Color(0xFF8B1A1A), width: 1.2),
          backgroundColor: const Color(0xFF1E0A0A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        icon: const Icon(Icons.logout_rounded, size: 20),
        label: const Text('Cerrar sesión'),
      ),
    );
  }
}
