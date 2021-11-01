import 'dart:math';

import 'package:evidencia_pcr/models/UzemnaJednotka.dart';

import 'models/Kraj.dart';
import 'models/Okres.dart';
import 'models/Osoba.dart';
import 'models/PCRTest.dart';
import 'models/PCRTestCode.dart';
import 'models/PCRTestDate.dart';
import 'models/Pracovisko.dart';
import 'models/twoThreeTree/TTTree.dart';

class Application {
  static final Application _singleton = Application._internal();

  factory Application() {
    return _singleton;
  }

  Application._internal() {
    init();
  }

  final TTTree<String, Osoba> personTree = TTTree();
  final TTTree<String, PCRTestCode> pcrTreeCode = TTTree();
  final TTTree<DateTime, PCRTestDate> pcrTreeDate = TTTree();
  final TTTree<DateTime, PCRTestDate> pcrTreePositive = TTTree();
  final TTTree<num, UzemnaJednotka> okresTree = TTTree();
  final TTTree<num, UzemnaJednotka> pracoviskoTree = TTTree();
  final randomOsoby = [];

  final names = [
    "Alexander",
    "Jett",
    "Griffin",
    "Tyson",
    "Donavan",
    "Remington",
    "German",
    "Frederick",
    "Camden",
    "Peter",
    "Gunnar",
    "Joey",
    "Leroy",
    "Braylon",
    "Darius",
    "Simeon",
    "Parker",
    "Colten",
    "Finnegan",
    "Esteban",
    "Nathaniel",
    "Marshall",
    "Hamza",
    "Mohammed",
    "Alden",
    "Kadin",
    "Will",
    "Orlando",
    "Lyric",
    "Shawn",
    "Ronald",
    "Brycen",
    "Kaleb",
    "Jaylan",
    "Keenan",
    "Bryant",
    "Eden",
    "Zaire",
    "Jarrett",
    "Gunner",
    "Dante",
    "Adonis",
    "Rex",
    "Giancarlo",
    "Grayson",
    "Alex",
    "Alfredo",
    "Ariel",
    "Cade",
    "Frank",
    "Craig",
    "Avery",
    "Rolando",
    "Daniel",
    "Nigel",
    "Malcolm",
    "Carmelo",
    "John",
    "Octavio",
    "Adrian",
    "Kash",
    "Shamar",
    "Alessandro",
    "Oliver",
    "Deangelo",
    "Kade",
    "Todd",
    "Spencer",
    "Trevin",
    "Jessie",
    "Santiago",
    "Theodore",
    "Damien",
    "Cayden",
    "Kelton",
    "Chance",
    "Jacob",
    "Jayvon",
    "Cael",
    "Zackary",
    "Javon",
    "Chandler",
    "Bentley",
    "Bronson",
    "Mekhi",
    "Emilio",
    "Hassan",
    "Micah",
    "Ronin",
    "Dennis",
    "Coby",
    "Rigoberto",
    "Morgan",
    "Oswaldo",
    "Brogan",
    "Wyatt",
    "Seamus",
    "Darian",
    "Titus",
    "Heath",
    "Marlene",
    "Miriam",
    "Kaylah",
    "Mylie",
    "Jaelyn",
    "Angeline",
    "Georgia",
    "Mia",
    "Rachael",
    "Zoie",
    "Emely",
    "Keira",
    "Cynthia",
    "Alena",
    "Mercedes",
    "Amara",
    "Carla",
    "Daisy",
    "Angie",
    "Lexie",
    "Reese",
    "Christine",
    "June",
    "Lila",
    "Angelina",
    "Sylvia",
    "Jacey",
    "Adalynn",
    "Alaina",
    "Dominique",
    "Rory",
    "Payten",
    "Casey",
    "Kira",
    "Noemi",
    "Fatima",
    "Alexandria",
    "Renee",
    "Jazmine",
    "Olive",
    "Cailyn",
    "Myah",
    "Evie",
    "Andrea",
    "Elizabeth",
    "Mariana",
    "Erika",
    "Kiersten",
    "Trinity",
    "Carissa",
    "Abagail",
    "Nicole",
    "Marlie",
    "Jewel",
    "Jasmine",
    "Kaia",
    "Mikayla",
    "Elise",
    "Leila",
    "Alia",
    "Alisha",
    "Kyla",
    "Juliet",
    "Paityn",
    "Isla",
    "Mareli",
    "Cristina",
    "Belinda",
    "Heidi",
    "Chana",
    "Shaniya",
    "Tania",
    "Isabela",
    "Avery",
    "Siena",
    "Amiya",
    "Madalyn",
    "Ryleigh",
    "Tara",
    "Jaylene",
    "Emery",
    "Jenna",
    "Jazlyn",
    "Shannon",
    "Brielle",
    "Reagan",
    "Averi",
    "Caitlin",
    "Abbey",
    "Aisha",
    "Cecelia",
    "Jocelynn",
    "Jordin",
    "Janiah",
    "Karissa",
    "Chelsea",
    "Kylie",
    "Eliana",
    "Sarah",
    "Kendall"
  ];
  final lastNames = [
    "Giles",
    "Todd",
    "Wilkerson",
    "Meyer",
    "Padilla",
    "Buchanan",
    "Dillon",
    "Joseph",
    "Mullen",
    "Moss",
    "Finley",
    "Compton",
    "Fritz",
    "Freeman",
    "Solis",
    "Browning",
    "Ball",
    "Adkins",
    "Nunez",
    "Travis",
    "Gilmore",
    "Santiago",
    "Mayo",
    "Carson",
    "Bauer",
    "Brandt",
    "Yu",
    "Fleming",
    "Paul",
    "English",
    "Douglas",
    "Pacheco",
    "Carlson",
    "Mcintyre",
    "Sampson",
    "Oliver",
    "Tapia",
    "Galloway",
    "Bautista",
    "Mccormick",
    "Singleton",
    "Newman",
    "Gordon",
    "Davila",
    "Ramsey",
    "Brooks",
    "Colon",
    "Donaldson",
    "Farmer",
    "Mcguire",
    "Garza",
    "Villarreal",
    "Alexander",
    "Kennedy",
    "Cross",
    "Hall",
    "Charles",
    "Mcconnell",
    "Bass",
    "Daniels",
    "Bishop",
    "Odonnell",
    "Salinas",
    "Wise",
    "Ayala",
    "Koch",
    "Kirk",
    "Schwartz",
    "Lindsey",
    "Leon",
    "Werner",
    "Bowers",
    "Carr",
    "Mooney",
    "Norton",
    "Beck",
    "Mcknight",
    "Phelps",
    "Valencia",
    "Richards",
    "Gallegos",
    "Potter",
    "Brewer",
    "Martin",
    "Garrison",
    "Meza",
    "Herring",
    "Harding",
    "Wong",
    "Mata",
    "Booth",
    "Mason",
    "Frazier",
    "Hughes",
    "Montgomery",
    "Robertson",
    "Zamora",
    "Ryan",
    "Shields",
    "Maynard"
  ];
  final okresNames = [
    "Bratislava I",
    "Bratislava II",
    "Bratislava III",
    "Bratislava IV",
    "Bratislava V",
    "Malacky",
    "Pezinok",
    "Senec",
    "Dunajská Streda",
    "Galanta",
    "Hlohovec",
    "Piešťany",
    "Senica",
    "Skalica",
    "Trnava",
    "Bánovce nad Bebravou",
    "Ilava",
    "Myjava",
    "Nové Mesto nad Váhom",
    "Partizánske",
    "Považská Bystrica",
    "Prievidza",
    "Púchov",
    "Trenčín",
    "Komárno",
    "Levice",
    "Nitra",
    "Nové Zámky",
    "Šaľa",
    "Topoľčany",
    "Zlaté Moravce",
    "Bytča",
    "Čadca",
    "Dolný Kubín",
    "Kysucké Nové Mesto",
    "Liptovský Mikuláš",
    "Martin",
    "Námestovo",
    "Ružomberok",
    "Turčianske Teplice",
    "Tvrdošín",
    "Žilina",
    "Banská Bystrica",
    "Banská Štiavnica",
    "Brezno",
    "Detva",
    "Krupina",
    "Lučenec",
    "Poltár",
    "Revúca",
    "Rimavská Sobota",
    "Veľký Krtíš",
    "Zvolen",
    "Žarnovica",
    "Žiar nad Hronom",
    "Bardejov",
    "Humenné",
    "Kežmarok",
    "Levoča",
    "Medzilaborce",
    "Poprad",
    "Prešov",
    "Sabinov",
    "Snina",
    "Stará Ľubovňa",
    "Stropkov",
    "Svidník",
    "Vranov nad Topľov",
    "Gelnica",
    "Košice I",
    "Košice II",
    "Košice III",
    "Košice IV",
    "Košice - okolie",
    "Michalovce",
    "Rožňava",
    "Sobrance",
    "Spišská Nová Ves",
    "Trebišov"
  ];
  final okresCodes = [
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    612,
    613,
    701,
    702,
    703,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    713,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811
  ];
  final krajNames = [
    "Bratislavský",
    "Trnavský",
    "Trenčiansky",
    "Nitriansky",
    "Žilinský",
    "Banskobystrický",
    "Prešovský",
    "Košický"
  ];
  final krajCodes = [1, 2, 3, 4, 5, 6, 7, 8];
  final pracoviskaNames = [
    "Nemocnica s poliklinikou Milosrdní bratia, spol. s r. o.",
    "UNB – Nemocnica Ružinov, Ružinov",
    "Univerzitná nemocnica Bratislava  - Nemocnica akad. L. Dérera",
    "Univerzitná nemocnica Bratislava - Nemocnica sv. Cyrila a Metoda",
    "Nemocnica Malacky",
    "Nemocnica s Poliklinikou Dunajská Streda",
    "Nemocnica s Poliklinikou Sv. Lukáša Galanta",
    "Nemocnica A. Wintera Piešťany",
    "Fakultná Nemocnica s Poliklinikou Skalica",
    "Fakultná Nemocnica Trnava",
    "Nemocnica Bánovce nad Bebravou",
    "Nemocnica s Poliklinikou Ilava",
    "Nemocnica s Poliklinikou Myjava",
    "Nemocnica s Poliklinikou Nové Mesto nad Váhom",
    "Nemocnica na okraji mesta Partizánske",
    "Nemocnica s Poliklinikou Považská Bystrica",
    "Nemocnica s Poliklinikou Prievidza, Bojnice",
    "Nemocnica Handlová",
    "Fakultná nemocnica Trenčín",
    "Nemocnica  Agel Komárno s.r.o.",
    "Nemocnica Levice",
    "Hospitale Šahy",
    "Fakultná Nemocnica Nitra",
    "Fakultná Nemocnica s Poliklinikou Nové Zámky",
    "Svet zdravia Nemocnica Topoľčany",
    "Nemocnica Zlaté Moravce",
    "Kysucká Nemocnica s Poliklinikou Čadca",
    "Dolnooravská Nemocnica s Poliklinikou MUDr. L.N.J",
    "Liptovská Nemocnica s Poliklinikou MUDr. I.Stodolu",
    "Univerzitná Nemocnica Martin",
    "Hornooravská Nemocnica s Poliklinikou Trstená",
    "Fakultná Nemocnica s Poliklinikou Žilina",
    "Oravská poliklinika Námestovo",
    "Fakultná nemocnica s poliklinikou  F. D. Roosevelta Banská Bystrica",
    "Nemocnica s Poliklinikou Brezno",
    "Nemocnica s Poliklinikou Krupina",
    "Všeobecná Nemocnica s Poliklinikou Lučenec",
    "Nemocnica s Poliklinikou Revúca",
    "Gemerclinic Hnúšťa",
    "Svet zdravia, a. s., Všeobecná nemocnica Rimavská Sobota",
    "Všeobecná Nemocnica s Poliklinikou Veľký Krtíš",
    "Nemocnica AGEL Zvolen a.s.",
    "Nemocnica s Poliklinikou Mediform Nová Baňa",
    "Svet zdravia, a.s.,  Všeobecná nemocnica Žiar nad Hronom",
    "PRO VITAE n. o., Gelnica , Nemocnica s poliklinikou",
    "Železničné zdravotníctvo Košice s.r.o.",
    "Nemocnica AGEL Košice-Šaca a.s.",
    "Univerzitná nemocnica L. Pasteura Košice",
    "Univerzitná nemocnica L. Pasteura Košice 2",
    "Nemocnica s Poliklinikou Štefana Kukuru Michalovce, a.s.",
    "Nemocnica s Poliklinikou sv. Barbory Rožňava",
    "Regionálna nemocnica Sobrance, n.o.",
    "Nemocnica Krompachy",
    "Nemocnica s Polklinikou Kráľovský Chlmec",
    "Nemocnica s Poliklinikou Trebišov",
    "Nemocnica s Poliklinikou Spišská Nová Ves, a.s.",
    "Nemocnica s Poliklinikou Sv. Jakuba Bardejov",
    "Nemocnica A. Leňa Humenné",
    "Nemocnica Kežmarok",
    "Nemocnica Levoča",
    "Nemocnica Poprad",
    "Fakultná Nemocnica s Poliklinikou Prešov",
    "Poliklinika Sabinov, n.o.",
    "Nemocnica Snina, s.r.o.",
    "Ľubovnianska nemocnica",
    "Nemocnica Stropkov",
    "Nemocnica gen. L. Svobodu Svidník",
    "Vranovská nemocnica, a.s."
  ];
  final pracoviskaCodes = [
    101,
    102,
    103,
    104,
    105,
    201,
    202,
    203,
    204,
    205,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    701,
    702,
    703,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812
  ];

  final kraje = [];

  Random random = new Random();

  // Application() {
  //
  // }

  void init() {
    print('--------------------------------------');
    //random.setSeed(60); //TODO: remove it
    if (okresCodes.length != okresNames.length) {
      print("Error: okresCodes.length != okresNames.length");
    }
    if (krajCodes.length != krajNames.length) {
      print("Error: krajCodes.length != krajNames.length");
    }
    if (pracoviskaNames.length != pracoviskaCodes.length) {
      print("Error: pracoviskaNames.length != pracoviskaCodes.length");
    }
    for (int i = 0; i < okresCodes.length; i++) {
      Okres okres =
          new Okres(okresCodes[i], okresCodes[i] ~/ 100, okresNames[i]);
      okresTree.add(okres);
    }
    for (int i = 0; i < krajCodes.length; i++) {
      Kraj kraj = new Kraj(krajCodes[i], krajNames[i]);
      kraje.add(kraj);
    }
    for (int i = 0; i < pracoviskaCodes.length; i++) {
      Pracovisko pracovisko = new Pracovisko(
          pracoviskaCodes[i], pracoviskaCodes[i] ~/ 100, pracoviskaNames[i]);
      pracoviskoTree.add(pracovisko);
    }
  }

  void printPersonTree() {
    personTree.preorder(personTree.getRoot());
  }

  void printPcrTree() {
    pcrTreeCode.preorder(pcrTreeCode.getRoot());
  }

  void printOkresTree() {
    okresTree.preorder(okresTree.getRoot());
  }

  getOkresCodes() {
    return okresCodes;
  }

  getKrajCodes() {
    return krajCodes;
  }

  TTTree<DateTime, PCRTestDate> getPcrTreeDate() {
    return pcrTreeDate;
  }

  TTTree<DateTime, PCRTestDate> getPcrTreePositive() {
    return pcrTreePositive;
  }

  Okres getOkres(int kodOkresu) {
    final okres = Okres(kodOkresu, 0, "");
    return okresTree.search(okres);
  }

  int getPersonCount() {
    return personTree.getSize();
  }

  String getKrajName(int kodKraja) {
    if (kodKraja >= krajNames.length) {
      return "Neznamy kraj " + kodKraja.toString();
    }
    return krajNames[kodKraja];
  }

  PCRTest getPCRTest(String kodTestu) {
    final testData =
        PCRTest(kodTestu, null, null, null, null, null, null, null, null);
    final testCode = PCRTestCode(testData);
    PCRTestCode test = pcrTreeCode.search(testCode);
    return test == null ? null : test.getData();
  }

  Osoba getOsoba(String rodCislo) {
    final osoba = Osoba(null, null, null, rodCislo);
    return personTree.search(osoba);
  }

  Pracovisko getPracovisko(int kodPracoviska) {
    final pracovisko = Pracovisko(kodPracoviska, 0, "");
    return pracoviskoTree.search(pracovisko);
  }

  Kraj getKraj(int kodKraja) {
    if (kodKraja > kraje.length || kodKraja <= 0) {
      return null;
    }
    return kraje[kodKraja - 1];
  }

  List<Osoba> getVsetkyOsoba() {
    print(personTree.getSize());
    return personTree.getInOrderData();
  }

  List<Osoba> getIntervalOsoba(String startRodCislo, String endRodCislo) {
    print(personTree.getSize());
    final osoba1 = Osoba(null, null, null, startRodCislo);
    final osoba2 = Osoba(null, null, null, endRodCislo);
    return personTree.getIntervalData(osoba1, osoba2);
  }

  // bool writeToFile(String fileName) {
  //     String text;
  //     List<PCRTestCode> testy = this.pcrTreeCode.getInOrderData();
  //     ArrayList<Osoba> osoby = this.personTree.getInOrderData();
  //     try {
  //         BufferedWriter writer = new BufferedWriter(new FileWriter(fileName + ".csv"));
  //         for (Osoba osoba : osoby) {
  //             text = "";
  //             text += osoba.getRodCislo() + ",";
  //             text += osoba.getMeno() + ",";
  //             text += osoba.getPriezvisko();
  //             text += "\n";
  //             writer.write(text);
  //         }
  //         writer.write("END\n");
  //         for (PCRTestCode test : testy) {
  //             text = "";
  //             text += test.getData().getKodTestu() + ",";
  //             text += test.getData().getRodCisloPacienta() + ",";
  //             text += test.getData().getKodPracoviska() + ",";
  //             text += test.getData().getKodOkresu() + ",";
  //             text += test.getData().getKodKraja() + ",";
  //             text += test.getData().isVysledok() + ",";
  //             if (test.getData().getPoznamka() != null) {
  //                 text += test.getData().getPoznamka() + ",";
  //             } else {
  //                 text += "" + ",";
  //             }
  //             Date date = test.getData().getDatum();
  //             text += date.getDate() + "-" + (date.getMonth() + 1) + "-" + (date.getYear() + 1900) + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
  //             text += "\n";
  //             writer.write(text);
  //         }
  //         writer.close();
  //         return true;
  //     } catch (Exception e) {
  //         System.out.println(e.getMessage());
  //         return false;
  //     }
  // }

  // public boolean loadFromFile(String fileName) {
  //     try {
  //         BufferedReader reader = new BufferedReader(new FileReader(fileName + ".csv"));
  //         String line = reader.readLine();
  //         boolean readingPersons = true;
  //         SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
  //         while (line != null) {
  //             //System.out.println(line);
  //             if (line.equals("END")) {
  //                 readingPersons = false;
  //                 line = reader.readLine();
  //             }
  //             String[] data = line.split(",");
  //             if (readingPersons) {
  //                 addOsoba(data[1], data[2], data[0]);
  //             } else {
  //                 Date date = formatter.parse(data[7]);
  //                 Osoba osoba = this.getOsoba(data[1]);
  //                 addPCRTest(data[0], data[1], Integer.parseInt(data[2]), Integer.parseInt(data[3]), Integer.parseInt(data[4]), Boolean.parseBoolean(data[5]), data[6], osoba, date);
  //             }
  //             line = reader.readLine();
  //         }
  //         reader.close();
  //         return true;
  //     } catch (Exception e) {
  //         System.out.println("Error: Reading");
  //         System.out.println(e.getMessage());
  //         return false;
  //     }
  // }

  bool addPCRTest(
      String kodTestu,
      String rodCislo,
      int kodPracoviska,
      int kodOkresu,
      int kodKraju,
      bool vysledok,
      String poznamka,
      Osoba osoba,
      DateTime datum) {
    if (kodTestu == null) {
      kodTestu = Random().nextInt(100000).toString();
    }
    final pcrTest = new PCRTest(kodTestu, rodCislo, kodPracoviska, kodOkresu,
        kodKraju, vysledok, poznamka, osoba, datum);
    final pcrTestCode = new PCRTestCode(pcrTest);
    final pcrTestDate = new PCRTestDate(pcrTest);
    final isTestAdd = [];
    for (int i = 0; i < isTestAdd.length; i++) {
      isTestAdd[i] = true;
    }
    isTestAdd.add(pcrTreeCode.add(pcrTestCode));
    if (!isTestAdd[0]) {
      return false;
    }
    isTestAdd.add(getPracovisko(kodPracoviska).getTesty().add(pcrTestDate));
    isTestAdd.add(getKraj(kodKraju).getTesty().add(pcrTestDate));
    isTestAdd.add(getOkres(kodOkresu).getTesty().add(pcrTestDate));
    if (vysledok) {
      isTestAdd.add(getOkres(kodOkresu).getPozitivneTesty().add(pcrTestDate));
      isTestAdd.add(getKraj(kodKraju).getPozitivneTesty().add(pcrTestDate));
      isTestAdd.add(
          getPracovisko(kodPracoviska).getPozitivneTesty().add(pcrTestDate));
      isTestAdd.add(pcrTreePositive.add(pcrTestDate));
    }
    isTestAdd.add(pcrTreeDate.add(pcrTestDate));
    for (bool pom in isTestAdd) {
      if (!pom) {
        return false;
      }
    }
    osoba.getTesty().add(pcrTestDate);
    return true;
  }

  void removeAllData() {
    List<Osoba> osoby = this.personTree.getInOrderData();
    for (Osoba osoba in osoby) {
      this.removeOsoba(osoba.getRodCislo());
    }
  }

  Osoba removeOsoba(String rodCislo) {
    final tempOsoba = Osoba(null, null, null, rodCislo);
    Osoba osoba = personTree.remove(tempOsoba);
    if (osoba != null) {
      List<PCRTestDate> testy = osoba.getTesty().getInOrderData();
      for (int i = 0; i < testy.length; i++) {
        PCRTestDate test = testy[i];
        if (this.removePCRTest(test.getData().getKodTestu(), false) == null) {
          return null;
        }
      }
      return osoba;
    }
    return null;
  }

  PCRTest removePCRTest(String kodTestu, bool onlyTest) {
    final tempData =
        PCRTest(kodTestu, null, null, null, null, null, null, null, null);
    final tempTest = PCRTestCode(tempData);
    PCRTestCode test = pcrTreeCode.remove(tempTest);
    if (test == null) {
      return null;
    }
    PCRTestDate testDate = new PCRTestDate(test.getData());
    if (test.getData().isVysledok()) {
      getPracovisko(test.getData().getKodPracoviska())
          .getPozitivneTesty()
          .removeData(testDate);
      getOkres(test.getData().getKodOkresu())
          .getPozitivneTesty()
          .removeData(testDate);
      getKraj(test.getData().getKodKraja())
          .getPozitivneTesty()
          .removeData(testDate);
      pcrTreePositive.removeData(testDate);
    }
    getPracovisko(test.getData().getKodPracoviska())
        .getTesty()
        .removeData(testDate);
    getOkres(test.getData().getKodOkresu()).getTesty().removeData(testDate);
    getKraj(test.getData().getKodKraja()).getTesty().removeData(testDate);
    pcrTreeDate.removeData(testDate);
    if (onlyTest) {
      test.getData().getOsoba().getTesty().removeData(testDate);
    }
    return test.getData();
  }

  Osoba addOsoba(String meno, String priezvisko, String rodCislo) {
    final actualDate = DateTime.now();
    int year = int.parse(rodCislo.substring(0, 2));
    int month = int.parse(rodCislo.substring(2, 4));
    int day = int.parse(rodCislo.substring(4, 6));
    final date = DateTime(
        year <= actualDate.year - 2000 ? year + 2000 : year + 1900, month, day);
    final osoba = Osoba(meno, priezvisko, date, rodCislo);
    if (personTree.add(osoba)) {
      return osoba;
    }
    return null;
  }

  void addRandomPCRTest(int count) {
    final actualDate = DateTime.now();
    for (int i = 0; i < count; i++) {
      final rodCislo = this.getRandomRodCislo();
      int kodPracoviska =
          pracoviskaCodes[random.nextInt(pracoviskaCodes.length)];
      int kodOkresu = okresCodes[random.nextInt(okresCodes.length)];
      int kodKraju = kodOkresu ~/ 100;
      final vysledok = random.nextInt(2) == 1;
      Osoba osoba = getOsoba(rodCislo);
      if (osoba == null) {
        if (randomOsoby.length > 0) {
          osoba = randomOsoby[random.nextInt(randomOsoby.length)];
        } else {
          print("Musi sa vygenerovat aspon 1 nahodna osoba.");
          return;
        }
      }
      var kodTestu = "" + random.nextInt(1000000).toString();
      kodTestu = null;

      int year = random.nextInt(actualDate.year - 2021 + 1) + 2021;
      int month;
      int day;
      if (year == actualDate.year) {
        month = random.nextInt(actualDate.month) + 1;
        if (month == actualDate.month) {
          day = random.nextInt(actualDate.day) + 1;
        } else {
          day = random.nextInt(31) + 1;
        }
      } else {
        month = random.nextInt(12) + 1;
        day = random.nextInt(31) + 1;
      }
      if (month == 2 && day > 28) {
        day = 28;
      } else if (day == 31) {
        switch (month) {
          case 4:
          case 6:
          case 9:
          case 11:
            day = 30;
        }
      }
      int hour = random.nextInt(24);
      int minutes = random.nextInt(60);
      var date = new DateTime(year, month, day, hour, minutes);
      //date = actualDate;
      if (osoba != null)
        this.addPCRTest(kodTestu, osoba.getRodCislo(), kodPracoviska, kodOkresu,
            kodKraju, vysledok, null, osoba, date);
    }
    this.randomOsoby.clear();
  }

  void addRandomPersons(int count) {
    for (int i = 0; i < count; i++) {
      String randomName = names[random.nextInt(this.names.length)];
      String randomLastName = lastNames[random.nextInt(this.lastNames.length)];
      Osoba osoba =
          this.addOsoba(randomName, randomLastName, getRandomRodCislo());
      if (osoba != null) {
        randomOsoby.add(osoba);
      }
    }
  }

  String getRandomRodCislo() {
    final actualDate = DateTime.now();
    int randomCode;
    int randomYear = random.nextInt(100);
    String randomCodeStr;
    if (randomYear < 54 && randomYear > actualDate.year - 100) {
      randomCode = random.nextInt(1000);
      if (randomCode < 10) {
        randomCodeStr = "00" + randomCode.toString();
      } else if (randomCode < 100) {
        randomCodeStr = "0" + randomCode.toString();
      } else {
        randomCodeStr = "" + randomCode.toString();
      }
    } else {
      randomCode = random.nextInt(10000);
      if (randomCode < 10) {
        randomCodeStr = "000" + randomCode.toString();
      } else if (randomCode < 100) {
        randomCodeStr = "00" + randomCode.toString();
      } else if (randomCode < 1000) {
        randomCodeStr = "0" + randomCode.toString();
      } else {
        randomCodeStr = "" + randomCode.toString();
      }
    }
    int randomMonth = random.nextInt(12) + 1;
    int randomDay = random.nextInt(30) + 1;
    if (randomMonth == 2 && randomDay > 28) {
      randomDay = 28;
    }
    String randomRodCislo = "" +
        (randomYear < 10
            ? ("0" + randomYear.toString())
            : randomYear.toString()) +
        (randomMonth < 10
            ? ("0" + randomMonth.toString())
            : randomMonth.toString()) +
        (randomDay < 10 ? ("0" + randomDay.toString()) : randomDay.toString()) +
        randomCodeStr;
    //System.out.println(randomRodCislo);
    return randomRodCislo;
  }
}
