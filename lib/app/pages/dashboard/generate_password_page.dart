import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kykey/app/utils/generate_letter.dart';

class GeneratePasswordPage extends StatefulWidget {
  const GeneratePasswordPage({Key? key}) : super(key: key);

  @override
  State<GeneratePasswordPage> createState() => _GeneratePasswordPageState();
}

class _GeneratePasswordPageState extends State<GeneratePasswordPage> {
  double sliderValue = 4;
  late String _currentPassword;
  Map<String, bool> appliedFilters = {
    'lowerCases': true,
    'upperCases': true,
    'numbers': false,
    'specialCharacters': false,
  };

  @override
  void initState() {
    _currentPassword = _generateString(length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      appBar: AppBar(centerTitle: true, title: Text('Gerador de senhas'),),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        _currentPassword,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Icon(
                  Icons.copy,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              'Configurações',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              'Tamanho da senha: ${sliderValue.toInt()}',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Slider(
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  if (value.toInt() > _currentPassword.length) {
                    _currentPassword += _generateString();
                  } else if (value.toInt() < _currentPassword.length) {
                    List<String> letters = _currentPassword.split('');
                    letters.removeLast();
                    _currentPassword = letters.join();
                  }
                  sliderValue = value.toInt().toDouble();
                });
              },
              min: 4,
              max: 40,
            ),
          ),
          _selectFilter('Letras minúsculas', 'lowerCases'),
          _selectFilter('Letras Maiúsculas', 'upperCases'),
          _selectFilter('Numeros', 'numbers'),
          _selectFilter('Caracters especiais', 'specialCharacters'),
        ],
      ),
    );
  }

  _selectFilter(String filterName, String filter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            filterName,
            style: const TextStyle(fontSize: 12),
          ),
          Checkbox(
            value: appliedFilters[filter],
            onChanged: (value) => setState(() {
              if (_isValidFilterChange(filter)) appliedFilters[filter] = value ?? true;
              _currentPassword = _generateString(length: sliderValue.toInt());
            }),
          ),
        ],
      ),
    );
  }

  String _generateString({int length = 1}) {
    String generatedString = '';
    for (int i = 0; i < length; i++) {
      generatedString += generateLetter(
        includesDigits: appliedFilters['numbers']!,
        includesLowerCases: appliedFilters['lowerCases']!,
        includesUpperCases: appliedFilters['upperCases']!,
        includesSpacialCharacters: appliedFilters['specialCharacters']!,
      );
    }
    return generatedString;
  }

  bool _isValidFilterChange(String filter) {
    bool haveTrue = false;
    for (String i in appliedFilters.keys) {
      if (i != filter) haveTrue = haveTrue || appliedFilters[i]!;
    }
    return haveTrue || !appliedFilters[filter]!;
  }
}
