<?php

include "connection.php";
session_start();

// Kada iz app.js saljemo nesto u action.php pomocu ovoga to pokupimo
$oPostData = file_get_contents("php://input");
$oPostData = json_decode($oPostData);
// Pokupimo sto pise pod action_id i to zavrtimo u switch
$sActionID = $oPostData->action_id;

if (isset($_POST['action_id'])) {
    $sActionID = $_POST['action_id'];
}
$oJson = array();

switch ($sActionID) {
    
    // ------------------------------------------------------------------------------------------------------------------------------ >>  1. 

    case 'check_logged_in':
        if (isset($_SESSION['user_id'])) {

            echo json_encode(array(
                "status" => 1,
                "user_id" => $_SESSION['user_id'],
            ));
        } else {
            echo json_encode(array(
                "status" => 0,
            ));
        }
    break;

    case 'check_if_admin':
        if (isset($_SESSION['user_id'])) {
            $UserID = $_SESSION['user_id'];
            $sQuery = "SELECT * FROM user WHERE user_id='$UserID'";
            $oRecord = $oConnection->query($sQuery);
            $row = $oRecord->fetch();
            $count = $oRecord->rowCount();

            if ($count > 0) {
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['type'] = $row['type'];
                echo json_encode(array(
                    "status" => 1,
                    "user_id" => $_SESSION['user_id'],
                    "type" => $_SESSION['type'],
                ));
            } else {
                echo json_encode(array(
                    "status" => 0,
                ));
            }
        }
    break;
    
    case 'login':
        $Username = $oPostData->username;
        $Password = $oPostData->password;

        $sQuery = "SELECT * FROM user WHERE (username='$Username' OR email='$Username') AND password='$Password'";
        $oRecord = $oConnection->query($sQuery);
        $row = $oRecord->fetch();
        $count = $oRecord->rowCount();

        if ($count > 0) {
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['username'] = $row['username'];
            echo json_encode(array(
                "status" => 1,
                "user_id" => $_SESSION['user_id'],
            ));
        } else {
            echo json_encode(array(
                "status" => 0,
            ));
        }
    break;
    
    case 'register':
        $Username = $oPostData->username;
        $Password = $oPostData->password;

        $Ime = $oPostData->ime;
        $Prezime = $oPostData->prezime;
        $Email = $oPostData->email;

        $Type = $oPostData->type;

        
        $sQueryOne = "SELECT * FROM user WHERE email='$Email'";
        $oRecord = $oConnection->query($sQueryOne);
        $row = $oRecord->fetch();
        $count = $oRecord->rowCount();
        if ($count > 0) {
            echo "Već postoji korisnik s tim Email-om!";
        }
        else {
            $sQueryTwo= "SELECT * FROM user WHERE username='$Username'";
            $oRecord = $oConnection->query($sQueryTwo);
            $row = $oRecord->fetch();
            $count = $oRecord->rowCount();
            if ($count > 0) {
                echo "Već postoji korisnik s tim Korisničkim imenom!";
            }
            else {
                $sQuery = "INSERT INTO user (username, password, type, ime, prezime, email) VALUES (:username, :password, :type, :ime, :prezime, :email)";
                
                $oData = array(
                    'username' => $Username,
                    'password' => $Password,
                    'ime' => $Ime,
                    'prezime' => $Prezime,
                    'email' => $Email,
                    'type' => $Type,
                );

                try
                {
                    $oStatement = $oConnection->prepare($sQuery);
                    $oStatement->execute($oData);
                    echo 1;
                } catch (PDOException $error) {
                    echo $error;
                    echo 0;
                }
            }
        }
    break;
    
    case 'add_user':
        $Username = $oPostData->username;
        $Password = $oPostData->password;
        $Type = $oPostData->type;
        $Ime = $oPostData->ime;
        $Prezime = $oPostData->prezime;
        $Email = $oPostData->email;

        
        $sQueryOne = "SELECT * FROM user WHERE email='$Email'";
        $oRecord = $oConnection->query($sQueryOne);
        $row = $oRecord->fetch();
        $count = $oRecord->rowCount();
        if ($count > 0) {
            echo "Već postoji korisnik s tim Email-om!";
        }
        else {
            $sQueryTwo= "SELECT * FROM user WHERE username='$Username'";
            $oRecord = $oConnection->query($sQueryTwo);
            $row = $oRecord->fetch();
            $count = $oRecord->rowCount();
            if ($count > 0) {
                echo "Već postoji korisnik s tim Korisničkim imenom!";
            }
            else {
                $sQuery = "INSERT INTO user (username, password, type, ime, prezime, email) VALUES (:username, :password, :type, :ime, :prezime, :email)";

                $oData = array(
                    'username' => $Username,
                    'password' => $Password,
                    'ime' => $Ime,
                    'prezime' => $Prezime,
                    'email' => $Email,
                    'type' => $Type,
                );

                try
                {
                    $oStatement = $oConnection->prepare($sQuery);
                    $oStatement->execute($oData);
                    echo 1;
                } catch (PDOException $error) {
                    echo $error;
                    echo 0;
                }
            }
        }
    break;

    case 'logout':
        session_destroy();
    break;

    // ------------------------------------------------------------------------------------------------------------------------------ >>  2.
    
    case 'add_category':
        $Category_name = $oPostData->categoryName;

        $sQuery = "INSERT INTO category (categoryName) VALUES (:categoryName)";
        $oStatement = $oConnection->prepare($sQuery);
        $oData = array(
            'categoryName' => $Category_name,
        );
        try
        {
            $oStatement->execute($oData);
            echo 1;
        } catch (PDOException $error) {
            //echo $error;
            echo 0;
        }
    break;
        
    case 'delete_category':
        $CategoryID = $oPostData->category_id;
        
        $sQuery = "DELETE FROM category WHERE categoryID ='$CategoryID' ";
        $sQueryArticle = "DELETE FROM article WHERE categoryID ='$CategoryID' ";
        $oStatement = $oConnection->prepare($sQuery);
        $oStatementArticle = $oConnection->prepare($sQueryArticle);
        try
        {
            $oStatement->execute();
            $oStatementArticle->execute();
            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
        
    case 'delete_user':
        $sUser_id = $oPostData->user_id;
        $sQuery = "DELETE FROM user WHERE user_id ='$sUser_id' ";
        $oStatement = $oConnection->prepare($sQuery);
        try
        {
            $oStatement->execute();
            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
    break;

    // ------------------------------------------------------------------------------------------------------------------------------ >>  3.

    case 'add_article':
        $CategoryID = $oPostData->categoryID;
        $Article_title = $oPostData->article_title;
        $Article_content = $oPostData->article_content;
        $Image = $oPostData->image;
        $UserID = $oPostData->userID;

        $sQuery = "INSERT INTO article (article_title, article_content, categoryID, image, userID) VALUES (:article_title, :article_content, :categoryID, :image, :UserID)";
        $oStatement = $oConnection->prepare($sQuery);
        $oData = array(
            'article_title' => $Article_title,
            'article_content' => $Article_content,
            'categoryID' => $CategoryID,
            'image' =>$Image,
            'UserID' =>$UserID
        );
        try
        {
            $oStatement->execute($oData);
            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
    break;

    case 'edit_article':
        $Article_title = $oPostData->article_title;
        $Article_content = $oPostData->article_content;
        $ArticleID = $oPostData->article_id;
        $UserID = $_SESSION['user_id'];
        $Date = date('Y-m-d H:i:s');
        $image = $oPostData->image;

        $sQuery = "UPDATE article SET article_title='$Article_title', article_content='$Article_content', image='$image' WHERE articleID =$ArticleID";
        //UPDATE article SET article_title='gay', article_content='cigan' WHERE articleID =109

        $sQueryEdit = "INSERT INTO edit_history(user_id, article_id, date) VALUES (:user_id, :article_id, :date)";
        $oStatement = $oConnection->prepare($sQuery);

        $oEditStatement = $oConnection->prepare($sQueryEdit);

        $oEditData = array(
            'user_id' => $UserID,
            'article_id' => $ArticleID,
            'date' => $Date,
        );
        try
        {
            $oStatement->execute();
            $oEditStatement->execute($oEditData);
            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
    break;

    case 'delete_article':
        $ArticleID = $oPostData->article_id;

        $sQuery = "DELETE FROM article WHERE articleID ='$ArticleID' ";
        $sQuerySubarticle = "DELETE FROM subarticle WHERE articleID ='$ArticleID' ";
        // Obrisatri svu povijet za te clanke
        $sQueryEditHistory = "DELETE FROM edit_history WHERE article_id ='$ArticleID' ";
        // Obrisati sve ocjene tih clanaka
        $sQueryDeleteOcjena = "DELETE FROM article_rating WHERE articleID ='$ArticleID' ";

        $oStatement = $oConnection->prepare($sQuery);
        $oStatementSubarticle = $oConnection->prepare($sQuerySubarticle);
        
        $oStatementEditHistory = $oConnection->prepare($sQueryEditHistory);
        $oStatementDeleteOcjena = $oConnection->prepare($sQueryDeleteOcjena);

        try
        {
            $oStatement->execute();
            $oStatementSubarticle->execute();
            $oStatementEditHistory->execute();
            $oStatementDeleteOcjena->execute();

            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
    break;

    case 'obrisi_sve_od_tog_korisnika':
        $User_id = $oPostData->user_id;
        
        // Obrisati sve podclanke tog korisnika
        $sQuerySubarticle = "DELETE FROM subarticle WHERE userID ='$User_id' ";
        // Obrisati svu povijet tog korisnika
        $sQueryEditHistory = "DELETE FROM edit_history WHERE user_id ='$User_id' ";
        // Obrisati sve ocjene tog korisnika
        $sQueryDeleteOcjena = "DELETE FROM article_rating WHERE userID ='$User_id' ";
        
        $oStatementSubarticle = $oConnection->prepare($sQuerySubarticle);
        $oStatementEditHistory = $oConnection->prepare($sQueryEditHistory);
        $oStatementDeleteOcjena = $oConnection->prepare($sQueryDeleteOcjena);

        try
        {
            $oStatementSubarticle->execute();
            $oStatementEditHistory->execute();
            $oStatementDeleteOcjena->execute();

            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
        
    break;
    

    case 'ocijeni' : 
        $Ocjena = $oPostData->ocjena;
        $Clanak = $oPostData->clanak;
        $Korisnik = $oPostData->korisnik;
        
        // provjera da li vec ima u bazi od tog korisnika
        $sQueryP = "SELECT * FROM article_rating WHERE userID='$Korisnik' AND articleID='$Clanak'";
        $oRecordP = $oConnection->query($sQueryP);
        $count = $oRecordP->rowCount();
        if ($count > 0) {

            $sQuery = "UPDATE article_rating SET rating_number='$Ocjena' WHERE userID =$Korisnik AND articleID='$Clanak'";
            $oStatement = $oConnection->prepare($sQuery);
            
            try
            {
                $oStatement->execute();
                echo 1;
            } catch (PDOException $error) {
                echo $error;
                echo 0;
            }
        } else {

            $sQuery = "INSERT INTO article_rating(ratingID, userID, articleID, rating_number) VALUES (null, :User_id, :Clanak_id, :Ocjena)";
            $oStatement = $oConnection->prepare($sQuery);
            $oData = array(
                'User_id' => $Korisnik,
                'Clanak_id' => $Clanak,
                'Ocjena' => $Ocjena,
            );
            try
            {
                $oStatement->execute($oData);
                echo 1;
            } catch (PDOException $error) {
                echo $error;
                echo 0;
            }
        }
    break;

    // ------------------------------------------------------------------------------------------------------------------------------ >>  4.

    case 'add_subarticle':
        $articleID = $oPostData->articleID;
        $sub_title = $oPostData->sub_title;
        $sub_content = $oPostData->sub_content;
        $userID = $oPostData->userID;

        $sQuery = "INSERT INTO subarticle (subarticleID, sub_title, sub_content, articleID, userID) VALUES ( null, :sub_title, :sub_content, :articleID, :userID)";
        $oStatement = $oConnection->prepare($sQuery);
        $oData = array(
            'sub_title' => $sub_title,
            'sub_content' => $sub_content,
            'articleID' => $articleID,
            'userID' =>$userID
        );
        try
        {
            $oStatement->execute($oData);
            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
    break;

    case 'edit_subarticle':
        $SubarticleID = $oPostData->subarticle_id;
        $sub_title = $oPostData->sub_title;
        $sub_content = $oPostData->sub_content;
        $UserID = $_SESSION['user_id'];
        $Date = date('Y-m-d H:i:s');

        $sQuery = "UPDATE subarticle SET sub_title='$sub_title', sub_content='$sub_content' WHERE subarticleID =$SubarticleID";

        $sQueryEdit = "INSERT INTO edit_history(user_id, article_id, date) VALUES (:user_id, :article_id, :date)";
        $oStatement = $oConnection->prepare($sQuery);

        $oEditStatement = $oConnection->prepare($sQueryEdit);

        $oData = array(
            'sub_title' => $sub_title,
            'sub_content' => $sub_content,
        );

        $oEditData = array(
            'user_id' => $UserID,
            'article_id' => $SubarticleID,
            'date' => $Date,
        );
        try
        {
            $oStatement->execute();
            $oEditStatement->execute($oEditData);
            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }
    break;

    case 'delete_subarticle':
        $SubarticleID = $oPostData->subarticle_id;
        echo $sQuery = "DELETE FROM subarticle WHERE subarticleID= $SubarticleID ";
        $oStatement = $oConnection->prepare($sQuery);
        try
        {
            $oStatement->execute();
            echo 1;
        } catch (PDOException $error) {
            echo $error;
            echo 0;
        }

    break;

    default:
        echo "greška";
    break;
}