# (c) Cartesi and individual authors (see AUTHORS)
# SPDX-License-Identifier: Apache-2.0 (see LICENSE)

FROM cartesi/server-manager:0.8.0

ARG user
ARG group
ARG uid
ARG gid

USER root

RUN if ! getent group ${gid}; then \
        groupadd -g ${gid} ${group}; \
    fi

RUN useradd -u ${uid} -g ${gid} -s /bin/sh -m ${user}

USER ${uid}:${gid}
