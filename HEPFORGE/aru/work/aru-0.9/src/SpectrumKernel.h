#ifndef _SpectrumKernel_h_
#define _SpectrumKernel_h_

#include "VKernel.h"
#include <cmath>
#include <vector>

#include <TMath.h>

// calculates the p.d.f. of ln(x), whereas x has a normal distribution with "mean" and "sigma"
double ExpNormal(double x, double mean, double sigma)
{
  const double arg1 = (exp(x) - mean)/sigma;
  const double norm = sqrt(0.5*TMath::Pi())*sigma*(1.0 + TMath::Erf(mean/(sqrt(2)*sigma)));
  return exp( - 0.5*arg1*arg1 + x )/norm;
}

class SpectrumKernel : public Aru::VKernel {
private:
  std::vector<double> fPars;

public:
  SpectrumKernel() {}

  SpectrumKernel(const std::vector<double>& pars)
  {
    SetPars(pars);
  }

  void
  SetPars(const std::vector<double>& pars)
  {
    fPars = pars;
  }

  double
  ResolutionPdf(const double yObserved, const double y)
    const
  {
    const double sigma = Sigma(y);
    const double ypow10 = std::pow(10,y);
    return ExpNormal(yObserved*TMath::Ln10(), ypow10, sigma*ypow10)*TMath::Ln10();
  }

  double
  Sigma(const double y)
    const
  {
    const size_t n = fPars.size();
    double result = fPars[0];
    const double x = std::pow(10,-0.5*(y-18));
    for (size_t i=1;i<n;++i)
      result += fPars[i]*std::pow(x,i);
    return result;
  }
};

#endif

