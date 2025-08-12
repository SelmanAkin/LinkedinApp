# LinkedIn Benzeri Sosyal Ağ Uygulaması

Bu proje, **Ruby on Rails 7** kullanılarak geliştirilmiş, LinkedIn benzeri bir sosyal ağ platformudur. Kullanıcıların profil oluşturabildiği, bağlantı kurabildiği, gönderi paylaşımı ve beğeni sistemi ile etkileşimde bulunabildiği bir uygulamadır.


## Özellikler

- **Kullanıcı Kayıt ve Giriş:** Devise gemi ile güvenli kimlik doğrulama.
- **Yetkilendirme:** Pundit ile rol ve izin yönetimi.
- **Kullanıcı Profilleri:** Kişisel ve profesyonel bilgiler içeren detaylı profil sayfaları.
- **Bağlantılar:** Kullanıcılar birbirleriyle bağlantı kurabilir, bağlantı isteklerini yönetebilir.
- **Mesajlaşma:** Kullanıcılar arası mesajlaşma, ancak yalnızca karşılıklı bağlantı kabulü sonrasında aktif olur.
- **Gönderi Paylaşımı:** Metin içeren gönderiler oluşturulabilir.
- **Beğeni Sistemi:** Gönderiler beğenilebilir, beğeni sayısı takip edilir.
- **Dosya Yönetimi:** Active Storage ile profil fotoğrafı ve gönderi dosyalarının yönetimi.



## Kullanılan Teknolojiler ve Gemler

- **Ruby on Rails 7:** Modern web uygulama çatısı.
- **Devise:** Kullanıcı kimlik doğrulama ve yönetimi.
- **Pundit:** Yetkilendirme ve izin kontrolü.
- **Active Storage:** Dosya ve medya yükleme işlemleri.
- **Jbuilder:** JSON API çıktılarının oluşturulması.



## Kullanım

- Kayıt olup giriş yaptıktan sonra profilinizi oluşturabilir ve düzenleyebilirsiniz.
- Diğer kullanıcılarla bağlantı isteği gönderip alabilirsiniz ve mesaj atabilirsiniz.
- Gönderi paylaşabilir, beğenebilir ve yorum yapabilirsiniz.
- Profil ve gönderi fotoğraflarınızı yükleyebilirsiniz.



## Proje Yapısı

- **app/models:** Kullanıcı, Profil, Bağlantı, Gönderi, Beğeni modelleri.
- **app/controllers:** CRUD işlemleri ve iş mantığı.
- **app/policies:** Pundit yetki politikaları.
- **app/views:** Kullanıcı arayüzü bileşenleri.
- **app/views/posts:** Jbuilder şablonları.
- **config/routes.rb:** Uygulama rotaları.




---

Teşekkürler!
