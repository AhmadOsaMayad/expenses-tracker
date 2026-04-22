enum Currency {
  usd(init: 'USD', enName: 'US Dollar', arName: 'دولار أمريكي'),
  yer(init: 'YER', enName: 'Yem Rial(N)', arName: 'ريال يمني'),
  yers(init: 'YERs', enName: 'Yem Rial(S)', arName: 'قعيطي جنوبي'),
  sar(init: 'SAR', enName: 'Saudi Riyal', arName: 'ريال سعودي');

  final String init, enName, arName;

  const Currency({
    required this.init,
    required this.enName,
    required this.arName,
  });
}
