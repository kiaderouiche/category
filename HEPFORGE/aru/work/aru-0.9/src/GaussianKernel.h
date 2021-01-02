#ifndef _GaussianKernel_h_
#define _GaussianKernel_h_

#include "VKernel.h"
#include <cmath>

class GaussianKernel : public Aru::VKernel {
private:
  const double fSigma;
public:

  GaussianKernel(const double sigma) :
    fSigma(sigma)
  {
  }

  double
  ResolutionPdf(const double yObserved, const double yAverage)
    const
  {
    const double z = (yObserved-yAverage)/fSigma;
    const double c = 1.0/std::sqrt(2*M_PI)/fSigma;
    return c*std::exp(-0.5*z*z);
  }

};

#endif

