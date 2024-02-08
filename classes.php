<?php
class Configuration
{
    public $host = '127.0.0.1';
    public $dbName = 'wikipedia';
    public $username = 'root';
    public $password = '';
};
class Admin
{
    public $id = '';
    public $korisnicko_ime = '';
    public $lozinka = '';
    public function __construct($nID, $sKorisnicko_ime, $sLozinka)
    {
        $this->id = $nID;
        $this->korisnicko_ime = $sKorisnicko_ime;
        $this->lozinka = $sLozinka;
    }
}

class Korisnik
{
    public $id = '';
    public $korisnicko_ime = '';
    public $ime = '';
    public $prezime = '';
    public $email = '';
    //public $lozinka = '';
    public function __construct($nID, $sKorisnicko_ime, $Ime, $Prezime, $Email)
    {
        $this->id = $nID;
        $this->korisnicko_ime = $sKorisnicko_ime;
        $this->ime = $Ime;
        $this->prezime = $Prezime;
        $this->email = $Email;
        //$this->lozinka = $sLozinka;
    }
}
class Clanak
{
    public $articleID = 'N/A';
    public $article_title = 'N/A';
    public $article_content = 'N/A';
    public $categoryID = 'N/A';
    public $image = 'http://localhost/Digipedia%20nova/images/2.png';
    public $userID = 'N/A';

    public function __construct($articleID = null, $article_title = null, $article_content = null, $categoryID = null, $image = null, $userID = null)
    {
        if ($articleID) {
            $this->articleID = $articleID;
        }

        if ($article_title) {
            $this->article_title = $article_title;
        }

        if ($article_content) {
            $this->article_content = $article_content;
        }

        if ($categoryID) {
            $this->categoryID = $categoryID;
        }

        if ($image) {
            $this->image = $image;
        }
        if ($userID) {
            $this->userID = $userID;
        }

    }
}
class Kategorija
{
    public $categoryID = 'N/A';
    public $categoryName = 'N/A';
    public $userID = 'N/A';

    public function __construct($categoryID = null, $categoryName = null, $UserID = null)
    {
        if ($categoryID) {
            $this->categoryID = $categoryID;
        }

        if ($categoryName) {
            $this->categoryName = $categoryName;
        }

        if ($UserID) {
            $this->userID = $UserID;
        }

    }
}
class Podclanak
{
    public $id = '';
    public $title = '';
    public $content = '';
    public $mainArticleID = '';
    public $userID = '';

    public function __construct($nID, $sTitle, $sContent, $nMainArticleID, $suserID)
    {
        $this->id = $nID;
        $this->title = $sTitle;
        $this->content = $sContent;
        $this->mainArticleID = $nMainArticleID;
        $this->userID = $suserID;
    }
}

class SingleClanak
{
    public $categoryName = 'N/A';
    public $article_title = 'N/A';
    public $article_content = 'N/A';
    //public $content ='N/A';
    public function __construct($categoryName, $article_title, $article_content)
    {
        $this->$categoryName = $$categoryName;
        $this->article_title = $article_title;
        $this->article_content = $article_content;
        //$this->content = $content;
    }
}
