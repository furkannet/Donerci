# Döner Dükkanı – Proje Şartnamesi

Tarayıcıda çalışan, three.js tabanlı 3D döner dükkanı simülatörü. Canlı adres: https://furkannet.github.io/Donerci/

## Kurallar (her değişiklikte uyulmalı)

1. **Bağımlılık yok.** Proje hiçbir harici bağımlılığa dayanmaz: npm paketi, derleme/bundle aracı, CDN veya harici servis kullanılmaz. Her şey düz HTML/CSS/JS olarak [index.html](index.html) içinde veya depodaki yerel dosyalarda durur. Mevcut istisna: yerel kopya [three.min.js](three.min.js). Yeni kütüphane eklenmez.
2. **Önce telefon.** Uygulama özellikle telefonda (yatay konumda) kullanılacaktır. Her arayüz ve düzen kararı önce telefon ekranına göre verilir, sonra masaüstüne uyarlanır. Dokunmatik kullanım, küçük ekranda yer tasarrufu ve parmakla basılabilir düğmeler önceliklidir. Değişiklikler en az 740×360 (yatay telefon) boyutunda kontrol edilir.
3. **Her güncelleme GitHub'a yüklenir.** Yapılan her değişiklik `./yayinla.sh "ne değişti"` ile commit edilip GitHub'a gönderilir (`furkannet/Donerci`, GitHub Pages ile yayınlanır). Claude Code'da bu, [.claude/settings.json](.claude/settings.json) içindeki Stop hook'u ([.claude/auto-publish.sh](.claude/auto-publish.sh)) ile otomatik yapılır. Yükleme başarısız olursa kullanıcıya açıkça bildirilir.

4. **Grafikler performansı etkilememeli.** Projedeki tüm grafikler düşük donanımlı telefonlarda akıcı çalışacak şekilde tasarlanır; bundan sonra eklenen her grafik de bu ilkelere uyar:
   - Düşük poligon: küçük segment sayılı geometriler (küre/silindir için en çok ~12 segment), basit kutu ve silindir formları.
   - Yalnızca ucuz malzemeler: `MeshLambertMaterial` veya `MeshBasicMaterial`. `MeshStandard`/`Physical`, gölge, yansıma ve post-processing kullanılmaz.
   - Aynı renkli malzemeler paylaşılır: `M(renk)` önbellekli kullanılır, nesne başına yeni malzeme/geometri üretilmez; tekrarlayan nesneler ortak geometriyi (`GEO`) kullanır.
   - Işık sayısı en az tutulur (şu an 3 nokta ışığı); yeni nokta ışığı eklenmez. Kenar yumuşatma kapalı, `pixelRatio` en fazla 2 (`DPR_MAX`) ve uyarlanabilir kalite ile düşer.
   - Doku boyutları küçük tutulur ve yeniden kullanılır; büyük dosya/görsel eklenmez.
   - Kare başına yeni nesne oluşturulmaz (çöp toplama takılması); kare başında DOM'a yalnızca değer değiştiyse yazılır (`disp`/`txt`/`sty` yardımcıları).
   - Uyarlanabilir çözünürlük açıktır: kare hızı 40 FPS altına düşünce çözünürlük otomatik %50'ye kadar küçülür, rahatlayınca yükselir. Yeni grafik bu mekanizmayı bozmaz.
   - Yeni bir grafik eklenince etkisi `FPS` göstergesiyle kontrol edilir; gözle görülür düşüş varsa sadeleştirilir.

5. **İletişim ve Onay Kuralı (7. Sınıf Öğrencisi İçin Zorunlu Kural):**
   - Bu programı 7. sınıfa giden bir öğrenci yazmaktadır. Kendisi uzun yazıları okurken sıkılır ve bir şeyi uzun anlatmayı sevmez.
   - **Çok kısa ve sade yaz:** Tüm yanıtlar 1-2 kısa cümleden oluşmalı, uzun açıklamalardan kaçınılmalıdır.
   - **Önce ne anladığını yaz ve onay iste:** Kullanıcı bir komut verdiğinde, kodları değiştirmeden önce komuttan anladığın şeyi kısaca ona yaz.
   - **Onay almadan kodu değiştirme:** Kullanıcıdan açık onay ("evet", "tamam", "yap", "doğru" vb.) almadan **kesinlikle** kodları değiştirme.
   - **Onay isteğini tekrarla:** Kullanıcı doğru onayı verene kadar her yanıtında kendisinden onay istediğini açıkça belirt (ör. *"Anladığım bu: ... Onaylıyor musun? Onay verene kadar kodları değiştirmiyorum."*).

## Yayın ve sürüm

- `yayinla.sh` sürüm numarasını (`APP_VERSION` ve `version.json`) yeniler. Oyun bu numarayı sunucudakiyle karşılaştırıp güncelleme uyarısı gösterir; sürüm etiketi ekranın altında görünür.
- Sürüm numarasını elle değiştirme; yayın betiği yönetir.
