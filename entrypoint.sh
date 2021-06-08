rclone version
rclone serve webdav "mega3:" --addr :$PORT --htpasswd "/.config/rclone/htpasswd" --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes
