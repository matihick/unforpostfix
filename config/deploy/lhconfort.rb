role :web, "lhconfort"
role :app, "lhconfort"
role :db,  "lhconfort", primary: true

set :nginx_server_names, "mail.lhconfort.com.ar"
set :brand_description, "Servidor de correo - LH Confort"
