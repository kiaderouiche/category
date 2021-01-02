(* ::Package:: *)

(* ::Title:: *)
(*K-K mixing*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="KKmixing.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=KKmixing;


TempObsName="\!\(\*SubscriptBox[\(\[CapitalDelta]m\), \(K\)]\)";
FFObsClass[TempObsName]=2; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* PDG 2012 (in GeV) *)
FFExpValue[TempObsName]=3.484*10^-15;
FFExpUnc[TempObsName]=0.006*10^-15;
(* Need Refs *)
FFSMValue[TempObsName]=3.484*10^-15;
FFSMUnc[TempObsName]=3.484*10^-15;
AppendTo[$FFObsNameList,TempObsName];
FFDmKName=TempObsName;

TempObsName="\!\(\*SubscriptBox[\(\[Epsilon]\), \(K\)]\)";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* PDG 2012 (in GeV) *)
FFExpValue[TempObsName]=2.228*10^-3;
FFExpUnc[TempObsName]=0.011*10^-3;
(* From 1602.08494 *) 
FFSMValue[TempObsName]=2.24*10^-3;
FFSMUnc[TempObsName]=0.19*10^-3;
AppendTo[$FFObsNameList,TempObsName];
FF\[Epsilon]KName=TempObsName;


Options[KKmixing]={IncludeSM->False,QCDRG->True};
KKmixing[\[Mu]SUSY_,Heffall_,opts:OptionsPattern[]]:=Block[
{doQCDRG,useSM,msat2GeV,mdat2GeV,RfacK,BVLL,BLR1,BLR2,BSLL1,BSLL2,BVLLSM,CVLLSM,
CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2,KHK,\[Mu]LO,
mK,fK,\[CapitalDelta]mKexp,\[CapitalDelta]mK,\[Epsilon]K,\[Kappa]t\[Epsilon],\[Epsilon]KSM},

useSM=If[OptionValue[IncludeSM],1,0];
doQCDRG=OptionValue[QCDRG];

\[Mu]LO=2;(* Take the low scale to be 2 GeV *)

fK=GetSMParameter["fK"];
mK=GetSMParameter["mK"];
\[CapitalDelta]mKexp=FFExpValue[FFDmKName];

(* From FLAG: 1310.8555 *)
RfacK=24.3;  (*RfacK=(mK/(msat2GeV+mdat2GeV))^2;*)
BVLL=0.56;
(* From 1310.7372v1  *)
BLR1=0.85;  (* B5 *)
BLR2=1.08; (* B4 *)
BSLL1=0.62; (* B2 *)
BSLL2=0.43; (* (5*B2-2*B3)/3 *)

(* From 1002.3612v3  *)
\[Kappa]t\[Epsilon]=0.94; (* \[Epsilon]K correction accounting for Subscript[\[Phi], \[Epsilon]]!=\[Pi]/4 and LD effects in Im[M12] & Im[\[CapitalGamma]12] *)
\[Epsilon]KSM=FFSMValue[FF\[Epsilon]KName];

(* Input Wilson coeffs at 2 GeV scale *)
(* No need for factors of 1/2, these are built into the definition of the operators in FormFlavor already *)
CVLL=Coefficient[Heffall,OpV["L","L"][{"s","d"},{"s","d"}]];
CVRR=Coefficient[Heffall,OpV["R","R"][{"s","d"},{"s","d"}]];
CLR1=Coefficient[Heffall,OpV["L","R"][{"s","d"},{"s","d"}]];
CLR2=Coefficient[Heffall,OpS["L","R"][{"s","d"},{"s","d"}]];
CSLL1=Coefficient[Heffall,OpS["L","L"][{"s","d"},{"s","d"}]];
CSLL2=Coefficient[Heffall,OpT["L","L"][{"s","d"},{"s","d"}]];
CSRR1=Coefficient[Heffall,OpS["R","R"][{"s","d"},{"s","d"}]];
CSRR2=Coefficient[Heffall,OpT["R","R"][{"s","d"},{"s","d"}]];

If[doQCDRG,
{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}=DeltaF2RG[\[Mu]LO,\[Mu]SUSY,{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}][[2;;-1]];
];

useSM=0;
KHK=1/3mK fK^2 BVLL (CVLL+CVRR)-1/6RfacK mK fK^2 BLR1 CLR1+1/4RfacK mK fK^2 BLR2 CLR2-5/24 RfacK mK fK^2 BSLL1 (CSLL1+CSRR1)-1/2RfacK mK fK^2 BSLL2 (CSLL2+CSRR2);

(* From 1601.00005 *)
\[CapitalDelta]mK=2Re[KHK];
\[Epsilon]K=-\[Kappa]t\[Epsilon]*Im[KHK]/(Sqrt[2]\[CapitalDelta]mKexp)+\[Epsilon]KSM;
(* Minus sign in epsilonK from NP because we are computing M12^* *)

{{FFDmKName,\[CapitalDelta]mK},{FF\[Epsilon]KName,\[Epsilon]K}}
];
