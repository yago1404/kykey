import 'package:flutter/material.dart';
import 'package:kykey/app/widgets/cards/kykey_password_card.dart';
import 'package:kykey/app/widgets/kykey_bottom_nav_bar.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedFilter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Bem vindo de volta',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Yago',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              _headerActionButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 12),
              _headerActionButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _passwordAmount(),
          const SizedBox(height: 18),
          Row(
            children: const [
              Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _filterCard(
                index: 1,
                icon: Icon(
                  Icons.list,
                  size: 18,
                  color: selectedFilter == 1 ? Colors.white : Colors.grey,
                ),
                label: 'Todos',
              ),
              _filterCard(
                index: 2,
                icon: Icon(
                  Icons.login,
                  size: 18,
                  color: selectedFilter == 2 ? Colors.white : Colors.grey,
                ),
                label: 'Login',
              ),
              _filterCard(
                index: 3,
                icon: Icon(
                  Icons.credit_card_outlined,
                  size: 18,
                  color: selectedFilter == 3 ? Colors.white : Colors.grey,
                ),
                label: 'Cartões',
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              Text(
                'Adicionadas recentemente',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: index == 9 ? 30 : 6),
                  child: const KykeyPasswordCard(
                    title: 'Gmail',
                    login: 'ytaveiros@gmail.com',
                    password: 'UmA.SeNhA.MuItO.GrAnDe.123.456.798',
                  ),
                );
              },
            ),
          ),
          // const SizedBox(height: 60),
        ],
      ),
    );
  }

  _passwordAmount() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              const Color(0xFF191849),
            ]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Suas senhas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '24 Senhas',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 75,
                    child: PieChart(
                      legendOptions: const LegendOptions(
                        showLegends: false,
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValues: false,
                      ),
                      ringStrokeWidth: 14,
                      dataMap: const {
                        'Uso': 24,
                      },
                      chartType: ChartType.ring,
                      totalValue: 35,
                      baseChartColor: Colors.white,
                      colorList: [
                        Theme.of(context).primaryColor,
                      ],
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '68%',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          top: 8,
          right: 8,
          child: Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    );
  }

  _headerActionButton({required Widget icon}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.2),
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }

  _filterCard({
    required int index,
    required Widget icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: () => setState(() {
        selectedFilter = index;
      }),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: selectedFilter == index
                ? Theme.of(context).primaryColor.withOpacity(.6)
                : Colors.grey,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .primaryColor
                    .withOpacity(selectedFilter == index ? .9 : .2),
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: selectedFilter == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
