<p align="center">
    <a href="https://github.com/yiisoft" target="_blank">
        <img src="https://avatars0.githubusercontent.com/u/993323" height="100px">
    </a>
    <h1 align="center">aYom Project Template (Admin-LTE Yii2 Oauth2 Mimin)</h1>
    <br>
</p>


Minimum Penggunaan
------------

PHP 5.4


Installasi
------------

### Installasi dengan Composer

Jika kamu tidak memiliki [Composer](http://getcomposer.org/), kamu bisa menginstalnya dengan mengikuti tutorial di [getcomposer.org](http://getcomposer.org/doc/00-intro.md#installation-nix).

Kamu bisa menginstal dengan menjalankan perintah berikut:

~~~
php composer.phar create-project --prefer-dist --stability=dev chabibnr/ayom ayom
~~~
ATAU
~~~
composer create-project --prefer-dist --stability=dev chabibnr/ayom ayom
~~~


Konfigurasi
-------------

### Database

Ubah berkas `config/db.php` dengan data yang sesunguhnya, seperti:

```php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=localhost;dbname=ayom',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8',
];
```

Selanjutnya import database ```ayom.sql```


Jalankan Server
-------

~~~
php yii serve
~~~

DEFAULT USER & PASSWORD
-------

~~~
user : admin
pass : admin

user : member
pass : member
~~~