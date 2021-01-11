//==================================================================== 
//                                                                     
//                         R A D I A T O R                             
//                                                                     
//            A program to calculate the TR quanta yield               
//    Version  2.0  - E. Shulga FRTRAN to C++ transformation of P. Nevski's program 
//    Input - radiator.txt,  Output- Radiator.root     
//==================================================================== 

#if !defined(__CINT__) || defined(__MAKECINT__)
#include <Riostream.h>
#include <TSystem.h>
#include <TMath.h>
#include <TRandom.h>
#include <TNtuple.h>
#include <TNamed.h>
#include <TF1.h>
#include <TF2.h>
#include <TH2.h>
#include <TFile.h>
#include <TObjArray.h>
#include <TString.h>
#include <TEllipse.h>
#include <TLine.h>
#include <TGraph.h>
#include <TCanvas.h>

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>
#include <stdio.h>      /* printf, fgets */
#include <stdlib.h>     /* atof */
#include <math.h>       /* sin */
#include <vector>
#include "./Matter.h"

#define ARRAY_SIZE(array) (sizeof((array))/sizeof((array[0])))

using namespace std;

#endif


//const Int_t Lo=500; 
const Int_t Lm=40; 
const Int_t Km=20; 
Int_t Ke=0; 
Int_t Kw=0;  
Int_t Nw=0;  
const Int_t Lb=90; 
const Int_t Le=20; 
const Int_t Lt=10; 
const Int_t Li=1; 
const Int_t Lu=2; 
const Int_t Lc=10;  
const Int_t Lr=10; 
const Int_t Lv=10; 
const Int_t Lw=1+3*Lt*Le;

const Double_t sc=0.0001;

char name[100];

Int_t j_g;
Int_t Nset=-1;  
Int_t Ivar=0;
Int_t Ih0=0;
Int_t Ir1;
Int_t Ir2;
Double_t Al1=0;
Double_t Al2=0;
Double_t Om1=0;
Double_t Om2=0;
Int_t Nf;

Int_t Itype[Lb];
Int_t Ipr[Lt];
Int_t Ihi[Lt];
Int_t Nelem[Lt];
std::string Types[Lt][Le];
Int_t ANfoil[Lt][Le];
Double_t ALfoil[Lt][Le];
Double_t ALtot[Lt][Le];
Int_t Mater[Lt][Le];
Double_t Cthr[Lc];
Int_t Ivv[2][Lv];
vector<Double_t> ABSORB[Km];
Double_t val[Lr];

Double_t  Omi;
Double_t  Oma;
Double_t  Ost;
Double_t  G;
//Int_t No=-1;
Int_t Nc=-1;
Int_t nech=0;
vector <Double_t> Omg;
Int_t Nvv[Lv];
Double_t VVV[Lv][Lv];
Double_t VV[Lv];
Int_t Var[Lw];

//Calc
//Double_t Zct[Lc]={};

Double_t Emin=0;
Double_t Emax=0;

TString TAT[Km];
Int_t IEM[Km];
Double_t ROR[Km];

Double_t WAZ[Km];

//Int_t IDM[Km];
//Double_t ALRD[Km];
//Double_t DMM[Lm,Km];
//Double_t DWW[Lm,Km];
//Double_t ABSORB[Lo][Km];

std::vector<Double_t> DMM[Km];
std::vector<Double_t> DWW[Km];

vector<TRMatter> AllMatter;


TH1F *h0;

TH1F *h[5];

TH1F *h_1[5];

TH1F *h1 ;
TH1F *h10[5];
TH1F *h20[5];
TH1F *h30[5];

void MyData();
void MyRead(TString TXTFile);
void Calc();

Double_t Xemitan ( Double_t om);
Double_t CLUST(vector <Double_t> X,vector <Double_t> Y,Double_t T);
vector <Double_t> ESCAPE(vector <Double_t> omg, vector <Double_t> y, Double_t E_max);

/*! Center-aligns string within a field of width w. Pads with blank spaces
  to enforce alignment. */
std::string center(const string s, const Int_t w);
std::string center(const string s, const Int_t w) {
  stringstream ss, spaces;
  Int_t padding = w - s.size();                 // count excess room to pad
  for(Int_t i=0; i<padding/2; ++i)
    spaces << " ";
  ss << spaces.str() << s << spaces.str();    // format with padding
  if(padding>0 && padding%2!=0)               // if odd #, add 1 space
    ss << " ";
  return ss.str();
}
/* Convert double to string with specified number of places after the decimal
   and left padding. */
std::string prd(const Double_t x, const Int_t decDigits, const Int_t width) ;
std::string prd(const Double_t x, const Int_t decDigits, const Int_t width) {
  stringstream ss;
  ss << fixed << right;
  ss.fill(' ');        // fill space around displayed #
  ss.width(width);     // set  width around displayed #
  ss.precision(decDigits); // set # places after decimal
  ss << x;
  return ss.str();
}
void radiator(TString TXTFile="radiator_tmp.txt",TString OutFName="radiator.root"){
  //fill arrays
  MyData();
  MyRead(TXTFile);




  TFile out(OutFName,"recreate",OutFName,9);

  Double_t gmin=2; 
  Double_t gmax=5.5; 
  Int_t ngch=20;
  h1 =new TH1F("h1","alog10(Lorentz factor)",9,0.5,9.5);
  h10[0]=new TH1F("h11","Mean number of incident gammas vs Log10(Lorentz)",ngch,gmin,gmax);
  h10[1]=new TH1F("h12","Mean number of absorbed gammas vs Log10(Lorentz)",ngch,gmin,gmax);
  h10[2]=new TH1F("h13","Mean number of registered gammas vs Log10(Lorentz)",ngch,gmin,gmax);
  h10[3]=new TH1F("h14","Mean number of generated gammas vs Log10(Lorentz)",ngch,gmin,gmax);

  h20[0]=new TH1F("h21","Mean energy (keV) of incident gamma vs Log10(Lorentz)",ngch,gmin,gmax);
  h20[1]=new TH1F("h22","Mean energy (keV) of absorbed gamma vs Log10(Lorentz)",ngch,gmin,gmax);
  h20[2]=new TH1F("h23","Mean energy (keV)  of registered gamma vs Log10(Lorentz)",ngch,gmin,gmax);
  h20[3]=new TH1F("h24","Mean energy (keV) of generated gamma vs Log10(Lorentz)",ngch,gmin,gmax);
		   
  h30[0]=new TH1F("h31","Full energy (keV) of incident gammas vs Log10(Lorentz)",ngch,gmin,gmax);
  h30[1]=new TH1F("h32","Full energy (keV) of absorbed gammas vs Log10(Lorentz)",ngch,gmin,gmax);
  h30[2]=new TH1F("h33","Full energy (keV) of registered gammas vs Log10(Lorentz)",ngch,gmin,gmax);
  h30[3]=new TH1F("h34","Full energy (keV) of generated gammas vs Log10(Lorentz)",ngch,gmin,gmax);




  Ih0=100*(Ivar+1);

  Double_t xstep=0.01; 
  nech=(Emax-Emin)/xstep;
  Int_t ngam=0;
  Int_t kw_f=0;
  while(kw_f<Nvv[Kw]){
    kw_f++;
    Int_t iv=Ivar; 
    for(Int_t iw=0;iw<Kw+1;iw++){ 
      Int_t k=Nvv[iw]; 
      Int_t ivk=iv%k;
      iv=iv/k; 
      VV[iw]=VVV[ivk][iw]; 
    }
    for(Int_t iw=0;iw<Nw+1;iw++){
      Var[Ivv[0][iw]]=VV[Ivv[1][iw]] ;
    }
    Ivar=Ivar+1; 
    Int_t MyVar=Ivar;  
    if(iv==1) MyVar=0;  
    Ih0=100*Ivar;
    sprintf(name,"h%i",Ih0);
    h0=new TH1F(name,"Iterations   ",100,0,0);
    
    Int_t N=(Oma-Omi)/Ost;

    sprintf(name,"h%i",Ih0+1);
    h[0]=new TH1F(name,"Incident gamma spectrum   ; log(#omega), [keV]; Incident", N, Omi/2.3, Oma/2.3);
    sprintf(name,"h%i",Ih0+2);
    h[1]=new TH1F(name,"Absorbed gamma spectrum   ; log(#omega), [keV];", N, Omi/2.3, Oma/2.3);
    sprintf(name,"h%i",Ih0+3);
    h[2]=new TH1F(name,"Registered gamma spectrum ; log(#omega), [keV];", N, Omi/2.3, Oma/2.3);
    sprintf(name,"h%i",Ih0+4);
    h[3]=new TH1F(name,"Generated gamma spectrum  ; log(#omega), [keV];", N, Omi/2.3, Oma/2.3);
    sprintf(name,"h%i",1000+Ih0+1);
    h_1[0]=new TH1F(name,"Incident gamma spectrum; #omega, [keV];", nech, Emin, Emax);
    sprintf(name,"h%i",1000+Ih0+2);
    h_1[1]=new TH1F(name,"Absorbed gamma spectrum; #omega, [keV];", nech, Emin, Emax);
    sprintf(name,"h%i",1000+Ih0+3);
    h_1[2]=new TH1F(name,"Registered gamma spectrum; #omega, [keV];", nech, Emin, Emax);
    sprintf(name,"h%i",1000+Ih0+4);
    h_1[3]=new TH1F(name,"Generated gamma spectrum; #omega, [keV];", nech, Emin, Emax);


    G=Var[0];

    ngam=ngam+1;
    h1->Fill(ngam,log10(G));

    Calc();
    
    h0->Write();

    for(Int_t i=0;i<4;i++){
      h[i]->Write();
      h_1[i]->Write();
    }

  }

  h1->Write();
  
  for(Int_t i=0;i<4;i++){
    h10[i]->Write();
    h20[i]->Write();
    h30[i]->Write();
  }

  out.Close();

}



void MyData(){


  //"                                                             Hydrogen ";
  TAT[0]="H  "; 
  Double_t DWW_1[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};
  
  //u
  Double_t DMM_1[]={7.217e+00,  2.148e+00,  1.059e+00,  5.612e-01,  4.546e-01,  4.193e-01,  4.042e-01,  3.914e-01,  3.854e-01,  3.764e-01,  3.695e-01,  3.570e-01,  3.458e-01,  3.355e-01,  3.260e-01,  3.091e-01,  2.944e-01,  2.651e-01,  2.429e-01,  2.112e-01,  1.893e-01,  1.729e-01,  1.599e-01,  1.405e-01,  1.263e-01,  1.129e-01,  1.027e-01,  8.769e-02,  6.921e-02,  5.806e-02,  5.049e-02,  4.498e-02,  3.746e-02,  3.254e-02,  2.539e-02,  2.153e-02}; 
  // Double_t DMM_1[]={7.31, 2.164, 1.061, .5605, .4542, .4192, .4041, .3913, .3854, .3764,
  // 		    .3695, .3570, .3458, .3355, .3260, .3090, .2944, .2650, .2428, .2112};
  DMM[0]=std::vector<Double_t>(DMM_1 , DMM_1 + sizeof(DMM_1) / sizeof(DMM_1[0]));
  DWW[0]=std::vector<Double_t>(DWW_1 , DWW_1 + sizeof(DWW_1) / sizeof(DWW_1[0]));
  IEM[0]=1;
  //IDM[0]=20; 
  WAZ[0]=.27;   
  ROR[0]=.09e-03;
  //ALRD[0]=61.28;
 
  //"                                                             Helium   ";
  TAT[1]="HE ";
  Double_t DWW_2[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};

  //|    u      |
  Double_t DMM_2[]={6.084e+01,   1.676e+01,   6.863e+00,   2.007e+00,   9.329e-01,   5.766e-01,   4.195e-01,   2.933e-01,   2.476e-01,   2.092e-01,   1.960e-01,   1.838e-01,   1.763e-01,   1.703e-01,   1.651e-01,   1.562e-01,   1.486e-01,   1.336e-01,   1.224e-01,   1.064e-01,   9.535e-02,   8.707e-02,   8.054e-02,   7.076e-02,   6.362e-02,   5.688e-02,   5.173e-02,   4.422e-02,   3.503e-02,   2.949e-02,   2.577e-02,   2.307e-02,   1.940e-02,   1.703e-02,   1.363e-02,   1.183e-02};

  DMM[1]=std::vector<Double_t>(DMM_2 , DMM_2 + sizeof(DMM_2) / sizeof(DMM_2[0]));
  DWW[1]=std::vector<Double_t>(DWW_2 , DWW_2 + sizeof(DWW_2) / sizeof(DWW_2[0]));

  IEM[1]=1; 
  WAZ[1]=.27;   
  ROR[1]=.178E-03; 


  //"                                                             Carbon   ";
  TAT[2]="C  ";

  Double_t DWW_3[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};   
  
  Double_t DMM_3[]={2.211e+03,  7.002e+02,  3.026e+02,  9.033e+01,  3.778e+01,  1.912e+01,  1.095e+01,  4.576e+00,  2.373e+00,  8.071e-01,  4.420e-01,  2.562e-01,  2.076e-01,  1.871e-01,  1.753e-01,  1.610e-01,  1.514e-01,  1.347e-01,  1.229e-01,  1.066e-01,  9.546e-02,  8.715e-02,  8.058e-02,  7.076e-02,  6.361e-02,  5.690e-02,  5.179e-02,  4.442e-02,  3.562e-02,  3.047e-02,  2.708e-02,  2.469e-02,  2.154e-02,  1.959e-02,  1.698e-02,  1.575e-02};
  DMM[2]=std::vector<Double_t>(DMM_3 , DMM_3 + sizeof(DMM_3) / sizeof(DMM_3[0]));
  DWW[2]=std::vector<Double_t>(DWW_3 , DWW_3 + sizeof(DWW_3) / sizeof(DWW_3[0]));
  IEM[2]=1; 
  WAZ[2]=30.65; 
  ROR[2]=2.265;    

  //"                                                             Nitrogen ";
  TAT[3]="N  ";
  Double_t DWW_4[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};
  
  Double_t DMM_4[]={3.311e+03,  1.083e+03,  4.769e+02,  1.456e+02,  6.166e+01,  3.144e+01,  1.809e+01,  7.562e+00,  3.879e+00,  1.236e+00,  6.178e-01,  3.066e-01,  2.288e-01,  1.980e-01,  1.817e-01,  1.639e-01,  1.529e-01,  1.353e-01,  1.233e-01,  1.068e-01,  9.557e-02,  8.719e-02,  8.063e-02,  7.081e-02,  6.364e-02,  5.693e-02,  5.180e-02,  4.450e-02,  3.579e-02,  3.073e-02,  2.742e-02,  2.511e-02,  2.209e-02,  2.024e-02,  1.782e-02,  1.673e-02}; 		   
  DMM[3]=std::vector<Double_t>(DMM_4 , DMM_4 + sizeof(DMM_4) / sizeof(DMM_4[0]));
  DWW[3]=std::vector<Double_t>(DWW_4 , DWW_4 + sizeof(DWW_4) / sizeof(DWW_4[0]));
  IEM[3]=1; 
  WAZ[3]=.72;   
  ROR[3]=1.25E-03; 

  //"                                                             Oxigen   ";
  TAT[4]="O  ";

  Double_t DWW_5[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};

  Double_t DMM_5[]={4.590e+03,  1.549e+03,  6.949e+02,  2.171e+02,  9.315e+01,  4.790e+01,  2.770e+01,  1.163e+01,  5.952e+00,  1.836e+00,  8.651e-01,  3.779e-01,  2.585e-01,  2.132e-01,  1.907e-01,  1.678e-01,  1.551e-01,  1.361e-01,  1.237e-01,  1.070e-01,  9.566e-02,  8.729e-02,  8.070e-02,  7.087e-02,  6.372e-02,  5.697e-02,  5.185e-02,  4.459e-02,  3.597e-02,  3.100e-02,  2.777e-02,  2.552e-02,  2.263e-02,  2.089e-02,  1.866e-02,  1.770e-02};
  DMM[4]=std::vector<Double_t>(DMM_5 , DMM_5 + sizeof(DMM_5) / sizeof(DMM_5[0]));
  DWW[4]=std::vector<Double_t>(DWW_5 , DWW_5 + sizeof(DWW_5) / sizeof(DWW_5[0]));
  IEM[4]=1;
  WAZ[4]=.77;
  ROR[4]=1.43E-03;

  //"                                                             Xenon    ";
  TAT[5]="XE ";
  Double_t DWW_6[]={1.0e-03,  1.07191e-03,  1.14900e-03,  /*M1*/ 1.14901e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  4.78220e-03,  /*L3*/ 4.78221e-03,  5.0e-03,  5.10370e-03,  /*L2*/ 5.10370e-03,  5.27536e-03,  5.45280e-03,  /*L1*/ 5.45280e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  3.45614e-02,  /*K*/  3.456141e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01}; 


  Double_t DMM_6[]={9.413e+03, 8.151e+03,  7.035e+03,  7.338e+03,  4.085e+03,  2.088e+03,  7.780e+02,  3.787e+02,  2.408e+02,  6.941e+02,  6.392e+02,  6.044e+02,  8.181e+02,  7.579e+02,  6.991e+02,  8.064e+02,  6.376e+02,  3.032e+02,  1.690e+02,  5.743e+01,  2.652e+01,  8.930e+00,  6.129e+00,  3.316e+01,  2.270e+01,  1.272e+01,  7.825e+00,  3.633e+00,  2.011e+00,  7.202e-01,  3.760e-01,  1.797e-01,  1.223e-01,  9.699e-02,  8.281e-02,  6.696e-02,  5.785e-02,  5.054e-02,  4.594e-02,  4.078e-02,  3.681e-02,  3.577e-02,  3.583e-02,  3.634e-02,  3.797e-02,  3.987e-02,  4.445e-02,  4.815e-02};
  DMM[5]=std::vector<Double_t>(DMM_6 , DMM_6 + sizeof(DMM_6) / sizeof(DMM_6[0]));
  DWW[5]=std::vector<Double_t>(DWW_6 , DWW_6 + sizeof(DWW_6) / sizeof(DWW_6[0]));
  IEM[5]=2; 
  WAZ[5]=1.56;  
  ROR[5]=5.85E-03; 

  //"                                                            Berilium ";
  TAT[6]="BE "; 
  Double_t DWW_7[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};

  Double_t DMM_7[]   ={6.041e+02,     1.797e+02,     7.469e+01,     2.127e+01,     8.685e+00,     4.369e+00,     2.527e+00,     1.124e+00,     6.466e-01,     3.070e-01,     2.251e-01,     1.792e-01,     1.640e-01,     1.554e-01,     1.493e-01,     1.401e-01,     1.328e-01,     1.190e-01,     1.089e-01,     9.463e-02,     8.471e-02,     7.739e-02,     7.155e-02,     6.286e-02,     5.652e-02,     5.054e-02,     4.597e-02,     3.938e-02,     3.138e-02,     2.664e-02,     2.347e-02,     2.121e-02,     1.819e-02,     1.627e-02,     1.361e-02,     1.227e-02};
  DMM[6]=std::vector<Double_t>(DMM_7 , DMM_7 + sizeof(DMM_7) / sizeof(DMM_7[0]));
  DWW[6]=std::vector<Double_t>(DWW_7 , DWW_7 + sizeof(DWW_7) / sizeof(DWW_7[0]));
  IEM[6]=1; 
  WAZ[6]=26.08; 
  ROR[6]=1.848;   

  //"                                                               Litium ";
  TAT[7]="LI "; 

  Double_t DWW_8[]={1.0e-03  ,  1.50000e-03  ,  2.0e-03  ,  3.0e-03  ,  4.0e-03  ,  5.0e-03  ,  6.0e-03  ,  8.0e-03  ,  1.0e-02  ,  1.50000e-02  ,  2.0e-02  ,  3.0e-02  ,  4.0e-02  ,  5.0e-02  ,  6.0e-02  ,  8.0e-02  ,  1.0e-01  ,  1.50000e-01  ,  2.0e-01  ,  3.0e-01  ,  4.0e-01  ,  5.0e-01  ,  6.0e-01  ,  8.0e-01  ,  1.0e+00  ,  1.25000e+00  ,  1.50000e+00  ,  2.0e+00  ,  3.0e+00  ,  4.0e+00  ,  5.0e+00  ,  6.0e+00  ,  8.0e+00  ,  1.0e+01  ,  1.50000e+01  ,  2.0e+01};


  Double_t DMM_8[]   ={2.339e+02,     6.668e+01,     2.707e+01,     7.549e+00,     3.114e+00,     1.619e+00,     9.875e-01,     5.054e-01,     3.395e-01,     2.176e-01,     1.856e-01,     1.644e-01,     1.551e-01,     1.488e-01,     1.438e-01,     1.356e-01,     1.289e-01,     1.158e-01,     1.060e-01,     9.210e-02,     8.249e-02,     7.532e-02,     6.968e-02,     6.121e-02,     5.503e-02,     4.921e-02,     4.476e-02,     3.830e-02,     3.043e-02,     2.572e-02,     2.257e-02,     2.030e-02,     1.725e-02,     1.529e-02,     1.252e-02,     1.109e-02};
  DMM[7]=std::vector<Double_t>(DMM_8 , DMM_8 + sizeof(DMM_8) / sizeof(DMM_8[0]));
  DWW[7]=std::vector<Double_t>(DWW_8 , DWW_8 + sizeof(DWW_8) / sizeof(DWW_8[0]));
  IEM[7]=1; 
  WAZ[7]=13.8;  
  ROR[7]=.53;  

  //"                                                               Boron    ";
  TAT[8]="B  "; 
  Double_t DWW_9[]={1.0e-03  ,  1.50000e-03  ,  2.0e-03  ,  3.0e-03  ,  4.0e-03  ,  5.0e-03  ,  6.0e-03  ,  8.0e-03  ,  1.0e-02  ,  1.50000e-02  ,  2.0e-02  ,  3.0e-02  ,  4.0e-02  ,  5.0e-02  ,  6.0e-02  ,  8.0e-02  ,  1.0e-01  ,  1.50000e-01  ,  2.0e-01  ,  3.0e-01  ,  4.0e-01  ,  5.0e-01  ,  6.0e-01  ,  8.0e-01  ,  1.0e+00  ,  1.25000e+00  ,  1.50000e+00  ,  2.0e+00  ,  3.0e+00  ,  4.0e+00  ,  5.0e+00  ,  6.0e+00  ,  8.0e+00  ,  1.0e+01  ,  1.50000e+01  ,  2.0e+01};
		  
  Double_t DMM_9[]   ={1.229e+03,     3.766e+02,     1.597e+02,     4.667e+01,     1.927e+01,     9.683e+00,     5.538e+00,     2.346e+00,     1.255e+00,     4.827e-01,     3.014e-01,     2.063e-01,     1.793e-01,     1.665e-01,     1.583e-01,     1.472e-01,     1.391e-01,     1.243e-01,     1.136e-01,     9.862e-02,     8.834e-02,     8.065e-02,     7.460e-02,     6.549e-02,     5.890e-02,     5.266e-02,     4.791e-02,     4.108e-02,     3.284e-02,     2.798e-02,     2.476e-02,     2.248e-02,     1.945e-02,     1.755e-02,     1.495e-02,     1.368e-02};
  DMM[8]=std::vector<Double_t>(DMM_9 , DMM_9 + sizeof(DMM_9) / sizeof(DMM_9[0]));
  DWW[8]=std::vector<Double_t>(DWW_9 , DWW_9 + sizeof(DWW_9) / sizeof(DWW_9[0]));
  IEM[8]=1;   
  WAZ[8]=28.38;  
  ROR[8]=2.1;  

  //"                                                            Bismuth   "
  TAT[9]="BIS";
  Double_t DWW_10[]={1.0e-03,  1.50000e-03,  2.0e-03,  2.57960e-03,  /*M5*/ 2.57961e-03,  2.63305e-03,  2.68760e-03,  /*M4*/ 2.68761e-03,  3.0e-03,  3.17690e-03,  /*M3*/ 3.17691e-03,  3.42677e-03,  3.69630e-03,  /*M2*/ 3.69631e-03,  3.84472e-03,  3.99910e-03,  /*M1*/ 3.99911e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.34186e-02,  /*L3*/ 1.341861e-02,  1.50000e-02,  1.57111e-02,  /*L2*/ 1.571111e-02,  1.60457e-02,  1.63875e-02,  /*L1*/ 1.638751e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  9.05259e-02,  /*K*/  9.052591e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};
  
  Double_t DMM_10[]  ={5.441e+03,     2.468e+03,     1.348e+03,     7.724e+02,     1.777e+03,     1.850e+03,     1.852e+03,     2.576e+03,     2.053e+03,     1.774e+03,     2.048e+03,     1.707e+03,     1.415e+03,     1.498e+03,     1.366e+03,     1.243e+03,     1.297e+03,     1.296e+03,     7.580e+02,     4.855e+02,     2.378e+02,     1.360e+02,     6.491e+01,     1.560e+02,     1.160e+02,     1.027e+02,     1.416e+02,     1.351e+02,     1.282e+02,     1.478e+02,     8.952e+01,     3.152e+01,     1.495e+01,     8.379e+00,     5.233e+00,     2.522e+00,     1.856e+00,     7.380e+00,     5.739e+00,     2.082e+00,     1.033e+00,     4.163e-01,     2.391e-01,     1.656e-01,     1.277e-01,     9.036e-02,     7.214e-02,     5.955e-02,     5.285e-02,     4.659e-02,     4.279e-02,     4.242e-02,     4.317e-02,     4.437e-02,     4.725e-02,     5.025e-02,     5.721e-02,     6.276e-02};                                   
  DMM[9]=std::vector<Double_t>(DMM_10 , DMM_10 + sizeof(DMM_10) / sizeof(DMM_10[0]));
  DWW[9]=std::vector<Double_t>(DWW_10 , DWW_10 + sizeof(DWW_10) / sizeof(DWW_10[0]));
  IEM[9]=3;  
  WAZ[9]=56.8 ;  
  ROR[9]=9.8; 

  //"                                                             Germanium   "
  TAT[10]="GE ";
  Double_t DWW_11[]={1.0e-03,  1.10304e-03,  1.21670e-03,  /*L3*/ 1.21671e-03,  1.23215e-03,  1.24780e-03,  /*L2*/ 1.24781e-03,  1.32844e-03,  1.41430e-03,  /*L1*/ 1.41431e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.11031e-02,  /*K*/  1.110311e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};

  Double_t DMM_11[]  ={1.893e+03,     1.502e+03,     1.190e+03,     4.389e+03,     4.734e+03,     4.974e+03,     6.698e+03,     6.348e+03,     5.554e+03,     6.287e+03,     5.475e+03,     2.711e+03,     9.613e+02,     4.497e+02,     2.472e+02,     1.509e+02,     6.890e+01,     3.742e+01,     2.811e+01,     1.981e+02,     9.152e+01,     4.222e+01,     1.385e+01,     6.207e+00,     3.335e+00,     2.023e+00,     9.501e-01,     5.550e-01,     2.491e-01,     1.661e-01,     1.131e-01,     9.327e-02,     8.212e-02,     7.452e-02,     6.426e-02,     5.727e-02,     5.101e-02,     4.657e-02,     4.086e-02,     3.524e-02,     3.275e-02,     3.158e-02,     3.107e-02,     3.103e-02,     3.156e-02,     3.340e-02,     3.528e-02};
  DMM[10]=std::vector<Double_t>(DMM_11 , DMM_11 + sizeof(DMM_11) / sizeof(DMM_11[0]));
  DWW[10]=std::vector<Double_t>(DWW_11 , DWW_11 + sizeof(DWW_11) / sizeof(DWW_11[0]));
  IEM[10]=4; 
  WAZ[10]=47.1;  
  ROR[10]=5.32 ; 
  
  
  
  //"                                                          polistirol ";
  j_g=11;
  IEM[j_g]=1; 
  TAT[j_g]="PST";  
  WAZ[j_g]=21.64; 
  ROR[j_g]=1.05;   
  for(unsigned int Ij=0;Ij<DMM[2].size();Ij++) { DMM[j_g].push_back(.922*DMM[2].at(Ij)+.078*DMM[0].at(Ij)) ;}
  DWW[j_g]=std::vector<Double_t>(DWW_3 , DWW_3 + sizeof(DWW_3) / sizeof(DWW_3[0]));

  
  j_g=j_g+1;//"                                                         Polipropilen ";
  IEM[j_g]=1; 
  TAT[j_g]="PPR";  
  ROR[j_g]=0.92;//was 0.92   
  WAZ[j_g]=20.87/sqrt(0.92/ROR[j_g]); 
  for(unsigned int Ij=0;Ij<DMM[2].size();Ij++) { DMM[j_g].push_back(.856*DMM[2].at(Ij)+.144*DMM[0].at(Ij)) ;}
  DWW[j_g]=std::vector<Double_t>(DWW_3 , DWW_3 + sizeof(DWW_3) / sizeof(DWW_3[0]));
  
  j_g=j_g+1;//"                                                      C5 H4 O2 (MYLAR)";
  IEM[j_g]=1; 
  TAT[j_g]="MYL";  
  WAZ[j_g]=24.5;  
  ROR[j_g]=1.39;   
  Double_t DWW_13[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};
  
  Double_t DMM_13[]={ 2.911e+03, 9.536e+02, 4.206e+02, 1.288e+02, 5.466e+01, 2.792e+01, 1.608e+01, 6.750e+00, 3.481e+00, 1.132e+00, 5.798e-01, 3.009e-01, 2.304e-01, 2.020e-01, 1.868e-01, 1.695e-01, 1.586e-01, 1.406e-01, 1.282e-01, 1.111e-01, 9.947e-02, 9.079e-02, 8.395e-02, 7.372e-02, 6.628e-02, 5.927e-02, 5.395e-02, 4.630e-02, 3.715e-02, 3.181e-02, 2.829e-02, 2.582e-02, 2.257e-02, 2.057e-02, 1.789e-02, 1.664e-02};
  
  DMM[j_g]=std::vector<Double_t>(DMM_13 , DMM_13 + sizeof(DMM_13) / sizeof(DMM_13[0]));
  DWW[j_g]=std::vector<Double_t>(DWW_13 , DWW_13 + sizeof(DWW_13) / sizeof(DWW_13[0]));
  
  //"                                                                  AIR ";
  j_g=j_g+1;
  IEM[j_g]=1; 
  TAT[j_g]="AIR";  
  WAZ[j_g]=0.73;  
  ROR[j_g]=.00129; 
  Double_t DWW_14[]={1.0e-03,  1.50000e-03,  2.0e-03,  3.0e-03,  3.20290e-03,  /*18 K*/  3.20291e-03,  4.0e-03,  5.0e-03,  6.0e-03,  8.0e-03,  1.0e-02,  1.50000e-02,  2.0e-02,  3.0e-02,  4.0e-02,  5.0e-02,  6.0e-02,  8.0e-02,  1.0e-01,  1.50000e-01,  2.0e-01,  3.0e-01,  4.0e-01,  5.0e-01,  6.0e-01,  8.0e-01,  1.0e+00,  1.25000e+00,  1.50000e+00,  2.0e+00,  3.0e+00,  4.0e+00,  5.0e+00,  6.0e+00,  8.0e+00,  1.0e+01,  1.50000e+01,  2.0e+01};
  
  
  
  Double_t DMM_14[]={3.606e+03, 1.191e+03, 5.279e+02, 1.625e+02, 1.340e+02, 1.485e+02, 7.788e+01, 4.027e+01, 2.341e+01, 9.921e+00, 5.120e+00, 1.614e+00, 7.779e-01, 3.538e-01, 2.485e-01, 2.080e-01, 1.875e-01, 1.662e-01, 1.541e-01, 1.356e-01, 1.233e-01, 1.067e-01, 9.549e-02, 8.712e-02, 8.055e-02, 7.074e-02, 6.358e-02, 5.687e-02, 5.175e-02, 4.447e-02, 3.581e-02, 3.079e-02, 2.751e-02, 2.522e-02, 2.225e-02, 2.045e-02, 1.810e-02, 1.705e-02};
  
  DMM[j_g]=std::vector<Double_t>(DMM_14 , DMM_14 + sizeof(DMM_14) / sizeof(DMM_14[0]));
  DWW[j_g]=std::vector<Double_t>(DWW_14 , DWW_14 + sizeof(DWW_14) / sizeof(DWW_14[0]));
  
  j_g=j_g+1;//"                                                           CH2 + 20%B ";
  IEM[j_g]=1; 
  TAT[j_g]="20B";  
  WAZ[j_g]=23.0;  
  ROR[j_g]=1.156;  
  for(unsigned int Ij=0;Ij<DMM[2].size();Ij++) { 
    DMM[j_g].push_back(.636*DMM[2].at(Ij)+.107*DMM[0].at(Ij)+.257*DMM[12].at(Ij)) ;
    DWW[j_g].push_back(1.*DWW[2].at(Ij));
  }
  
  j_g=j_g+1;//"                                                           CH2 + 30%B ";
  IEM[j_g]=1; 
  TAT[j_g]="30B";  
  WAZ[j_g]=24.3;  
  ROR[j_g]=1.274;  
  for(unsigned int Ij=0;Ij<DMM[2].size();Ij++) { 
    DMM[j_g].push_back(.500*DMM[2].at(Ij)+.084*DMM[0].at(Ij)+.416*DMM[12].at(Ij)) ; \
    DWW[j_g].push_back(1.*DWW[2].at(Ij));
  }
  
  j_g=j_g+1;//"                                                                  BGO ";
  IEM[j_g]=1; 
  TAT[j_g]="BGO";  
  WAZ[j_g]=49.8;  
  ROR[j_g]=7.1;    
  for(unsigned int Ij=0;Ij<DMM[10].size();Ij++) { 
    DMM[j_g].push_back(1.*DMM[10].at(Ij));
    DWW[j_g].push_back(1.*DWW[10].at(Ij));
  }


  j_g=j_g+1;//"                                                                  LIT ";
  IEM[j_g]=1; 
  TAT[j_g]="LIT";  
  WAZ[j_g]=13.8;  
  ROR[j_g]=.53; 
  for(unsigned int Ij=0;Ij<DMM[7].size();Ij++) { 
    DMM[j_g].push_back(DMM[7].at(Ij));
    DWW[j_g].push_back(DWW[7].at(Ij));
  }


  Ke=j_g+1; 

  TRMatter mt;

  for(int i=0;i<Ke;i++){
    mt.MSet(TAT[i],DMM[i],DWW[i],ROR[i],WAZ[i]);
    AllMatter.push_back(mt);
  }

}


void MyRead(TString TXTFile){


  Ivar=0;  
  Int_t Nb=-1;  
  Int_t Ne=-1;  
  Int_t Kb=0;  
  Kw=-1;  
  Nw=-1;
 
  Omg.clear();

  std::string line;
  std::string Com;
  ifstream myfile (TXTFile);

  if (myfile.is_open()){
    while ( getline (myfile,line) )
      {
	std::cout << line << "\n";

	Int_t Jr=0;
	Int_t L=0;
	Int_t Nv=0;
	if(line.substr(0,1)!=" ") continue;
	if(line.substr(1,3)=="END") break;
	std::string Ele=line.substr(7,3);
	if(line.substr(1,3)!="   ")Com=line.substr(1,3);
	if(Com=="ELE") {

	  Int_t j1=0;
	  Int_t j2=0;
	  for(Int_t m=0;m<2;m++){
	    Int_t is=7+6*(m+1);
	    j1=j2;
	    j2=0;
	    for(Int_t i=0;i<Ke;i++){
	      if(line.substr(is,3)==TAT[i]){
		j2=i;
	      }
	    }
	  }//m
	  Jr=j1+1000*j2;
	  L=1;
	  if(j2>0)L=3;

	  for(Int_t l=0;l<L;l++){
	    std::string buffer = line.substr(25+6*l,5);
	    val[l]=atof(buffer.c_str());
	  }

	}else{
	  L=0;
	  if(Com=="SET" || Com=="THR" || Com=="VAR" ){
	    L=10;
	  }else {
	    L=3;
	  }
	  Nv=-1;
	  for(Int_t l=0;l<L;l++){
	    std::string buffer = line.substr(13+6*l,5);
	    val[l]=atof(buffer.c_str());
	    if(val[l]!=0) Nv=l;
	  }
	  if(Nv<0)std::cout<<"Input Error: No data"<<std::endl;
	}



	//	"- - - - - - - - -    put data Int_to commons    - - - - - - - - - -"; 
	if(Com=="SET"){
	  for(Int_t i=0;i<9;i=i+2){
	    Int_t N=val[i];
	    Int_t Ib=val[i+1];
	    for(Int_t j=0; j<N;j++){
	      if(Nset<Lb) Nset++;
	      Itype[Nset]=Ib; 
	      if(Kb<Ib){ Kb=Ib;}	      
	    }
	  }
	}	
	if(Com=="BLO"){
	  if(Nb<Lt)Nb++; 
	  Ne=-1; 
	  Ipr[Nb]=val[0]; 
	  Ihi[Nb]=val[1];

	}	
	if(Com=="ELE"){
	  if(Ne<Lt)Ne++;  
	  Nelem[Nb]=Ne;  
	  Types[Nb][Ne]=Ele; 
	  Mater[Nb][Ne]=Jr; 
	  ALtot[Nb][Ne]=val[0]*sc; 
	  ANfoil[Nb][Ne]=val[1]; 
	  ALfoil[Nb][Ne]=val[2]*sc;
	}	
	if(Com=="THR"){
	  Nc=Nv+1;  
	  for(Int_t i=0; i<Nc;i++) { Cthr[i]=log(val[i]);}
	}
	if(Com=="ENE"){
	  Omi=log(val[0]); 
	  Oma=log(val[1]); 
	  Ost=val[2]/val[0];
	  Double_t Om=Omi-Ost;
	  while(Om<=Oma){
	    Om+=Ost;
	    Omg.push_back(Om);
	  }
	  Emin=val[0]; 
	  Emax=val[1];
	}	
	if(Com=="GAM"){
	  G=val[0];
	  for(Int_t i=0; i<Lr;i++) {Var[i]=val[i];}
	}	
	if(Com=="VAR"){
	  if(Kw<Lv)Kw++; 
	  Nvv[Kw]=Nv+1; 
	  for(Int_t i=0; i<Nv+1;i++) { 
	    VVV[i][Kw]=val[i];
	  }
	}	




      }
    
    myfile.close();

    //"- - - - - - - - - -          variables          - - - - - - - - - -";
    for(Int_t iv=0;iv<Lw;iv++){ 
      Int_t jv=-Var[iv];
      if(jv<=0) continue;
      if(jv>Kw+1) {std::cout<<"Variable "<<jv<<" undefined"<<std::endl; break;}
      
      if(Nw<Lv)Nw++; 
      Ivv[0][Nw]=iv; 
      Ivv[1][Nw]=jv-1;

    }
    //"- - - - -           Check Nb=Ib, Nw>=Nw etc                   .....";
    //"..."
    //"- - - - -           prepare absorption table                  .....";
    for(Int_t j=0; j<Ke;j++){ 
      Double_t m_ro=AllMatter[j].GetROR();
      Int_t No=Omg.size();
      for(Int_t io=0; io<No;io++){
	ABSORB[j].push_back(AllMatter[j].GetCoeff(Omg[io])*m_ro); 
      }
    }    
    
  }else{
    std::cout << "ERROR:Unable to open file"<<std::endl; 
  }

}

  





void Calc()
{
  Int_t nx2=0;
  Double_t ngammasum[4], egammasum[4];
  Double_t Zc[Lc]; 
  vector<Double_t> Ea; 
  vector<Double_t> Ed; 
  vector<Double_t> Er;
  Double_t Zct[Lc];

  Int_t Lo=Omg.size(); 
  Double_t Ey[Lo];

  memset(Zct,0, sizeof(Zct));
  memset(Ey, 0, sizeof(Ey));

  for(Int_t Iset=0;Iset<Nset+1;Iset++){
    Int_t Ity=Itype[Iset]-1; 
    Int_t Nel=Nelem[Ity]+1;

    memset(Zc,0, sizeof(Zc)); 
    Ea.clear();
    Ed.clear();
    Er.clear(); 
  
    for(Int_t Iel=0;Iel<Nel;Iel++)
      { 
	Double_t Al=ALtot[Ity][Iel]; 
	TString Type=Types[Ity][Iel];
	Int_t Ir=Mater[Ity][Iel];
	
	for(Int_t Io=0;Io<Lo;Io++){ 
	  Double_t Om=exp(Omg[Io]); 
	  Double_t E=Ey[Io];
	  if(Iel==0){
	    Ea.push_back(0); 
	    Ed.push_back(0);    
	  }
	  
	  if(Type=="RAD"){ 
	    Ir2=Ir/1000;  
	    Ir1=Ir-Ir2*1000;
	    Nf=ANfoil[Ity][Iel];  
	    Al1=ALfoil[Ity][Iel];  
	    Al2=Al/Nf-Al1;
	    Om1=AllMatter[Ir1].GetWAZ()*1.e-3; 
	    Om2=AllMatter[Ir2].GetWAZ()*1.e-3;  
	    
	    Double_t Gy=Xemitan(Om)/Om;
	    Double_t c1=ABSORB[Ir1][Io] * Al1*Nf;  
	    Double_t w1=0; 
	    if(c1<20) w1=exp(-c1);
	    Double_t c2=ABSORB[Ir2][Io] * Al2*Nf;  
	    Double_t w2=0; 
	    if(c2<20) w2=exp(-c2);
	    
	    Double_t wr=1; 
	    if(c1+c2>0) wr=(1-w1*w2)/(c1+c2); 
	    Ey[Io]=E*w1*w2+Gy*wr;
	    h[3]->Fill(Omg[Io]/2.3,Gy);
	    
	  }else{ 
	    Double_t ca=ABSORB[Ir][Io]*Al; 
	    
	    Double_t w=0; 
	    if(ca<20) w=exp(-ca); 
	    Ey[Io]=E*w;
	    if(Type=="CHA") {
	      Ea[Io]+=E*(1-w); 
	      Ed[Io]+=E;
	    }
	    
	  }
	} 
      }//for: Iel
  

    Er=ESCAPE(Omg,Ea,Emax); //"<--- Reduce spectrum and count clusters  --->";
    

    for (Int_t n=0;n<Nc;n++) { 
      Zc[n]=CLUST(Omg,Er,Cthr[n]); 
      Zct[n]+=Zc[n];
    }
    
    if (Ihi[Ity]>0) { 
      for (Int_t Io=0;Io<Lo;Io++) { 
	Double_t om=Omg[Io]/2.3;
	//Fill Histos
	h[0]->Fill(om,Ed[Io]);
	h[1]->Fill(om,Ea[Io]);
	h[2]->Fill(om,Er[Io]);
      }          
    }
  
    //" Add hists with energy scale in keV, calculate total number end energy of TR photons "
    nx2=nech;
    Double_t xmin2=Emin;
    Double_t xmax2=Emax;
    Double_t xstep2=(xmax2-xmin2)/nx2;
    memset(ngammasum, 0, sizeof(ngammasum) );  
    memset(egammasum, 0, sizeof(egammasum) );
    
    for(Int_t Ich=0;Ich<nx2;Ich++){
      Double_t ekev=xmin2+(Ich+1.-0.5)*xstep2;  
      Double_t elog=log10(ekev);
      for(Int_t Iht=0;Iht<4;Iht++){
	Double_t b_tmp=h[Iht]->FindBin(elog);
	Double_t v_tmp=h[Iht]->GetBinContent(b_tmp);
	h_1[Iht]->Fill(ekev,v_tmp);
	ngammasum[Iht]+=v_tmp;
	egammasum[Iht]+=v_tmp*ekev;
      }
    }

    std::cout<<"Lorentz-factor:"<<G<<'\n';
    std::cout<<center(" ",25)<<"|"<<center("Incident",15)<<"|"<<center("Absorbed",15)<<"|"<<center("Registered",15)<<"|"<<center("Generated",15)<<'\n';
    std::cout << std::string(25 + 4*15+4, '-') << "\n";

    Int_t Iht=0;
    for(std::cout<<center("Number of gammas:",25);std::cout<<"|"<<prd(ngammasum[Iht]*xstep2,3,15);++Iht)
      if(Iht>2)break;
    std::cout<<"\n"; Iht=0;

    for(std::cout<<center("Mean gamma energy, keV:",25);std::cout<<"|"<<prd(h_1[Iht]->GetMean(),3,15);++Iht)
      if(Iht>2)break;
    std::cout<<"\n"; Iht=0;

    for(std::cout<<center("Sum of energy, keV:",25);std::cout<<"|"<<prd(egammasum[Iht]*xstep2,3,15);++Iht)
      if(Iht>2)break;
    std::cout<<"\n\n"; Iht=0;


    
    Double_t glog=log10(G);
    for(Int_t Int_T=0;Int_T<4;Int_T++){
       h10[Int_T]->Fill(glog,ngammasum[Int_T]*xstep2);
       h20[Int_T]->Fill(glog,h_1[Int_T]->GetMean());
       h30[Int_T]->Fill(glog,egammasum[Int_T]*xstep2);
    }

  }//for: Iset


}
//---------------------------------------------------------------------------------                 

Double_t Xemitan ( Double_t om ){
  //" pure TR quanta emission for fix E without any absorption - Garibian";
  const Double_t pi = atan(1.0)*4;
  Double_t ck=0.806554e7;
  //  " the constant e/(2pihc) translate photon energy {kv} in wavelen {cm}";
  Double_t om12=(Om1*Om1-Om2*Om2)/om;  
  Double_t Al=Al1+Al2;
  Double_t oms=(Al1*Om1*Om1+Al2*Om2*Om2)/Al;
  Double_t Ao =0.5*Al1*om12*ck;   
  Double_t Bo =0.5*Al2*om12*ck;
  Double_t ro =sqrt(oms)/G;
  Double_t co =(om/(G*G)+oms/om)/2;   
  Double_t cc = co*Al*ck;
  Double_t roco=0;
  if(ro>co){roco=ro;}else{roco=co;}
  Int_t i1 =1+roco*Al*ck;  
  Int_t i2 =G*ro*Al*ck;
  Double_t Sum=0;
  Double_t Smx=0;
  Double_t Sm1=0;
  Double_t S=0;
  Double_t So=0;
  Double_t Sx=0;

  for(Int_t Ir=i1;Ir<=i2;Ir++){  
    Double_t w=Ir;     
    Sx=So;  
    So=S;
    S=(w-cc)*pow( (sin(pi*Al2/Al*(w-Ao))/(w-Ao)/(w+Bo)) ,2);
    if(S>Smx){Smx=S;}  
    if(S>Sm1){Sm1=S;}  
    Sum+=S;
    h0->Fill(Ir+.1,S);
  } 
  Double_t XEmitan=(Double_t)Nf/137./pi*pow(om12*Al*ck,2) * Sum;
  return XEmitan;

}
//---------------------------------------------------------------------------------                 
vector <Double_t> ESCAPE( vector <Double_t> omg, vector <Double_t> y, Double_t E_max){
  vector <Double_t> yy;
  //" correct the energy spectrum to soft gamma escape - for Xe           ";
  Int_t N = omg.size();
  Double_t x[N];
  Double_t z[N];
  for (int i=0 ; i<N ; i++){
    x[i]=omg[i];
    z[i]=y[i];
  }
  
  TGraph *g_esc= new TGraph(N,x,z);
  sprintf(name,"g_Escape_%i",N);      
  g_esc->SetName(name);
  
  for(Int_t I=0; I<N;I++){  
    Double_t om=exp(omg[I]);          
    Double_t w=1; 
    if(om>4.9 && om<34.6){
      w=0.85;    
      yy.push_back(w*y[I]+0.15*g_esc->Eval(log(om+4.0)));
    }else if(om<=4.9){
      w=1.;
      yy.push_back(w*y[I]+0.15*g_esc->Eval(log(om+4.0)));                        
    }else if(om>=34.6){ 
      w=1.;
      yy.push_back(w*y[I]);
    }
  }

  Double_t z_1[N];
  for (int i=0 ; i<N ; i++){
    z_1[i]=yy[i];
  }

  TGraph *g_esc_1= new TGraph(N,x,z_1);
  sprintf(name,"g_Escape_%i_1",N);      
  g_esc_1->SetName(name);
  
  for(Int_t I=0; I<N;I++){  
    Double_t om=exp(omg[I]);          
    Double_t w=1; 
    if(om>=34.6){ 
      w=0.11;
      if(om+34<=E_max){
	yy[I]=w*z_1[I]+0.89*g_esc_1->Eval(log(om+34));
      }else{
	yy[I]=w*z_1[I];
      }
    }else{
      w=1;
      if(om+34<=E_max)yy[I]=w*z_1[I]+0.89*g_esc_1->Eval(log(om+34));
    }

  }
 
  return yy;
}
//---------------------------------------------------------------------------------                 

Double_t CLUST(vector <Double_t> X, vector <Double_t> Y,Double_t T){
  Double_t S=0;
  Int_t N=X.size();
  for (Int_t I=1;I<N+1;I++){
    if(T>=X[I]) continue;
    if(T>=X[I-1]){
      S= (exp(X[I])*Y[I]-(exp(X[I])*Y[I]-exp(X[I-1])*Y[I-1])*(X[I]-T)/(X[I]-X[I-1])/2)*(X[I]-T);
    }else{
      S=S+(X[I]-X[I-1])*(exp(X[I])*Y[I]+exp(X[I-1])*Y[I-1])/2;
    }
  }

  return S;
  
}

