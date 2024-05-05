FROM alpine:3.12
RUN wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.15.0/kubeseal-linux-amd64 -O kubeseal
RUN install -m 755 kubeseal /usr/local/bin/kubeseal
RUN wget https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
RUN install -m 755 kubectl /usr/local/bin/kubectl