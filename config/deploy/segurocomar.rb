role :web, "segurocomar"
role :app, "segurocomar"
role :db,  "segurocomar", primary: true

set :nginx_server_names, "mail.seguro.com.ar"
set :brand_description, "Servidor de correo - LH Confort"
