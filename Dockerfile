FROM debian:latest
RUN  apt update \
  && DEBIAN_FRONTEND=noninteractive apt upgrade -y \
  && mkdir -p /var/run/vsftpd/empty \
  && DEBIAN_FRONTEND=noninteractive apt install -y vsftpd ftp \
  && rm /etc/pam.d/vsftpd \
  && mkdir /home/ftpuser \
  && useradd ftpuser \
  && echo "ftpuser:ftpuser" | chpasswd \
  && chown -R ftpuser:ftpuser /home/ftpuser
EXPOSE 20 21
CMD vsftpd