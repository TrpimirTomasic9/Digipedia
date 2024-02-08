var oWikiModul = angular.module("wiki-app", ["ngRoute"]);

// Rute
oWikiModul.config(function ($routeProvider) {
  //Pocetna
  $routeProvider.when("/", {
    templateUrl: "templates/home.html",
    controller: "wikiController",
  });

  //Kategorija i clanak
  $routeProvider.when("/category/:path", {
    templateUrl: "templates/category.html",
    controller: "wikiController",
  });
  $routeProvider.when("/article/:path", {
    templateUrl: "templates/single_article.html",
    controller: "wikiController",
  });

  //Administracija
  $routeProvider.when("/administration_users", {
    templateUrl: "templates/administration_users.html",
    controller: "wikiController",
  });
  $routeProvider.when("/administration_categorys", {
    templateUrl: "templates/administration_categorys.html",
    controller: "wikiController",
  });
  $routeProvider.when("/administration_articles", {
    templateUrl: "templates/administration_articles.html",
    controller: "wikiController",
  });

  $routeProvider.otherwise({
    template: "Greška",
  });
});

oWikiModul.controller("wikiController", function (
  $scope,
  $http,
  $location,
  $rootScope,
  $route,
  $window,
  $timeout
) {
  // ----------------------------------------------------------------------------------------------------- >>
  // ----------------------------------------------------------------------------------------------------- >> Provjera ulogiranog, Prijava, Registracija
  // ----------------------------------------------------------------------------------------------------- >>

  $scope.CheckLoggedIn = function () {
    $http
      .post("action.php", {
        action_id: "check_logged_in",
      })
      .then(
        function (response) {
          if (response.data.status == 1) {
            $scope.loggedin = true;
            $scope.CheckAdmin();
          } else {
            $scope.loggedin = false;
          }
        },
        function (error) {
          console.log(error);
        }
      );
  };

  $scope.CheckAdmin = function () {
    $http
      .post("action.php", {
        action_id: "check_if_admin",
      })
      .then(
        function (response) {
          if (response.data.type == "admin") {
            $scope.admin = true;
          } else {
            $scope.admin = false;
          }
        },
        function (error) {
          console.log(error);
        }
      );
  };

  $scope.modalLogIn = function () {
    $scope.openModal();
  };
  $scope.openModal = function () {
    var modal_popup = angular.element(document.querySelector("#modalLogIn"));
    modal_popup.modal("show");
  };

  $scope.closeModal = function () {
    var modal_popup = angular.element("#modalLogIn");
    modal_popup.modal("hide");
  };

  $scope.OtvoriModalReg = function () {
    $scope.closeModal();
    $scope.openModalSignUp();
  };

  $scope.Login = function () {
    var oData = {
      action_id: "login",
      username: $scope.username,
      password: $scope.password,
    };

    $http.post("action.php", oData).then(
      function (response) {
        if (response.data.status == 1) {
          $scope.closeModal();
          $scope.loggedin = true;

          localStorage.setItem(
            "ulogiran_id",
            JSON.stringify(response.data.user_id)
          );

          $location.path("/");
          $scope.CheckAdmin();
          alert("Pozdrav " + $scope.username + "!");
        } else {
          alert("Neispravno korisničko ime i/ili lozinka! Pokušajte ponovno!");
        }
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.modalSignUp = function () {
    $scope.openModalSignUp();
  };
  $scope.openModalSignUp = function () {
    var modal_popup = angular.element(document.querySelector("#modalSignUp"));
    modal_popup.modal("show");
  };

  $scope.closeModalSignUp = function () {
    var modal_popup = angular.element("#modalSignUp");
    modal_popup.modal("hide");
  };

  $scope.OtvoriModalLog = function () {
    $scope.closeModalSignUp();
    $scope.openModal();
  };

  $scope.closeMsg = function () {
    $scope.alertMsg = false;
  };

  $scope.Register = function () {
    $scope.alertMsg = true;

    if ($scope.password.length < 6) {
      $scope.alertClass = "alert-danger";
      $scope.alertMessage = "Lozinka se mora sastojati od minimalno 6 znakova!";
    } else {
      var oData = {
        action_id: "register",
        username: $scope.username,
        password: $scope.password,
        ime: $scope.ime,
        prezime: $scope.prezime,
        email: $scope.email,
        type: "user",
      };
      $http.post("action.php", oData).then(function (response) {
        if (response.data == 1) {
          $scope.closeModalSignUp();
          alert("Uspješna registracija!");
          $location.path("/");
        } else {
          $scope.alertClass = "alert-danger";
          $scope.alertMessage = response.data;
        }
      });
    }
  };

  // ----------------------------------------------------------------------------------------------------- >>
  // ----------------------------------------------------------------------------------------------------- >>
  // ----------------------------------------------------------------------------------------------------- >>

  // Modal dodavanje clanka
  $scope.modaldodavanjeopen = function () {
    var modal_popup = angular.element(
      document.querySelector("#modaldodavanjeClanka")
    );
    modal_popup.modal("show");
  };
  $scope.modaldodavanjeclose = function () {
    var modal_popup = angular.element("#modaldodavanjeClanka");
    modal_popup.modal("hide");
  };
  $scope.modaldodavanjeClanka = function () {
    $scope.modaldodavanjeopen();
  };

  // Modal obrisi clanak
  $scope.modalClanakBrisanjeOpen = function () {
    var modal_popup = angular.element(document.querySelector("#modalDelete"));
    modal_popup.modal("show");
  };
  $scope.modalClanakBrisanjeClose = function () {
    var modal_popup = angular.element("#modalDelete");
    modal_popup.modal("hide");
  };
  $scope.clanakBrisanje = function (id, title, content) {
    $scope.article_id = id;
    $scope.article_title = title;
    $scope.article_content = content;
    $scope.modalClanakBrisanjeOpen();
  };

  // Modal uredi clanak
  $scope.modalClanakEditOpen = function () {
    var modal_popup = angular.element(document.querySelector("#modalEdit"));
    modal_popup.modal("show");
  };
  $scope.modalClanakEditClose = function () {
    var modal_popup = angular.element("#modalEdit");
    modal_popup.modal("hide");
  };
  $scope.clanakEdit = function (id, title, content) {
    $scope.article_id = id;
    $scope.article_title = title;
    $scope.article_content = content;

    $scope.modalClanakEditOpen();
  };

  //modal dodaj kategoriju

  $scope.modalDodajKategorijuOpen = function () {
    var modal_popup = angular.element(
      document.querySelector("#modaldodavanjeKategorije")
    );
    modal_popup.modal("show");
  };
  $scope.modalDodajKategorijuClose = function () {
    var modal_popup = angular.element("#modaldodavanjeKategorije");
    modal_popup.modal("hide");
  };
  $scope.modaldodavanjeKategorije = function () {
    $scope.modalDodajKategorijuOpen();
  };

  // modali za brisanje uredivanje i dodavanje podkategorija

  //modal obrisi podclanak
  $scope.modalObrisiPodClanak = function () {
    var modal_popup = angular.element(
      document.querySelector("#modalDeleteSubarticle")
    );
    modal_popup.modal("show");
  };

  $scope.podclanakBrisanje = function (id, title, content) {
    $scope.podclanak_id = id;
    $scope.podclanak_title = title;
    $scope.podclanak_content = content;
    $scope.modalObrisiPodClanak();
  };
  $scope.modalUrediPodclanak = function () {
    var modal_popup = angular.element(
      document.querySelector("#modalEditSubarticle")
    );
    modal_popup.modal("show");
  };
  $scope.podclanakUredivanje = function (id, title, content) {
    $scope.podclanak_id = id;
    $scope.podclanak_title = title;
    $scope.podclanak_content = content;
    $scope.modalUrediPodclanak();
  };

  // dodavanje podclanka
  $scope.modalAddPodclanak = function () {
    var modal_popup = angular.element(
      document.querySelector("#modalAddSubarticle")
    );
    modal_popup.modal("show");
  };
  $scope.dodajPodclanak = function (articleID) {
    $scope.article_id = articleID;
    $scope.modalAddPodclanak();
  };
  $scope.DodajSubarticle = function () {
    var oData = {
      action_id: "add_subarticle",
      articleID: $scope.article_id,
      sub_title: $scope.title,
      sub_content: $scope.content,
      userID: $scope.ulogiran_id,
    };
    console.log(oData);
    $http.post("action.php", oData).then(function (response) {
      alert("Podčlanak uspješno dodan!");
      $window.location.reload();
    });
  };

  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  $scope.AddUser = function () {
    $scope.alertMsg = true;
    if ($scope.password.length < 6) {
      $scope.alertClass = "alert-danger";
      $scope.alertMessage = "Lozinka se mora sastojati od minimalno 6 znakova!";
    } else {
      var oData = {
        action_id: "add_user",
        username: $scope.username,
        password: $scope.password,
        type: $scope.tip_input,
        ime: $scope.ime,
        prezime: $scope.prezime,
        email: $scope.email,
      };
      console.log(oData);
      $http.post("action.php", oData).then(function (response) {
        if (response.data == 1) {
          $scope.closeModalSignUp();
          alert("Uspješna registracija!");
          $window.location.reload();
        } else {
          $scope.alertClass = "alert-danger";
          $scope.alertMessage = response.data;
        }
      });
    }
  };

  $scope.Logout = function () {
    var oData = {
      action_id: "logout",
    };
    $http
      .post("action.php", {
        action_id: "logout",
      })
      .then(
        function (response) {
          $scope.loggedin = false;
          $scope.admin = false;
          alert("Uspješno ste se odjavili!");
          localStorage.clear();
          $location.path("/");
        },
        function (error) {
          console.log(error);
        }
      );
  };

  $scope.getArticles = function () {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_clanke",
    }).then(
      function (response) {
        $scope.articles = response.data;
      },
      function (response) {
        console.log("error");
      }
    );
  };

  $scope.getSubarticles = function () {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_podclanke",
    }).then(
      function (response) {
        localStorage.setItem("polje_subartikl", JSON.stringify(response.data));

        $scope.polje_subartikl = JSON.parse(
          localStorage.getItem("polje_subartikl")
        );
      },
      function (error) {
        console.log("error");
      }
    );
  };

  $scope.getCategories = function () {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_kategorije",
    }).then(
      function (response) {
        $scope.categories = response.data;
        //console.log($scope.categories);
      },
      function (error) {
        console.log("error");
      }
    );
  };

  $scope.GetAllFromCategory = function (id, name) {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_sve_iz_kategorije&category_id=" + id,
    }).then(
      function (response) {
        $location.path("/category/" + name);
      },
      function (error) {
        console.log(error);
      }
    );

    localStorage.setItem("ime_kategorije", JSON.stringify(name));
    localStorage.setItem("id_kategorije", JSON.stringify(id));
  };

  $scope.getArticleByType = function () {
    $scope.id_kategorije = JSON.parse(localStorage.getItem("id_kategorije"));
    $http({
      method: "GET",
      url:
        "json.php?json_id=dohvati_clanke_po_id&category_id=" +
        $scope.id_kategorije,
    }).then(
      function (response) {
        $scope.articlesByType = response.data;

        $scope.ime_kategorije = JSON.parse(
          localStorage.getItem("ime_kategorije")
        );
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.AddArticle = function () {
    $scope.ime_slike = JSON.parse(localStorage.getItem("ime_slike"));
    var ime_slike = $scope.ime_slike;
    ime_slike = ime_slike.substr(1);
    var novo_ime = ime_slike.slice(0, -1);

    $scope.ulogiran_id = JSON.parse(localStorage.getItem("ulogiran_id"));

    var putanja = "http://localhost/Digipedia%20nova/images/" + novo_ime;
    var oData = {
      action_id: "add_article",
      categoryID: $scope.category,
      article_title: $scope.article_title,
      article_content: $scope.article_content,
      image: putanja,
      userID: $scope.ulogiran_id,
    };
    console.log(oData);
    $http.post("action.php", oData).then(function (response) {
      alert("Članak uspješno dodan!");
      $window.location.reload();
    });
  };

  $scope.SingleArticle = function (oArticle) {
    localStorage.setItem("objekt_artikl", JSON.stringify(oArticle));

    $location.path("/article/" + oArticle.article_title);
  };

  $scope.ShowSingleArticle = function () {
    $scope.objekt_artikl = JSON.parse(localStorage.getItem("objekt_artikl"));
    $scope.ulogiran_id = JSON.parse(localStorage.getItem("ulogiran_id"));
    //console.log($scope.objekt_artikl, $scope.ulogiran_id);
    $timeout(function () {
      $http({
        method: "GET",
        url:
          "json.php?json_id=dohvati_ocjenu&article_id=" +
          $scope.objekt_artikl.articleID +
          "&user_id=" +
          $scope.ulogiran_id,
      }).then(
        function (response) {
          localStorage.setItem("ocjena", JSON.stringify(response.data));

          $scope.ocj = JSON.parse(localStorage.getItem("ocjena"));

          if (response.data == "") {
            $scope.ocj[0] = { ocjena: 0 };
          }
        },
        function (error) {
          console.log(error);
        }
      );
    }, 500);
  };

  $scope.ShowAllRating = function () {
    // Šaljemo upit prema bazi i šaljemo id artikla
    $http({
      method: "GET",
      url:
        "json.php?json_id=dohvati_ocjene&article_id=" +
        $scope.objekt_artikl.articleID,
    }).then(
      function (response) {
        // Pošto na povrat dobivamo array sa jednim objektom onda mu pristupamo pomocu -> [0]
        $scope.info_ocjena = response.data[0];
        // Ako nema ni jedne ocjene biti ce null i onda umjesto da nist ne ispisujemo ispisat cemo 0
        if ($scope.info_ocjena.srednja_ocjena == null) {
          $scope.info_ocjena.srednja_ocjena = 0;
        }
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.ObrisiOcjenu = function () {
    $http({
      method: "GET",
      url:
        "json.php?json_id=obrisi_ocjenu&article_id=" +
        $scope.objekt_artikl.articleID +
        "&user_id=" +
        $scope.ulogiran_id,
    }).then(
      function (response) {
        $window.location.reload();
        /*
        localStorage.setItem("ocjena", JSON.stringify(response.data));

        $scope.ocj = JSON.parse(localStorage.getItem("ocjena"));

        if (response.data == "") {
          $scope.ocj[0] = { ocjena: 0 };
        }
        */
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.ShowSingleSubarticle = function () {
    $scope.objekt_subartikl = JSON.parse(
      localStorage.getItem("objekt_subartikl")
    );
  };

  $scope.EditArticle = function (id) {
    $scope.ime_slike = JSON.parse(localStorage.getItem("ime_slike"));

    var ime_slike = $scope.ime_slike;
    if (ime_slike == null) {
      var putanja = $scope.objekt_artikl.image;
    } else {
      ime_slike = ime_slike.substr(1);
      var novo_ime = ime_slike.slice(0, -1);
      var putanja = "http://localhost/Digipedia%20nova/images/" + novo_ime;
    }

    var oData = {
      action_id: "edit_article",
      article_id: id,
      article_title: $scope.article_title,
      article_content: $scope.article_content,
      image: putanja,
    };
    $http.post("action.php", oData).then(function (response) {
      alert("Članak uspješno promijenjen!");
      $location.path("/");
    });
  };

  $scope.DeleteArticle = function (id) {
    var oData = {
      action_id: "delete_article",
      article_id: id,
    };
    $http.post("action.php", oData).then(function (response) {
      $location.path("/");
    });
  };

  $scope.EditSubarticle = function (id) {
    var oData = {
      action_id: "edit_subarticle",
      subarticle_id: id,
      sub_title: $scope.podclanak_title,
      sub_content: $scope.podclanak_content,
    };
    $http.post("action.php", oData).then(function (response) {
      alert("Članak uspješno promijenjen!");
      $location.path("/");
    });
  };

  $scope.DeleteSubarticle = function (subarticle_id) {
    var oData = {
      action_id: "delete_subarticle",
      subarticle_id: subarticle_id,
    };
    if (confirm("Jeste li sigurni da želite obrisati podčlanak?")) {
      $http.post("action.php", oData).then(function (response) {
        alert("Podčlanak uspješno obrisan!");
        $window.location.reload();
      });
    }
  };

  $scope.AddCategory = function () {
    var oData = {
      action_id: "add_category",
      categoryName: $scope.kategorijaName,
    };
    $http.post("action.php", oData).then(function (response) {
      alert("Kategorija uspješno dodana!");
      $route.reload();
    });
  };

  $scope.GetUserType = function () {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_tip",
    }).then(
      function (response) {
        $scope.tipovi = response.data;
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.EditHistory = function () {
    $http({
      method: "GET",
      url: "json.php?json_id=edit_history",
    }).then(
      function (response) {
        $scope.edit_history = response.data;
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.DohvatiKategoriju = function () {
    $http({
      method: "GET",
      url:
        "json.php?json_id=dohvati_kategoriju_po_id&category_id=" +
        $rootScope.id,
    }).then(
      function (response) {
        $scope.categoryName = response.data;
        $scope.categoryID = $rootScope.id;
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.getUsers = function () {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_korisnike",
    }).then(
      function (response) {
        $scope.users = response.data;
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.DeleteCategory = function (id) {
    var oData = {
      action_id: "delete_category",
      category_id: id,
    };
    console.log(oData);
    if (confirm("Jeste li sigurni da želite obrisati kategoriju?")) {
      $http.post("action.php", oData).then(function (response) {
        alert("Kategorija uspješno obrisana!");
      });
      $window.location.reload();
    }
  };

  // FUNKCIJUA ZA BRISANJE KORISNIKA KOJA BRIŠE APSOLUTNO SVE OD TOG KORISNIKA
  $scope.DeleteUser = function (id) {
    if (confirm("Jeste li sigurni da želite obrisati korisnika?")) {
      // DOHVACAMO SVE CLANKE TOG KORIUSNIKA
      $scope.DohvatiClankeTogKorisnika(id);
      // DOHVACAMO SVE KATEGORIJE TOG KOPRISNIKA
      $scope.DohvatiKategorijeTogKorisnika(id);

      // POSTAVLJEN JE TIMEOUT JER PRVO TREBAMO DOHVATITI TE INFORMACIJE IZNAD I ONDA RUKUJEMO S NJIMA
      $timeout(function () {
        // PROLAZIMO POMOCU FOREACH PETLJE KROZ SVE DOHVACENE CLANKE I POZIVAMO FUNKCIJU KOJA BRISE POJEDINI CLANKE I SVE NJEGOVE PODCLANKE
        angular.forEach($scope.clanci_tog_korisnika, function (id_clanka) {
          // Briše sve clanke tog korisnika i njihove podclanke, povjest, ocjene
          $scope.DeleteArticle(id_clanka.id);
        });
        // PROLAZIMO POMOCU FOREACH PETLJE KROZ DOHVACENE KATEGORIJE OD TOG KORISNIKA  TE POZIVAMO FUNKCIJU KOJA BRISE SVAKU KATEGORIJU I NJIHOVE CLANKE
        angular.forEach($scope.kategorije_tog_korisnika, function (
          id_kategorije
        ) {
          $scope.DeleteCategory(id_kategorije.id);
        });

        // Briše sve podclanke, povijest i ocjene tog korisnika
        $scope.ObrisiSveOdTogKorisnika(id);
        // Briše tog korisnika
        var oData = {
          action_id: "delete_user",
          user_id: id,
        };
        $http.post("action.php", oData).then(function (response) {
          alert("Korisnik je uspješno obrisan!");
        });
        $window.location.reload();
      }, 500);
    }
  };

  $scope.ObrisiSveOdTogKorisnika = function (id) {
    var oData = {
      action_id: "obrisi_sve_od_tog_korisnika",
      user_id: id,
    };
    $http.post("action.php", oData).then(function (response) {
      alert("Uspješno!");
    });
  };

  $scope.DohvatiClankeTogKorisnika = function (id) {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_clanke_korisnika&user_id=" + id,
    }).then(
      function (response) {
        $scope.clanci_tog_korisnika = response.data;
        console.log($scope.clanci_tog_korisnika);
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.DohvatiKategorijeTogKorisnika = function (id) {
    $http({
      method: "GET",
      url: "json.php?json_id=dohvati_kategorije_korisnika&user_id=" + id,
    }).then(
      function (response) {
        $scope.kategorije_tog_korisnika = response.data;
        console.log($scope.kategorije_tog_korisnika);
      },
      function (error) {
        console.log(error);
      }
    );
  };

  $scope.Ocijeni = function (ocjena, clanak) {
    $scope.ulogiran_id = JSON.parse(localStorage.getItem("ulogiran_id"));

    var oData = {
      action_id: "ocijeni",
      ocjena: ocjena,
      clanak: clanak,
      korisnik: $scope.ulogiran_id,
    };

    $http.post("action.php", oData).then(function (response) {
      if (response.data == 1) {
        $scope.closeModalSignUp();
        alert("Uspješno ocjenjeno!");
        $window.location.reload();
      } else {
        alert("Neuspješno ocjenjeno!");
      }
    });
  };
});

oWikiModul.filter("strLimit", [
  "$filter",
  function ($filter) {
    return function (input, limit) {
      if (!input) return;
      if (input.length <= limit) {
        return input;
      }

      return $filter("limitTo")(input, limit) + "...";
    };
  },
]);

// Za Upload slika
oWikiModul.directive("myDirective", function (httpPostFactory) {
  return {
    restrict: "A",
    scope: true,
    link: function (scope, element, attr) {
      element.bind("change", function () {
        var formData = new FormData();
        formData.append("file", element[0].files[0]);
        httpPostFactory("upload_image.php", formData, function (callback) {
          // recieve image name to use in a ng-src
          console.log(callback);
          localStorage.setItem("ime_slike", JSON.stringify(callback.data));
        });

        // optional front-end logging
        var fileObject = element[0].files[0];
        scope.fileLog = {
          lastModified: fileObject.lastModified,
          lastModifiedDate: fileObject.lastModifiedDate,
          name: fileObject.name,
          size: fileObject.size,
          type: fileObject.type,
        };
        scope.$apply();
      });
    },
  };
});

// Za Upload slika
oWikiModul.factory("httpPostFactory", function ($http) {
  return function (file, data, callback) {
    $http({
      url: file,
      method: "POST",
      data: data,
      headers: { "Content-Type": undefined },
    }).then(
      function (response) {
        callback(response);
      },
      function (error) {}
    );
  };
});

// https://stackoverflow.com/questions/18571001/file-upload-using-angularjs  LINK ZA UPLOADANJE SLIKA, 3. odgovor sa scorom 58
