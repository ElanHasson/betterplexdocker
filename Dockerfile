FROM plexinc/pms-docker:plexpass
RUN apt-get update && apt-get install keyutils cifs-utils -y
RUN mkdir /pmsmedia
RUN echo "//10.16.1.125/video /pmsmedia cifs user=plex,password=plex,file_mode=0777,dir_mode=0777" >> /etc/fstab
RUN echo "//11.16.1.125/docker/plex /config cifs user=plex,password=plex,file_mode=0777,dir_mode=0777" >> /etc/fstab

RUN echo "#!/usr/bin/with-contenv bash" > /etc/cont-init.d/30-mount-cifs
RUN echo "mount -a" >> /etc/cont-init.d/30-mount-cifsQ
