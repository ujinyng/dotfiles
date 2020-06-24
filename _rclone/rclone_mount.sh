#!/bin/zsh

# Enable option
# cmount -o modules=iconv,from_code=UTF-8,to_code=UTF-8-MAC
# --cache-db-purge
# --dir-cache-time [h/m/s]
# --umask 000
# --fast-list
# --log-file [path]
# # -vv #more detail log
# --daemon

#Google Drive(Gdrive/gdrive_cache/gdrive_crypt)
#default poll-interval is 1m

#for utf-8 but too slow
# rclone cmount -o modules=iconv,from_code=UTF-8,to_code=UTF-8-MAC GdriveCache: ~/Gdrive --allow-other --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 72h --fast-list -vv

# rclone mount gdrive_crypt: ~/Gdrive --allow-other --allow-non-empty --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 48h --cache-info-age 76h --fast-list -vv --daemon

# rclone mount GdriveCache: ~/Gdrive --allow-other --allow-non-empty --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 48h --cache-info-age 76h --fast-list --log-file ~/logs/rclone_gdrive.log -v --daemon

rclone mount Gdrive: ~/Gdrive --allow-other --allow-non-empty --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 48h --cache-info-age 76h --fast-list --log-file ~/logs/rclone_gdrive.log -v --daemon

#Dropbox(Dropbox/dropbox_cache/dropbox_crypt)
#poll-interval is not supoorted in dropbox, so need to set --dir-cache-time to small, which sould be smaller than --info-age
#default info-age is 6h

#for utf-8 but too slow
# rclone cmount -o modules=iconv,from_code=UTF-8,to_code=UTF-8-MAC DboxCache: ~/Dbox --allow-other --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 1m --fast-list -vv

# rclone mount dropbox_crypt: ~/Dbox --allow-other --allow-non-empty --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 10s --fast-list -vv --daemon

# rclone mount DboxCache: ~/Dbox --allow-other --allow-non-empty --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 10s --fast-list --log-file ~/logs/rclone_dropbox.log -v --daemon

# rclone mount Dbox: ~/Dbox --allow-other --allow-non-empty --use-mmap --timeout 1h --vfs-cache-mode writes --dir-cache-time 5s --fast-list --log-file ~/logs/rclone_dropbox.log -v --daemon


#Rclone web browser
# rclone rcd --rc-web-gui --daemond
