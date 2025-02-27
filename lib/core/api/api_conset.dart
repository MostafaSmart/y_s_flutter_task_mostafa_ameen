class ApiConstants {
  // static const header = {'Accept': 'application/json', 'Accept-Language': 'ar'};
  // static const String baseUrl = "http://192.168.90.104:8001/api/";
  // static const String baseUrl = "https://eyescareapp.pythonanywhere.com/api/";
  static const String baseUrl = "https://api.marketstack.com/v1/";

  
  static const String apiKey = "dc1d98bdc76c383df34c82d4bca85d9d";


  ///=========================================  Urls ===============================================

  static const String getTopStocks = '${baseUrl}tickers?access_key=${apiKey}';
  static const String  getHistoricalStockPrices ='${baseUrl}eod?access_key=${apiKey}&symbols=AAPL&limit=5';
  
 
  
  
  
  }