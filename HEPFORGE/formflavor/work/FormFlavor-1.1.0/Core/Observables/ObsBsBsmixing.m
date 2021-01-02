(* ::Package:: *)

(* ::Title:: *)
(*Bs-Bs mixing*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="BsBsmixing.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=BsBsmixing;


TempObsName="\!\(\*SubscriptBox[\(\[CapitalDelta]m\), SubscriptBox[\(B\), \(s\)]]\)";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* From HFAG http://www.slac.stanford.edu/xorg/hfag/osc/summer_2015/ *)
FFExpValue[TempObsName]=1.169*10^-11;
FFExpUnc[TempObsName]=0.0014*10^-11;
(* Lenz 1409.6963 *)
(*FFSMValue[TempObsName]=1.13*10^-11;
FFSMUnc[TempObsName]=0.17*10^-11;*)
(* Fermilab/MILC 1602.03560 *)
FFSMValue[TempObsName]=1.303*10^-11;
FFSMUnc[TempObsName]=0.078*10^-11;
AppendTo[$FFObsNameList,TempObsName];
FFDmBsName=TempObsName;


(* Calculated using FormFlavor routines -- LO SM Wilson coefficient at mt *)
CVLLSMBs=Block[{CKMnum=GetSMParameter["CKM"],xt,Alfa2,CKM,CKMC,MW2,SW2,MT2,ParamSub,s\[Theta]w,mW,mt,\[Alpha]EMin},
mW=GetSMParameter["mW"];
\[Alpha]EMin=GetSMParameter["\[Alpha]EM@mZ"];
s\[Theta]w=GetSMParameter["s\[Theta]w"];
mt=GetSMParameter["mt@mt"];
ParamSub={SW2->s\[Theta]w^2,MW2->mW^2,MT2->mt^2,Alfa2->\[Alpha]EMin^2};

(Alfa2 xt CKM[3,2]^2 CKMC[3,3]^2 (-4+15 xt-12 xt^2+xt^3+6 xt^2 Log[xt]))/(32 (MW2 SW2^2 (-1+xt)^3))
/.CKM[i_,j_]:>CKMnum[[i,j]]/.CKMC[i_,j_]:>Conjugate[CKMnum[[i,j]]]/.xt->(MT2/MW2)/.ParamSub];
{CVLLSMBs,dum,dum,dum,dum,dum,dum,dum}=DeltaF2RG[GetSMParameter["mb@MSbar"],GetSMParameter["mt@mt"],{CVLLSMBs,0,0,0,0,0,0,0}][[2;;-1]];


Options[BsBsmixing]={IncludeSM->True,QCDRG->True};
BsBsmixing[\[Mu]SUSY_,Heffall_,opts:OptionsPattern[]]:=Block[{doQCDRG,useSM,msatmb,mbatmb,RfacBs,BVLL,BLR1,BLR2,BSLL1,BSLL2,BVLLSM,CVLLSM,CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2,BsHBs,\[CapitalDelta]mBs,ReH,ImH,\[Mu]LO,
mbbin,mBs,fBs,mttsub},

useSM=If[OptionValue[IncludeSM],1,0];
doQCDRG=OptionValue[QCDRG];

mbbin=GetSMParameter["mb@MSbar"];
mttsub=GetSMParameter["mt@mt"];
fBs=GetSMParameter["fBs"];
mBs=GetSMParameter["mBs"];

(* Input Wilson coeffs at the b mass *)
\[Mu]LO=mbbin;

RfacBs=1.6517; (*RfacBs=(mBs/(mbatmb+msatmb))^2;*)

(* Table 15 in 1602.03560v2 *)
BVLL=0.952;  (* B1 *)
BLR1=1.799; (* B5 - Rescaled by (R_B+d_i)/(R_B) for d_5=3/2 *)
BLR2=1.125; (* B4 - Rescaled by (R_B+d_i)/(R_B) for d_4=1/6 *)
BSLL1=0.806; (* B2 - using BMU evanescent scheme *)
BSLL2=0.610; (* (5*B2-2*B3)/3 *)

(* as we are caluclating <Xbar|Heff|X> = 2m_X M_ {12}^* *)
CVLL=Coefficient[Heffall,OpV["L","L"][{"b","s"},{"b","s"}]];
CVRR=Coefficient[Heffall,OpV["R","R"][{"b","s"},{"b","s"}]];
CLR1=Coefficient[Heffall,OpV["L","R"][{"b","s"},{"b","s"}]];
CLR2=Coefficient[Heffall,OpS["L","R"][{"b","s"},{"b","s"}]];
CSLL1=Coefficient[Heffall,OpS["L","L"][{"b","s"},{"b","s"}]];
CSLL2=Coefficient[Heffall,OpT["L","L"][{"b","s"},{"b","s"}]];
CSRR1=Coefficient[Heffall,OpS["R","R"][{"b","s"},{"b","s"}]];
CSRR2=Coefficient[Heffall,OpT["R","R"][{"b","s"},{"b","s"}]];

If[doQCDRG,
{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}=DeltaF2RG[mbbin,\[Mu]SUSY,{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}][[2;;-1]];
];

BsHBs=1/3mBs fBs^2 BVLL (CVLL+useSM Conjugate[CVLLSMBs]+CVRR)-1/6RfacBs mBs fBs^2 BLR1 CLR1+1/4RfacBs mBs fBs^2 BLR2 CLR2-5/24 RfacBs  mBs fBs^2 BSLL1 (CSLL1+CSRR1)-1/2RfacBs  mBs fBs^2 BSLL2 (CSLL2+CSRR2);

\[CapitalDelta]mBs=2Abs[BsHBs];

{{FFDmBsName,\[CapitalDelta]mBs}}
];
