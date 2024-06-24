# Utiliser une image de base appropriée
FROM registry.redhat.io/ubi8/ubi-minimal

# Installer les dépendances
RUN microdnf install -y fuse wget \
    && microdnf clean all

# Télécharger le fichier .AppImage depuis GitHub
RUN mkdir -p /app \
    && wget -O /app/glpi-agent-1.9-x86_64.AppImage https://github.com/glpi-project/glpi-agent/releases/download/1.9/glpi-agent-1.9-x86_64.AppImage

# Rendre le fichier .AppImage exécutable
RUN chmod +x /app/glpi-agent-1.9-x86_64.AppImage

# Commande pour maintenir le conteneur actif
CMD ["/app/glpi-agent-1.9-x86_64.AppImage"]
