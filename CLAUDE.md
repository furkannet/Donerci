# Döner Dükkanı – Proje Şartnamesi

Tarayıcıda çalışan, three.js tabanlı 3D döner dükkanı simülatörü. Canlı adres: https://furkannet.github.io/Donerci/

## Kurallar (her değişiklikte uyulmalı)

1. **Bağımlılık yok.** Proje hiçbir harici bağımlılığa dayanmaz: npm paketi, derleme/bundle aracı, CDN veya harici servis kullanılmaz. Her şey düz HTML/CSS/JS olarak [index.html](index.html) içinde veya depodaki yerel dosyalarda durur. Mevcut istisna: yerel kopya [three.min.js](three.min.js). Yeni kütüphane eklenmez.
2. **Önce telefon.** Uygulama özellikle telefonda (yatay konumda) kullanılacaktır. Her arayüz ve düzen kararı önce telefon ekranına göre verilir, sonra masaüstüne uyarlanır. Dokunmatik kullanım, küçük ekranda yer tasarrufu ve parmakla basılabilir düğmeler önceliklidir. Değişiklikler en az 740×360 (yatay telefon) boyutunda kontrol edilir.
3. **Her güncelleme GitHub'a yüklenir.** Yapılan her değişiklik `./yayinla.sh "ne değişti"` ile commit edilip GitHub'a gönderilir (`furkannet/Donerci`, GitHub Pages ile yayınlanır). Claude Code'da bu, [.claude/settings.json](.claude/settings.json) içindeki Stop hook'u ([.claude/auto-publish.sh](.claude/auto-publish.sh)) ile otomatik yapılır. Yükleme başarısız olursa kullanıcıya açıkça bildirilir.

## Yayın ve sürüm

- `yayinla.sh` sürüm numarasını (`APP_VERSION` ve `version.json`) yeniler. Oyun bu numarayı sunucudakiyle karşılaştırıp güncelleme uyarısı gösterir; sürüm etiketi ekranın altında görünür.
- Sürüm numarasını elle değiştirme; yayın betiği yönetir.
