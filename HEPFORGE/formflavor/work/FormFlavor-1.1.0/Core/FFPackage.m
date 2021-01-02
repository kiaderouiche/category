(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*Main Package*)


(* ::Section:: *)
(*Load FormFlavor*)


FormFlavor`$LOADED=True;

BeginPackage["FormFlavor`"];
FormFlavor`$FFVersion="1.1.0";
FormFlavor`$FFVersionDate="25 September 2017";

Print[""];
Print["FormFlavor ",FormFlavor`$FFVersion," (",FormFlavor`$FFVersionDate,")"];
Print["by Jared A. Evans and David Shih"];
Print["Documentation:"];
Print["  arXiv:1606.00003"];
Print[""];


(* ::Section:: *)
(*Global Parameters*)


(* ::Subsection:: *)
(*FF Parameters*)


FormFlavor`$FFprecision=MachinePrecision;
(* lines below are loaded with observable module files *)
$FFAmpFileList={}; 
$FFProcessList={}; 
$FFObsNameList={}; 


(* ::Subsection:: *)
(*SM Parameters*)


Print["Loading Standard Model Parameters"];

Get[FormFlavor`$FFPath<>"/Core/SMParameters.m"];


(* ::Subsection:: *)
(*Master operator list*)


Oplist=Flatten[{Table[OpS[i,j],{i,{"L","R"}},{j,{"L","R"}}],Table[OpV[i,j],{i,{"L","R"}},{j,{"L","R"}}],Table[OpT[i,j],{i,{"L","R"}},{j,{"L","R"}}],Table[OpA[i],{i,{"L","R"}}],Table[OpG[i],{i,{"L","R"}}],Table[OpA10[i],{i,{"L","R"}}],Table[OpG10[i],{i,{"L","R"}}]}];


(* ::Section:: *)
(*Load FFWilson (compiler and Wilson coefficients)*)


Print["Loading FFWilson"];
Get[FormFlavor`$FFPath<>"/Core/FFWilson.m"]


(* ::Section:: *)
(*Load FFObservables*)


Print["Loading FFObservables"];
Get[FormFlavor`$FFPath<>"/Core/FFObservables.m"]


(* ::Section:: *)
(*Load FFModel*)


Get[FormFlavor`$FFModelPath<>"/ModelMaster.m"];


(* ::Section:: *)
(*Load User Functions*)


Print["Loading User Functions"];

Get[FormFlavor`$FFPath<>"/Core/UserCore.m"];
Get[FormFlavor`$FFModelPath<>"/UserModel.m"];


(* ::Section:: *)
(*Master routines: FormFlavor*)


Options[FormFlavor]={Observable->All,Sparticle->All,IncludeSM->True,QCDRG->True,Ampfuncname->""};
FormFlavor[calcspecoutput_,opts:OptionsPattern[]]:=Block[{Heff,wilsonuse,obslist,obsoutput,procwant,spartwant,Heffuse,QSUSYuse,IncludeStandardModel},

QSUSYuse=calcspecoutput[[-1]];

wilsonuse=FFWilson[calcspecoutput,FilterRules[{opts},Options[FFWilson]]];

Heff=Tr[#[[-1,-1]]&/@wilsonuse];
obslist=DeleteDuplicates[#[[1,1]]&/@wilsonuse];

obsoutput=FFObservables[QSUSYuse,obslist,Heff,{opts}];

obsoutput
];

FormFlavor[calcspecoutput_,mode_,opts:OptionsPattern[]]:=Block[{ampname,optsnew},

Switch[mode,"Fast",ampname=ampfunc,"Acc",ampname=ampfuncAcc,_,ampname=ampfunc];
optsnew=Union[Complement[opts,FilterRules[{opts},Ampfuncname]],{Ampfuncname->ampname}];

FormFlavor[calcspecoutput,optsnew]
];


FFObsMeasure[status_,FFval_,{Expval_,Expunc_},{SMval_,SMunc_}]:=Block[{DiffVal,NetUnc},
(* status = 0   normal
          = 1   experimental UB only
          = 2   no theory prediction *)
Switch[status,
0,NetUnc=Sqrt[Expunc^2+SMunc^2]; DiffVal=Expval;,
1,NetUnc=Expval; DiffVal=0;,
2,NetUnc=Expval+2*Expunc; DiffVal=0;];
(FFval-DiffVal)/NetUnc]


(* takes FF ouput as input and tracks deviations *)
FFConstraints[FFout_]:=Block[{FFFlat=Flatten[FFout,1],FFval,status},
Table[FFval=Select[FFFlat,#[[1]]==X &][[1,2]];status=FFObsClass[X];
{X,FFObsMeasure[FFObsClass[X],FFval,{FFExpValue[X],FFExpUnc[X]},{FFSMValue[X],FFSMUnc[X]}],status}
,{X,$FFObsNameList}]]


(* ::Section:: *)
(*Function Information*)


FormFlavor::usage = "FormFlavor[{calcspecoutput}] evaluates loaded flavor observables from model spectrum output.";

FFConstraints::usage = "FFConstraints[FormFlavorOutput] converts FormFlavor output into a simple statistical constraint. 
Output of form {observable, X, status}, where status is
0 - existing theoretical prediction and measurement, X=(FFvalue-ExpValue)/\!\(\*SqrtBox[\(ExpUnc^2 + TheoryUnc^2\)]\)
1 - existing theoretical prediction, but experimental upper bound only, X=FFvalue/ExpUB
2 - experimental measurement, but no reliable theory prediction (e.g. \!\(\*SubscriptBox[\(\[CapitalDelta]m\), \(D\)]\)), X=FFvalue/(ExpVal+2ExpUnc)";



(* ::Section:: *)
(*End Package*)


EndPackage[];
