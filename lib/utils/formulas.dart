
class Converter{
  double kmTom(double valueKM) => valueKM * 1000;
  double kmTocm(double valueCM) => valueCM * 100000;

  double mTokm(double valueM) => valueM / 1000;
  double mToCM(double valueM) => valueM * 100;

  double cmTokm(double valueCM) => valueCM / 100000;
  double cmTom(double valueCM) => valueCM / 100;

 }
