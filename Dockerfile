FROM ricog/cakephp
MAINTAINER Rick Guyer <ricoguyer@gmail.com>

COPY .ssh/ /root/.ssh/
COPY entrypoint.sh /entrypoint.sh
COPY build_app.sh /build_app.sh
COPY build_app_local.sh /build_app_local.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/build_app_local.sh"]
