#!/bin/sh
# Kullanım: ./yayinla.sh "ne değişti"
# Sürüm numarasını yeniler (oyundaki uyarı bu sayede tetiklenir), commit eder ve GitHub'a gönderir.
set -e
cd "$(dirname "$0")"
V=$(date +%Y-%m-%d-%H%M%S)
sed -i "s/const APP_VERSION = '[^']*'/const APP_VERSION = '$V'/" index.html
printf '{"version":"%s"}\n' "$V" > version.json
git add -A
git commit -m "${1:-Güncelleme} ($V)"
git push
echo "Yayınlandı: $V (1-2 dakika içinde canlıya geçer)"
