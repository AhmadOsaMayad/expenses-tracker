enum Currency {
  usd(init: 'USD'),
  yer(init: 'YER'),
  sar(init: 'SAR');

  final String init;

  const Currency({required this.init});
}
