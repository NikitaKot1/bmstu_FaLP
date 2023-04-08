/*****************************************************************************

		Copyright (c) My Company

 Project:  TESTGOAL
 FileName: TESTGOAL.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "testgoal.inc"

domains
  adress = addr(string, string, integer, integer).
  property = car(string, string, string, integer, string); 
  	     building(string, string, integer); 
  	     plot(string, string, integer); 
  	     water_vehicle(string, string, string, integer).
  name, bankname, check = string.

predicates
  record(name, integer, adress)
  possession(name, property)
  bank(name, bankname, check, integer)
  
  title_by_name(name, string)
  title_price_by_name(name, string, integer)
  all_price_by_name(name, integer)
  
clauses
  record("Kupchev", 131, addr("Krasnogorsk", "Lesnaya", 15, 6)).
  record("Kupchev", 222,  addr("Krasnogorsk", "Lesnaya", 15, 6)).
  record("Allanov", 341,  addr("Moscow", "Inessa Armand", 79, 122)).
  record("Cherbenkov", 441,  addr("Moscow", "Golubinskaya", 140, 15)).
  record("Cherbenkov", 476,  addr("Moscow", "Golubinskaya", 140, 15)).
  record("Lochkarev", 544,  addr("Moscow", "Dorms 5", 655, 89)).
  record("Lochkarev", 194,  addr("Moscow", "Dorms 5", 655, 89)).
  record("Ivanov", 656,  addr("Ekaterinburg", "Sovetskaya", 140, 3)).
  
  bank("Kupchev", "Sber", "12345677", 2).
  bank("Allanov", "Alpha", "98765", 3).
  bank("Cherbenkov", "Sber", "987654", 10986).
  bank("Lochkarev", "Tinkof", "23483", 1254).
  bank("Ivanov", "Sber", "84927", 432112).
  
  possession("Kupchev", car("lastochka", "lada", "red", 150000, "oa200b")).
  possession("Kupchev", building("logovo", "Novostroika", 10)).
  possession("Kupchev", plot("pustosh", "Chernila", 133)).
  possession("Kupchev", water_vehicle("seledka", "red", "as666s", 12345)).
  
  possession("Ivanov", car("zver", "mers", "black", 2000000, "lok333i")).
  possession("Ivanov", plot("boloto", "Chernila", 133)).
  possession("Ivanov", water_vehicle("seledka2", "black", "ho616l", 124345)).
  
  possession("Allanov", car("vedro", "volga", "rust", 10000, "lo723l")).
  possession("Allanov", building("kamen", "Novostroika", 10)).
  possession("Allanov", plot("less", "Chernila", 133)).
  
  possession("Cherbenkov", car("vegro2", "ferra", "red", 15000000, "om999l")).
  possession("Cherbenkov", building("turma", "WaterBuial", 1234540)).
  possession("Cherbenkov", plot("jest", "Gugugaga", 135433)).
  possession("Cherbenkov", water_vehicle("seledka3", "orabge", "he124l", 876540)).
  
  possession("Lochkarev", building("chell", "GadleNowa", 9966690)).
  possession("Lochkarev", plot("ololo", "Uhgu", 267300)).
  possession("Lochkarev", water_vehicle("seledka4", "white", "me345t", 1010101)).

  title_by_name(Name, K1):-
  	possession(Name, car(K1, _, _, _, _));
  	possession(Name, building(K1, _, _));
  	possession(Name, plot(K1, _, _));
  	possession(Name, water_vehicle(K1, _, _, _)).
  
  title_price_by_name(Name, K1, Pr):-
  	possession(Name, car(K1, _, _, Pr, _));
  	possession(Name, building(K1, _, Pr));
  	possession(Name, plot(K1, _, Pr));
  	possession(Name, water_vehicle(K1, _, _, Pr)).
  	
  all_price_by_name(Name, Pr):-
  	possession(Name, car(_, _, _, Pr, _)).


goal
  %title_by_name("Lochkarev", PropName).
  %title_price_by_name("Lochkarev", PropName, PropPrice).
  all_price_by_name("Lochkarev", Pri).