(* ::Package:: *)

(* ::Title:: *)
(*\[Tau]->\[Mu]\[Gamma]*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


TempAmpFileName="tautomugamma.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the the main function in the last block *)
ObservableFunction[TempProcessName]=tautomugamma;


TempObsName="\[Tau]\[Rule]\[Mu]\[Gamma]";
FFObsClass[TempObsName]=1; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* BaBar: 0908.2381 (NOTE: 90% CL limits) *)
FFExpValue[TempObsName]=4.4*10^-8;
FFExpUnc[TempObsName]=4.4*10^-8;
(* None *)
FFSMValue[TempObsName]=0; (*<< exp*)
FFSMUnc[TempObsName]=0; (*<< exp*)
AppendTo[$FFObsNameList,TempObsName];
FF\[Tau]\[Mu]gName=TempObsName;


(* Very simple treatment here *)
(* Could switch to 1601.07166  *)
Options[tautomugamma]={IncludeSM->True};
tautomugamma[\[Mu]SUSY_,wilson_,opts:OptionsPattern[]]:=Block[{\[Delta]C7L,\[Delta]C7R,output,useSM,\[CapitalGamma]tauphys,\[Alpha]EM,m\[Tau]},

useSM=If[OptionValue[IncludeSM],1,0];

(* Load SM parameters *)
\[CapitalGamma]tauphys=GetSMParameter["\[CapitalGamma]\[Tau]phys"];
\[Alpha]EM=GetSMParameter["\[Alpha]EM@low"];
m\[Tau]=GetSMParameter["m\[Tau]"];

\[Delta]C7L=Coefficient[wilson,OpA["R"][{"\[Mu]","\[Tau]"},{"\[Gamma]"}]];
\[Delta]C7R=Coefficient[wilson,OpA["L"][{"\[Mu]","\[Tau]"},{"\[Gamma]"}]];

(* C7 has e absorbed *)(* see, e.g., 9604296 *)
output=\[Alpha]EM*m\[Tau]^3*(Abs[\[Delta]C7L]^2+Abs[\[Delta]C7R]^2)/\[CapitalGamma]tauphys;

{{FF\[Tau]\[Mu]gName,Re[output]}}
];
