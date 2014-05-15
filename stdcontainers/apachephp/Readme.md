Apache2.4 running wiht PHP support via PHP-FPM. The (PHP) worker count is static, and defaults to 8. You can override this by passing in the `FPM_WORKERS` environment variable.

It expects the documentroot to be /var/www/html, you will want to mount this is in manually with your source code:

    docker run -d -p 80 -v /my/docroot:/var/www/html -e "FPM_WORKERS=16" <imagename>
