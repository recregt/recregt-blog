# Renovate Bot Kurulum Kılavuzu

Bu proje için Renovate Bot yapılandırması tamamlandı. 🤖

## 📋 Ne Yapar?

Renovate Bot otomatik olarak:
- ✅ CDN bağımlılıklarını (fuse.js, KaTeX) günceller
- ✅ SRI (Subresource Integrity) hash'lerini otomatik hesaplar ve günceller
- ✅ GitHub Actions workflow'larını günceller
- ✅ Güvenlik açıklarını tespit eder ve PR oluşturur
- ✅ Her ayın ilk Pazartesi sabahı CDN güncellemelerini kontrol eder

## 🚀 Kurulum Adımları

### 1. GitHub'da Renovate App'i Yükleyin

1. **GitHub Marketplace'e gidin:**
   👉 https://github.com/apps/renovate

2. **"Install it for free" butonuna tıklayın**

3. **Repository seçimi:**
   - "Only select repositories" seçin
   - `recregt-blog` repository'sini seçin
   - Veya "All repositories" seçerek tüm projelerinizde kullanın

4. **Install & Authorize** butonuna tıklayın

### 2. İlk Çalıştırma

Renovate yüklendikten sonra otomatik olarak:
- Repository'nizi tarayacak
- "Configure Renovate" başlıklı bir **onboarding PR** oluşturacak
- Bu PR'da mevcut yapılandırmanız gösterilecek

**Bu PR'ı merge etmeyin!** Çünkü biz zaten `.github/renovate.json` dosyasını oluşturduk.

### 3. Onboarding PR'ı Kapatın

```bash
# Renovate'in onboarding PR'ını kapatın (Close without merging)
# Çünkü özel yapılandırmamız zaten hazır
```

## ⚙️ Yapılandırma Özeti

### Zamanlama
- **CDN güncellemeleri:** Her ayın ilk Pazartesi günü, sabah 06:00'dan önce
- **GitHub Actions:** Haftada bir Pazartesi 06:00'dan önce
- **Timezone:** Europe/Istanbul

### Özellikler

#### 1. CDN Bağımlılıkları (fuse.js, KaTeX, vb.)
```html
<!-- ÖNCE -->
<script src="https://cdn.jsdelivr.net/npm/fuse.js@6.6.2" 
        integrity="sha512-eski_hash" 
        crossorigin="anonymous"></script>

<!-- SONRA (Renovate günceller) -->
<script src="https://cdn.jsdelivr.net/npm/fuse.js@7.0.0" 
        integrity="sha512-yeni_hash" 
        crossorigin="anonymous"></script>
```

#### 2. GitHub Actions
```yaml
# Örnek: actions/checkout@v4 → actions/checkout@v5
- uses: actions/checkout@v4
# Renovate bunu v5'e güncelleyecek
```

#### 3. Güvenlik Uyarıları
- Güvenlik açığı olan bağımlılıklar için hemen PR oluşturur
- `security` etiketi ile işaretler
- **Yüksek öncelikli** olarak işaretlenir

### PR Limitleri
- **Saatlik:** Maksimum 2 PR
- **Eşzamanlı:** Maksimum 5 açık PR
- **Gruplama:** İlgili güncellemeler tek PR'da birleştirilir

## 🔍 Hangi Dosyalar İzlenir?

### ✅ İzlenen
- `layouts/**/*.html` - Hugo şablonları
- `.github/workflows/*.yml` - GitHub Actions

### ❌ İzlenmeyen
- `themes/PaperMod/**` - Özel update-theme workflow'u var
- `node_modules/**`
- `vendor/**`

## 📊 Örnek PR'lar

### CDN Güncelleme PR'ı
```
Title: chore(deps): update CDN dependencies

- Update fuse.js from 6.6.2 to 6.7.0
- Update KaTeX from 0.16.9 to 0.16.10
- Update SRI hashes automatically
```

### Güvenlik PR'ı
```
Title: chore(deps): [SECURITY] update fuse.js to 6.6.3

⚠️ Security vulnerability detected in fuse.js 6.6.2
Fixes: CVE-2024-XXXXX
```

## 🛠️ Yapılandırma Değişiklikleri

### Daha Sık Güncelleme İstiyorsanız
`.github/renovate.json` dosyasında:
```json
"schedule": [
  "before 6am every weekday"  // Her hafta içi
]
```

### Otomatik Merge İstiyorsanız
```json
"packageRules": [
  {
    "matchDepTypes": ["devDependencies"],
    "automerge": true,
    "automergeType": "pr"
  }
]
```

### Sadece Major Güncellemeleri Devre Dışı Bırakmak
```json
"packageRules": [
  {
    "matchUpdateTypes": ["major"],
    "enabled": false
  }
]
```

## 🧪 Test Etme

### Manuel Tetikleme
Renovate'i manuel çalıştırmak için:
1. Repository Settings → Actions → General
2. "Renovate" workflow'unu bulun
3. "Run workflow" butonuna tıklayın

### Log Kontrolü
- Renovate her çalıştığında issue oluşturur: `Dependency Dashboard`
- Bu issue'da tüm bağımlılıkların durumunu görebilirsiniz

## 📚 Daha Fazla Bilgi

- **Renovate Docs:** https://docs.renovatebot.com/
- **Configuration Options:** https://docs.renovatebot.com/configuration-options/
- **Regex Managers:** https://docs.renovatebot.com/modules/manager/regex/

## ❓ Sorun Giderme

### Renovate PR Oluşturmuyor
1. Dependency Dashboard issue'sunu kontrol edin
2. `.github/renovate.json` syntax hatası olabilir
3. Repository permissions kontrol edin

### SRI Hash'ler Yanlış
- Renovate otomatik hesaplar, ancak jsDelivr'den alır
- Manuel kontrol: https://www.jsdelivr.com/package/npm/fuse.js

### PR Çok Fazla Geliyor
```json
"prHourlyLimit": 1,  // Saatlik limiti düşürün
"schedule": ["before 6am on the first day of the month"]  // Daha seyrek
```

## 📝 Not

Hugo theme (`themes/PaperMod`) için ayrı bir `update-theme.yml` workflow'umuz var, 
bu yüzden Renovate git submodule güncellemelerini devre dışı bıraktık.

---

**Son Güncelleme:** 2025-10-05
**Oluşturan:** GitHub Copilot & recregt
