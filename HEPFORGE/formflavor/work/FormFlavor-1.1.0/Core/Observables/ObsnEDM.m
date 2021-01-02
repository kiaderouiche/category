(* ::Package:: *)

(* ::Title:: *)
(*neutron EDM*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="nEDM.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=neutronEDM


TempObsName="nEDM";
FFObsClass[TempObsName]=1; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* PDG 2012 (d in e*cm - upper bound) *)
FFExpValue[TempObsName]=0.29*10^-25;
FFExpUnc[TempObsName]=0.29*10^-25; 
(* none *)
FFSMValue[TempObsName]=0; (*<< exp*)
FFSMUnc[TempObsName]=0; (*<< exp*)
AppendTo[$FFObsNameList,TempObsName];
FFnEDMName=TempObsName;


(* We rely on the reference 0510137 for the RG evolution of the dipole operators from the SUSY scale down to the low scale. 
We only work to LO for everything. Other references we use are: 9604387 for the leading order MIA expressions 
to check our normalizations, conventions etc. And 0909.1333 for a recent work with a formula for the neutron EDM in terms of the quark EDMs. *)
(* Taken from 0510137 eq (13) *)
(* Difference in conventions: our Wilson coeffs multiply the operators 
e I qbar sigma^{munu} P_{L,R}q F_{munu} and g_s I qbar sigma^{munu} P_{L,R}q G_ {munu}.
Their Wilson coeffs multiply the operators -I/2 e Qq mq qbar sigma^{munu} q F_{munu}
and -I/2 mq qbar sigma^{munu} q G_ {munu}. Where Qq={2/3,-1/3} for u and d quark respectively.
So
C_e(us) = -1/2C_e(them)Qq mq
C_c(us) = -1/2C_c(them)Qq mq/gs

We will just do the leading order evolution, ignoring the "magic numbers" going from 6 quarks to 4 quarks etc.
*)

EDMRG[\[Mu]LO_,\[Mu]SUSY_,{C7d_,C8d_,C9d_,C10d_},{C7u_,C8u_,C9u_,C10u_}]:=Block[
{\[Eta],C7dout,C8dout,C9dout,C10dout,C7uout,C8uout,C9uout,C10uout,\[Gamma]A,\[Gamma]B,\[Gamma]shift},

\[Eta]=AlfasNLO[\[Mu]SUSY]/AlfasNLO[\[Mu]LO];
(* Taken by comparing 0510137 and 9806471. The former is for both u and d quarks, 
while the latter is just for d quark. Further corrected anomalous dimension \[Gamma] to 
account for quark mass  dm/dt =-2 \[Gamma]0 (alpha_s/4pi) m   with \[Gamma]0 = 4
 this takes 16->16+3*\[Gamma]0=28, 14->+3*\[Gamma]0=26 in the numerator *)
\[Gamma]shift=12;
\[Gamma]A=16+\[Gamma]shift;
\[Gamma]B=14+\[Gamma]shift;

C7dout=\[Eta]^(\[Gamma]A/23) C7d+8/3(\[Eta]^(\[Gamma]B/23)-\[Eta]^(\[Gamma]A/23))C8d;
C8dout=\[Eta]^(\[Gamma]B/23) C8d;
C9dout=\[Eta]^(\[Gamma]A/23) C9d+8/3(\[Eta]^(\[Gamma]B/23)-\[Eta]^(\[Gamma]A/23))C10d;
C10dout=\[Eta]^(\[Gamma]B/23) C10d;

C7uout=\[Eta]^(\[Gamma]A/23) C7u-16/3(\[Eta]^(\[Gamma]B/23)-\[Eta]^(\[Gamma]A/23))C8u;
C8uout=\[Eta]^(\[Gamma]B/23) C8u;
C9uout=\[Eta]^(\[Gamma]A/23) C9u-16/3(\[Eta]^(\[Gamma]B/23)-\[Eta]^(\[Gamma]A/23))C10u;
C10uout=\[Eta]^(\[Gamma]B/23) C10u;


{{C7dout,C8dout,C9dout,C10dout},{C7uout,C8uout,C9uout,C10uout}}


];


Options[neutronEDM]={IncludeSM->True,QCDRG->True};
neutronEDM[\[Mu]SUSY_,Heff_,opts:OptionsPattern[]]:=Block[
{doQCDRG,useSM,dde,due,ddc,duc,dneutron,ELuse,
C7Ld,C7Rd,C8Ld,C8Rd,C7Lu,C7Ru,C8Lu,C8Ru,C7dout,C8dout,C9dout,C10dout,
C7uout,C8uout,C9uout,C10uout,\[Mu]LO,cmGeV,dnval,chromoCorr},

useSM=If[OptionValue[IncludeSM],1,0];
doQCDRG=OptionValue[QCDRG];

\[Mu]LO=2; (* Use 2 GeV for low scale, following 0510137 *)
ELuse=N[Sqrt[GetSMParameter["\[Alpha]EM@mZ"]*4\[Pi]]];

C7Ld=Coefficient[Heff,OpA["R"][{"d","d"},{"\[Gamma]"}]];
C7Rd=Coefficient[Heff,OpA["L"][{"d","d"},{"\[Gamma]"}]];
C8Ld=Coefficient[Heff,OpG["R"][{"d","d"},{"g"}]];
C8Rd=Coefficient[Heff,OpG["L"][{"d","d"},{"g"}]];

C7Lu=Coefficient[Heff,OpA["R"][{"u","u"},{"\[Gamma]"}]];
C7Ru=Coefficient[Heff,OpA["L"][{"u","u"},{"\[Gamma]"}]];
C8Lu=Coefficient[Heff,OpG["R"][{"u","u"},{"g"}]];
C8Ru=Coefficient[Heff,OpG["L"][{"u","u"},{"g"}]];

(* C7, C8, C9, C10 *)
If[doQCDRG,
{{C7Ld,C8Ld,C7Rd,C8Rd},{C7Lu,C8Lu,C7Ru,C8Ru}}=EDMRG[\[Mu]LO,\[Mu]SUSY,{C7Ld,C8Ld,C7Rd,C8Rd},{C7Lu,C8Lu,C7Ru,C8Ru}];
];

dde=2*Im[(C7Ld-C7Rd)];
due=2*Im[(C7Lu-C7Ru)];
ddc=2*Im[(C8Ld-C8Rd)];
duc=2*Im[(C8Lu-C8Ru)];

cmGeV=NatUnit["cmGeV"];

(* From 1204.2653 Note: very large disagreement in the literature *)
dnval=0.12;
chromoCorr=1.5;

(* From 1204.2653 *)
dneutron=dnval ((4 dde-due)+chromoCorr(2 ddc+duc)); (* no ELuse as this is in the e.cm def *)

(*{{"neutron EDM",Re[dneutron]}}*)
{{FFnEDMName,Abs[Re[dneutron/cmGeV]]}}
];

