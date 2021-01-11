#if !defined(__CINT__) || defined(__MAKECINT__)
#include <Riostream.h>
#include <TObjArray.h>
#include <TString.h>
#include <TGraph.h>
#include <TCanvas.h>

#include <iostream>
#include <fstream>

using namespace std;

#endif


class TRMatter : public TNamed
{
 private:
  TString f_TAT;//Name of the Matter

  vector<Double_t> f_DMM;//absorption coefficients
  vector<Double_t> f_DWW;//omega bins for the absorption coefficients

  Double_t f_ROR;//density
  
  Double_t f_WAZ;//plasma frequency
  TGraph *g_TAT;



 public:
 TRMatter() : f_TAT(0), f_DMM(0), f_DWW(0), f_ROR(0), f_WAZ(0) {}
  virtual   ~TRMatter() {}
  
  
  
  void       MSet(TString t_TAT, vector<Double_t> t_DMM, vector<Double_t> t_DWW, Double_t t_ROR, Double_t t_WAZ) {
    for(unsigned int i=0; i<t_DWW.size();i++)t_DWW[i]=log(1e3*t_DWW[i]);//keV

    f_TAT=t_TAT;
    f_DMM=t_DMM; 
    f_DWW=t_DWW; 
    f_ROR=t_ROR; 
    f_WAZ=t_WAZ;
    
 
    g_TAT= new TGraph(f_DWW.size(),&(f_DWW[0]),&(f_DMM[0]));
    char name[100];
    sprintf(name,"g_TAT");      
    g_TAT->SetName(name+f_TAT);
  }


  Double_t GetCoeff(Double_t w)  const {return g_TAT->Eval(w);}
  Double_t GetROR()              const {return f_ROR;}
  Double_t GetWAZ()              const {return f_WAZ;}
  TString GetTAT()              const {return f_TAT;}


};
