role :web, "triplemsales"
role :app, "triplemsales"
role :db,  "triplemsales", primary: true

set :nginx_server_names, "mail.triplemsales.com.ar"
set :brand_description, "Servidor de correo - mail.triplemsales.com.ar"
