#!/bin/sh
# Claude her turu bitirdiğinde çalışır: değişiklik varsa yayinla.sh ile GitHub'a gönderir.
cd "$(dirname "$0")/.." || exit 0
[ -n "$(git status --porcelain)" ] || exit 0

if out=$(./yayinla.sh "Otomatik güncelleme" 2>&1); then
  echo '{"systemMessage":"Degisiklikler GitHub a yuklendi (site 1-2 dk icinde guncellenir)."}'
else
  echo '{"systemMessage":"GitHub a yukleme BASARISIZ. Terminalde ./yayinla.sh calistirip hataya bak."}'
fi
exit 0
