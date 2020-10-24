import 'package:flutter/material.dart';
import 'package:calculator/utils/formulas.dart';

import '../utils/constants.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _selectedFromOption;
  int _selectedFromValue;
  String _selectedToOption;
  int _selectedToValue;
  double valueFrom = 0.0;
  double valueTo = 0.0;
  var prueba;
  final lstTypes = <String>['Kilometros(KM)', 'Metros(M)', 'Centimetros(CM)'];
  Converter converter = new Converter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Measures Converter')),
      ),
      body: Stack(
        children: [
          _background(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _fieldText(context, 'Value'),
                  _space(),
                  _fieldinsertData(),
                  _space(),
                  _fieldText(context, 'From'),
                  _space(),
                  _fieldDrowDownButtonFrom(),
                  _space(),
                  _fieldText(context, 'To'),
                  _space(),
                  _fieldDrowDownButtonTo(),
                  _space(),
                  _space(),
                  _fiedlButton(),
                  _space(),
                  Text(
                    'Resultado: ' + valueTo.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget _space() {
    return SizedBox(height: 20);
  }

  Widget _fieldinsertData() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Please insert the meaure to be ...',
      ),
      onChanged: (value) {
        //setState(() {
        valueFrom = double.tryParse(value);
        //});
      },
    );
  }

  Widget _fieldDrowDownButtonFrom() {
    return DropdownButton(
      isExpanded: true,
      icon: Icon(Icons.arrow_downward),
      style: TextStyle(color: colorConverter, fontSize: 16),
      value: _selectedFromOption,
      items: lstTypes.map(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (value) {
        setState(() {
          _selectedFromOption = value;
          for (var i = 0; i < lstTypes.length; i++) {
            if (lstTypes[i] == _selectedFromOption) {
              print(i);
              _selectedFromValue = i;
            }
          }
        });
      },
    );
  }

  Widget _fieldDrowDownButtonTo() {
    return DropdownButton(
      isExpanded: true,
      icon: Icon(Icons.arrow_downward),
      style: TextStyle(color: colorConverter, fontSize: 16),
      value: _selectedToOption,
      items: lstTypes.map(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (value) {
        setState(() {
          _selectedToOption = value;
          for (var i = 0; i < lstTypes.length; i++) {
            if (lstTypes[i] == _selectedToOption) {
              print(i);
              _selectedToValue = i;
            }
          }
        });
      },
    );
  }

  Widget _fiedlButton() {
    return RaisedButton(
      child: Text(
        'Convert',
        style: TextStyle(color: colorConverter),
      ),
      color: Colors.white,
      splashColor: colorConverter,
      onPressed: () {
        setState(() {
          switch (_selectedFromValue) {
            case 0:
              switch (_selectedToValue) {
                case 1:
                  valueTo = converter.kmTom(valueFrom);
                  break;
                case 2:
                  valueTo = converter.kmTocm(valueFrom);
                  break;
                default:
                  valueTo = valueFrom;
              }
              break;
            case 1:
              switch (_selectedToValue) {
                case 0:
                  valueTo = converter.mTokm(valueFrom);
                  break;
                case 2:
                  valueTo = converter.mToCM(valueFrom);
                  break;
              }
              break;
            case 2:
              switch (_selectedToValue) {
                case 0:
                  valueTo = converter.cmTokm(valueFrom);
                  break;
                case 1:
                  valueTo = converter.cmTom(valueFrom);
                  break;
              }
              break;
          }
        });
      },
    );
  }
}

Widget _background() {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
        ),
      ),
      Expanded(
        flex: 2,
        child: Opacity(
          opacity: 0.2,
          child: Container(
            child: Image.asset('assets/question.png'),
          ),
        ),
      ),
    ],
  );
}
