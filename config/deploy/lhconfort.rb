role :web, "apollo"
role :app, "apollo"
role :db,  "apollo", primary: true

set :nginx_server_names, "mail.lhconfort.com.ar"
set :brand_description, "Servidor de correo - mail.lhconfort.com.ar"
