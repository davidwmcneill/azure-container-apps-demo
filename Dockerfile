FROM klakegg/hugo:0.93.2-ext-alpine AS hugo
ARG env=staging

COPY ./ /site
WORKDIR /site
RUN hugo --environment $env

FROM nginxinc/nginx-unprivileged
COPY nginx/nginx-app.conf /etc/nginx/conf.d/
COPY nginx/nginx-prod.conf /etc/nginx/nginx.conf
COPY --from=hugo /site/public /usr/share/nginx/html
