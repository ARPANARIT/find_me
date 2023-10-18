import 'package:flutter/material.dart';
import 'package:news_feed/api/exchange_rate.dart';
import 'coins.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurr = 'USD';
  String exchangeRatesBTC = '';
  String exchangeRatesETH = '';
  String exchangeRatesLTC = '';

  String baseCurr = '';
  // create a function to list the dropdown items
  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> newDropDownList = [];
    for (int i = 0; i < currenciesList.length; i++) {
      var currency = currenciesList[i];
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      newDropDownList.add(item);
    }
    return newDropDownList;
  }

  void callApi(String baseCurrency) async {
    String ratesBTC = await BitCoinApi.getExchangeRatesBTC(baseCurrency);
    String ratesETH = await BitCoinApi.getExchangeRatesETH(baseCurrency);
    String ratesLTC = await BitCoinApi.getExchangeRatesLTC(baseCurrency);

    setState(() {
      exchangeRatesBTC = ratesBTC;
      exchangeRatesETH = ratesETH;
      exchangeRatesLTC = ratesLTC;
      baseCurr = baseCurrency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xff00796b),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${exchangeRatesBTC} ${baseCurr} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xff00796b),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = ${exchangeRatesETH} ${baseCurr} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xff00796b),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = ${exchangeRatesLTC} ${baseCurr} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xff00796b),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              style: TextStyle(
                color: Color(0xff26969a),
              ),
              value: selectedCurr,
              items: getDropdownItems(),
              onChanged: (value) {
                setState(() {
                  selectedCurr = value!;
                  callApi(selectedCurr);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
