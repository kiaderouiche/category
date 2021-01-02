(* ::Package:: *)

(* ::Title:: *)
(*Bd->\[Mu]\[Mu]*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="Bdtomumu.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=Bdtomumu;


TempObsName="\!\(\*SubscriptBox[\(B\), \(d\)]\)\[Rule]\!\(\*SuperscriptBox[\(\[Mu]\), \(+\)]\)\!\(\*SuperscriptBox[\(\[Mu]\), \(-\)]\)";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* LHCb & CMS combination: http://cds.cern.ch/record/1564324 (BR) *)
FFExpValue[TempObsName]=3.6*10^-10;
FFExpUnc[TempObsName]=1.6*10^-10; (*+1.6-1.4*)
(* Bobeth, et al 1311.0903 *)
FFSMValue[TempObsName]=1.06*10^-10;
FFSMUnc[TempObsName]=0.09*10^-10;
AppendTo[$FFObsNameList,TempObsName];
FFBdmumuName=TempObsName;


(* We use the references 1208.0934 and 9512380.  *)
(* According to 0812.4320, the Wilson coefficients are not renormalized, and higher order corrections are minimized at the top mass scale. (See also 1311.1347.) *)
Options[Bdtomumu]={IncludeSM->True,QCDRG->True};
Bdtomumu[\[Mu]SUSY_,wilson_,opts:OptionsPattern[]]:=Block[{useSM,CASM,CSMlist,mbrunatmt,
CVLL,CVRR,CVLR,CVRL,CSLL,CSRR,CSLR,CSRL,FS,FV,FP,FA,Mampsq,brout,FASM,mtbase,Rt,
mmusub,mttsub,CKMnum,GFF,MWW,fBd,mBd,\[CapitalGamma]Bd,SMNNLOcorr},

useSM=If[OptionValue[IncludeSM],1,0];

mmusub=GetSMParameter["m\[Mu]"];
mttsub=GetSMParameter["mt@mt"];
CKMnum=GetSMParameter["CKM"];
GFF=GetSMParameter["GF"];
MWW=GetSMParameter["mW"];
fBd=GetSMParameter["fBd"]; 
mBd=GetSMParameter["mBd"]; 
\[CapitalGamma]Bd=GetSMParameter["\[CapitalGamma]Bdphys"];

useSM=If[OptionValue[IncludeSM],1,0];

mbrunatmt= mbDRbar[mttsub];

(* From 1311.0903 *)
mtbase=163.5;
Rt=mttsub/mtbase;

(* From 1311.1347 and 1311.1348, includes NNLO 3-loop QCD corrections and NLO EW, 
matched to our calculation of SM Wilson coefficients to nail down signs and 
factors of 2 etc *)
SMNNLOcorr=0.4690*Rt^1.51; (* From 1311.0903 *)
CASM=mmusub/mbrunatmt(4Conjugate[CKMnum[[3,3]]]CKMnum[[3,1]]GFF^2/\[Pi]^2 MWW^2*SMNNLOcorr); 

(* signs checked against CA *)
CVLL=-mmusub/mbrunatmt Coefficient[wilson,OpV["L","L"][{"b","d"},{"\[Mu]","\[Mu]"}]];
CVRR=-mmusub/mbrunatmt Coefficient[wilson,OpV["R","R"][{"b","d"},{"\[Mu]","\[Mu]"}]];
CVLR=-mmusub/mbrunatmt Coefficient[wilson,OpV["L","R"][{"b","d"},{"\[Mu]","\[Mu]"}]];
CVRL=-mmusub/mbrunatmt Coefficient[wilson,OpV["R","L"][{"b","d"},{"\[Mu]","\[Mu]"}]];

CSLL=-Coefficient[wilson,OpS["L","L"][{"b","d"},{"\[Mu]","\[Mu]"}]];
CSRR=-Coefficient[wilson,OpS["R","R"][{"b","d"},{"\[Mu]","\[Mu]"}]];
CSLR=-Coefficient[wilson,OpS["L","R"][{"b","d"},{"\[Mu]","\[Mu]"}]];
CSRL=-Coefficient[wilson,OpS["R","L"][{"b","d"},{"\[Mu]","\[Mu]"}]];

FS=mBd^3/(mbrunatmt)(CSLL+CSLR-CSRR-CSRL);
FP=mBd^3/(mbrunatmt)(-CSLL+CSLR-CSRR+CSRL);
FA=mBd (2 mbrunatmt) (CVLL-CVLR+CVRR-CVRL + useSM CASM);
Mampsq=(Abs[FS]^2 (1-(2mmusub)^2/mBd^2)+Abs[FP]^2 +Abs[FA]^2+2Re[FP Conjugate[FA]]);

brout= fBd^2/\[CapitalGamma]Bd/(128\[Pi]) Mampsq/mBd Sqrt[1-(2mmusub/mBd)^2];

{{FFBdmumuName,brout}}
];
