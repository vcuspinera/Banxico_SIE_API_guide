# Cash time series from Banco de Mexico

choices_series <- list(
  # Banknotes in Circulation
  "Banknotes in circulation, total - (SM1470)" = "SM1470",
  "Banknotes in circulation, 20 pesos - (SM1472)" = "SM1472",
  "Banknotes in circulation, 50 pesos - (SM1478)" = "SM1478",
  "Banknotes in circulation, 100 pesos - (SM1479)" = "SM1479",
  "Banknotes in circulation, 200 pesos - (SM1480)" = "SM1480",
  "Banknotes in circulation, 500 pesos - (SM1481)" = "SM1481",
  "Banknotes in circulation, 1000 pesos - (SM1482)" = "SM1482",
  
  # Coins in Circulation
  "Coins in circulation, total - (SM200)" = "SM200",
  "Coins in circulation, 10 cents - (SM10)" = "SM10",
  "Coins in circulation, 20 cents - (SM11)" = "SM11",
  "Coins in circulation, 50 cents - (SM12)" = "SM12",
  "Coins in circulation, 1 peso - (SM13)" = "SM13",
  "Coins in circulation, 2 pesos - (SM14)" = "SM14",
  "Coins in circulation, 5 pesos - (SM15)" = "SM15",
  "Coins in circulation, 10 pesos - (SM16)" = "SM16",
  "Coins in circulation, 20 pesos - (SM17)" = "SM17",
  
  # Issue of new banknotes
  "Issue of new banknotes, total - (SM915)" = "SM915",
  "Issue of new banknotes, 20 pesos - (SM925)" = "SM925",
  "Issue of new banknotes, 50 pesos - (SM1282)" = "SM1282",
  "Issue of new banknotes, 100 pesos - (SM1496)" = "SM1496",
  "Issue of new banknotes, 200 pesos - (SM1497)" = "SM1497",
  "Issue of new banknotes, 500 pesos - (SM1498)" = "SM1498",
  "Issue of new banknotes, 1000 pesos - (SM1499)" = "SM1499",
  
  # Issue of new coins
  "Issue of new coins, total - (SM555)" = "SM555",
  "Issue of new coins, 10 cents (type BC) - (SM557)" = "SM557",
  "Issue of new coins, 20 cents (type BC) - (SM558)" = "SM558",
  "Issue of new coins, 50 cents (type BC) - (SM559)" = "SM559",
  "Issue of new coins, 10 cents (type C1) - (SM568)" = "SM568",
  "Issue of new coins, 20 cents (type C1) - (SM569)" = "SM569",
  "Issue of new coins, 50 cents (type C1) - (SM570)" = "SM570",
  "Issue of new coins, 1 peso - (SM560)" = "SM560",
  "Issue of new coins, 2 pesos - (SM561)" = "SM561",
  "Issue of new coins, 5 pesos - (SM562)" = "SM562",
  "Issue of new coins, 10 pesos - (SM563)" = "SM563",
  "Issue of new coins, 20 pesos (type BC) - (SM564)" = "SM564",
  "Issue of new coins, 20 pesos (type C1) - (SM1512)" = "SM1512",
  
  # Unfit banknote deposit
  "Unfit banknote deposit, total - (SM1483)" = "SM1483",
  "Unfit banknote deposit, 20 pesos - (SM1485)" = "SM1485",
  "Unfit banknote deposit, 50 pesos - (SM1487)" = "SM1487",
  "Unfit banknote deposit, 100 pesos - (SM1489)" = "SM1489",
  "Unfit banknote deposit, 200 pesos - (SM1490)" = "SM1490",
  "Unfit banknote deposit, 500 pesos - (SM1492)" = "SM1492",
  "Unfit banknote deposit, 1000 pesos - (SM1494)" = "SM1494",
  
  # Cash by holders
  "Currency in circulation - (SF1)" = "SF1",
  "Currency held by the public - (SF4)" = "SF4",
  "Cash in vault - (SF5)" = "SF5",
  
  # Average banknote lifetime
  "Average banknote lifetime, 20 pesos (paper) - (SM28)" = "SM28",
  "Average banknote lifetime, 20 pesos (polymer) - (SM29)" = "SM29",
  "Average banknote lifetime, 50 pesos (paper) - (SM30)" = "SM30",
  "Average banknote lifetime, 50 pesos (polymer) - (SM60)" = "SM60",
  "Average banknote lifetime, 100 pesos - (SM31)" = "SM31",
  "Average banknote lifetime, 200 pesos - (SM32)" = "SM32",
  "Average banknote lifetime, 500 pesos - (SM33)" = "SM33",
  "Average banknote lifetime, 1000 pesos - (SM40)" = "SM40",
  
  # Counterfeit banknotes
  "Annual counterfeit notes, total - (SM1255)" = "SM1255",
  "Annual counterfeit notes, 20 pesos - (SM1249)" = "SM1249",
  "Annual counterfeit notes, 50 pesos - (SM1250)" = "SM1250",
  "Annual counterfeit notes, 100 pesos - (SM1251)" = "SM1251",
  "Annual counterfeit notes, 200 pesos - (SM1252)" = "SM1252",
  "Annual counterfeit notes, 500 pesos - (SM1253)" = "SM1253",
  "Annual counterfeit notes, 1000 pesos - (SM1254)" = "SM1254",
  
  # Counterfeit coins
  "Annual counterfeit coins, total - (SM1266)" = "SM1266",
  "Annual counterfeit coins, 10 cents - (SM1256)" = "SM1256",
  "Annual counterfeit coins, 20 cents - (SM1257)" = "SM1257",
  "Annual counterfeit coins, 50 cents - (SM1258)" = "SM1258",
  "Annual counterfeit coins, 1 peso - (SM1259)" = "SM1259",
  "Annual counterfeit coins, 2 pesos - (SM1260)" = "SM1260",
  "Annual counterfeit coins, 5 pesos - (SM1261)" = "SM1261",
  "Annual counterfeit coins, 10 pesos - (SM1262)" = "SM1262",
  "Annual counterfeit coins, 20 pesos - (SM1263)" = "SM1263",
  
  # Indicators
  "Percentage of people that remember or know 2 or more security features - (SM69)" = "SM69",
  "Percentage of people mentioning that they check their banknotes - (SM70)" = "SM70",
  "Average banknote lifetime, Percentage of people that when making a purchase, the commercial establishment did not have currency change - (SM71)" = "SM71",
  "Average banknote lifetime, Percentage of people that could not make a purchase due to lack of change - (SM72)" = "SM72"
)