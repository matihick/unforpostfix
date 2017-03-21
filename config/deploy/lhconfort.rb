role :web, "apollo"
role :app, "apollo"
role :db,  "apollo", primary: true

set :nginx_server_names, 'mail.lhconfort.com.ar'
set :nginx_ssl_private_key, '/etc/ssl/private/star_lhconfort_com_ar.key'
set :nginx_ssl_certificate, '/etc/ssl/certs/star_lhconfort_com_ar_chained.crt'
