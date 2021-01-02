(* ::Package:: *)

(* ::Title:: *)
(*K->\[Pi]\[Nu]\[Nu]*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="Ktopinunu.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable Function name must match the name in the last block *)
ObservableFunction[TempProcessName]=Ktopinunu;


TempObsName="\!\(\*SuperscriptBox[\(K\), \(+\)]\)\[Rule] \!\(\*SuperscriptBox[\(\[Pi]\), \(+\)]\)\[Nu]\!\(\*OverscriptBox[\(\[Nu]\), \(_\)]\)";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* PDG 2012 (BR) *)
FFExpValue[TempObsName]=1.17*10^-10;
FFExpUnc[TempObsName]=1.1*10^-10;
(* Brod, Gorbahn, Stamou 1009.0947 *)
FFSMValue[TempObsName]=0.78*10^-10;
FFSMUnc[TempObsName]=0.08*10^-10;
AppendTo[$FFObsNameList,TempObsName];
FFKpnunuName=TempObsName;

TempObsName="\!\(\*SubsuperscriptBox[\(K\), \(L\), \(0\)]\)\[Rule] \!\(\*SuperscriptBox[\(\[Pi]\), \(0\)]\)\[Nu]\!\(\*OverscriptBox[\(\[Nu]\), \(_\)]\)";
FFObsClass[TempObsName]=1; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* PDG 2012 (BR - upper bound) *)
FFExpValue[TempObsName]=2.6*10^-8;
FFExpUnc[TempObsName]=2.6*10^-8;
(* Brod, Gorbahn, Stamou 1009.0947 *)
FFSMValue[TempObsName]=2.43*10^-11;
FFSMUnc[TempObsName]=0.40*10^-11; (*+0.40-0.37*) 
AppendTo[$FFObsNameList,TempObsName];
FFK0nunuName=TempObsName;


(* We modify the formulas from the review article 1107.6001 into a different notation. 
 This treatment relies on numbers from the paper 1009.0947. *)
(* See also 0408142 for formulas in the general MSSM. *)
(* See the review 9806471 for a comprehensible discussion of the RG evolution of the wilson coefficients. It is stated there that since the operator
responsible for K->pi nu nu is the product of a hadronic and a lepton current, there is no operator mixing and no QCD anomalous dimension, so the RG
from the SUSY scale (or weak scale) to the Kaon scale is trivial. *)
Options[Ktopinunu]={IncludeSM->True,QCDRG->True};
Ktopinunu[\[Mu]SUSY_,wilson_,opts:OptionsPattern[]]:=Block[{useSM,c0,cp,Pc,\[Lambda]CKM,CL,CR,
Xtry,BRK0,BRKp,CKMnum,Xt,\[Lambda]t,\[Lambda]c,s\[Theta]w,MWW,\[Alpha]EMin,vVEV,CVLLSM,\[CapitalDelta]EM,\[Delta]\[Epsilon],\[Delta]Pcu,r0,rp,BRK2\[Pi]e\[Nu]},

useSM=If[OptionValue[IncludeSM],1,0];

CKMnum=GetSMParameter["CKM"];
s\[Theta]w=GetSMParameter["s\[Theta]w"];
vVEV=GetSMParameter["vhVEV"]*Sqrt[2];
\[Alpha]EMin=GetSMParameter["\[Alpha]EM@mZ"];

BRK2\[Pi]e\[Nu]=GetSMParameter["BRK2\[Pi]e\[Nu]"];

r0=0.944; (* from Marciano and Parsa: Phys.Rev. D53 (1996) 1-5 *)
rp=0.901; (* from Marciano and Parsa: Phys.Rev. D53 (1996) 1-5 *)

cp=(3 rp BRK2\[Pi]e\[Nu])/(2 Abs[CKMnum[[1,2]]]^2);
c0=(3 r0 BRK2\[Pi]e\[Nu])/(2 Abs[CKMnum[[1,2]]]^2) GetSMParameter["\[CapitalGamma]Kpmphys"]/GetSMParameter["\[CapitalGamma]KLphys"];

Pc=9.37*10^-4;  (* from hep-ph/9806471 *)
\[Delta]Pcu=1.08*10^-4; (* from hep-ph/0503107 *)

(*Xt=1.469;  from 1009.0947 *)
Xt=1.481; (* from 1503.02693 *)
\[Lambda]t=CKMnum[[3,2]]Conjugate[CKMnum[[3,1]]];
\[Lambda]c=CKMnum[[2,2]]Conjugate[CKMnum[[2,1]]];

(* Signs checked with CA *)
CL=Coefficient[wilson,OpV["L","L"][{"d","s"},{"\[Nu]e","\[Nu]e"}]];
CR=Coefficient[wilson,OpV["R","L"][{"d","s"},{"\[Nu]e","\[Nu]e"}]];

CVLLSM=1/(\[Pi] vVEV^2) (\[Alpha]EMin/s\[Theta]w^2)*(\[Lambda]c*(Pc+\[Delta]Pcu)+\[Lambda]t*Xt);

\[CapitalDelta]EM=-0.003; (* from 1503.02693, -0.3% effect *)
\[Delta]\[Epsilon]=-0.011;(* hep-ph/9607447 -1% effect *)

Xtry=CL+CR+useSM*CVLLSM;

BRK0=c0*vVEV^4*Im[Xtry]^2*(1+\[Delta]\[Epsilon]);
BRKp=cp*vVEV^4*Abs[Xtry]^2*(1+\[CapitalDelta]EM);

(*{{"BR(KL -> \[Pi]\[Nu]\[Nu])",BRK0},{"BR(K+ -> \[Pi]\[Nu]\[Nu])",BRKp}}*)
{{FFK0nunuName,BRK0},{FFKpnunuName,BRKp}}
];
