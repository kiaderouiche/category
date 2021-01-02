#include "VKernel.h"
#include <cmath>
#include <vector>
#include <stdexcept>
#include <algorithm>

#include <TMatrixDSym.h>
#include <TDecompSVD.h>

  class ReferenceEstimator {
  public:

    struct Point {

      Point() :
        fZ(0), fW(0), fH(1.0)
      {}
      
      Point(double z, double w) :
        fZ(z), fW(w), fH(1.0)
      {}
      
      inline
      bool
      operator<(const Point& other)
        const
      {
        return fZ < other.fZ;
      }

      inline
      bool
      operator<(double z)
        const
      {
        return fZ < z;
      }

      double fZ;
      double fW;
      double fH;
    };

    typedef std::vector<Point> PointArray;

    enum EndPointBehavior { eNoTreatment, eMirror, eTruncated };

    ReferenceEstimator(const VKernel& kernel, const std::vector<double>& data,
                   const double start, const double stop,
                   EndPointBehavior endPointBehavior = eTruncated) :
      fStart(start), fRange(stop-start), fEndPointBehavior(endPointBehavior)
    {
      for (size_t i=0;i<data.size();++i)
      {
        const double y = data[i];
        const double x = kernel.X(y);
        const double z = ToZ(x);
        if (z>=0.0 && z<1.0)
          fPoints.push_back(Point(z,1.0/kernel.Efficiency(y)));
      }

      std::sort(fPoints.begin(), fPoints.end());

      // zero order estimate
      const double h0 = ComputeH0();
      for (size_t i=0;i<fPoints.size();++i)
        fPoints[i].fH = h0;
    }

    double
    operator()(double x)
      const
    {
      const double z = ToZ(x);
      double vsum = 0.0;
      for (PointArray::const_iterator it=fPoints.begin();
           it!=fPoints.end();++it)
        vsum += it->fW*Kernel(z,it->fZ,it->fH);
      return vsum/fRange;
    }

    double
    Variance(double x)
      const
    {
      const double z = ToZ(x);
      double f = 0.0;
      for (PointArray::const_iterator it=fPoints.begin();
           it!=fPoints.end();++it)
        f += Kernel(z,it->fZ,it->fH);
      const double h = GetBandWidth(x);
      const double w = GetWeight(x);
      return 0.5*f/h*w*w/(fRange*fRange);
    }

    double
    GetBandWidth(double x)
      const
    {
      const double z = ToZ(x);

      PointArray::const_iterator it =
        std::lower_bound(fPoints.begin(),fPoints.end(), z);

      if (it != fPoints.begin() && it != fPoints.end())
      {
        const double z2 = it->fZ;
        const double h2 = it->fH;
        --it;
        const double z1 = it->fZ;
        const double h1 = it->fH;
        return ((z2-z)*h1 + (z-z1)*h2)/(z2-z1);
      }
      else
      {
        if (it==fPoints.end()) --it;
        return it->fH;
      }
    }

    double
    GetWeight(double x)
      const
    {
      const double z = ToZ(x);

      PointArray::const_iterator it =
        std::lower_bound(fPoints.begin(),fPoints.end(), z);

      if (it != fPoints.begin() && it != fPoints.end())
      {
        const double z2 = it->fZ;
        const double w2 = it->fW;
        --it;
        const double z1 = it->fZ;
        const double w1 = it->fW;
        return ((z2-z)*w1 + (z-z1)*w2)/(z2-z1);
      }
      else
      {
        if (it==fPoints.end()) --it;
        return it->fW;
      }
    }

  private:

    inline
    double ToZ(double x)
      const
    {
      return (x-fStart)/fRange;
    }

    double
    ComputeH0()
      const
    {
      const size_t n = fPoints.size();
      double sumz=0.0;
      double sumzz=0.0;
      for (PointArray::const_iterator it=fPoints.begin();it!=fPoints.end();++it)
      {
        sumz += it->fZ;
        sumzz += it->fZ*it->fZ;
      }
      const double sigma = std::sqrt(sumzz/(n-1) - sumz*sumz/(n*n-n));
      return std::pow(4.0/3.0,0.2)*sigma*std::pow(n,-0.2);
    }

    inline
    double
    Kernel(double z, double zi, double hi)
      const
    {
      const double sqrt2 = std::sqrt(2.0);
      const double t = (z-zi)/hi/sqrt2;
      const double kOneDivSqrt2Pi = 0.3989422804014327;

      double result = 0.0;
      switch (fEndPointBehavior)
      {
        case eNoTreatment:
          result = kOneDivSqrt2Pi/hi*
                   std::exp(-t*t);
        break;
        case eMirror:
        {
          const double t1 = (z+zi)/hi/sqrt2;
          const double t2 = (z+zi-2)/hi/sqrt2;
          result = kOneDivSqrt2Pi/hi*
                   (std::exp(-t*t) +
                    std::exp(-t1*t1) +
                    std::exp(-t2*t2));
        }
        break;
        case eTruncated:
          result = kOneDivSqrt2Pi/hi*
                   2.0*std::exp(-t*t)/
                   (ROOT::Math::erf((1.0-zi)/hi/sqrt2)-ROOT::Math::erf(-zi/hi/sqrt2));
        break;
      }

      return result;
    }

    const double fStart;
    const double fRange;
    PointArray fPoints;
    EndPointBehavior fEndPointBehavior;
  };



  void
  FitReference(std::vector<double>& refCoefs,
           TMatrixDSym& priorCov,
           const Spline::Function1D& spline,
           const ReferenceEstimator& kde)
  {
    const Spline::KnotVector& xknots = spline.GetKnotVector();
    const size_t nBasis = spline.GetSize();
    const size_t nData = 2*(xknots.size()-1)+1;

    TMatrixD a(nData,nBasis);
    TVectorD b(nData);
    TMatrixDSym bvar(nData);
    for (size_t i=0;i<nData;++i)
    {
      const double x = (i % 2==0 || i==nData-1) ? xknots[i/2] : 0.5*(xknots[i/2]+xknots[i/2+1]);
      b[i] = kde(x);
      bvar(i,i) = kde.Variance(x);
      for (size_t j=0;j<nBasis;++j)
        a(i,j) = spline.Basis(j,x);
    }

    TDecompSVD svd(a);
    TMatrixD pinv(nBasis,nData);
    for (size_t i=0;i<nBasis;++i)
      for (size_t j=0;j<nData;++j)
        for (size_t k=0;k<nBasis;++k)
          if (svd.GetSig()[k]>1e-12)
            pinv(i,j) += svd.GetV()(i,k)/svd.GetSig()[k]*svd.GetU()(j,k);

    for (size_t i=0;i<nBasis;++i)
    {
      refCoefs[i] = 0.0;
      for (size_t j=0;j<nData;++j)
        refCoefs[i] += pinv(i,j)*b[j];

      if (refCoefs[i] < 1e-12)
        refCoefs[i] = 1e-12;
    }

    for (size_t i=0;i<nBasis;++i)
      for (size_t j=i;j<nBasis;++j)
    {
      priorCov(i,j) = 0.0;
      for (size_t k=0;k<nData;++k)
        for (size_t l=0;l<nData;++l)
          priorCov(i,j) += pinv(i,k)*pinv(j,l)*bvar(k,l);
      if (i!=j)
        priorCov(j,i) = priorCov(i,j);
    }
  }
