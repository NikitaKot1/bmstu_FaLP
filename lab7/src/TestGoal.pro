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

predicates
  record(string, integer, adress)
  auto(string, string, string, integer, string)
  
clauses
  record("Kupchev", 131, addr("Krasnogorsk", "Lesnaya", 15, 6)).
  record("Kupchev", 222,  addr("Krasnogorsk", "Lesnaya", 15, 6)).
  record("Allanov", 341,  addr("Moscow", "Inessa Armand", 79, 122)).
  record("Cherbenkov", 441,  addr("Moscow", "Golubinskaya", 140, 15)).
  record("Cherbenkov", 476,  addr("Moscow", "Golubinskaya", 140, 15)).
  record("Lochkarev", 544,  addr("Moscow", "Dorms 5", 655, 89)).
  record("Lochkarev", 194,  addr("Moscow", "Dorms 5", 655, 89)).
  record("Ivanov", 656,  addr("Ekaterinburg", "Sovetskaya", 140, 3)).

  auto("Kupchev", "lada", "red", 150000, "oa200b").
  auto("Kupchev", "kivi", "green", 1532100, "oa200x").
  auto("Ivanov", "mers", "black", 2000000, "lok333i").
  auto("Allanov", "volga", "rust", 10000, "lo723l").
  auto("Allanov", "porsh", "yellow", 1009900, "lo063l").
  auto("Cherbenkov", "ferra", "red", 15000000, "om999l").
  auto("Lochkarev", "porsh", "grey", 124000, "ad123a").
  auto("Ivanov", "jiguul", "white", 150000, "qw123r").
  auto("Ivanov", "lowk", "black", 155500, "qw023r").


goal
  
  auto(Name, "porsh", "grey", _, _), record(Name, Phone,  addr(Town, _, _, _)).
