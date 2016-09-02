server {
        listen 80;
        listen [::]:80;
        root /var/www/codecore.io;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name *.amazonaws.com;

        location / {

                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}