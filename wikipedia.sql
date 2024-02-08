-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 27, 2020 at 09:17 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wikipedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `articleID` int(10) NOT NULL AUTO_INCREMENT,
  `article_title` mediumtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `article_content` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `categoryID` int(10) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `userID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`articleID`, `article_title`, `article_content`, `categoryID`, `image`, `userID`) VALUES
(1, 'Nogomet', 'Nogomet je sport u kojemu se dvije momčadi od 11 igrača nadmeću na pravokutnom igralištu travnate površine. Cilj igre jest postizanje više pogodaka od protivničke momčadi bilo kojim dijelom tijela osim rukom. Vratar je jedini igrač kojemu je dozvoljeno igrati i zabiti gol rukama, doduše samo unutar jasno označenog pravokutnika ispred vlastitih vrata. Svim igračima dopušteno je proizvoljno kretanje po terenu, iako pravilo zaleđa ograničava napadačke kretnje ovisno o položaju lopte i protivničke obrane.', 1, 'http://localhost/Digipedia/images/e13b053854373b01abe7cf0aa7122b6a_XL.jpg', '1'),
(2, 'Košarka', 'Košarka je šport u kojem dvije momčadi sastavljene od pet igrača pokušavaju ostvariti što više poena (bodova) ubacivanjem lopte kroz obruč koša pod organiziranim pravilima. Kada se to dogodi govori se o košu.', 1, 'http://localhost/Digipedia/images/kosarka.jpg', '1'),
(3, 'Rukomet', 'Content= Rukomet je ekipni šport s loptom, u kojem se natječu dvije momčadi s po 7 igrača (6 igrača u polju + 1 golman) na svakoj strani, Osnovni cilj igre jest loptom pogoditi označeni prostor gola. Lopta se između igrača dodaje rukama slično kao u košarci, ali s nešto manjom loptom te uz drugačija pravila vođenja lopte.', 1, 'http://localhost/Digipedia/images/ivano-balic-rukomet-600x336.jpg', '1'),
(4, 'MMA', 'Content= Mješovite borilačke vještine (engl. Mixed Martial Arts (MMA)), poznatiji i kao ultimate-fight, slobodna borba, Vale Tudo (portugalska riječ, znači sve vrijedi) i free-fight je borilački sport u kojem se za pobjedu nad protivnikom koristi kombinacija velike većine borilačkih disciplina.', 1, 'http://localhost/Digipedia/images/13354056_web1_UFC-247-Mixed-Martial-Arts.jpg', '1'),
(5, 'Skateboarding', 'Skateboarding (u nas poznat i kao skejtanje) naziv je za ekstremni šport u kojem osoba (skejter) stoji na posebnoj dasci s kotačima na dvije osovine (skateboardu ili skejtu) te pritom izvodi razne trikove. Sam naziv dolazi od dvije engleske riječi: skate, što znači \"klizati\" te board, što znači \"daska\".', 1, 'http://localhost/Digipedia/images/5421a1e0e4d4c7f5b37108ec12beea5a.jpg', '1'),
(6, 'Stari vijek', 'Stari vijek dijelimo prema kulturama čiji tragovi su se zadržali do danas (3.500 pr. Kr. - 5. stoljeće). Najznačajnije civilizacije su Drevna Mezopotamija, Drevni Egipat, Drevna Kina, Drevna Indija, Drevna Grčka i Drevni Rim.', 2, 'http://localhost/Digipedia/images/Pieter_Bruegel_the_Elder_-_The_Tower_of_Babel_(Vienna)_-_Google_Art_Project_-_edited.jpg', '1'),
(7, 'Srednji vijek', 'Nakon pada Zapadnog Rimskog carstva prilikom Velike seobe naroda u Europi počinje \"mračni\" srednji vijek. Bizant nastavlja tradiciju rimskoga carstva. Na zapadu u društvenim odnosima prevladava feudalizam. Najznačajniji pravci u umjetnosti toga razdoblja su predromanika, romanika i gotika.', 2, 'http://localhost/Digipedia/images/plug.jpg', '1'),
(8, 'Novi vijek', 'U ranom novom vijeku čovjek gradi brodove kojima istražuje i oplovljava cijeli svijet. Kao početak razdoblja novog vijeka uzima se godina Kolumbovog otkrića Amerike, 1492. godine. U društvenim odnosima se pojavljuje kapitalizam. U umjetnosti i znanosti javljaju se renesansni i barokni stil, te klasicizam i prosvjetiteljstvo. Dolazi i do industrijske revolucije.', 2, 'http://localhost/Digipedia/images/1272x570_Heritage_KochStory1-min.jpg', '1'),
(9, 'Suvremena povijest', 'Najnovije doba - doba današnjice, poslije otkrića parnog stroja i željeznice, proizvodnje na vrpci (automobili), zrakoplovi, struja, računala... Kao početak se uzima konac prvog svjetskog rata 1918. godine (nekad se isticalo i nakon Listopadske revolucije 1918.). U društvenim odnosima se pored kapitalizma, koji je sam doživio duboke promjene, javlja i socijalizam. Dvadeseto stoljeće obilježila su dva svjetska rata uz ogromne ljudske gubitke. Razdoblje nakon Drugog svjetskog rata, koje je potrajalo do kraja stoljeća naziva se razdobljem hladnog rata.', 2, 'http://localhost/Digipedia/images/suvremena.jpg', '1'),
(10, 'Hrvatska povijest', 'Hrvatski je narod oko 626. podložio rimske pokrajine Dalmaciju, Panoniju (bivši Ilirik) te osnovao dvije neovisne kneževine, koje je u Hrvatsko Kraljevstvo ujedinio njegov prvi kralj Tomislav, okrunjen 925. godine.', 2, 'http://localhost/Digipedia/images/800px-Oton_Ivekovic,_Dolazak_Hrvata_na_Jadran.jpg', '1'),
(11, 'Hrvatska kultura', 'Kultura u Hrvatskoj ima svoje korijene u dugoj hrvatskoj povijesti: Hrvati naseljavaju ova područja četrnaest stoljeća ali postoje i značajni ostaci drugih, starijih naroda koji su živjeli na ovim područjima, i koji su dobro očuvani.', 3, 'http://localhost/Digipedia/images/nematerijalna-bastina-800x533.jpg', '1'),
(12, 'Obilježja kulture', 'Kultura ima nekoliko karakterističnih obilježja: Temelji se na simbolima.\r\nLjudi pomoću kulture u istome društvu dijele zajedničko ponašanje i način razmišljanja.\r\nKultura se uči: kao što ljudi biološki nasljeđuju mnoge fizičke osobine i instinkte ponašanja, tako se kultura nasljeđuje kroz društvo, tj. osoba mora naučiti kulturu od ostalih članova društva.\r\nKultura je prilagodljiva: ljudi je koriste da se fleksibilno i brzo prilagode promjenama u svijetu oko njih.\r\n', 3, 'http://localhost/Digipedia/images/unnamed.jpg', '1'),
(13, 'Definiranje kulture', 'Mnogi ljudi danas koriste shvaćanje \"kulture\" koje se razvilo u Europi tijekom 18. i ranog 19. stoljeća. To shvaćanje kulture odražavalo je nejednakost unutar europskih društava i među europskim silama i njihovim kolonijama diljem svijeta. Ono izjednačuje \"kulturu\" s \"civilizacijom\" i suprostavlja oboje \"prirodi\". Prema tom mišljenju neke su zemlje civiliziranije od drugih kao što su i neki ljudi kulturniji od drugih. Stoga su neki kulturni teoretičari zapravo pokušali izbaciti popularnu ili masovnu kulturu iz definicije kulture.', 3, 'http://localhost/Digipedia/images/1_eoHVQskFWPUrc2NQgK-Z2A.jpg', '1'),
(14, 'Kultura kao svijetski „gledana“', 'Tijekom romantizma u Njemačkoj su znanstvenici, posebno oni zaokupljeni nacionalizmom (težnja za ujedinjenjem Njemačke i borba potlačenih naroda u Austro-ugarskoj Monarhiji), razvili obuhvatniji pojam kulture kao \"svjetski gledane\". Taj način razmišljanja, različit i neusporediv pogled na svijet, obilježje je svake etničke grupe. Iako obuhvatnije od ranijih gledišta, taj pristup još uvijek je dopuštao razlike među \"civiliziranim\" i \"primitivnim\" ili \"plemenskim\" kulturama.\r\n\r\n', 3, 'http://localhost/Digipedia/images/Cultural+Understanding.jpg', '1'),
(15, 'Kulturne komponente', 'Drugi uobičajen način razumijevanja kulture je promatranje kulture koju čine njene komponente: simboli, jezik, vrijednosti, norme, i rituali.', 3, 'http://localhost/Digipedia/images/0_lwOezQxnAslnPbwL.jpg', '1'),
(16, 'Matematika', 'Matematika (od grčkog mathema - znanost) je egzaktna (točna, nedvojbena) znanost koja izučava aksiomatski definirane apstraktne strukture koristeći matematičku logiku. Matematika izniče gdje god se pojavljuju pitanja vezana za veličinu, strukturu, prostor ili promjenu. U početku vezano uz trgovinu i mjerenje zemljišta, kasnije astronomiju, a danas uz mnoga područja života. Matematika se uči u osnovnim i srednjim školama kao obavezan predmet. Također i veliki dio fakulteta ima obavezne i izborne matematičke kolegije.', 4, 'http://localhost/Digipedia/images/b888d8f803.jpg', '1'),
(17, 'Fizika', 'Fizika (grč. φυσıϰή, od φυσıϰός: prirodan, naravan) je temeljna prirodna znanost koja se bavi materijom, gibanjem, energijom i međudjelovanjem. Fizikalni zakoni izražavaju se u matematičkom obliku. U fizici su pokus (istraživanje pojava pod uvjetima koji se kontroliraju što je više moguće) i teorija (koja opisuje fizikalne pojave u obliku pojednostavnjenih matematičkih modela) komplementarni.', 4, 'http://localhost/Digipedia/images/906524e1ea.jpg', '1'),
(18, 'Biologija', 'Biologija (od grčkog bios=život i logos=nauka, učenje) je znanost koja se bavi proučavanjem živoga svijeta, znanost o životu. Biologija proučava svojstva i ponašanje organizama, njihov rast, razvoj i razmnožavanje, kao i interakcije između različitih organizama, te organizama i njihovog okoliša. Biologija obuhvaća široki spektar akademskih područja koja se često smatraju različitim disciplinama. Ove discipline zajedno proučavaju život na različitim razinama.', 4, 'http://localhost/Digipedia/images/87371f0f52.jpg', '1'),
(19, 'Astronomija', 'Astronomija ili zvjezdoznanstvo (grč. ἀστρονομία: zvjezdoznanstvo) je znanost o nebeskim tijelima i pojavama u svemiru te o njegovu ustroju; jedna od najstarijih ljudskih djelatnosti. Astronomija se razvila iz praktičnih potreba i zadržala je i dalje taj svoj praktični značaj (izradba kalendara, određivanje točnog vremena, točnog položaja, orijentacija pri putovanju, osobito na moru i u zraku). Izvanredno dug razvoj astronomije kao egzaktne prirodne znanosti, niz otkrića i uspjesi što ih je postizala u ispravnom tumačenju prirodnih pojava omogućili su da se pravilno ocijeni njezina uloga pri upoznavanju svijeta koji nas okružuje..', 4, 'http://localhost/Digipedia/images/7da88ae329.jpg', '1'),
(20, 'Računalno programiranje', 'Programiranje je pisanje uputa računalu što i kako učiniti, a izvodi se u nekom od programskih jezika. Programiranje je umjetnost i umijeće u stvaranju programa za računala. Stvaranje programa sadrži u sebi pojedine elemente dizajna, umjetnosti, znanosti, matematike kao i inžinjeringa. Osoba koja stvara program zove se programer.', 4, 'http://localhost/Digipedia/images/992b22cedc.jpg', '1'),
(21, 'Glazba', 'Glazba je umjetnost čiji je medij zvuk kojeg organiziramo u vremenu i prostoru, uglavnom po nekom planu i namjerno, iako ima i drugih načina. Glazba je umjetnost tona koja oplemenjuje ćud čovjeka, budi osjećaj za red i ljepotu, te time idealizira i karakterizira različite narode. Stvaranje, izvođenje, važnost, a nekad i definicija glazbe veoma ovise o kulturi i socijalnim aspektima. Glazbu dijelimo u žanrove i podžanrove, ali njihove granice i veze ponekad ovise o osobnoj interpretaciji.', 5, 'http://localhost/Digipedia/images/23cd188b85.jpg', '1'),
(22, 'Slikarstvo', 'Slikarstvo je likovna umjetnost oblikovanja plohe bojom (sve što nastaje umjetničkim slikanjem). Slikanje je postupak gdje se nečim nanosi mješavina pigmenta i ljepila na podlogu (plohu) stvara slika. Plohe i tehnike slikanja su različite: npr. plohi zida odgovara tehnika freske, drvenoj ploči ili platnu – tempera, uljene boje, papiru – akvarel, tempera, gvaš, itd. Slikarstvu je pretpostavka crtež, a osnovno izražajna sredstva su mu boja i ploha (likovna umjetnost). No, za razliku od fotografije, slikar ima veću slobodu oblikovanja i likovnog izražavanja, tj. može mijenjati oblik i boju svakog lika, prostora ili njihove odnose, pa čak i stvarati iz mašte ono što ne postoji.', 5, 'http://localhost/Digipedia/images/f2fea51b69.jpg', '1'),
(23, 'Film', 'Film (eng. film - kožica, opna, tanki sloj) vizualna je projekcija u pokretu, najčešće ozvučena. Hrvatski naziv za film je slikopis. Razlika između filma i snimke je u tome što film gradi neko očekivanje koje zatim ispuni (npr. rijeka koja teče je snimka, a rijeka koja teče i zatim se ukaže brod je film). Filmska slika je ono što se pretežno razabire na temelju projekcije filmske snimke.\r\nKao i drugi oblici umjetnosti, film je namijenjen publici. Filmovi se gledaju u posebnom prostoru za projekciju (kino), ili bilo gdje drugdje (video). Film se često spominje kao sedma umjetnost, kao što je strip nazvan devetom umjetnošću.\r\nFilmsko djelo je cjelovit te društveno i doživljajno svrhovit filmski proizvod. Film i kinematografiju sustavno proučava humanističko-znanstvena disciplina filmologija.\r\n\r\n', 5, 'http://localhost/Digipedia/images/68824fde9b.jpg', '1'),
(24, 'Književnost', 'Književnost je sveukupnost pisanih predložaka, djela, dokumenata, spomenika jednog jezika, naroda, kulturnog kruga ili civilizacije. Književnost može značiti i kao umjetnost lijepih riječi.\r\nKnjiževnost je i zbir tekstova pedagoškog, filozofskog, religijskog, općenito humanističkog značaja, za razliku od djela uže znanstvene, prirodnjačke, tehničke ili praktične naravi.\r\nKnjiževnošću se nazivaju i djela takozvane \"lijepe književnosti\", najraznovrsniji sastavci ostvareni kao umjetnost riječi i pisane riječi, u kojima pisac izražava osobni svjetonazor i vlastite zamisli subjektivne naravi, koje se ne mogu iznijeti kao objektivna znanstvena činjenica.\r\n\r\n', 5, 'http://localhost/Digipedia/images/2c5c72c16f.jpg', '1'),
(25, 'Strip', 'Strip je niz naracijom povezanih prizora. Strip dolazi od američkog naziva Comic Strip što doslovno znači komična traka. Njegovo postojanje povezano je s pojavom masovnih medija. Iako u početku egzistira kao dodatna zabava za čitatelje novina ubrzo postaje neovisni medij ili kako se voli kazati \"deveta umjetnost\".', 5, 'http://localhost/Digipedia/images/a00c71e2e9.jpg', '1'),
(26, 'Povijest medicine', 'Povijest medicine temelji se na zapisima liječnika koji su liječili bolesnike unatrag više od 4500 godina. Međutim, veći dio tog vremena liječnici su imali vrlo malo stvarnog znanja i uglavnom su se oslanjali na praznovjerje i liječenje biljkama. Medicinska znanost kakvu danas poznajemo počela se razvijati prije 300 godina kad je procvat znanosti omogućio liječnicima poznavanje načina rada tijela. Kasnije su izumi, poput cjepiva, olakšali liječenje bolesnika. Današnji napredak u medicini sačuva više života nego ikad ranije, no to može biti skupo i mnogo siromašnih ljudi na svijetu to sebi ne može priuštiti.', 6, 'http://localhost/Digipedia/images/bfdc2bad11.jpg', '1'),
(27, 'Tradicijska medicina ', 'Tradicijska medicina izraz je koji se rabi za dio alternativne medicine ili medicine koja proizlazi iz narodnog znanja.\r\nOpisuje medicinsko znanje koje se sustavno razvijalo kroz generacije različitih društava prije modernog doba medicine. Tradicijske metode liječenja su primjerice biljne metode, ajurveda, unani, drevna iranska medicina, islamska medicina, tradicijska kineska medicina, akupunktura, muti, Ifa, i druga medicinska znanja sa svih krajeva svijeta.\r\n', 6, 'http://localhost/Digipedia/images/71e0a3090a.jpg', '1'),
(28, 'Veteranska medicina', 'Veterina (veterinarstvo, veterinarska medicina) je grana medicine koja se bavi bolestima domaćih i divljih životinja, kao i kućnih ljubimaca.\r\nBrine se o zdravlju i zaštiti životinja, pridruženim istraživanjima, ali i o hrani životinjskog porijekla i srodnim temama. To je od velike važnosti, prije svega radi zaštite potrošača, zbog odgovornosti za kontrolu hrane životinjskog podrijetla u proizvodnji i pri daljnoj preradi.\r\n', 6, 'http://localhost/Digipedia/images/f7151f7ae4.jpg', '1'),
(29, 'Fitopatologija', 'Fitopatologija (lat. \"phyton\" = biljka; \"pathos\" = bolest, patnja; \"logos\" = nauka) je znanost o biljnim bolestima. Bavi se proučavanjem patogenih mikroorganizama i abiotičkih faktora koji izazivaju biljne bolesti, mehanizmom njihovog nastanka, interakcijom uzroka i oboljele biljke i pronalaženjem mjera za njihovo suzbijanje.', 6, 'http://localhost/Digipedia/images/74e16fc407.jpg', '1'),
(30, 'Anatomija', 'Anatomija je biološka disciplina koja se bavi strukturom i organizacijom organizama. U užem smislu naziv se odnosi na znanost o građi čovječjeg tijela (anthropotomia), ali u širem smislu on obuhvaća i znanosti o sustavu tijela životinja (zootomia) i biljaka (pythotomia).', 6, 'http://localhost/Digipedia/images/19da9b9768.jpg', '1'),
(31, 'Predškolsko obrazovanje', 'Rani i predškolski odgoj u Republici Hrvatskoj uređen je Zakonom o predškolskom odgoju i obrazovanju (Narodne novine br.: 10/1997, 107/2007, 94/2013) i pripadajućim podzakonskim aktima te obuhvaća odgoj, obrazovanje i skrb o djeci predškolske dobi, a ostvaruje se programima odgoja, obrazovanja, zdravstvene zaštite, prehrane i socijalne skrbi za djecu od šest mjeseci do polaska u osnovnu školu.', 7, 'http://localhost/Digipedia/images/9fb8cdab33.jpg', '1'),
(32, 'Osnovnoškolsko obrazovanje', 'Traje najmanje osam godina, a svrha mu je omogućiti učeniku stjecanje znanja u skladu s njegovim sposobnostima i sklonostima. Kao roditelj za svoje dijete imate pravo izabrati vrstu, oblik i metode osnovnog školovanja\r\nTijekom osnovnoškolskog odgoja i obrazovanja vaše će dijete steći temeljne (općeobrazovne) kompetencije za nastavak školovanja i cjeloživotno učenje u promjenjivom društveno-kulturnom kontekstu prema zahtjevima tržišnog gospodarstva, suvremenih informacijsko-komunikacijskih tehnologija i znanstvenih spoznaja i dostignuća.\r\n', 7, 'http://localhost/Digipedia/images/c39c00c7a6.jpg', '1'),
(33, 'Srednjoškolsko obrazovanje', 'Srednja škola je trogodišnja ili četverogodišnja škola koju učenik pohađa nakon završene osmogodišnje osnovne škole.\r\nSrednje se škole dijele na gimnazije, strukovne škole i umjetničke škole. Gimnazije mogu biti opće, jezične, klasične, prirodoslovno-matematičke i prirodoslovne, a obrazovanje u njima traje četiri godine. Strukovne se škole dijele na četverogodišnje (tehničke, gospodarske, poljoprivredne i dr.), trogodišnje (industrijske, obrtničke i dr.) škole i jedna petogodišnja škola (zdravstvena). Umjetničke škole obrazuju učenike u području glazbe, plesa, likovne umjetnosti i dizajna, a školovanje u njima traje četiri godine. Osim ovih, postoje i srednje škole MUP-a, vojne škole i vjerske škole.\r\nNakon četverogodišnje srednje škole učenik može nastaviti obrazovanje na visokim učilištima.\r\n', 7, 'http://localhost/Digipedia/images/75496796f2.jpg', '1'),
(34, 'Diplomsko obrazovanje', 'Diplomsko obrazovanje uključuje stjecanje naobrazbe po završetku koje se dobiva akademski naziv magistra, profesionalna ili akademska potvrda, ili druga kvalifikacija za koju je preduvjet općenito bio dovršetak preddiplomskog studija, a normalno se smatra dijelom visokog obrazovanja.\r\nOrganizacija i struktura diplomskog obrazovanja različita je u raznim zemljama pa i u raznim ustanovama unutar iste države.\r\n', 7, 'http://localhost/Digipedia/images/fb27e9d48b.jpg', '1'),
(35, 'Posljediplomsko obrazovanje', 'Poslijediplomsko obrazovanje obuhvaća posljednju, treću razinu visokog obrazovanja po završetku koje se stječe, ovisno o vrsti studija, akademski stupanj doktora znanosti ili umjetnosti odnosno specijalista.\r\nNastava poslijediplomskog obrazovanja u pravilu se izvodi na sveučilištu.\r\nTrajanje poslijediplomskih doktorskih studija obično iznosi tri godine, a poslijediplomskog specijalističkog studija obično godinu dana\r\n', 7, 'http://localhost/Digipedia/images/9447248dca.jpg', '1'),
(36, 'Prapovijesna tehnologija', 'Prapovijesna tehnologija je vezana uz prapovijest koje je najdulje razdoblje u prošlosti čovječanstva. Početak prapovijesti određuje se prvim nalaskom alata hominida (negdje oko 2.500.000 godina pr. Kr.), a kraj s početkom ljudske pismenosti (tj. najstarijim nalazima ljudske pismenosti) - oko 3500. godine pr. Kr. Prapovijest se dijeli na dva velika razdoblja – kameno doba i metalno doba. Kameno doba dijeli se na starije (paleolitik), srednje (mezolitik) i mlađe kameno doba (neolitik), a metalno doba na bakreno, brončano i željezno doba.', 8, 'http://localhost/Digipedia/images/4d3f474eb0.jpg', '1'),
(37, 'Tehnologija drevnih civilizacija', 'Tehnologija drevnih civilizacija se odnosi na urbanu revolucija, koja označava kraj kamenoga doba i početak brončanoga doba, kraj prapovijesti i početak povijesti, koja je započela prije otprilike 6000 godina na Bliskom istoku i u konačnici je dovela do prvih civilizacija, sa svim društvenim i povijesnim posljedicama koje ih prate: visoka gustoća stanovništva (veće populacije), gradovi, razvoj složenih i raslojenih društava (specijalizacija struka i oštrija podjela rada), ', 8, 'http://localhost/Digipedia/images/a1fa962e40.jpg', '1'),
(38, 'Tehnologija stare Grčke', 'Tehnologija stare Grčke je u toku čitave antike bila potpuno odvojena od starogrčke znanosti i filozofije. Stotine malih novih tehnologija i tehničkih poboljšanja se pojavilo tijekom 1200 godina antike, poput nožnog kola dodanog lončarskom kolu, ali se u cjelini tehnološki temelj proizvodnje nije promijenio tijekom cijelog razdoblja. U nekim se granama tehnologije, poput rudarstva, pojavio industrijski stil proizvodnje, a postala je uobičajena i trgovina na velike udaljenosti. No većina proizvodnje je ostala zasnovana na obrtništvu i lokalna, a obrtnici, tradicionalno skloni skrivanju svog umijeća, su nastojali monopolizirati svoje vještine, ne oslanjajući se na pisanu riječ, znanost ili filozofiju prirode.', 8, 'http://localhost/Digipedia/images/dbc17b10cc.jpg', '1'),
(39, 'Tehnologija srednjeg vijeka ', 'Tehnologija srednjeg vijeka u Europi je oblikovana zahvaljujući nizu međusobno povezanih tehnoloških novina: poljodjelska revolucija, nova vojna tehnika, oslanjanje na vodui vjetar kao izvore energije. Taj tehnološki razvoj daje važan dio odgovora na pitanje kako se je i zašto Europa preobrazila od kulturne zabiti zasnovane na gospodarstvu jedva naprednijem od onog tradicionalnih neolitičkih zajednica u cvatuću i jedinstvenu, ali i agresivnu civilizaciju, koja će povesti svijet u razvoj znanosti i industrije.', 8, 'http://localhost/Digipedia/images/645a2d7856.jpg', '1'),
(40, 'Industrijska revolucija', 'U drugoj polovici XVIII. stoljeća ručna se proizvodnja počela zamjenjivati parnim strojevima. Time je počeo razvoj koji je od kraja 18. do sredine 19. stoljeća temeljito izmjenio ranije političke, gospodarske i društvene sustave u većem dijelu svijeta. Počela je Prva industrijska revolucija. U Engleskoj su proizvođači sve više ulagali novac u stvaranje novih izuma. No, najpoznatiji je bio izum parnog stroja. Njega je 1764. godine usavršio Škot James Watt. Pronalazak parnog stroja izazvao je veliki preokret u proizvodnji, odnosno revoluciju u prerađivačkim djelatnostima ili industriji. Manufakturna proizvodnja zamijenjena tvorničkim radom.', 8, 'http://localhost/Digipedia/images/4b3f85f2eb.jpg', '1'),
(41, 'Kršćanstvo', 'Kršćanstvo (grč. Xριστός) je monoteistička svjetska religija, nastala u Palestini u prvom stoljeću nakon Kristova rođenja. Obuhvaća brojne kršćanske crkve, zajednice i sekte, kojima je zajednička vjera u Isusa Krista, te prihvaćanje života u skladu s evanđeljem. Utemeljio ju je Isus Krist, a njezini sljedbenici nazivaju se kršćanima. Kršćanstvo pripada tipu povijesne, proročke i objavljene religije, etično-mistične strukture, spasenjski i eshatološki usmjerene. Kroz povijest se raščlanilo na više konfesija (katolicizam, pravoslavlje, protestantizam, nestorijanstvo i monofizitstvo) i njima odgovarajućih Crkava (Katolička Crkva, pravoslavne Crkve, protestantske Crkve i istočne pretkalcedonske Crkve; vidi popis kršćanskih crkvi i pokreta). Kršćanska era počinje Isusovim rođenjem.', 9, 'http://localhost/Digipedia/images/506f8e3854.jpg', '1'),
(42, 'Judaizam', 'Judaizam je religija koja propovijeda vjeru u jednog, bestjelesnog i samo duhovnog Boga, oca svih ljudi. Bog predstavlja sveukupnost moralnih savršenstava i od ljudi zahtijeva ljubav i pravednost. Ime Boga zbog njegove svetosti nije dozvoljeno izgovarati. Judaistička religioznost temelji se na poslušnosti prema “božanskom zakonu”. Ovaj zakon sadržan je u hebrejskoj Bibliji. Biblija je sintetiziran rukopis od 24 knjige. Pisana je na hebrejskom i djelomično na aramejskom jeziku. Govori o povijesti, idejama i društvenim borbama judinog naroda. Ujedno to je i zbirka vjerskih i pravnih propisa, kao i starih mitova koje su Judeji preuzeli od drugih naroda istoka. ', 9, 'http://localhost/Digipedia/images/c6c71d2d90.jpg', '1'),
(43, 'Hinduizam', 'Hinduizam je drevna azijska religija čiji početci sežu iz razdoblja od 16. do 15. stoljeća prije Krista, koja je započela svoj razvoj u Indiji, gdje je i danas glavna religija. Indijci, međutim, radije govore o vječnom učenju i zakonu (sanātana dharma), jer je naglasak na načinu života više nego na načinu mišljenja. Hinduizam se izdvaja među svjetskim religijama po neuobičajenoj šarolikosti teoloških i filozofskih doktrina, svjetonazora i religijskih organizacija. Unutar njega postoje razlike često veće od onih među formalno različitim svjetskim religijama što čini svaki pokušaj jezgrovitog definiranja i opisivanja te religije teškim, pa i nemogućim.', 9, 'http://localhost/Digipedia/images/12fdf0c10b.jpg', '1'),
(44, 'Budizam', 'Budizam je jedna od pet velikih svjetskih religija. Nastao je u VI stoljeću prije Krista u sjevernoj Indiji. Osnovao ga je Sidarta Gautama, za kojeg se većina stručnjaka slaže da je živio od 563. do 483. pr. Kr. Najstariji sačuvani podaci nalaze se u tekstovima prakriti skupine jezika koja uključuje gandari i pali. Tekstovi na pali jeziku su formirali kanon današnjeg teravada budizma dok su gandara tekstovi, iako nestali iz aktivne upotrebe, kao najstariji dostupni zapisi danas iznimno bitni za razumijevanje ranih faza razvoja. Djelomično su sačuvane i druge verzije ranih škola pri čemu su važni kineski prijevodi koji ponekad sadrže jedine preostale zapise određenih tekstova, kao i neki drugi fragmenti i tekstovi. Glavne grane budizma su teravada (škola starih) i mahajana (velika kola) dok se vađrajana ponekad smatra zasebnom, a ponekad dijelom mahajane. Budizam utjecao na europsku filozofiju, osobito u XIX. stoljeću. Broj sljedbenika budizma procjenjuje se između 150 do 500 milijuna jer budizam ne isključuje i pripadnost nekoj drugoj vjeri.', 9, 'http://localhost/Digipedia/images/a546f03210.jpg', '1'),
(45, 'Islam', 'Islam ili muhamedanstvo, monoteistička svjetska religija utemeljena je u Arabiji u VII. stoljeću. Utemeljio ju je Muhamed, a njezini sljedbenici nazivaju se muslimani. Pripada tipu objavljene i pravne religije. Islam znači religiju (din), stav predanosti Bogu (iman) i civilizaciju (ovozemaljsko uređenje zajednice po islamskim zakonima). Islamska era počinje 622., kad se Muhamed sa svojim pristašama seli iz Meke (gdje su se tadašnji Arapi protivili širenju islama) u Medinu (hidžra).', 9, 'http://localhost/Digipedia/images/c594de47e9.jpg', '1'),
(46, 'Psihologija', 'Izraz \"psihologija\" je sastavnica koja potječe iz grčkog psiha = duh, duša, život, um, dah i logos = govor, riječ, promišljanje, rasuđivanje. Doslovno tako psihologija znači promišljanje ili rasuđivanje o duhu ili duši. Značenje pojma ostaje nepromijenjeno sve do šesnaestog ili sedamnaestog stoljeća, kada mu je pridodano novo značenje u smislu \"znanost o svijesti\".', 10, 'http://localhost/Digipedia/images/dd185ee62f.jpg', '1'),
(47, 'Sociologija', 'Sociologija je znanost koja proučava društva i načine na koje ta društva oblikuju ponašanje, vjerovanja i identitet ljudi.', 10, 'http://localhost/Digipedia/images/072e03354f.jpg', '1'),
(48, 'Politologija', 'Političke znanosti (često se spominju kao politologija ili politička znanost) su znanstveno polje društvenih znanosti, koje se bave s znanstvenim studijem politike. Bave se suživotom građana, i kako bi se trebao nadzirati taj suživot s pogledom na institucionalne, postupovne i predmetno-materijalne temelje. Najvažniji predmeti te znanosti su strukturalni problemi demokracije, sustavne konkurencije socijalizma i kapitalizma, političkih stranaka i društvenih pokreta, međunarodnim odnosima, državnim intervencijama u gospodarstvu, političkim stajalištima i svjesnih oblika, odnosima religije i politike-politologijom religije, javnim mnijenjem, masovnim medijima i izbornom ponašanju.', 10, 'http://localhost/Digipedia/images/1d988c1368.jpg', '1'),
(49, 'Antropologija', 'Antropologija je znanstvena disciplina koja proučava kulturnu i biološku različitost ljudi. Antropologija proučava čovjeka, njegovu kulturu, njegov jezik, njegovu evolucijsku prošlost i srodnike primate, sličnosti i razlike među ljudima od razine genetike do razine kulture. Istražuje kako ljudi žive, što rade, što misle i kako se odnose prema okolini.', 10, 'http://localhost/Digipedia/images/aa2c16352a.jpg', '1'),
(50, 'Ekonomija', 'Ekonomija u slobodnom bi prijevodu značila skup pravila i vještina upravljanja domaćinstvom; gospodarstvo; razumna uporaba novca ili kakva drugoga sredstva radi postignuća najveće koristi uz najmanju žrtvu. Znanost koja proučava ekonomske djelatnosti uopće ili zasebna gospodarska područja, poduzeća i slično.', 10, 'http://localhost/Digipedia/images/94c7aec1e3.jpg', '1'),
(51, 'Sedam svijetskih čuda', 'Sedam svjetskih čuda je sedam veličanstvenih čovjekovih dostignuća u arhitekturi i građevinarstvu. Kako civilizacija vremenom napreduje, tako postoji nekoliko takvih popisa.', 11, 'http://localhost/Digipedia/images/00094b000d.webp', '1'),
(52, 'Crkvena arhitektura', 'Crkveno graditeljstvo ili crkvena arhitektura označava arhitekturu kršćanskih crkava. U sebi spaja širok raspon vjerskih i svjetovnih umjetničkih stilova koji su utjecali na razvoj izgleda i konstrukcije crkvenih zgrada od postanka kršćanstva do danas.', 11, 'http://localhost/Digipedia/images/9e62adebbf.jpg', '1'),
(53, 'Gotička arhitektura', 'Gotika je najreprezentativnija u arhitekturi gdje se karakteristike ovog stila najviše poznaju.', 11, 'http://localhost/Digipedia/images/df13455e04.jpg', '1'),
(54, 'Romantička arhitektura', 'Romanika je stil arhitekture koji dolazi nakon predromanike. Traje od 10. do 13. st.', 11, 'http://localhost/Digipedia/images/12d3dcefcc.jpg', '1'),
(55, 'Hrvatska arhitektura', 'Hrvatska arhitektura je arhitektura na području današnje Republike Hrvatske.', 11, 'http://localhost/Digipedia/images/4c73f995fe.jpg', '1'),
(56, 'Antička filozofija', 'Antička filozofija obuhvaća filozofska mišljenja i sustave koji su se razvili na širokom sredozemnom prostoru prožetom starom grčkom i rimskom kulturom u razdoblju od 7. stoljeća pr. Kr. do propasti starog svijeta početkom 6. stoljeća.', 12, 'http://localhost/Digipedia/images/4a03e46480.jpg', '1'),
(57, 'Srednjovijekovna filozofija', 'Poslije propasti Zapadnog Rimskog Carstva (476.) završava antičko razdoblje.', 12, 'http://localhost/Digipedia/images/362d3f3ccf.jpg', '1'),
(58, 'Metafizika', 'Metafizika je grana filozofije koja istražuje principe stvarnosti koji transcendiraju one koje su u bilo kojoj određenoj znanosti. Kozmologija i ontologija su tradicionalne grane metafizike. Bavi se objašnjenjem krajnje prirode bitka i svijeta.', 12, 'http://localhost/Digipedia/images/fd4da84974.jpg', '1'),
(59, 'Ontologija', 'Ontologija (opća metafizika) je temeljna disciplina metafizike, koja proučava biće kao takvo, tj. ako ono jest biće. Ona ne promatra biće pod nekim ograničenim vidom, dakle neko konkretno biće ili područje bitka (kao ostale znanosti), nego ona biće promatra kako je ono po sebi, u svojoj biti. Proučavajući biće, ontologija propituje prva počela i uzroke bića kao takvog, njegovu bit, njegovo postojanje (egzistenciju), njegovu mogućnost, odnosno stvarnost, njegove kategorije te, od kategorija šire, transcendentalije.', 12, 'http://localhost/Digipedia/images/13e31fb7ca.png', '1'),
(60, 'Najpoznatiji filozofi', 'Filosof je osoba koja se bavi filozofijom. Etimološko značenje dolazi od grčkog philos i sofia, što znači \"ljubitelj mudrosti\" (uporediti s filantrop). To bili uglavnom znanstvenici i mislioci, no kako se filozofija razlučivala na posebne znanosti, npr. na fiziku, biologiju i sociologiju, pripadnici ovih grana sve su se rjeđe nazivali filozofima a sve češće fizičarima, biolozima i sociolozima. Veliki broj osoba koji se bavio filozofijom pripadao je akademskim krugovima, ali u filozofiji su također imali značajan udio i osobe izvan ili na rubu akademskog svijeta. Kant i Hegel su npr., bili uspješni i slavljeni akademici ali njih su nadmašili npr. David Hume, Nietzsche i Gottlob Frege.', 12, 'http://localhost/Digipedia/images/f8f2859a22.jpg', '1'),
(61, 'Sisavci', 'Sisavci (Mammalia) su jedan od razreda unutar velike skupine životinja s kralježnicom, a u tradicionalnoj sistematici su razvrstani u razred. U najuočljivije osobine sisavaca spadaju krzno i hranjenje podmlatka mlijekom - sisanje. Na svijetu danas postoji 5.500 različitih recentnih vrsta, koje se po nekim podjelama svrstavaju u 3 podrazreda: prasisavci (Prototheria), tobolčari (Metatheria) i placentalni sisavci (Eutheria) u koju, zoološki promatrano, spada i čovjek.', 13, 'http://localhost/Digipedia/images/f4510a6009.jpg', '1'),
(62, 'Gmazovi', 'Gmazovi (Reptilia) ili reptili (od lat. reptilis - onaj koji gmiže) su jedan razred kralježnjaka. Kao filogenetički takson ili kao zatvorena razvojna grupa, trebali bi sadržavati i ptice. Ovdje se obrađuje svrstavanje u gmazove prema klasičnoj podjeli koja ne odgovara prirodnom grupiranju, jer oni nisu svi potomci zadnjih zajedničkih predaka. Gmazovi su kralježnjaci koji ni u jednom stadiju svog života nisu vezani za vodu. Oni su prvi pravi kopneni kralježnjaci. Ova skupina je dobila naziv gmazovi zbog nogu koje su im postavljene sa strane pa gmižu.', 13, 'http://localhost/Digipedia/images/244d54773e.jpg', '1'),
(63, 'Ptice', 'Ptice (lat. aves) su razred dvonožnih, toplokrvnih kralježnjaka koji polažu jaja. Ptice su tijekom jure evoluirale od dinosaura podreda Theropoda, a najranija poznata ptica iz kasne jure je Archaeopteryx. Veličinom variraju od sitnih kolibrića do krupnih nojeva. Postoji između 9 i 10 tisuća poznatih vrsta ptica i najraznovrsniji su razred među kopnenim kralježnjacima (Teropoda).', 13, 'http://localhost/Digipedia/images/79846f6d45.jpg', '1'),
(64, 'Galaktika', 'Galaktike ili galaksije su masivni sustavi sastavljeni od zvijezda, plina i prašine (međuzvjezdana tvar), te tamne tvari koje na okupu održava gravitacija. Riječ ima grčki korijen galaxias [γαλαξίας], u značenju \"mliječni,\" čime se mislilo na galaksiju Mliječni put. Tipične galaktike u rasponu su od patuljastih, s ne više od desetak milijuna (107) zvijezda, pa do divovskih u kojima ima do bilijun (1012) zvijezda, koje se sve kreću u putanjama oko središta mase.', 13, 'http://localhost/Digipedia/images/1646471466.jpg', '1'),
(65, 'Voda', 'Voda je kemijski spoj dva atoma vodika i jednog atoma kisika i jedan od osnovnih uvjeta života. Kemijska formula vode je H2O.', 13, 'http://localhost/Digipedia/images/27967ed46a.jpg', '1'),
(66, 'Oceanografija', 'Oceanografija (Ocean + grčki γράφειν = pisati), također zvana oceanologija, znanost o zemljinim oceanima i njihovih međusobno povezanih ekosustava te kemijskih i fizičkih procesa. Postoje pet glavnih područja unutar znanosti: definicija oceanografije je jednostavna, ona je znanost o oceanima.', 14, 'http://localhost/Digipedia/images/ea971195f7.jpg', '1'),
(67, 'Klimatografija', 'Klimatologija (klima, prema grč. ϰλίμα, genitiv ϰλίματος: nagib; strana svijeta) je znanost o klimi. Klimatologija na temelju meteoroloških podataka proučava fizičke osobine Zemljine atmosfere tijekom duljega vremenskog razdoblja. Klimatologija je dio meteorologije, odnosno geofizike.', 14, 'http://localhost/Digipedia/images/4b5b47d077.jpg', '1'),
(68, 'Glaciologija', 'Glaciologija je znanost o ledenjacima ili općenitije znanost o ledu i prirodnim pojavama vezanima uz led. Riječ ledenjak, tj. glečer dolazi iz latinskog glacies što označava led ili mraz.', 14, 'http://localhost/Digipedia/images/fa798173b8.jpg', '1'),
(69, 'Pedologija', 'Pedologija (ruski: Педология, od grčkog pedon = tlo, zemlja), je znanost o tlu njegovom sastavu i oblicima. Ona se bavi genezom, morfologijom, klasifikacijom i distribucijom tla.', 14, 'http://localhost/Digipedia/images/d3980c8d4a.gif', '1'),
(70, 'Hidrologija', '= Hidrologija (grčki: ὕδωρ/hidōr + λόγος/lógos), znanost o vodi, njenim fizikalnim svojstvima i pojavljivanju u prirodi. Podrazumijeva zajedno i hidrološki ciklus i vodna bogatstva.', 14, 'http://localhost/Digipedia/images/3e7725aa4a.jpg', '1'),
(71, 'Aerobik', 'Aerobik je vrsta treninga koja kombinira ritmičke aerobne vježbe s istezanjem i vježbama snage. Cilj aerobika je povećati snagu, elastičnost i kardiovaskularni kapacitet organizma. U načelu se izvodi grupno, uz glazbu i nazočnost instruktora aerobika.', 15, 'http://localhost/Digipedia/images/235f23bc03.jpg', '1'),
(72, 'Joga', 'Joga  označava sustavan pristup duhovnim vježbama unutar Indijskih i religijskih tradicija u njenoj sferi utjecaja.', 15, 'http://localhost/Digipedia/images/22251a4c22.jpg', '1'),
(73, 'Vitamini', 'Vitamini su esencijalni nutrijenti koje ljudsko tijelo ne može sintetizirati i mora ih uzimati putem hrane. Vitamini nastaju u biljkama uz pomoć sunca i/ili u bakterijama; u nekim slučajevima mogu nastati u ljudskom ili životinjskom organizmu.', 15, 'http://localhost/Digipedia/images/4166598b77.jpg', '1'),
(74, 'Kalistenika', 'Kalistenika je naziv za vježbe koje se sastoje od raznih čistih motoričkih pokreta kao što su trčanje, stajanje, hvatanje, guranje, skakanje i slično. Često se izvode ritmički i bez puno opreme te su to, u suštini, vježbe s vlastitom tjelesnom težinom. ', 15, 'http://localhost/Digipedia/images/9d6e3715ef.jpg', '1'),
(75, 'Bjelančevine', 'Bjelančevine ili proteini su, uz vodu, najvažnije tvari u tijelu. Najvažniji su čimbenik u rastu i razvoju svih tjelesnih tkiva. Glavni su izvor tvari za izgradnju mišića, krvi, kože, kose, noktiju i unutarnjih organa, uključujući srce i mozak. Sastavni su dijelovi svake stanice, što ih čini osnovom života na Zemlji. Izgrađene su od aminokiselina koje su međusobno povezane peptidnom vezom.', 15, 'http://localhost/Digipedia/images/be8766ad7c.jpg', '1'),
(76, 'Lirika', 'Lirika ili lirsko pjesništvo je književni rod kojem pripadaju književna djela u kojima su iskazani osjećaji, misli i doživljaji. Književno djelo napisano u stihovima ili prozi u kojemu su odabranim i umjetnički oblikovanim riječima iskazani doživljaji, osjećaji i misli nazivamo lirskom pjesmom. Lirika je kraće književno djelo napisano u stihovima. Može biti umjetnička i narodna.', 16, 'http://localhost/Digipedia/images/58fd1a4682.jpg', '1'),
(77, 'Epika ', 'Epika je književni rod u koji pripadaju sva pripovjedna djela u stihu i prozi. Pojam je nastao od grčke riječi ephos, što znači riječ ili pjesnička pripovijest. Epika obuhvaća svu pripovjednu književnost u stihu i prozi: epske pjesme, epovi, romance, balade, poeme, novele, romani, bajke, legende, basne i crtice.', 16, 'http://localhost/Digipedia/images/61eb4912fb.jpg', '1'),
(78, 'Drama', 'Drama znači radnja. Ona obuhvaća sve književne vrste namijenjene izvođenju na pozornici, a koje svoj pravi smisao dobivaju u kazališnoj predstavi.', 16, 'http://localhost/Digipedia/images/6d83f320e1.jpg', '1'),
(79, 'Dnevnik', 'Dnevnik, žanr autobiografske književnosti u kojem autor svakodnevno ili povremeno bilježi svoja zapažanja ili unutarnja stanja, vezana uz stvarne ili izmišljene događaje s kojima je povezan. Spada u diskurzivni književni rod.', 16, 'http://localhost/Digipedia/images/29d48c3eff.jpg', '1'),
(80, 'Poznati Hrvatski književnici', 'Jedni od najpoznatijih i najutjecajnijih Hrvatskih književnika su: Vjekoslav Novak, Miroslav Krleža, Dragutin Tadijanović, Tin Ujević, Ivo Andrić, Ivana Blić mažuranić,Marija Jurić Zagorka....', 16, 'http://localhost/Digipedia/images/73d4ba99d1.jpg', '1'),
(81, 'Kum', 'Kum (eng. The Godfather) je kriminalistička drama Francisa Forda Coppole temeljena na istoimenom romanu Maria Puza. U glavnim ulogama pojavljuju se Marlon Brando, Al Pacino, Robert Duvall, Diane Keaton i James Caan. Radnja filma proteže se na deset godina od kraja 1945. do 1955. te predstavlja kronologiju mafijaške obitelji Corleone.', 17, 'http://localhost/Digipedia/images/9824538cc2.jpg', '1'),
(82, 'Donnie Darko', 'Donnie Darko je znanstvenofantastični film američkog režisera Richarda Kellyja iz 2001. Lik iz naslova je inteligentan, ali poremećen tinejdžer koji ima vizije čudovišnog antropomorfnog zeca što ga uvodi u niz bizarnih događaja s ciljem da spasi svijet od uništenja.\r\nFilm ima vrlo kompleksnu radnju i filozofsku pozadinu. Teme kojima se bavi su putovanje kroz vrijeme, egzistencijalizam, ljubav i osobno žrtvovanje.\r\n', 17, 'http://localhost/Digipedia/images/f2b8c165ac.jpg', '1'),
(83, 'Istrebljivač', 'Istrebljivač (eng. Blade Runner) je slavni američki ZF noir film iz 1982. koji govori o detektivu Deckardu koji u budućnosti proganja odbjegle replikante, umjetna bića stvorena na naličje ljudi. Film je režirao Ridley Scott prema romanu \"Sanjaju li androidi električne ovce?\" slavnog pisca Philipa K. Dicka.\r\nBlade Runner je učvrstio zvjezdani status Harrisona Forda i mada nije doživio komercijalni uspjeh pri premijeri, njegov je ugled s vremenom rastao tako da se danas smatra jednim od najboljih ZF filmova uopće. Njegove teme obrađuju polemike o individualnosti života i egzistencije. \r\n', 17, 'http://localhost/Digipedia/images/0c42b55344.jpg', '1'),
(84, 'Igra prijestolja', 'Igra prijestolja (eng. Game of Thrones) američka je fantastična dramska televizijska serija autora Davida Benioffa i D. B. Weissa. Radi se o adaptaciji književnog serijala Pjesma leda i vatre (objavljeno je pet romana) autora Georgea R. R. Martina čiji se prvi dio zove Igra prijestolja. Serija se snima u Belfastu te u drugim gradovima Ujedinjenog Kraljevstva, Kanade, Hrvatske, Islanda, Malte, Maroka, Španjolske i SAD-a. ', 17, 'http://localhost/Digipedia/images/c8b852cebc.jpg', '1'),
(85, 'Crveni patuljak', 'Crveni patuljak (\"Red Dwarf\") je britanska znanstveno fantastična humoristična serija, koja se prikazivala na BBC 2 od 1988. do 1999. (8 sezona) i stekla kultni status. Tvorci serije su Rob Grant i Doug Naylor. Serija je osmišljena prema ponavljajućem skeču \"Dave Hollins: Space Cadet\" koji je bio dio radijske emisije \"Son of Cliche\" koja se emitirala na BBC Radio 4 sredinom 1980-ih i koju su takoder stvorili Grant i Naylor. Osim TV serija, postoje i četiri bestseler knjige, dvije pilot epizode za američkuverzije serije, kao i brojni časopisi, knjige i ostala roba povezana sa serijom.', 17, 'http://localhost/Digipedia/images/aedf52245a.jpg', '1'),
(86, 'Elder Scrolls: Skyrim', 'The Elder Scrolls V: Skyrim je akcijska računalna RPG igra (eng. Role Playing Game) koju je razvila američka računalna tvrtka Bethesda Game Studios, a pustila u prodaju Bethesda Softworks. Skyrim je peti dio serijala The Elder Scrolls, nastavak igre The Elder Scrolls IV: Oblivion.', 18, 'http://localhost/Digipedia/images/8cedd1764f.png', '1'),
(87, 'Half-life 2', 'Half-life 2 (engleski termin za vrijeme poluraspada) je znanstveno fantastična pucačina iz prvog lica koju je napravila programska kuća Valve. Dana 16. studenog 2004. Ovu igru je izdao je studio Sierra za operativni sustav Microsoft Windows. Igra je prvotno trebala izaći 2003. godine no datum izlaska je bio otkazan za tu godinu pošto je većina igre več procurila na internet. Njemački haker je hakirao Valveova računala te je te hakirane podatke skoro dovršene verzije Half-Life 2 igre stavio na internet.', 18, 'http://localhost/Digipedia/images/bef6e17e0b.jpg', '1'),
(88, 'Grand Theft Auto: San Andreas ', 'Grand Theft Auto: San Andreas (skraćeno: GTA: SA) je akcijsko-avanturistička sandbox videoigra, proizvođača Rockstar North (Velika Britanija) i izdavača Rockstar Games, igra GTA serijala i treća igra GTA 3 ere. Ovo je treća igra u serijalu s 3D formatom. Za PlayStation 2 je izašla u listopadu 2004., a nakon toga za Xbox i Microsoft Windows (PC) u srpnju 2005. U prosincu 2008. izašla je za Xbox 360,a za PS 3 u prosincu 2012. te je ukupno postigla jak odaziv i veliku prodanost za sve platforme. To je najprodavanija igra za PlayStation 2 svih vremena.', 18, 'http://localhost/Digipedia/images/b821c20afb.jpg', '1'),
(89, 'Fortnite', 'Fortnite je online-multiplayer-video igra koju su razvili razvojni studiji Epic Games i People Can Fly. Izdavač je Epic Games. Plaćena rana inačica video igre je objavljena 25. srpnja 2017., za Microsoft Windows, PlayStation 4, MacOS i Xbox One.', 18, 'http://localhost/Digipedia/images/1259d7b2ba.png', '1'),
(90, 'Suffering', 'Patnja je 2004. prva i treća osoba pucač video igre, razvijen od strane Surreal Software za PlayStation 2, Xbox i Microsoft Windows. Igra je objavljena od strane Midway Games za PlayStation i Xbox. PC verziju objavili su Encore u Sjevernoj Americi i Zoo Digital Publishing u Europi. U Sjevernoj Americi, igra je izdana za PlayStation 2 i Xbox u ožujku, a za PC u lipnju. U Europi je izdan za PlayStation i Xbox u svibnju, a za PC u srpnju. Verzija je također planirana za GameCube, ali je otkazana prije objavljivanja. U 2017, igra je objavljena na GOG.com.', 18, 'http://localhost/Digipedia/images/c67652e9e4.jpg', '1'),
(91, 'Kuhanje', 'Kuhanje je termička obrada sirove hrane.Kuha se u vodi ili na pari na 100 °C. Osim kuhanja hrana se termički može još pripremati i pečenjem ili pirjanjem. Oba načina hranu termički obrađuju na temperaturi od preko 100 °C, s tim što se pirjanje odvija na nešto nižoj temperaturi, bliže 100 °C.', 19, 'http://localhost/Digipedia/images/d760039e47.jpg', '1'),
(92, 'Prženje', 'Ako namirnicu kuhamo u vrućoj masnoći tj. stavimo je u toliko vruće masnoće da namirnica u njoj pliva, onda se taj proces zove prženje. Pržiti se mogu jednostavna jela: meso, ribe i povrće, ali mogo se prže i druga jela što su obično razne tjestenine ili dodaci mesu. Za prženje se može upotrijebiti ulje, mast i maslac, što se jednim imenom zove friture.', 19, 'http://localhost/Digipedia/images/b54db27751.jpg', '1'),
(93, 'Pirjanje', 'Pirjati znači toplinom prigotoviti namirnicu u pokrivenoj posudi bez vode, s malo vode, s nekim sokom ili masnoćom. Osnovno je upamtiti da se namirnice uvijek pirjaju na nižoj temperaturi, ne naglo, i da namirnice valja češće promiješati da ne zagore. Budući da je namirnica pokrivena, a uronjena je manjim dijelom u vlastiti sok, u vodu ili masnoću, ona se zapravo većim dijelom pirja u pari.', 19, 'http://localhost/Digipedia/images/85e6cedfc4.jpg', '1'),
(94, 'Sušenje', 'Sušenje (ili dehidracija) je uklanjanje kapljevine (npr. vode ili organskog otapala) iz tvari u kojima se ona nalazi u razmjerno malom udjelu. Pod sušenjem se u prvom redu razumije kao toplinsko uklanjanje vode(redovito prisutne kao vlaga) iz čvrstih tvari, kao vlažnoga materijala, radi dobivanja proizvoda u suhom i čvrstom stanju.', 19, 'http://localhost/Digipedia/images/70f4e5c3b2.jpeg', '1'),
(95, 'Mljevenje', 'Mljevenje je operacija procesne tehnike koja primjenjuje vanjsku silu (gnječenje, udaranje i (ili) trenje) za smanjenje čestica čvrstoga materijala do potrebne veličine. Uz drobljenje kao prvi korak (stupanj), mljevenje je drugi stupanj usitnjivanja, kojim se čestice veličine od 13 do 19 milimetara smanjuju na nekoliko milimetara, pa i manje. Mljevenje može biti suho ili mokro, šaržno ili kontinuirano.', 19, 'http://localhost/Digipedia/images/798da6b1e2.jpg', '1'),
(96, 'Odjeća', 'Odjeća, odjevni predmeti namijenjeni zaštiti čovjekovog tijela od klimatskih i drugih vanjskih utjecaja. Prva odjeća izrađivala se od raznih prirodnih materijala, kao što su kože, krzna, lišće i trava, a prema antropolozima počela se pojavljivati prije nekih 100,000 do 500,000 godina, da bi se unazad 30,000 godina pojavila i prva igla', 20, 'http://localhost/Digipedia/images/f2c574ed18.jpg', '1'),
(97, 'Obuća', 'Obuća je pokrivalo za noge, koje se nosi radi zaštite nogu i u modne svrhe.\nVećina obuće sastoji se od gornjeg dijela ili gornjišta (vanjska strana pričvršćena na potplat), od unutarnjeg dijela ili podstave i donjeg dijela ili đona. Ženska obuća često ima visoku petu. Većina obuće veže se pomoću vezica, a neke imaju patent s čičkom. Obuća se izrađuje u različitim veličinama i brojevima. Da', 20, 'http://localhost/Digipedia/images/21c92ef321.jpg', '1'),
(98, 'Frizura', 'Frizura se dobiva oblikovanjem kose. Postoje mnogi načini izrade frizura od jednostavnog rezanja škarama do složenih umjetničkih frizura raznih boja i oblika. Oblikovanje frizure može uključivati rezanje kose, bojanje, dodavanje ekstenzija, kovrčanje, izradu trajne itd. Prilikom uređivanja i održavanja kose, koriste se razna pomagala poput sušila za kosu, škara, boja za kosu, gela, uvijača za kosu i dr.', 20, 'http://localhost/Digipedia/images/b734650604.jpg', '1'),
(99, 'Šminka', 'Šminka je vrsta kozmetike, koja se odnosi na proizvode koji su namijenjeni uljepšavanju i promjeni izgleda najčešće žena.\nKoristi se za ljepši i ženstveniji izgled. Njome se mogu naglasiti pojedini dijelovi lica poput očiju, usana, a služi i prekrivanju onoga što se želi sakriti. Postoji u raznim bojama, najčešće su crvena, ljubičasta, crna i dr. Postoje protivnici šminkanja poput nekih udruga feministica, udruga za zaštitu životinja i dr. Postoje bojazni o štetnosti šminke, kada joj istekne rok trajanja ili kada istu šminku koristi više osoba. Ponekad se u šminci koriste opasne tvari, koje mogu izazvati kožne bolesti poput dermatitisa.sss', 20, 'http://localhost/Digipedia/images/5350ed7bee.jpg', '1'),
(100, 'Solarij', 'Solarij je tehnički uređaj za zračenje tijela s UV-svjetlom. Svrha korištenja solarija je preplanulost te estetski razlozi. Također koristi se u medicini za liječenje kožnih bolesti poput akni.', 20, 'http://localhost/Digipedia/images/55e322e2fb.png', '1');
INSERT INTO `article` (`articleID`, `article_title`, `article_content`, `categoryID`, `image`, `userID`) VALUES
(123, 'Box', 'Boks je borilački sport u kojem se protivnici slične tjelesne težine udaraju šakama na kojima su podstavljene rukavice. Borba se odvija u ograđenom pravokutnom ringu, u 3 do 15 rundi od po tri minute borbe. Cilj borbe je protivniku uputiti što više udaraca u dijelove tijela iznad pojasa (glava, torzo) te pri tome izbjeći protivnikove udarce. Može se pobijediti nokautom (oznaka KO, od engleskog izraza knock-out), tj. kada se protivnik nakon što je bačen na tlo ne uspije ustati u tijeku deset sekundi, tehničkim nokautom (oznaka TKO), tj. kada jedan borac nema snage nastaviti borbu, ili se pak pobjednik određuje odlukom sudaca poslije dogovorenog broja rundi.', 1, 'http://localhost/Digipedia/images/6c5ad0e916.jpg', '26'),
(125, 'Witcher 3 Wild Hunt', 'The Witcher 3', 18, 'http://localhost/Digipedia/images/d2d71c6fad.jpg', '26');

-- --------------------------------------------------------

--
-- Table structure for table `article_rating`
--

DROP TABLE IF EXISTS `article_rating`;
CREATE TABLE IF NOT EXISTS `article_rating` (
  `ratingID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `articleID` int(11) NOT NULL,
  `rating_number` int(11) NOT NULL,
  PRIMARY KEY (`ratingID`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `article_rating`
--

INSERT INTO `article_rating` (`ratingID`, `userID`, `articleID`, `rating_number`) VALUES
(13, 26, 123, 4),
(25, 26, 125, 5),
(18, 1, 125, 4),
(23, 26, 91, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(10) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) NOT NULL,
  `userID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`, `userID`) VALUES
(1, 'Sport', '1'),
(2, 'Povijest', '1'),
(3, 'Kultura', '1'),
(4, 'Znanost', '1'),
(5, 'Umjetnost', '1'),
(6, 'Zdravstvo', '1'),
(7, 'Obrazovanje', '1'),
(8, 'Tehnologija', '1'),
(9, 'Religija i sistemi vjerovanja', '1'),
(10, 'Društvo i društvene znanosti', '1'),
(11, 'Arhitektura', '1'),
(12, 'Filozofija i razmišljanje', '1'),
(13, 'Priroda', '1'),
(14, 'Geografija', '1'),
(15, 'Zdravlje i fitnes', '1'),
(16, 'Književnost', '1'),
(17, 'Serije i filmovi', '1'),
(18, 'Igre', '1'),
(19, 'Kulinarstvo', '1'),
(20, 'Moda', '1');

-- --------------------------------------------------------

--
-- Table structure for table `edit_history`
--

DROP TABLE IF EXISTS `edit_history`;
CREATE TABLE IF NOT EXISTS `edit_history` (
  `edit_historyID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`edit_historyID`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `edit_history`
--

INSERT INTO `edit_history` (`edit_historyID`, `user_id`, `article_id`, `date`) VALUES
(38, 1, 5, '2020-06-20'),
(49, 26, 20, '2020-06-29'),
(48, 26, 20, '2020-06-29'),
(37, 1, 100, '2020-06-09'),
(39, 1, 5, '2020-06-20'),
(40, 1, 5, '2020-06-20'),
(41, 1, 5, '2020-06-20'),
(42, 1, 5, '2020-06-20'),
(43, 1, 5, '2020-06-20'),
(50, 26, 20, '2020-06-29'),
(51, 26, 18, '2020-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `subarticle`
--

DROP TABLE IF EXISTS `subarticle`;
CREATE TABLE IF NOT EXISTS `subarticle` (
  `subarticleID` int(10) NOT NULL AUTO_INCREMENT,
  `sub_title` varchar(50) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `sub_content` longtext COLLATE utf8_croatian_ci NOT NULL,
  `articleID` int(10) NOT NULL,
  `userID` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`subarticleID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `subarticle`
--

INSERT INTO `subarticle` (`subarticleID`, `sub_title`, `sub_content`, `articleID`, `userID`) VALUES
(7, 'Wall street', 'Wall Street je ulica na Manhattanu u New Yorku (SAD). Proteže se istočno od Broadwaya do South Streeta na East Riveru kroz povijesno središte Financial Districta (Financijski distrikt). Wall Street prvo je stalno sjedište Njujorške burze (New York Stock Exchange). S vremenom nazivom Wall Street počeo je označavati i okolno susjedstvo (četvrt).', 50, '1'),
(14, 'Martisince', 'Dr. Martens je engleski brend obuće i odjeće sa sjedištem u Wollastonu u Wellingborou, Northamptonshire. Izrađuju i niz dodataka - sredstva za njegu cipela, odjeću, torbe itd. Osim doktora Martensa, oni su poznati i kao Doc Martens ili Docs. [1] Obuća se odlikuje zračnim potplatom (nazvanim Bouncing Soles), gornjim oblikom, izrađenom konstrukcijom i žutim šavima. Čizme su bile izbor obuće među raznim skupinama britanske kulture: u šezdesetim godinama kožani su ih počeli nositi, dok su ih \"Docs\" uobičajeno nazivali, a krajem 1980-ih bili su popularni među jahačima skutera, pandura, goti, nekih novi val glazbenici i članovi drugih mladih kultura, ponajviše grunge modna scena početkom devedesetih.', 97, '1'),
(16, 'Sugar Ray Robinson', 'Sugar Ray Robinson (rođen Walker Smith Jr .; 3. svibnja 1921. - 12. travnja 1989.) bio je američki profesionalni bokser koji se natjecao od 1940. do 1965. Robinson-ovi nastupi u divizijama srednje i srednje težine potaknuli su sportske pisce da stvore ljestvicu \"funta za kilogram\". , gdje su uspoređivali borce bez obzira na težinu. Priveden je u Internacionalnu boksersku dvoranu slavnih 1990. [1] Smatra se da je najveći boksač svih vremena, a 2002. godine Robinson je rangiran kao prvo mjesto na popisu magazina The Ring za \"80 najboljih boraca u posljednjih 80 godina\".', 123, '1'),
(17, 'Protetska minka', 'Prosthetic makeup (also called Special make-up effects and FX prosthesis) is the process of using prosthetic sculpting, molding and casting techniques to create advanced cosmetic effects. In some ways, Prosthetic makeup goes back to the beginning of film making with A Trip to the Moon (French: Le Voyage dans la Lune) is a 1902 French adventure short film directed by Georges Méliès. Where the man on the moon was a combination of makeup and a prosthetic type mask with added pastes. Of course the great makeup artist Jack Pierce who was a Hollywood make-up artist best remembered for creating the iconic makeup worn by Boris Karloff in Frankenstein and his makeup for the Wolfman and more.', 99, '1'),
(18, 'Šišanje', 'Šišanje ili šišanje kose ima za cilj stvaranje ili održavanje određenog oblika i oblika. Postoje načini obrezivanja vlastite kose, ali obično je druga osoba angažirana za izvođenje postupka, jer je teško održavati simetriju dok šišanje kose na stražnjoj strani glave. Šišanje kose često se vrši šišanjem kose, škarama i britvicama. Češljevi i dlačice često se koriste za izoliranje dijela kose koji se zatim obrezuje', 98, '1'),
(19, 'Rifle', 'Rifle je talijanska tvrtka za odjeću osnovana 1958. godine u Pratu. Također je bio poznat po svojim trapericama tijekom 1980-ih, posebno u SSSR-u, Bugarskoj, Poljskoj i Čehoslovačkoj. [Citiranje potrebno] Također je bilo vrlo popularno u Švicarskoj, Velikoj Britaniji, Izraelu, Nizozemskoj i Kolumbiji između 1975. i 1990. [citat je potreban] Postoje vrhunske linije Rifle Jeans, nazvane Super Rifle, Golden Rifle i Royal Rifle.', 96, '1'),
(20, 'Zacini', 'Pod začinima podrazumijevamo dijelove biljki koji se zbog svog sadržaja okusa ili mirisa koriste u pripravljanju svih vrsta hrane kao bi se tim svojstvima jelo \"oplemenilo\". U tom smislu, kuhinjska sol nije začin. Začini su u srednjevjekovnoj Europi ali još i početkom novog vijeka igrali jednako tako značajnu gospodarsku i političku ulogu kao danas nafta. Bili su iznimno značajni, ali ne samo kao začini, nego i kao sredstvo za konzerviranje, ali i kao podloga za lijekove.', 95, '1'),
(21, 'Caj', 'Čaj (kineski 茶, korejski 차, hindski चाय „chai“) ili kineski čajevac je biljka latinskog naziva Camellia sinensis od čijeg se lišća i drugih dijelova spravlja vrući aromatični napitak blago gorkog i oporog mirisa koji se također naziva čaj.', 94, '1'),
(22, 'Brokula', 'Brokula (lat. Brassica oleracea var. italica) je povrće iz porodice kupusnjača kojoj još pripadaju prokulica, kupus, koraba, cvjetača, kelj i druge. Smatra se izvornim oblikom karfiola, a uzgaja se zbog središnjeg i postranih zelenih cvjetnih izdanaka smještenih na razgranatoj i mekanoj stabljici.', 93, '1'),
(23, 'Pomfrit', 'Prženi krumpirići ili pommes frites (engleski: Chips, američki engleski: French fries) je jelo proizvedeno od krumpira. Popularno je u mnogim zemljama svijeta i ima mnogo naziva. U Hrvatskoj se češće naziva \"pomfrit\". Pripada među najnezdravije obroke. Krumpir je sam po sebi jako dobar izvor B vitamina, ali jednom kada se uroni u vruće ulje, ova se niskokalorična namirnica pretvara u kaloričnu bombu, koja podiže loš kolesterol.', 92, '1'),
(24, 'Grah', 'Grah (fažol, lat. Phaseolus) biljni rod iz porodice mahunarki. Potječe iz Amerike, gdje je uzgajan još prije 4000 godina. Nakon otkrića Amerike, prenesen je u Europu, a iz nje u Afriku i Aziju.\n\nNa svijetu postoji 38 vrsta ovog povrća. To je jednogodišnja biljka koja sazrijeva u jesen. Može se uzgajati na dalekom sjeveru i jugu, pa čak i ekvatoru jer je dosta prilagodljiv različitim uvjetima uzgoja. Uzgaja se radi svoga reproduktivnog organa, tj. ploda (mahune) ili radi zrna (sjemena).\n\nIma ograničenu količinu celuloze te ima relativnu malu količinu suhe tvari, oko 15%. Grah sadrži mnogo bjelančevina, ali su one fiziološki nepotpune, što znači da im nedostaju aminokiseline koje su za ljudski organizam neophodne. Fiziološki zreli grah (sjeme) sadrži preko 80% suhe tvari u čijem sastavu je i oko 5% celuloze. Ovaj nedostatak se lako nadoknađuje uporabom žitarica u ishrani.', 91, '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Ime` varchar(50) DEFAULT NULL,
  `Prezime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `type`, `email`, `Ime`, `Prezime`) VALUES
(1, 'Trpimir', '12345', 'admin', 'trpimir.tomasic@vsmti.hr', 'Trpimir', 'Tomasic'),
(26, 'a', 'a', 'user', 'a@a', 'a', 'a');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
