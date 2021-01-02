(* ::Package:: *)

(* ::Title:: *)
(*Bs->\[Mu]\[Mu]*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="Bstomumu.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=Bstomumu;


TempObsName="\!\(\*SubscriptBox[\(B\), \(s\)]\)\[Rule]\!\(\*SuperscriptBox[\(\[Mu]\), \(+\)]\)\!\(\*SuperscriptBox[\(\[Mu]\), \(-\)]\)";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* LHCb & CMS combination: http://cds.cern.ch/record/1564324 (BR) *)
FFExpValue[TempObsName]=2.9*10^-9;
FFExpUnc[TempObsName]=0.7*10^-9;
(* Bobeth, et al 1311.0903 *)
FFSMValue[TempObsName]=3.65*10^-9;
FFSMUnc[TempObsName]=0.23*10^-9;
AppendTo[$FFObsNameList,TempObsName];
FFBsmumuName=TempObsName;


(* We use the references 1208.0934 and 9512380.  *)
(* According to 0812.4320, the Wilson coefficients are not renormalized, and higher order corrections are minimized at the top mass scale. (See also 1311.1347.) *)
Options[Bstomumu]={IncludeSM->True,QCDRG->True};
Bstomumu[\[Mu]SUSY_,wilson_,opts:OptionsPattern[]]:=Block[{useSM,CASM,CSMlist,
mbrunatmt,msrunatmt,mdrunatmt,CVLL,CVRR,CVLR,CVRL,CSLL,CSRR,CSLR,CSRL,FS,FV,FP,FA,
Mampsq,brout,FASM,mmusub,mttsub,CKMnum,GFF,MWW,fBs,mBs,msssub,\[CapitalGamma]Bs,SMNNLOcorr,mtbase,Rt},
useSM=If[OptionValue[IncludeSM],1,0];

mmusub=GetSMParameter["m\[Mu]"];
mttsub=GetSMParameter["mt@mt"];
CKMnum=GetSMParameter["CKM"];
GFF=GetSMParameter["GF"];
MWW=GetSMParameter["mW"];
fBs=GetSMParameter["fBs"]; 
mBs=GetSMParameter["mBs"]; 
msssub=GetSMParameter["ms@mt"]; 
\[CapitalGamma]Bs=GetSMParameter["\[CapitalGamma]BsHphys"];  (*Note: uses the heavier B_s lifetime 1204.1737 *)

mbrunatmt=mbDRbar[mttsub];

(* From 1311.0903 *)
mtbase=163.5;
Rt=mttsub/mtbase;

(* From 1311.1347 and 1311.1348, includes NNLO 3-loop QCD corrections and NLO EW, 
matched to our calculation of SM Wilson coefficients to nail down signs and 
factors of 2 etc *)
SMNNLOcorr=0.4690*Rt^1.51; (* From 1311.0903 *)
CASM=mmusub/mbrunatmt(4Conjugate[CKMnum[[3,3]]]CKMnum[[3,2]]GFF^2/\[Pi]^2 MWW^2*SMNNLOcorr); 

(* signs checked against CA *)
CVLL=-mmusub/mbrunatmt Coefficient[wilson,OpV["L","L"][{"b","s"},{"\[Mu]","\[Mu]"}]];
CVRR=-mmusub/mbrunatmt Coefficient[wilson,OpV["R","R"][{"b","s"},{"\[Mu]","\[Mu]"}]];
CVLR=-mmusub/mbrunatmt Coefficient[wilson,OpV["L","R"][{"b","s"},{"\[Mu]","\[Mu]"}]];
CVRL=-mmusub/mbrunatmt Coefficient[wilson,OpV["R","L"][{"b","s"},{"\[Mu]","\[Mu]"}]];

CSLL=-Coefficient[wilson,OpS["L","L"][{"b","s"},{"\[Mu]","\[Mu]"}]];
CSRR=-Coefficient[wilson,OpS["R","R"][{"b","s"},{"\[Mu]","\[Mu]"}]];
CSLR=-Coefficient[wilson,OpS["L","R"][{"b","s"},{"\[Mu]","\[Mu]"}]];
CSRL=-Coefficient[wilson,OpS["R","L"][{"b","s"},{"\[Mu]","\[Mu]"}]];

FS=mBs^3/(mbrunatmt+msssub)(CSLL+CSLR-CSRR-CSRL);
FP=mBs^3/(mbrunatmt+msssub)(-CSLL+CSLR-CSRR+CSRL);
FA=mBs (2 mbrunatmt) (CVLL-CVLR+CVRR-CVRL + useSM CASM);
Mampsq=(Abs[FS]^2 (1-(2mmusub/mBs)^2)+Abs[FP]^2+Abs[FA]^2)+2Re[FP Conjugate[FA]];

brout=fBs^2/\[CapitalGamma]Bs/(128\[Pi]) Mampsq/mBs Sqrt[1-(2mmusub/mBs)^2];

(*{{"BR(Bs->\[Mu]\[Mu])",brout}}*)
{{FFBsmumuName,brout}}
];
