(* ::Package:: *)

(* ::Title:: *)
(*b->d\[Gamma]*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v2 Sept 25 2017)*)


(* ::Text:: *)
(*Thanks to Motoi Endo for identifying a bug in the btodgamma routine*)


TempAmpFileName="btodgamma.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=btodgamma;


TempObsName="b\[Rule]d\[Gamma]";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* BaBar: 1005.4087 (BR) - see also 1106.5499 *)
FFExpValue[TempObsName]=1.41*10^-5;
FFExpUnc[TempObsName]=0.57*10^-5;
(* Crivellin, Mercolli: 1106.5499 *)
FFSMValue[TempObsName]=1.54*10^-5;
FFSMUnc[TempObsName]=0.31*10^-5; (*+0.26-0.31*)
AppendTo[$FFObsNameList,TempObsName];
FFbdgName=TempObsName;

(*TempObsName="ACP(b->d\[Gamma])";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* BaBar: 1005.4087 (BR) - see also 1106.5499 *)
FFExpValue[TempObsName]=0;
FFExpUnc[TempObsName]=0;
(* Crivellin, Mercolli: 1106.5499 *)
FFSMValue[TempObsName]=0;
FFSMUnc[TempObsName]=0;
AppendTo[$FFObsNameList,TempObsName];
FFACPbdgName=TempObsName;*)


(* We are using the updated reference 0609241 *)
Options[btodgamma]={IncludeSM->True,QCDRG->True};
btodgamma[\[Mu]SUSY_,wilson_,opts:OptionsPattern[]]:=Block[{\[Delta]C7L,\[Delta]C7R,\[Delta]C8L,\[Delta]C8R,doQCDRG,
ELuse,GSuse,useSM,PofE0,\[Epsilon]d,
mbbsub,mttsub,Vud,Vus,Vub,Vcd,Vcs,Vcb,Vtd,Vts,Vtb,GFF,MWW,msssub,bdgOpCoeff,
aconst,a77,a7r,a7i,a88,a8r,a8i,a\[Epsilon]\[Epsilon],a\[Epsilon]r,a\[Epsilon]i,a87r,a87i,a\[Epsilon]7r,a\[Epsilon]7i,a\[Epsilon]8r,a\[Epsilon]8i,
C7LSM,C8LSM,R7,R7t,R8,R8t,NNo100,BRbd\[Gamma],ACP,bdgexp,choosemcomb},

useSM=If[OptionValue[IncludeSM],1,0];
doQCDRG=OptionValue[QCDRG];

mbbsub=GetSMParameter["mb@mt"];
mttsub=GetSMParameter["mt@mt"];
msssub=GetSMParameter["ms@mt"]; 
{{Vud,Vus,Vub},{Vcd,Vcs,Vcb},{Vtd,Vts,Vtb}}=GetSMParameter["CKM"];
GFF=GetSMParameter["GF"];
MWW=GetSMParameter["mW"];

bdgOpCoeff=(4\[Pi]^2Sqrt[2]/(GFF mbbsub Conjugate[Vtd] Vtb));

\[Delta]C7L= -bdgOpCoeff Coefficient[wilson,OpA["R"][{"d","b"},{"\[Gamma]"}]];
\[Delta]C7R= -bdgOpCoeff Coefficient[wilson,OpA["L"][{"d","b"},{"\[Gamma]"}]];
\[Delta]C8L= -bdgOpCoeff Coefficient[wilson,OpG["R"][{"d","b"},{"g"}]];
\[Delta]C8R= -bdgOpCoeff Coefficient[wilson,OpG["L"][{"d","b"},{"g"}]];

(* C7, C8, C9, C10 *)
(* The formula of 0312260 is in terms of the Wilson coeffs at mtop *)
If[doQCDRG,
{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}=btosgammaRG[mttsub,\[Mu]SUSY,21,{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}];
];

(* This is eq 11 of 0312260 *)
NNo100=2.567*10^-5;

\[Epsilon]d=Conjugate[Vud] Vub/(Conjugate[Vtd] Vtb);

(* Table 1 of 0312260 *)
choosemcomb=0.23;
Which[choosemcomb==0.23,
(* mc/mb=0.23 *)
aconst=7.8221;
a77=0.8161; a7r=4.8802; a7i=0.3546;
a88=0.0197; a8r=0.5680; a8i=-0.0987;
a\[Epsilon]\[Epsilon]=0.4384; a\[Epsilon]r=-1.6981; a\[Epsilon]i=2.4997;
a87r=0.1923; a87i=-0.0487; a\[Epsilon]7r=-0.7827;
a\[Epsilon]7i=-0.9067; a\[Epsilon]8r=-0.0601; a\[Epsilon]8i=-0.0661;
,
(* mc/mb=0.29 *)
choosemcomb==0.29 || True,
aconst=6.9120;
a77=0.8161; a7r=4.5689; a7i=0.2167;
a88=0.0197; a8r=0.5463; a8i=-0.1105;
a\[Epsilon]\[Epsilon]=0.3787; a\[Epsilon]r=-2.6679; a\[Epsilon]i=2.8956;
a87r=0.1923; a87i=-0.0487; a\[Epsilon]7r=-1.0940;
a\[Epsilon]7i=-1.0447; a\[Epsilon]8r=-0.0819; a\[Epsilon]8i=-0.0779;
];

(* This is eq 26 of 0312260 *)
C7LSM=-0.189; C8LSM=-0.095;

R7=1+\[Delta]C7L/C7LSM; R7t=\[Delta]C7R/C7LSM;
R8=1+\[Delta]C8L/C8LSM; R8t=\[Delta]C8R/C8LSM;

(* This is eq 42 of 0312260 *)
PofE0=(aconst+a77(R7 Conjugate[R7]+R7t Conjugate[R7t])+a7r Re[R7]+a7i Im[R7]
+a88(R8 Conjugate[R8]+R8t Conjugate[R8t])
+a8r Re[R8]+a8i Im[R8]
+a87r Re[R8 Conjugate[R7]+R8t Conjugate[R7t]]
+a87i Im[R8 Conjugate[R7]+R8t Conjugate[R7t]]
+a\[Epsilon]\[Epsilon] Abs[\[Epsilon]d]^2+a\[Epsilon]r Re[\[Epsilon]d]+a\[Epsilon]i Im[\[Epsilon]d]
+a\[Epsilon]7r Re[R7 Conjugate[\[Epsilon]d]]+a\[Epsilon]8r Re[R8 Conjugate[\[Epsilon]d]]
+a\[Epsilon]7i Im[R7 Conjugate[\[Epsilon]d]]+a\[Epsilon]8i Im[R8 Conjugate[\[Epsilon]d]]);

BRbd\[Gamma]=NNo100 Abs[Conjugate[Vtd] Vtb/Vcb]^2 PofE0;

(* This is eq 43 of 0312260 - currently not output due to no measurement *)
(*bdgexp=FFExpValue[FFbdgName];
ACP=NNo100 Abs[Conjugate[Vtd] Vtb/Vcb]^2*Im[a87i*(R8 Conjugate[R7]+R8t Conjugate[R7t])+
a7i*R7+a8i*R8+a\[Epsilon]7i R7 Conjugate[\[Epsilon]d]+a\[Epsilon]8i R8 Conjugate[\[Epsilon]d]]/bdgexp; *)

{{FFbdgName,Re[BRbd\[Gamma]]}}

];
