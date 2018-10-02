FROM fedora:28

# Install build dependencies
RUN INSTALL_PKGS="git golang dep make" && \
    dnf install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    dnf clean all -y

# GOPATH
ENV GOPATH=/go

# Inject build scripts
COPY ./scripts /build/scripts/
