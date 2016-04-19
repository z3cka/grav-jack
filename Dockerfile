FROM ahumaro/grav-php-nginx

MAINTAINER Casey Grzecka <c@sey.gr>

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Grab mah keys!!
RUN curl https://github.com/z3cka.keys -o /root/.ssh/authorized_keys

# Grab mah source!
RUN git clone git@github.com:z3cka/grav-jack.git /usr/share/nginx/grav-jack

# Link mah user dir!
RUN ln -s /usr/share/nginx/html/user /usr/share/nginx/grav-jack/user

# chown mah stuff!!
RUN chown -R www-data:www-data /usr/share/nginx/grav-jack
RUN chmod -R 775 /usr/share/nginx/grav-jack

# Grav install!
RUN cd /usr/share/nginx/html && ./bin/grav install