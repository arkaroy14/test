FROM nginx:1.19.6
COPY rclone /usr/bin/
RUN chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone &&\
    mkdir -p /usr/local/share/man/man1 
COPY rclone.1 /usr/local/share/man/man1/
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget\
    && apt autoremove -y \
    && apt-get install -y man-db \
    && mandb

COPY entrypoint.sh /entrypoint.sh
COPY rclone.conf /.config/rclone/rclone.conf
COPY htpasswd /.config/rclone/htpasswd
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
