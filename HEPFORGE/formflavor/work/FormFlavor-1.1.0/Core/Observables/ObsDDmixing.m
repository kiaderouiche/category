(* ::Package:: *)

(* ::Title:: *)
(*D-D mixing*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="DDmixing.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=DDmixing;


TempObsName="\!\(\*SubscriptBox[\(\[CapitalDelta]m\), \(D\)]\)";
FFObsClass[TempObsName]=2; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* PDG 2012 (in GeV) *)
FFExpValue[TempObsName]=6.2*10^-15;
FFExpUnc[TempObsName]=2.7*10^-15; (*note -2.8 *)
(* No reliable SM prediction *)
FFSMValue[TempObsName]=0;
FFSMUnc[TempObsName]=6.2*10^-15;
AppendTo[$FFObsNameList,TempObsName];
FFDmDName=TempObsName;


Options[DDmixing]={IncludeSM->False,QCDRG->True};
DDmixing[\[Mu]SUSY_,Heffall_,opts:OptionsPattern[]]:=Block[{doQCDRG,useSM,muat2GeV,mcat2GeV,RfacD0,
BVLL,BLR1,BLR2,BSLL1,BSLL2,CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2,DHD,\[Mu]LO,mD0,fD0},

useSM=If[OptionValue[IncludeSM],1,0];
doQCDRG=OptionValue[QCDRG];

(*changed to 3 GeV*)
\[Mu]LO=3;

fD0=GetSMParameter["fD0"];
mD0=GetSMParameter["mD0"];

(* From 1310.5461v3
   A common value for RfacD0 extracted from Table 3 and Eq, 
   bag factors rescaled by a few percent to match *)
RfacD0=3.2; (*RfacD0=(mD0/(mcat2GeV+muat2GeV))^2;*)
BVLL=0.76;
BLR1=0.97;(*0.95;*)
BLR2=0.95;(*0.92;*)
BSLL1=0.635;(*0.64;*)
BSLL2=0.39; (* from 1.02->1.01  (5*B2-2*B3)/3 *)

CVLL=Coefficient[Heffall,OpV["L","L"][{"c","u"},{"c","u"}]];
CVRR=Coefficient[Heffall,OpV["R","R"][{"c","u"},{"c","u"}]];
CLR1=Coefficient[Heffall,OpV["L","R"][{"c","u"},{"c","u"}]];
CLR2=Coefficient[Heffall,OpS["L","R"][{"c","u"},{"c","u"}]];
CSLL1=Coefficient[Heffall,OpS["L","L"][{"c","u"},{"c","u"}]];
CSLL2=Coefficient[Heffall,OpT["L","L"][{"c","u"},{"c","u"}]];
CSRR1=Coefficient[Heffall,OpS["R","R"][{"c","u"},{"c","u"}]];
CSRR2=Coefficient[Heffall,OpT["R","R"][{"c","u"},{"c","u"}]];

If[doQCDRG,
{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}=DeltaF2RG[\[Mu]LO,\[Mu]SUSY,{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}][[2;;-1]];
];

(* Input Wilson coeffs at 2 GeV scale *)
(* As unknown, no SM contrib for DD mixing. *)
DHD=1/3mD0 fD0^2 BVLL (CVLL+CVRR)-1/6RfacD0 mD0 fD0^2 BLR1 CLR1+1/4RfacD0 mD0 fD0^2 BLR2 CLR2-5/24 RfacD0  mD0 fD0^2 BSLL1 (CSLL1+CSRR1)-1/2RfacD0 mD0 fD0^2 BSLL2 (CSLL2+CSRR2);

(*{{"\[CapitalDelta]mD",2Re[DHD]}}*)
{{FFDmDName,2Re[DHD]}}
];
