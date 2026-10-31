# 🌫️ Silent Hill F — App Flutter

> Proyecto académico desarrollado como taller práctico de Flutter, con navegación multi-pantalla, componentes de autenticación reutilizables y gestión de estado local.

---

## 📋 Descripción

**Silent Hill F** es una aplicación móvil desarrollada en Flutter que simula un sistema de autenticación completo y un dashboard de usuario. El proyecto fue diseñado con una temática visual inspirada en el videojuego *Silent Hill f*, con colores oscuros, imágenes de fondo y elementos de UI modernos.

La aplicación cubre el flujo completo de un usuario: desde la pantalla de carga inicial hasta el panel principal con navegación por pestañas, pasando por el inicio de sesión, registro y recuperación de contraseña.

---

## 🎯 Objetivos

- Implementar navegación entre múltiples pantallas usando `Navigator` y rutas nombradas.
- Aplicar validación de formularios con `GlobalKey<FormState>` y `TextFormField`.
- Simular flujos de autenticación (login, registro, recuperación de contraseña) con indicadores de carga.
- Construir un Dashboard funcional con `BottomNavigationBar` e `IndexedStack`.
- Mostrar listas dinámicas usando `ListView` y `Card`.
- Organizar rutas, colores y widgets compartidos en archivos independientes.
- Aplicar buenas prácticas de UI/UX con temas, colores y componentes reutilizables.

---

## 🛠️ Tech Stack

| Tecnología | Versión | Uso |
|------------|---------|-----|
| **Flutter** | 3.47 o compatible | Framework principal de UI |
| **Dart** | ≥ 3.13.7 | Lenguaje de programación |
| **Material Design 3** | Incluido en Flutter | Sistema de diseño y componentes |
| **Flutter Navigator** | Built-in | Navegación entre pantallas |
| **StatefulWidget** | Built-in | Gestión de estado local |

### Dependencias (`pubspec.yaml`)

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

---

## 🗂️ Estructura del Proyecto

```
taller/
├── lib/
│   ├── main.dart                    # Punto de entrada y MaterialApp
│   ├── routes/
│   │   └── app_routes.dart          # Rutas nombradas centralizadas
│   ├── theme/
│   │   └── app_colors.dart          # Paleta de colores compartida
│   ├── widgets/
│   │   └── auth_widgets.dart        # Campos y componentes reutilizables
│   └── presentation/pages/
│       ├── splash.dart
│       ├── login.dart
│       ├── register.dart
│       ├── forgot_password_page.dart
│       ├── dashboard_page.dart
│       └── profile_page.dart
├── test/
│   └── widget_test.dart
├── assets/
│   └── silent-hill-f.jpg
├── web/
├── .github/workflows/
│   └── deploy.yml                   # Build y deploy automático a Pages
├── pubspec.yaml
└── README.md
```

---

## 📱 Pantallas implementadas

| Pantalla | Archivo | Descripción |
|----------|---------|-------------|
| **Splash** | `splash.dart` | Logo + indicador de carga por 3 segundos |
| **Login** | `login.dart` | Email, contraseña, loading 2s → Dashboard |
| **Registro** | `register.dart` | Nombre, email, contraseña, validación, loading 2s → Login |
| **Recuperar contraseña** | `forgot_password_page.dart` | Email + SnackBar de confirmación |
| **Dashboard** | `dashboard_page.dart` | BottomNavigationBar: Inicio + Perfil |
| **Perfil** | `profile_page.dart` | Avatar, info de usuario, cerrar sesión |

---

## 🧭 Flujo de Navegación

```
Splash (3s)
    └─► Login
            ├─► [Ingresar] → loading 2s → Dashboard
            │                                 ├─ Tab Inicio: "Hola, Usuario" + 5 Cards
            │                                 └─ Tab Perfil: avatar, info, [Cerrar sesión] → Login
            ├─► Registrarse → loading 2s → SnackBar éxito → Login
            └─► ¿Olvidaste tu contraseña? → SnackBar confirmación
```

---

## 🚀 Cómo ejecutar el proyecto

```bash
# 1. Clonar el repositorio
git clone <url-del-repositorio>
cd taller

# 2. Instalar dependencias
flutter pub get

# 3. Verificar el entorno
flutter doctor

# 4. Ejecutar la aplicación
flutter run

# Para ejecutar en Chrome (web)
flutter run -d chrome
```

---

## 🌐 Despliegue en GitHub Pages

El workflow `.github/workflows/deploy.yml` compila la versión web y la publica automáticamente cuando se envía un commit a `main` o `master`, o al ejecutarlo manualmente desde GitHub Actions.

Para habilitarlo en el repositorio:

1. Sube el proyecto a GitHub y conserva la rama principal `main` o `master`.
2. En **Settings → Pages**, selecciona **GitHub Actions** como origen del despliegue.
3. Envía los cambios a la rama principal. GitHub Actions compilará y publicará la aplicación.

La URL publicada tendrá el formato `https://<usuario>.github.io/<repositorio>/`.

## ✅ Requisitos del sistema

- Flutter SDK `3.47` o compatible
- Dart SDK `^3.13.7` (definido en `pubspec.yaml`)
- Android Studio / VS Code con extensión de Flutter
- Dispositivo físico o emulador configurado

---

## 👩‍💻 Autor

| Campo | Detalle |
|-------|---------|
| **Nombre** | Maria Camila Tobón |
| **Curso** | Desarrollo de Aplicaciones Móviles |
| **Proyecto** | Taller práctico — Flutter |
| **Fecha** | Octubre 2026 |

---

<p align="center">
  Hecho con ❤️ y Flutter · <em>Un lugar entre la niebla y las flores</em>
</p>
