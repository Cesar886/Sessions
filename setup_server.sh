#!/bin/bash

# Script de configuración del servidor para el sistema de Telegram
echo "🚀 Configurando servidor para sistema de Telegram..."

# Actualizar sistema
echo "📦 Actualizando sistema..."
apt update && apt upgrade -y

# Instalar dependencias del sistema
echo "🔧 Instalando dependencias del sistema..."
apt install -y python3 python3-pip nodejs npm git curl

# Instalar PM2 globalmente
echo "⚙️ Instalando PM2..."
npm install -g pm2

# Crear directorio del proyecto
echo "📁 Creando directorio del proyecto..."
mkdir -p /root/telegram-bot-system
cd /root/telegram-bot-system

# Crear directorio de logs
mkdir -p logs

# Crear directorio de sesiones
mkdir -p sessions

# Instalar dependencias de Python
echo "🐍 Instalando dependencias de Python..."
pip3 install pyrogram flask flask-cors pymongo requests

# Configurar firewall para permitir el puerto 5000
echo "🔥 Configurando firewall..."
ufw allow 5000/tcp

# Crear servicio systemd para PM2 (opcional, para auto-inicio)
echo "🔄 Configurando auto-inicio con systemd..."
pm2 startup systemd -u root --hp /root

echo "✅ Configuración del servidor completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Copia los archivos del proyecto al directorio /root/telegram-bot-system/"
echo "2. Configura tu cadena de conexión de MongoDB en telegram_production_system.py"
echo "3. Copia tus archivos de sesión a /root/telegram-bot-system/sessions/"
echo "4. Ejecuta: pm2 start ecosystem.config.js"
echo "5. Ejecuta: pm2 save"
echo ""
echo "🌐 El sistema estará disponible en http://TU_IP_SERVIDOR:5000"

