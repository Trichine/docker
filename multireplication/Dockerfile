FROM debian:buster-slim

# Installation de MariaDB et du client MySQL
RUN apt-get update \
    && apt-get install -y mariadb mysql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Définition des variables d'environnement
ENV DBHOST=db
ENV DBLOGIN=root
ENV DBPORT=3306
ENV DBPASS="1234"
ENV CRONH=2
ENV CRONM=0

# Copie du script SQL d'initialisation
COPY init.sql /docker-entrypoint-initdb.d/

# Ajout du script de sauvegarde et du point d'entrée
ADD backup_host.sh /
COPY ./entrypoint.sh /
RUN chmod a+x /entrypoint.sh /backup_host.sh

# Point d'entrée pour le démarrage du conteneur
ENTRYPOINT ["/entrypoint.sh"]
