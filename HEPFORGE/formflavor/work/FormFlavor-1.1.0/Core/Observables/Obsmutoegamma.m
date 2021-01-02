(* ::Package:: *)

(* ::Title:: *)
(*\[Mu]->e\[Gamma]*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="mutoegamma.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=mutoegamma;


TempObsName="\[Mu]\[Rule]e\[Gamma]";
FFObsClass[TempObsName]=1; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* MEG: 1303.0754 (NOTE: 90% CL limits) *)
FFExpValue[TempObsName]=5.7*10^-13;
FFExpUnc[TempObsName]=5.7*10^-13;
(* None *)
FFSMValue[TempObsName]=0; (*<< exp*)
FFSMUnc[TempObsName]=0; (*<< exp*)
AppendTo[$FFObsNameList,TempObsName];
FF\[Mu]egName=TempObsName;


(* Very simple treatment here *)
(* Could switch to 1601.07166  *)
Options[mutoegamma]={IncludeSM->True};
mutoegamma[\[Mu]SUSY_,wilson_,opts:OptionsPattern[]]:=Block[{\[Delta]C7L,\[Delta]C7R,output,useSM,\[CapitalGamma]muphys,\[Alpha]EM,m\[Mu]},

useSM=If[OptionValue[IncludeSM],1,0];

(* Load SM parameters *)
\[CapitalGamma]muphys=GetSMParameter["\[CapitalGamma]\[Mu]phys"];
\[Alpha]EM=GetSMParameter["\[Alpha]EM@low"];
m\[Mu]=GetSMParameter["m\[Mu]"];

\[Delta]C7L=Coefficient[wilson,OpA["R"][{"e","\[Mu]"},{"\[Gamma]"}]];
\[Delta]C7R=Coefficient[wilson,OpA["L"][{"e","\[Mu]"},{"\[Gamma]"}]];

(* C7 has e absorbed *)(* see, e.g., 9604296 *)
output=\[Alpha]EM*m\[Mu]^3*(Abs[\[Delta]C7L]^2+Abs[\[Delta]C7R]^2)/\[CapitalGamma]muphys;

{{FF\[Mu]egName,Re[output]}}
];
