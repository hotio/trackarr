FROM hotio/base@sha256:ae471f9d08cf51928f92ed403a1d571fd3fc24f2771d58403e9963ef82205ba1

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7337

ARG TRACKARR_URL=https://gitlab.com/cloudb0x/trackarr/uploads/f79165c7eec923910a36f219d3adaad0/trackarr_v1.3.0-dev_linux_amd64.tar.gz

# install trackarr
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
