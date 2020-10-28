double GetProbability(double e)
{
  int m =1; double e0 = 25.7;
  double probability=pow(1-exp(-e/e0), m);
  //double probability=exp(-e0/e);
  //cout<<probability<<endl;
  return probability;
}