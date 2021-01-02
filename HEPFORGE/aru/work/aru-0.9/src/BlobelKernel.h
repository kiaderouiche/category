#ifndef _BlobelKernel_h_
#define _BlobelKernel_h_

#include "Utils.h"
#include "VKernel.h"
#include <cmath>

class BlobelKernel : public Aru::VKernel {
private:
  const double fSigma;

public:

  BlobelKernel()
    : fSigma(0.1)
  {}

  double
  ResolutionPdf(const double yObserved, const double y)
    const
  {
    const double z = (yObserved-y)/fSigma;
    const double c = 1.0/(std::sqrt(2*M_PI)*fSigma);
    return c*std::exp(-0.5*z*z);
  }

  double
  Efficiency(const double y)
    const
  {
    return 1.0 - 0.5*Aru::Sqr(y-1.0);
  }

  double
  X(const double y)
    const
  {
    return 10.0 - 2.0*std::sqrt(5.0)*std::sqrt(5.0-y);
  }

  double
  Y(const double x)
    const
  {
    return x - 0.05*x*x;
  }

};

#endif

