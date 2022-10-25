import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              child: const Text('Goto Checkout' ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cutlery',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Do you need cutlery',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: SwitchListTile(
                          dense: false,
                          value: false,
                          onChanged: (bool newValue) {}),
                    ),
                  ],
                ),
              ),
              Text(
                'Items',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '1x',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              'Pizza Margherita',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Text(
                            '\$4.99',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    );
                  }),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/delivery_time.svg'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Delivery in 20 minutes',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Change',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Do you have voucher',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Apply',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          )
                        ],
                      ),
                      SvgPicture.asset('assets/delivery_time.svg'),
                    ]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '\$20.0',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '\$5.0',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          '\$25.0',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
