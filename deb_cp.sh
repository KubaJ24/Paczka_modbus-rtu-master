#!/bin/bash

# Skrypt do przenoszenia paczek do repo

# Zmienne
PROG_NAME=".deb copier"

echo "${PROG_NAME}"

# Kopiowanie paczki .deb
cp ~/Desktop/programs/modbus/RPi3B_modbus_for_KALi/modbus-rtu-master-0.9.2.deb pool/main/

# Tworzenie paczek
# dists/stable...
dpkg-scanpackages pool /dev/null > dists/stable/main/binary-armhf/Packages
gzip -f dists/stable/main/binary-armhf/Packages
dpkg-scanpackages pool /dev/null > dists/stable/main/binary-arm64/Packages
gzip -f dists/stable/main/binary-arm64/Packages
# main/dists/stable...
dpkg-scanpackages pool /dev/null > main/dists/stable/main/binary-armhf/Packages
gzip -f main/dists/stable/main/binary-armhf/Packages
dpkg-scanpackages pool /dev/null > main/dists/stable/main/binary-arm64/Packages
gzip -f main/dists/stable/main/binary-arm64/Packages

echo "Paczki skopiowane do repozytorium 'modbus-rtu-master-repo'"

