enum MetricEnum {
  kilogram('kilogram', 'kg'),
  unit('unit', 'un'),
  packages('packages', 'pk');

  final String title;
  final String friendlyTitle;

  const MetricEnum(this.title, this.friendlyTitle);
}
