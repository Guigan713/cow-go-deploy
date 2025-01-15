# FROM golang:1.24rc1-bookworm

# RUN apt update

# COPY main* main

# WORKDIR /go

# ENTRYPOINT ["./main"]

# Utiliser une image Go de base
FROM golang:1.20-alpine as builder

# Définir le répertoire de travail
WORKDIR /app

# Copier le binaire Go compilé dans l'image
COPY ./bin/gocow /app/gocow

# Définir la commande par défaut pour l'image Docker
CMD ["./main"]



