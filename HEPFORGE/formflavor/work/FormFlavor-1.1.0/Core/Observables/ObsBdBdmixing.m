(* ::Package:: *)

(* ::Title:: *)
(*Bd-Bd mixing*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="BdBdmixing.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=BdBdmixing;


TempObsName="\!\(\*SubscriptBox[\(\[CapitalDelta]m\), SubscriptBox[\(B\), \(d\)]]\)";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* From HFAG http://www.slac.stanford.edu/xorg/hfag/osc/summer_2015/ *)
FFExpValue[TempObsName]=3.327*10^-13;
FFExpUnc[TempObsName]=0.013*10^-13;
(* Lenz 1409.6963 *)
(*FFSMValue[TempObsName]=3.32*10^-13;
FFSMUnc[TempObsName]=0.60*10^-13;*)
(* Fermilab/MILC 1602.03560 *)
FFSMValue[TempObsName]=4.21*10^-13;
FFSMUnc[TempObsName]=0.34*10^-13;
AppendTo[$FFObsNameList,TempObsName];
FFDmBdName=TempObsName;


(* Calculated using FormFlavor routines -- LO SM Wilson coefficient at mt *)
CVLLSMBd=Block[{CKMnum=GetSMParameter["CKM"],xt,Alfa2,CKM,CKMC,MW2,SW2,MT2,ParamSub,s\[Theta]w,mW,mt,\[Alpha]EMin},
mW=GetSMParameter["mW"];
\[Alpha]EMin=GetSMParameter["\[Alpha]EM@mZ"];
s\[Theta]w=GetSMParameter["s\[Theta]w"];
mt=GetSMParameter["mt@mt"];
ParamSub={SW2->s\[Theta]w^2,MW2->mW^2,MT2->mt^2,Alfa2->\[Alpha]EMin^2};

(Alfa2 xt CKM[3,1]^2 CKMC[3,3]^2 (-4+15 xt-12 xt^2+xt^3+6 xt^2 Log[xt]))/(32 (MW2 SW2^2 (-1+xt)^3))
/.CKM[i_,j_]:>CKMnum[[i,j]]/.CKMC[i_,j_]:>Conjugate[CKMnum[[i,j]]]/.xt->(MT2/MW2)/.ParamSub];
{CVLLSMBd,dum,dum,dum,dum,dum,dum,dum}=DeltaF2RG[GetSMParameter["mb@MSbar"],GetSMParameter["mt@mt"],{CVLLSMBd,0,0,0,0,0,0,0}][[2;;-1]];


Options[BdBdmixing]={IncludeSM->True,QCDRG->True};
BdBdmixing[\[Mu]SUSY_,Heffall_,opts:OptionsPattern[]]:=Block[{doQCDRG,useSM,mdatmb,msatmb,mbatmb,RfacBd,BVLLSMBd,BVLL,BLR1,BLR2,BSLL1,BSLL2,BVLLSM,CVLLSM,CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2,BdHBd,\[CapitalDelta]mBd,ReH,ImH,\[Mu]LO
,mbbin,mBd,fBd,mttsub},

useSM=If[OptionValue[IncludeSM],1,0];
doQCDRG=OptionValue[QCDRG];

(* Input Wilson coeffs at the b mass *)
mbbin=GetSMParameter["mb@MSbar"];
mttsub=GetSMParameter["mt@mt"];
fBd=GetSMParameter["fBd"];
mBd=GetSMParameter["mBd"];

RfacBd=1.6547; (*RfacBs=(mBd/(mbatmb+mdatmb))^2;*)

(* Table 15 in 1602.03560v2 *)
BVLL=0.913;  (* B1 *)
BLR1=1.838; (* B5 - Rescaled by (R_B+d_i)/(R_B) for d_5=3/2 *)
BLR2=1.145; (* B4 - Rescaled by (R_B+d_i)/(R_B) for d_4=1/6 *)
BSLL1=0.761; (* B2 - using BMU evanescent scheme *)
BSLL2=0.555; (* (5*B2-2*B3)/3 *)

(* as we are caluclating <Xbar|Heff|X> = 2m_X M_ {12}^* *)
CVLL=Coefficient[Heffall,OpV["L","L"][{"b","d"},{"b","d"}]];
CVRR=Coefficient[Heffall,OpV["R","R"][{"b","d"},{"b","d"}]];
CLR1=Coefficient[Heffall,OpV["L","R"][{"b","d"},{"b","d"}]];
CLR2=Coefficient[Heffall,OpS["L","R"][{"b","d"},{"b","d"}]];
CSLL1=Coefficient[Heffall,OpS["L","L"][{"b","d"},{"b","d"}]];
CSLL2=Coefficient[Heffall,OpT["L","L"][{"b","d"},{"b","d"}]];
CSRR1=Coefficient[Heffall,OpS["R","R"][{"b","d"},{"b","d"}]];
CSRR2=Coefficient[Heffall,OpT["R","R"][{"b","d"},{"b","d"}]];

If[doQCDRG,
{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}=DeltaF2RG[mbbin,\[Mu]SUSY,{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}][[2;;-1]];
];

BdHBd=1/3mBd fBd^2 BVLL (CVLL+useSM Conjugate[CVLLSMBd]+CVRR)-1/6RfacBd mBd fBd^2 BLR1 CLR1+1/4RfacBd mBd fBd^2 BLR2 CLR2-5/24 RfacBd  mBd fBd^2 BSLL1 (CSLL1+CSRR1)-1/2RfacBd  mBd fBd^2 BSLL2 (CSLL2+CSRR2);

\[CapitalDelta]mBd=2Abs[BdHBd];

{{FFDmBdName,\[CapitalDelta]mBd}}
];
