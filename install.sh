#!/bin/bash

# Colores para mensajes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Mensaje de bienvenida
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                        ║${NC}"
echo -e "${BLUE}║  ${GREEN}Quick Drupal Installer Pro${BLUE}                           ║${NC}"
echo -e "${BLUE}║  ${YELLOW}Instalador avanzado de Drupal 11 con temas React${BLUE}    ║${NC}"
echo -e "${BLUE}║                                                        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Verificar permisos de ejecución
if [ ! -x "$(pwd)/install-drupal-pro.sh" ]; then
  echo -e "${YELLOW}Configurando permisos de ejecución...${NC}"
  chmod +x "$(pwd)/install-drupal-pro.sh"
fi

# Preguntar por el nombre del proyecto
read -p "Ingrese el nombre del proyecto: " PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
  echo -e "${RED}Error: Debe especificar un nombre de proyecto.${NC}"
  exit 1
fi

# Preguntar por instalación completa
read -p "¿Desea realizar una instalación completa? (s/n): " FULL_INSTALL
FULL_OPTION=""
if [[ "$FULL_INSTALL" =~ ^[Ss]$ ]]; then
  FULL_OPTION="-f"
fi

# Preguntar por tema React
read -p "¿Desea instalar un tema React? (s/n): " INSTALL_REACT
REACT_OPTION=""
GIT_OPTION=""
if [[ "$INSTALL_REACT" =~ ^[Ss]$ ]]; then
  REACT_OPTION="-r"
  
  # Preguntar por URL del repositorio Git
  read -p "URL del repositorio Git para el tema React (dejar en blanco para omitir): " REACT_REPO
  if [ -n "$REACT_REPO" ]; then
    GIT_OPTION="-g $REACT_REPO"
  fi
fi

# Preguntar por opciones avanzadas
read -p "¿Desea configurar opciones avanzadas (usuario, contraseña, etc.)? (s/n): " ADVANCED_OPTIONS
ADMIN_OPTIONS=""
if [[ "$ADVANCED_OPTIONS" =~ ^[Ss]$ ]]; then
  read -p "Nombre de usuario administrador (predeterminado: admin): " ADMIN_USER
  if [ -n "$ADMIN_USER" ]; then
    ADMIN_OPTIONS="$ADMIN_OPTIONS -u $ADMIN_USER"
  fi
  
  read -p "Contraseña de administrador (predeterminado: admin): " ADMIN_PASS
  if [ -n "$ADMIN_PASS" ]; then
    ADMIN_OPTIONS="$ADMIN_OPTIONS -p $ADMIN_PASS"
  fi
  
  read -p "Correo electrónico de administrador (predeterminado: admin@example.com): " ADMIN_EMAIL
  if [ -n "$ADMIN_EMAIL" ]; then
    ADMIN_OPTIONS="$ADMIN_OPTIONS -e $ADMIN_EMAIL"
  fi
  
  read -p "Nombre del sitio (predeterminado: My Drupal CMS Pro): " SITE_NAME
  if [ -n "$SITE_NAME" ]; then
    ADMIN_OPTIONS="$ADMIN_OPTIONS -n \"$SITE_NAME\""
  fi
fi

# Construir el comando completo
COMMAND="./install-drupal-pro.sh $FULL_OPTION $REACT_OPTION $GIT_OPTION $ADMIN_OPTIONS $PROJECT_NAME"

echo ""
echo -e "${YELLOW}Comando a ejecutar:${NC}"
echo -e "${GREEN}$COMMAND${NC}"
echo ""

# Confirmar ejecución
read -p "¿Desea continuar con la instalación? (s/n): " CONFIRM
if [[ "$CONFIRM" =~ ^[Ss]$ ]]; then
  # Ejecutar el comando
  eval "$COMMAND"
else
  echo -e "${RED}Instalación cancelada.${NC}"
  exit 0
fi
