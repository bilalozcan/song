# song

Song App

## Proje Hakkında

iTunes API'si ile şarkı listeleme basit uygulamsı

- MVVM mimarisi kullanılmıştır
- State Management olarak Provider kullanılmıştır
- Provider Stacked paketi yardımı ile daha reactive kullanılmıştır
- Çoklu dil desteği için easy_localization kullanılmıştır
- Model yapısı için json serializable kullanılarak fromMap toMap auto generate yapılamktadır
- Navigation bar için persistent nav bar kütüphanesinden yararlanılmıştır.
- REST API sorguları için dio kütüphanesi kullanılmıştır. Genel bir network manager üzerinden tüm GET/POST/PUT gibi işlemler yapılabilmektedir.

## Dosya Şeması

    ├── core        # Ürün bağımsız temel kullanılacak yapılar
    ├── feature     # Ürün feature'ları bulunur (home, detail, login etc..)
    ├── product     # Ürün bazında kullanılacak yapılar (constants, service, provider etc...) 
    ├── main.dart
