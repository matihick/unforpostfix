role :web, "jupiter"
role :app, "jupiter"
role :db,  "jupiter", primary: true

set :nginx_server_names, "mail.seguro.com.ar"
set :brand_description, "Servidor de correo - mail.seguro.com.ar"
