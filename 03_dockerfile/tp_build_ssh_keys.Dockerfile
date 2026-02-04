FROM debian:13

# Variables
ARG user
ARG pubkey_file

# Installation serveur SSH 
RUN apt update
RUN apt install -y openssh-server

# Création utilisateur et configuration
# de l'authentification par clés SSH 
RUN useradd -m -s /bin/bash ${user}
RUN mkdir -p /home/${user}/.ssh
RUN chmod 700 /home/${user}/.ssh
COPY ${pubkey_file} /home/${user}/.ssh/authorized_keys
RUN chmod 600 /home/${user}/.ssh/authorized_keys
RUN chown -R ${user}:${user} /home/${user}/.ssh

EXPOSE 22/tcp

CMD [ "/usr/sbin/sshd", "-D" ]