role :web, "thecleangarden"
role :app, "thecleangarden"
role :db,  "thecleangarden", primary: true

set :nginx_server_names, 'mail.thecleangarden.com.ar'
set :nginx_ssl_private_key, '/etc/ssl/private/mail_thecleangarden_com_ar.key'
set :nginx_ssl_certificate, '/etc/ssl/certs/mail_thecleangarden_com_ar_chained.crt'
set :nginx_ssl_ciphers, ENV['CLEANGARDEN_NGINX_SSL_CIPHERS']
