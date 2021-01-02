(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*Standard Model Parameters (May 31 2016)*)


(* ::Text:: *)
(*Revision notes:*)
(*CKM last updated (Sept 25 2017)*)


GetSMParameter::notProvided="The parameter `1` is not included in SMparameters.m!  Setting to 0.";
GetSMParameter[x_]:=With[{},Message[GetParameter::notProvided,x];0]


(* ::Subsection:: *)
(*Natural Units*)


NatUnit["sGeV"]=1.51926751*10^24; (*Note: sigfigs valid // 1 s = sGeV GeV^-1*)
NatUnit["cmGeV"]=5.06773094*10^13; (*Note:  sigfigs valid // 1 cm = cmGeV GeV^-1*)
NatUnit["KpGeV"]=8.6173324*10^-14; (*Note: sigfigs valid // 1 K = KpGeV GeV*)


(* ::Subsection:: *)
(*Electroweak Parameters*)


GetSMParameter["\[Alpha]EM@low"]=1/137.036;
GetSMParameter["\[Alpha]EM@mZ"]=1/128.94;
GetSMParameter["\[Alpha]S@mZ"]=0.1185;
GetSMParameter["GFF"]=1.1663787 10^(-5);
GetSMParameter["GF"]=1.1663787 10^(-5);
GetSMParameter["s\[Theta]w"]=0.481664;
GetSMParameter["vhVEV"]=173.685;
GetSMParameter["g1@mZ"]=0.461285; (* SU(5) unification normalization *)
GetSMParameter["g2@mZ"]=0.64469;
GetSMParameter["g3@mZ"]=1.16825;


(* ::Subsection:: *)
(*Mass Parameters*)


(*except where noted, values come from PDG*)
GetSMParameter["mt@MSbar"]=160.0;
GetSMParameter["mt@pole"]=173.21;
GetSMParameter["mb@MSbar"]=4.18;
GetSMParameter["mb@1S"]=4.66;
GetSMParameter["mc@MSbar"]=1.275;
GetSMParameter["mc@pole"]=1.67;
GetSMParameter["ms@MSbar@2GeV"]=0.095;
GetSMParameter["md@MSbar@2GeV"]=0.0048;
GetSMParameter["mu@MSbar@2GeV"]=0.0023;
GetSMParameter["mc@MSbar@2GeV"]=1.087; (* from 1503.01791 *)
GetSMParameter["mb@kinetic"]=4.564; (* from 1503.01791 *)


GetSMParameter["mW"]=80.385;
GetSMParameter["mZ"]=91.1876;
GetSMParameter["mh"]=125.09;
GetSMParameter["mb@mt"]=2.737;
GetSMParameter["ms@mt"]=0.05216;
GetSMParameter["md@mt"]=0.00388;
GetSMParameter["mt@mt"]=163.2;
GetSMParameter["mc@mt"]=0.6123;
GetSMParameter["mu@mt"]=0.00222;
GetSMParameter["mb@mb"]=4.17;

GetSMParameter["me"]=5.11*10^-4;
GetSMParameter["m\[Mu]"]=0.105659;
GetSMParameter["m\[Tau]"]=1.77686;


(* ::Subsection:: *)
(*Lepton Parameters*)


GetSMParameter["\[CapitalGamma]\[Mu]phys"]=2.99598*10^-19;(*in GeV*)
GetSMParameter["\[CapitalGamma]\[Tau]phys"]=2.2652*10^-12;(*in GeV*)


(* ::Subsection:: *)
(*Meson Parameters*)


GetSMParameter["mBd"]=5.27958;
GetSMParameter["mBs"]=5.36677;
GetSMParameter["mK"]=0.497614;
GetSMParameter["mD0"]=1.8645;

(* From FLAG: 1310.8555 *)
GetSMParameter["fK"]=0.1598;
GetSMParameter["fD0"]=0.209;

(* From 1302.2644 - including fB+ fB0 splitting of 4 GeV *)
GetSMParameter["fBd"]=0.188;
(* from 1509.02220 *)
GetSMParameter["fBs"]=0.226;


GetSMParameter["f\[Pi]"]=0.0922;

GetSMParameter["\[CapitalGamma]Bsphys"]=4.48985*10^-13;(*in GeV*)
GetSMParameter["\[CapitalGamma]BsHphys"]=4.104*10^-13;(*in GeV*)
GetSMParameter["\[CapitalGamma]Bdphys"]=4.33319*10^-13;(*in GeV*)
GetSMParameter["\[CapitalGamma]KLphys"]=1.2866*10^-17;(*in GeV*)
GetSMParameter["\[CapitalGamma]KSphys"]=7.35104*10^-15;(*in GeV*)
GetSMParameter["\[CapitalGamma]Kpmphys"]=5.3167*10^-17;(*in GeV*)

GetSMParameter["BRb2ce\[Nu]"]=0.1067; (* for b->s\[Gamma] *)
GetSMParameter["BRK2\[Pi]e\[Nu]"]=0.0507; (* for K->\[Pi]\[Nu]\[Nu] *)


(* ::Subsection:: *)
(*CKM*)


(* use a unitary form extracted from Wolfenstein parameterization *)
(* From CKMFitter - Summer 2015, http://ckmfitter.in2p3.fr/www/results/plots_eps15/num/ckmEval_results_eps15.html 
GetSMParameter["CKM\[Lambda]"]=0.22543;
GetSMParameter["CKMA"]=0.8227;
GetSMParameter["CKM\[Rho]"]=0.1504;
GetSMParameter["CKM\[Eta]"]=0.3540;*)
(* From CKMFitter - ICHEP 2016, http://ckmfitter.in2p3.fr/www/results/plots_ichep16/num/ckmEval_results_ichep16.html *)
GetSMParameter["CKM\[Lambda]"]=0.22509;
GetSMParameter["CKMA"]=0.8250;
GetSMParameter["CKM\[Rho]"]=0.1598;
GetSMParameter["CKM\[Eta]"]=0.3499;

GenCKM[]:=Block[{Vud,Vus,Vub,Vcd,Vcs,Vcb,Vtd,Vts,Vtb,c,s,\[Delta],
\[Lambda]=GetSMParameter["CKM\[Lambda]"],Aa=GetSMParameter["CKMA"],
\[Rho]b=GetSMParameter["CKM\[Rho]"],\[Eta]b=GetSMParameter["CKM\[Eta]"]},

{{Vud,Vus,Vub},{Vcd,Vcs,Vcb},{Vtd,Vts,Vtb}}=
{{c[1,2]c[1,3],s[1,2]c[1,3],s[1,3]Exp[-I \[Delta]]},
{-s[1,2]c[2,3]-c[1,2]s[2,3]s[1,3]Exp[I \[Delta]],c[1,2]c[2,3]-s[1,2]s[2,3]s[1,3]Exp[I \[Delta]],s[2,3]c[1,3]},
{s[1,2]s[2,3]-c[1,2]c[2,3]s[1,3]Exp[I \[Delta]],-c[1,2]s[2,3]-s[1,2]c[2,3]s[1,3]Exp[I \[Delta]],c[2,3]c[1,3]}}
/.c[i_,j_]->Sqrt[1-s[i,j]^2]
/.s[1,2]->\[Lambda]/.s[2,3]->Aa \[Lambda]^2
/.s[1,3]->Abs[Aa \[Lambda]^3 (\[Rho]b+I \[Eta]b)Sqrt[1-Aa^2 \[Lambda]^4]/Sqrt[1-\[Lambda]^2]/(1-Aa^2 \[Lambda]^4 (\[Rho]b+I \[Eta]b))]
/.\[Delta]->Arg[Aa \[Lambda]^3 (\[Rho]b+I \[Eta]b)Sqrt[1-Aa^2 \[Lambda]^4]/Sqrt[1-\[Lambda]^2]/(1-Aa^2 \[Lambda]^4 (\[Rho]b+I \[Eta]b))]; 

{{Vud,Vus,Vub},{Vcd,Vcs,Vcb},{Vtd,Vts,Vtb}}]

(* preevaluated to take millisecond eval to microsecond *)
GetSMParameter["CKM"]=GenCKM[];


(* From CKMFitter - Summer 2015, http://ckmfitter.in2p3.fr/www/results/plots_eps15/num/ckmEval_results_eps15.html *)
(* Note: use fit, rather than direct measurements *)
(*GetSMParameter["CKM\[Alpha]"]=1.5777776438028739`; (* radians *)
GetSMParameter["CKM\[Beta]"]=0.39479347680111737`; (* radians *)
GetSMParameter["CKM\[Gamma]"]=1.1695451317614003`; (* radians *)*)

(* From CKMFitter - ICHEP 2016, http://ckmfitter.in2p3.fr/www/results/plots_ichep16/num/ckmEval_results_ichep16.html *)
GetSMParameter["CKM\[Alpha]"]=1.6057029118347834`; (* radians *)
GetSMParameter["CKM\[Beta]"]=0.39444441095071847`; (* radians *)
GetSMParameter["CKM\[Gamma]"]=1.1414453308042918`; (* radians *)


mquarkdownsq={MD2,MS2,MB2};
mquarkupsq={MU2,MC2,MT2};
