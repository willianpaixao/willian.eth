FROM nginx:alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a10

LABEL org.opencontainers.image.authors="Willian Paixao <willian@ufpa.br>"
LABEL org.opencontainers.image.description="Willian Paixao's personal website"
LABEL org.opencontainers.image.source="https://github.com/willianpaixao/willian.eth"
LABEL org.opencontainers.image.title="willian.eth"

# Copy the public directory (pre-built static files)
COPY /public/ /usr/share/nginx/html/

# Expose port 80/tcp
EXPOSE 80/tcp

# Set up healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
