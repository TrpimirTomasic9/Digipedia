<?php
//ini_set('memory_limit', '2048M');
//header('Content-type: text/json');
//header('Content-type: application/json');
header('Content-type: charset=ISO-8859-1');
include "connection.php";

$sJsonID = "";
$category_id = "";
$user_id = "";
$SearchParams = "";


if (isset($_GET['json_id'])) {
    $sJsonID = $_GET['json_id'];
}
if (isset($_GET['category_id'])) {
    $category_id = $_GET['category_id'];
}

if(isset($_GET['article_id'])) {
    $article_id = $_GET['article_id'];
}

if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
}

if (isset($_GET['search_params'])) {
    $SearchParams = $_GET['search_params'];
}

$oJson = array();
switch ($sJsonID) {
    
    case 'dohvati_clanke':
        $sQuery = "SELECT articleID, article_title, article_content, categoryID, image, userID FROM article ";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oClanci = new Clanak(
                $oRow['articleID'],
                $oRow['article_title'],
                $oRow['article_content'],
                $oRow['categoryID'],
                $oRow['image'],
                $oRow['userID']
            );
            array_push($oJson, $oClanci);
        }
    break;
    
    case 'dohvati_ocjenu':
        $sQuery = "SELECT ratingID, userID, articleID, rating_number FROM article_rating WHERE userID='$user_id' AND articleID='$article_id'";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oOcjena = array(
                'ocjena' => $oRow['rating_number'],
            );
            array_push($oJson, $oOcjena);
        }
    break;

    case 'dohvati_ocjene':
        //Dohvaca broj korisnik koji su ocjenili to je ovaj COUNT(*) i srednju ocjenu svih ocjena za taj clanak zaokruzeno na jednu decimalu
        $sQuery = "SELECT COUNT(*), ROUND(AVG(rating_number),1) as srednja FROM article_rating WHERE articleID='$article_id'";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oOcjena = array(
                'ukupno_ocjena' => $oRow['COUNT(*)'],
                'srednja_ocjena' => $oRow['srednja']
            );
            array_push($oJson, $oOcjena);
        }
    break;

    case 'obrisi_ocjenu':
        $sQuery = "DELETE FROM article_rating WHERE userID='$user_id' AND articleID='$article_id'";
        $oStatement = $oConnection->prepare($sQuery);
        try
        {
            $oStatement->execute();
            array_push($oJson, 1);
        } catch (PDOException $error) {
            array_push($oJson,  $error);
        }
    break;

    case 'dohvati_kategorije':
        $sQuery = "SELECT categoryID, categoryName, userID FROM category";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oKategorije = new Kategorija(
                $oRow['categoryID'],
                $oRow['categoryName'],
                $oRow['userID']
            );
            array_push($oJson, $oKategorije);
        }
        break;

    case 'dohvati_korisnike':
        $sQuery = "SELECT user_id, username, ime, prezime, email  FROM user";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oKorisnici = new Korisnik(
                $oRow['user_id'],
                $oRow['username'],
                $oRow['ime'],
                $oRow['prezime'],
                $oRow['email']
            );
            array_push($oJson, $oKorisnici);
        }
        break;

    
    case 'dohvati_sve_iz_kategorije':
        $sQuery = "SELECT article.articleID, article.article_title, article.article_content, article.categoryID, category.categoryName FROM article LEFT JOIN category ON article.categoryID = category.categoryID WHERE category.categoryID=$category_id
    ";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oClanciKat = array(
                'articleID' => $oRow['articleID'],
                'article_title' => $oRow['article_title'],
                'article_content' => $oRow['article_content'],
                'categoryID' => $oRow['categoryID'],
                'categoryName' => $oRow['categoryName'],
            );
            array_push($oJson, $oClanciKat);
        }

    
    case 'dohvati_clanke_po_id':
        $sQuery = "SELECT articleID, article_title, article_content, categoryID, image, userID FROM article  WHERE categoryID = $category_id ";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oClanci = new Clanak(
                $oRow['articleID'],
                $oRow['article_title'],
                $oRow['article_content'],
                $oRow['categoryID'],
                $oRow['image'],
                $oRow['userID']
                
            );
            array_push($oJson, $oClanci);
        }
        break;

        case 'dohvati_kategoriju_po_id':
            $sQuery = "SELECT categoryName FROM category  WHERE categoryID = $category_id ";
            $oRecord = $oConnection->query($sQuery);
            while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
                $oKategorija = array(
                    'name' => $oRow['categoryName']
                );
                array_push($oJson, $oKategorija);
            }
            break;

    

    case 'dohvati_tip':
        $sQuery = "SELECT DISTINCT type FROM user";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oType = array(
                'tip' => $oRow['type'],
            );
            array_push($oJson, $oType);
        }
        break;

    case 'edit_history':
        $sQuery = "SELECT edit_history.user_id, edit_history.article_id, edit_history.date, user.username, article.article_title FROM edit_history LEFT JOIN user ON edit_history.user_id = user.user_id LEFT JOIN article ON edit_history.article_id=article.articleID";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oEditHistory = array(
                'username' => $oRow['username'],
                'date' => $oRow['date'],
                'article_title' => $oRow['article_title'],
            );
            array_push($oJson, $oEditHistory);
        }
        break;
    case 'dohvati_podclanke':
        $sQuery = "SELECT subarticleID, sub_title, sub_content, articleID, userID FROM subarticle";
        $oRecord = $oConnection->query($sQuery);
        while($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oPodclanci = new Podclanak(
                $oRow['subarticleID'],
                $oRow['sub_title'],
                $oRow['sub_content'],
                $oRow['articleID'],
                $oRow['userID']
            );
            array_push($oJson, $oPodclanci);
        }
    break;

    case 'dohvati_clanke_korisnika':
        $sQuery = "SELECT articleID FROM article WHERE userID='$user_id'";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oClanci = array(
                'id' => $oRow['articleID']
            );
            array_push($oJson, $oClanci);
        }
    break;

    case 'dohvati_kategorije_korisnika':
        $sQuery = "SELECT categoryID FROM category WHERE userID='$user_id'";
        $oRecord = $oConnection->query($sQuery);
        while ($oRow = $oRecord->fetch(PDO::FETCH_BOTH)) {
            $oClanci = array(
                'id' => $oRow['categoryID']
            );
            array_push($oJson, $oClanci);
        }
    break;
    
    
}
echo json_encode($oJson);
