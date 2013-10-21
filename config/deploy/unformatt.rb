role :web, "unformatt"
role :app, "unformatt"
role :db,  "unformatt", primary: true

set :nginx_server_names, "mail.unformatt.com.ar"
set :brand_description, "Servidor de correo - mail.unformatt.com.ar"
