#ifndef _MyKernel_h_
#define _MyKernel_h_

#include "VKernel.h"
#include <cmath>

class MyKernel : public Aru::VKernel {
private:
  const double fSigma;
public:

  MyKernel() :
    fSigma(0.1)
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

