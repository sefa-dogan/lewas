# LEWAS

## Uygulamanın Tanıtımı
Kulllanıcı uygulamaya kayıt olduktan sonra, uygulamanın kendisine sunmuş olduğu kelimeleri ana sayfada, kendisi ve bir cümle içinde örnek kullanımı ile görüntüleyebilecektir. Öğrendiği kelimeleri listeleyebilir, silebilir ve listelenen kelimelere tıkladığında aynı şekilde kelimenin kendisini ve örnek kullanımını görüntüleyebilir. Profil sayfasında ise bilgilerini güncelleyebilecektir.

## Components
lib/components klasörüne gidin.

### Splash Screen
Uygulama açılırken kullanıcıya kısa süreliğine gösterilen ekran.

### Register Screen
Register ekranı, kullanıcının isim, soyisim, e-mail ve şifresini TextField aracılığıyla alarak Register butonu ile kayıt işleminin gerçekleşmesini sağlar. Kayıt işlemi tamamlandığında kullanıcının e-mail adresine hesap doğrulama maili gönderilir. Kullanıcı bu maildeki linke tıklayıp hesabını doğrulamazsa oturum açamayacaktır.

### Login Screen
Kullanıcının daha önce kayıt olduğu e-mail ve şifresi ile oturum açma işlemini gerçekleştireceği ekrandır. Eğer hesap onaylandıysa oturum açılacaktır.

### Home Screen ###
Oturum açtıktan sonra bizi karşılayacak olan ekrandır. Bu ekranda ingilizce kelimeler, bu kelimelerle ilgili metinler, Learned butonu ve Remind me later butonu yer almaktadır. Learned butonuna basıldığında geçerli kelime Learned Words Screen’ de listelenecektir. Remind me later butonuna basıldığında ise farklı bir kelime gösterilecektir.

### Learned Words Screen
Menu barında ortadaki butona dokunarak ulaşılabilen Learned Words ekranı öğrenilen bütün kelimelerin listelendiği ekrandır. Bu ekranda, öğrenilen kelime istenildiği takdirde Home ekranında görüntülenmek üzere silinebilir veya öğrenilen kelimenin üzerine dokunarak o kelimeye ait olan metin tekrar görüntülenebilir.

### User Informations Screen
User Informations ekranı kullanıcının isim, soyisim ve e-mail bilgilerini görüntüleyebildiği ve eğer isterse sağ üstteki “Edit” ikonuna dokunduktan sonra TextFieldları aktif edip bilgilerini değiştirdikten sonra Update butonu ile yeni bilgilerini veritabanına kayıt edebildiği ekrandır. Ayrıca sağ üstteki “Log out” ikonu ile oturumunu kapatabilir.

### Forgot Password Screen
Kullanıcının kayıt olurken kullandığı e-mail adresini girdikten sonra “Send Reset E-mail” butonuna dokunarak mail adresine şifre sıfırlama linki gönderdiği ve bu linki kullanarak şifresini değiştirebildiği ekrandır.

## Operasyonlar

### Sign In Operations
Sign In operasyonu, içindeki metod sayesinde kimlik doğrulama(authentication) işlemini ve eğer mail adresi doğulanmamışsa doğrulama maili gönderen operasyondur.

### Register Operations
Register operasyonu kullanıcıyı, isim soyisim ve e-mail bilgileri ile kayıt eder, doğrulama maili gönderir. Bu işlemlerin sonunda ise Login ekranına yönlendirir.

### Pull Word Operations
Pull Word operasyonu, ilk önce LearnedWordsOperations() operasyonu aracılığı ile önceden öğrenilen kelimeleri Firebase veritabanından çeker ve daha sonra anlamlarının çekilmesini istediğimiz WordList listesinden bu kelimeleri çıkarır. Elimizde kalan güncel  WordList listesindeki kelimeler hakkındaki bilgileri verilen api adresinden Dio paketi ile çeker. Kelimeleri istenilen formata getirir ve bilgileri çekilen bütün kelimelerin olduğu bir listeyi döndürür.

### Pull User Right Operations
Kullanıcının günlük kelime öğrenme hak bilgisini Firebase veritabanından çeker ve bunu döndürür.

### Learned Words Operations
Önceden öğrenilen kelimelerin veritabanından çekildiği, uygulama kullanılırken öğrenilen kelimelerin veritabanından silindiği operasyondur.

### Check Remaining Right Versus Pulled Daily Right Operations
Temel olarak, uygulama açıldıktan sonra Firebase veritabanından çekilen günlük hak sayısı ile uygulamayı kullanırken kalan hak sayısını karşılaştıran operasyondur. Öğrenilen uygulamayı veritabanına gönderir.

## Store folder
Uygulama içinde birden fazla component tarafından ulaşılacak metodlar/değişkenler bu klasörde çalışır.

## Utils folder
Uygulamada kullanılan constant değerler atomic widgetlar burada bulunur.