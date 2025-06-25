# Quick Drupal Installer Pro

Una herramienta avanzada para instalar rápidamente Drupal 11 con integración de temas React.

## Características

- Instalación rápida de Drupal 11 con DDEV
- Integración opcional de temas React
- Clonación de repositorios Git de temas React
- Configuración automática del tema para eliminar estilos de Drupal
- Soporte para desarrollo con React/Preact
- Instalación global mediante curl o wget

## Requisitos

- DDEV instalado
- Git instalado
- Bash shell
- curl o wget (para la instalación global)

## Instalación

Elija uno de estos métodos:

1. Usando curl:

```bash
curl -o- https://raw.githubusercontent.com/seedembrian/quick-drupal-installer-pro/master/install.sh | sh
```

2. Usando wget:

```bash
wget -qO- https://raw.githubusercontent.com/seedembrian/quick-drupal-installer-pro/master/install.sh | sh
```

3. O descargue y ejecute manualmente:

```bash
# Descargar el instalador
curl -o install-drupal-pro.sh https://raw.githubusercontent.com/seedembrian/quick-drupal-installer-pro/master/install.sh

# Hacerlo ejecutable
chmod +x install-drupal-pro.sh

# Ejecutar el instalador
./install-drupal-pro.sh
```

Esto instalará dos comandos en su sistema:
- `quick-drupal-pro`: Para uso directo con opciones de línea de comandos
- `quick-drupal-pro-interactive`: Para una experiencia guiada con preguntas interactivas

## Uso

### Modo interactivo

```bash
quick-drupal-pro-interactive
```

### Modo directo

```bash
quick-drupal-pro [opciones] nombre-proyecto
```

### Opciones

- `-f, --full`: Instalación automática completa
- `-u, --user USUARIO`: Nombre de usuario administrador (predeterminado: admin)
- `-p, --pass CONTRASEÑA`: Contraseña de administrador (predeterminado: admin)
- `-e, --email EMAIL`: Correo electrónico de administrador (predeterminado: admin@example.com)
- `-n, --name NOMBRE`: Nombre del sitio (predeterminado: My Drupal CMS Pro)
- `-r, --react`: Instalar tema React
- `-g, --git URL`: URL del repositorio Git para el tema React
- `-h, --help`: Mostrar ayuda

### Ejemplos

```bash
# Instalación básica de Drupal con tema React (preguntará la URL)
quick-drupal-pro -r mi-drupal-pro

# Instalación completa con tema React desde un repositorio específico
quick-drupal-pro -f -r -g https://github.com/user/react-theme.git mi-drupal-pro

# Instalación completa con opciones personalizadas y tema React
quick-drupal-pro -f -u admin -p secreto -e admin@example.com -n "Mi sitio Pro" -r mi-drupal-pro
```

## Estructura del tema React

El tema React se instalará en `web/themes/custom/theme_react/` con la siguiente estructura:

```
theme_react/
├── react-src/           # Código fuente de React (clonado o creado)
│   └── dist/            # Archivos compilados (generados por npm run build)
│       └── assets/      # Archivos JS y CSS con hash
├── templates/           # Plantillas Twig de Drupal
│   ├── html.html.twig   # Plantilla HTML principal
│   └── page.html.twig   # Plantilla de página con div #app
├── theme_react.info.yml # Configuración del tema
├── theme_react.libraries.yml # Definición de bibliotecas
└── theme_react.theme    # Hooks de PHP para integración
```

## Desarrollo

Para trabajar con el tema React después de la instalación:

1. Navega a la carpeta del tema React: `cd web/themes/custom/theme_react/react-src`
2. Instala dependencias si es necesario: `npm install`
3. Ejecuta el servidor de desarrollo: `npm run dev`
4. Compila para producción: `npm run build`
5. Limpia la caché de Drupal: `ddev drush cr`

## Desinstalación

Para desinstalar los comandos globales:

```bash
sudo rm /usr/bin/quick-drupal-pro /usr/bin/quick-drupal-pro-interactive
```
