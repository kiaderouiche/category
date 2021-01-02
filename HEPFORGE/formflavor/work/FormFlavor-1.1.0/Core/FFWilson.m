(* ::Package:: *)

(* ::Title:: *)
(*FFWilson Package*)


(* ::Subtitle:: *)
(*Building and compiling amplitudes*)
(*Numerical Wilson coefficients*)


(* ::Section:: *)
(*Load library of one-loop integrals*)


Print["- Loading Loop Library"];

Get[FormFlavor`$FFPath<>"/Core/LoopIntegrals/LoopIntegralsAcc.m"];
B00comp=Compile[{{x,_Complex},{y,_Complex}},Evaluate[B00funcAcc[x,y]]];
B01comp=Compile[{{x,_Complex},{y,_Complex}},Evaluate[B01funcAcc[x,y]]];
B10comp=Compile[{{x,_Complex},{y,_Complex}},Evaluate[B10funcAcc[x,y]]];
B11comp=Compile[{{x,_Complex},{y,_Complex}},Evaluate[B11funcAcc[x,y]]];
C0comp0=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C0func0Acc[x,y,z]]];
C1comp0=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C1func0Acc[x,y,z]]];
C2comp0=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C2func0Acc[x,y,z]]];
C00comp0=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C00func0Acc[x,y,z]]];
C11comp0=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C11func0Acc[x,y,z]]];
C12comp0=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C12func0Acc[x,y,z]]];
C22comp0=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C22func0Acc[x,y,z]]];
C0comp1=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C0func1Acc[x,y,z]]];
C1comp1=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C1func1Acc[x,y,z]]];
C2comp1=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C2func1Acc[x,y,z]]];
C00comp1=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C00func1Acc[x,y,z]]];
C11comp1=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C11func1Acc[x,y,z]]];
C12comp1=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C12func1Acc[x,y,z]]];
C22comp1=Compile[{{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[C22func1Acc[x,y,z]]];
D0comp=Compile[{{q,_Complex},{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[D0funcAcc[q,x,y,z]]];
D00comp=Compile[{{q,_Complex},{x,_Complex},{y,_Complex},{z,_Complex}},Evaluate[D00funcAcc[q,x,y,z]]];

(*added to remove initialization lag *)
B00comp[110.,100.];
B01comp[110.,100.];
B10comp[110.,100.];
B11comp[110.,100.];
C0comp0[120.,110.,100.];
C1comp0[120.,110.,100.];
C2comp0[120.,110.,100.];
C00comp0[120.,110.,100.];
C11comp0[120.,110.,100.];
C12comp0[120.,110.,100.];
C22comp0[120.,110.,100.];
C0comp1[120.,110.,100.];
C1comp1[120.,110.,100.];
C2comp1[120.,110.,100.];
C00comp1[120.,110.,100.];
C11comp1[120.,110.,100.];
C12comp1[120.,110.,100.];
C22comp1[120.,110.,100.];
D0comp[130.,120.,110.,100.];
D00comp[130.,120.,110.,100.];

Get[FormFlavor`$FFPath<>"/Core/LoopIntegrals/LoopIntegrals.m"]


(* ::Section:: *)
(*Substitutions*)


(* ::Subsection:: *)
(*Integrals*)


FFRunningModes={"Fast","Acc"};

integralsublist["Acc"]={
B0i0[bb0,a__]->HoldForm[B00comp]@@{a},
B0i0[bb1,a__]->HoldForm[B10comp]@@{a},
B0i1[bb0,a__]->HoldForm[B01comp]@@{a},
B0i1[bb1,a__]->HoldForm[B11comp]@@{a},
C0i0[cc0,a__]->HoldForm[C0comp0]@@{a},
C0i0[cc1,a__]->HoldForm[C1comp0]@@{a},
C0i0[cc2,a__]->HoldForm[C2comp0]@@{a},
C0i0[cc00,a__]->HoldForm[C00comp0]@@{a},
C0i0[cc11,a__]->HoldForm[C11comp0]@@{a},
C0i0[cc12,a__]->HoldForm[C12comp0]@@{a},
C0i0[cc22,a__]->HoldForm[C22comp0]@@{a},
C0i1[cc0,a__]->HoldForm[C0comp1]@@{a},
C0i1[cc1,a__]->HoldForm[C1comp1]@@{a},
C0i1[cc2,a__]->HoldForm[C2comp1]@@{a},
C0i1[cc00,a__]->HoldForm[C00comp1]@@{a},
C0i1[cc11,a__]->HoldForm[C11comp1]@@{a},
C0i1[cc12,a__]->HoldForm[C12comp1]@@{a},
C0i1[cc22,a__]->HoldForm[C22comp1]@@{a},
D0i[dd0,a__]->HoldForm[D0comp]@@{a},
D0i[dd00,a__]->HoldForm[D00comp]@@{a}};

integralsublist["Fast"]={B0i0[bb0,a__]->B0func0[a],B0i0[bb1,a__]->B1func0[a],B0i1[bb0,a__]->B0func1[a],B0i1[bb1,a__]->B1func1[a],
C0i0[cc0,a__]->C0func0[a],C0i1[cc0,a__]->C0func1[a],
C0i0[cc1,a__]->C1func0[a],C0i1[cc1,a__]->C1func1[a],
C0i0[cc2,a__]->C2func0[a],C0i1[cc2,a__]->C2func1[a],
C0i0[cc00,a__]->C00func0[a],C0i1[cc00,a__]->C00func1[a],
C0i0[cc11,a__]->C11func0[a],C0i1[cc11,a__]->C11func1[a],
C0i0[cc12,a__]->C12func0[a],C0i1[cc12,a__]->C12func1[a],
C0i0[cc22,a__]->C22func0[a],C0i1[cc22,a__]->C22func1[a],
D0i[dd0,a__]->D0func[a],
D0i[dd00,a__]->D00func[a],
D0i[dd1,a__]->D1func[a],
D0i[dd2,a__]->D2func[a],
D0i[dd3,a__]->D3func[a],
D0i[dd11,a__]->D11func[a],
D0i[dd12,a__]->D12func[a],
D0i[dd22,a__]->D22func[a]};


(* ::Subsection::Closed:: *)
(*SM subs*)


CKMSub={CKM[a_,b_]:>GetSMParameter["CKM"][[a,b]],CKMC[a_,b_]:>Conjugate[GetSMParameter["CKM"][[a,b]]]};


SMParamSub={Alfas->alfas,Alfas2->alfas^2,Mf2[3,a_]:>mquarkdownsq[[a]],Mf2[4,a_]:>mquarkupsq[[a]]};


(* ::Subsection:: *)
(*Other subs*)


ColorContractionSub={SUNT[Col1,Col2]->1,SUNT[Col3,Col4]->1,SUNT[Glu3,Col2,Col1]->1,SUNT[Glu3,Col1,Col2]->1,SUNT[__]->0};


IndexSub={SumOver[ind_,n_]z_.:>Sum[z,{ind,1,n}]};


(* ::Section:: *)
(*Building & Compiling*)


LoadAmp[AmpName_]:=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>AmpName]
LoadSubAmp[AmpName_]:=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/SubAmps/"<>AmpName]
WriteSubAmp[Amp_,OutName_]:=Put[Amp,FormFlavor`$FFModelPath<>"/ObservableAmps/SubAmps/"<>OutName]


(* ::Subsection:: *)
(*Building*)


BuildFF[proclist_,mode_]:= Block[{time,procname,ampval,ampname,topology,
amplitudes,tempout,subProcessListing,strname,modeset,tempx1,tempx2,tempx3,tempx4}, 
time=AbsoluteTiming[
iproc=0;
modeset=If[MemberQ[FFRunningModes,mode],mode,FFRunningModes[[1]]];
tempx1=PrintTemporary["Building "<>modeset<>" sub-amplitudes (this takes a few minutes)"];
tempx2=PrintTemporary[ProgressIndicator[Dynamic[iproc],{1,Dynamic[Length[amplitudes]]}]," on amplitude ",Dynamic[iproc]," of ",Dynamic[Length[amplitudes]]," in ",Dynamic[procname]];
tempx3=PrintTemporary[ProgressIndicator[Dynamic[nproc],{1,Length[proclist]}]," on process ",Dynamic[nproc]," of ",Length[proclist]];
tempx4=PrintTemporary["Buildling ",Dynamic[procname]," ",Dynamic[ampname]," ",Dynamic[topology]];
Do[
amplitudes=LoadAmp[proclist[[nproc]]];
procname=amplitudes[[1,1]];
subProcessListing={};
Do[
ampname=amplitudes[[iproc,2]];
topology=amplitudes[[iproc,3]];
ampval=ConvertSubAmp[ampname,amplitudes[[iproc,-1]],modeset]; 
strname=StringReplace[proclist[[nproc]],".m"->"_"<>modeset<>"_"<>ToString[iproc]<>".m"];
WriteSubAmp[{procname,ampname,topology,ampval},strname];
subProcessListing=Append[subProcessListing,strname];
,{iproc,1,Length[amplitudes]}];
strname=StringReplace[proclist[[nproc]],".m"->"_"<>modeset<>"_SubAmps.m"];
WriteSubAmp[subProcessListing,strname];
,{nproc,1,Length[proclist]}];
 ][[1]]; 
NotebookDelete[tempx1];NotebookDelete[tempx2];
NotebookDelete[tempx3];NotebookDelete[tempx4];
Print["Building "<>modeset<>" sub-amplitudes took ",time," seconds"];]


BuildFF[proclist_]:=Block[{mode},
Do[
mode=FFRunningModes[[imode]];
BuildFF[proclist,mode];
,{imode,1,Length[FFRunningModes]}];
];


CleanBuiltFFFiles[]:=Module[{FileList,check},
check=InputString["Are you sure you wish to remove all built files? 
This will remove all *.m files in the directory "<> FormFlavor`$FFModelPath<>"/ObservableAmps/SubAmps/(these can be regenerated at anytime with BuildFF[proclist]), freeing up approximately 300 MB of disk space?  Y/N"];
If[check=="Y",
FileList=FileNames["*.m",FormFlavor`$FFModelPath<>"/ObservableAmps/SubAmps/"];
If[Length[FileList]==0,"No files found to remove!",
DeleteFile[FileList];
Print["All *.m files in the directory "<> FormFlavor`$FFModelPath<>"/ObservableAmps/SubAmps/ have been removed!"];],
Print["No files have been removed"];]
]


(* ::Subsection:: *)
(*Compiling*)


CompileFFnoBuild[proclist_,mode_]:= Block[{modeset,time,procname,ampname,topology,amplitudes,tempout}, 
time=AbsoluteTiming[
Clear[compiledlist];
compiledlist={};
iproc=0;
modeset=If[MemberQ[FFRunningModes,mode],mode,FFRunningModes[[1]]];
$FFActiveRunningMode=modeset;
PrintTemporary["Compiling all "<>modeset<>" amplitudes (this takes a few minutes)"];
PrintTemporary[ProgressIndicator[Dynamic[iproc],{1,Dynamic[Length[amplitudes]]}]," on amplitude ",Dynamic[iproc]," of ",Dynamic[Length[amplitudes]]," in ",Dynamic[procname]];
PrintTemporary[ProgressIndicator[Dynamic[nproc],{1,Length[proclist]}]," on process ",Dynamic[nproc]," of ",Length[proclist]];
PrintTemporary["Compiling ",Dynamic[procname]," ",Dynamic[ampname]," ",Dynamic[topology]];
Do[
amplitudes=LoadAmp[proclist[[nproc]]];
procname=amplitudes[[1,1]];
Do[
ampname=amplitudes[[iproc,2]];
topology=amplitudes[[iproc,3]];
Switch[modeset,"Fast",
ampfunc[procname,ampname,topology]=CompileAmp[ampname,amplitudes[[iproc,-1]],modeset]; 
,"Acc",
ampfuncAcc[procname,ampname,topology]=CompileAmp[ampname,amplitudes[[iproc,-1]],modeset];
,_,0;
];
compiledlist=Join[compiledlist,{{procname,ampname,topology}}];
,{iproc,1,Length[amplitudes]}];
,{nproc,1,Length[proclist]}];
 ][[1]]; 
Print["Compilation took ",time," seconds"];
testCompile[mode];
]


CompileFFBuilt[proclist_,mode_]:= Block[{time,modeset,procname,ampname,topology,amplitudes,tempout,strname,amplist}, 
time=AbsoluteTiming[
Clear[compiledlist];
compiledlist={};
iproc=0;
modeset=If[MemberQ[FFRunningModes,mode],mode,FFRunningModes[[1]]];
$FFActiveRunningMode=modeset;

PrintTemporary["Compiling all built "<>modeset<>" amplitudes (this takes a few minutes)"];
PrintTemporary[ProgressIndicator[Dynamic[iproc],{1,Dynamic[Length[amplist]]}]," on amplitude ",Dynamic[iproc]," of ",Dynamic[Length[amplist]]," in ",Dynamic[procname]];
PrintTemporary[ProgressIndicator[Dynamic[nproc],{1,Length[proclist]}]," on process ",Dynamic[nproc]," of ",Length[proclist]];
PrintTemporary["Compiling ",Dynamic[procname]," ",Dynamic[ampname]," ",Dynamic[topology]];
Do[
strname=StringReplace[proclist[[nproc]],".m"->"_"<>modeset<>"_SubAmps.m"];
amplist=LoadSubAmp[strname];
Do[
amplitudes=Quiet[LoadSubAmp[amplist[[iproc]]]];
procname=amplitudes[[1]];
ampname=amplitudes[[2]];
topology=amplitudes[[3]];
Switch[modeset,
"Fast",
ampfunc[procname,ampname,topology]=CompileSubAmp[amplitudes[[-1]]]; 
,"Acc",
ampfuncAcc[procname,ampname,topology]=CompileSubAmp[amplitudes[[-1]]];
,_,0;
];
compiledlist=Join[compiledlist,{{procname,ampname,topology}}];
,{iproc,1,Length[amplist]}];
,{nproc,1,Length[proclist]}];
 ][[1]]; 
Print["Compilation took ",time," seconds"];
testCompile[mode];]


GetRunningModeAmpFuncDefault[]:=Which[$FFActiveRunningMode=="Fast",ampfunc,$FFActiveRunningMode=="Acc",ampfuncAcc,True,ampfunc]


CompileFF::unBuilt = "The built amplitudes for `1` in mode `2` appear to be absent.  
Running in unbuilt mode.  Consider building process files with BuildFF[proclist] to speed up compilation.";


CompileFF[proclist_,mode_]:=Block[{BuildExists},
(*test if build files exist*)
BuildExists=(Length[FileNames["*_"<>mode<>"_SubAmps.m",FormFlavor`$FFModelPath<>"/ObservableAmps/SubAmps/"]]>0);
If[BuildExists
,CompileFFBuilt[proclist,mode]
,Message[CompileFF::unBuilt,FormFlavor`$FFModel,mode];
CompileFFnoBuild[proclist,mode]
]]


(* When Compile mode unspecified, default to "Fast" *) 
CompileFF[proclist_]:=CompileFF[proclist,FFRunningModes[[1]]]
CompileFFBuilt[proclist_]:=CompileFFBuilt[proclist,FFRunningModes[[1]]]
CompileFFnoBuild[proclist_]:=CompileFFnoBuild[proclist,FFRunningModes[[1]]]


(* ::Section:: *)
(*Wilson Coefficients*)


Options[FFWilson]={Observable->All,Topology->All,Ampfuncname->""};
FFWilson[{calcspecoutput__},OptionsPattern[]]:=Block[{calcspecflat,timecount,ampfuncname,topologywant,wilsonouttemp,oplisttemp,procwant,wantlist},
procwant=OptionValue[Observable];
topologywant=OptionValue[Topology];
ampfuncname=OptionValue[Ampfuncname];
If[ampfuncname=="",ampfuncname=GetRunningModeAmpFuncDefault[]];

calcspecflat=Flatten[{calcspecoutput}];

If[TrueQ[procwant==All],
wantlist=compiledlist
,
wantlist=Select[compiledlist,#[[1]]==procwant&];
];
If[!TrueQ[topologywant==All],
wantlist=Select[wantlist,#[[2]]==topologywant&];
];
Table[
wilsonouttemp=(ampfuncname@@wantlist[[i]])@@calcspecflat;
oplisttemp=(#@@wantlist[[i,2]])&/@Oplist;
{wantlist[[i]],{wilsonouttemp[[1]],wilsonouttemp[[2;;-1]].oplisttemp}},{i,1,Length[wantlist]}]]

FFWilson[{calcspecoutput__},mode_,opts:OptionsPattern[]]:=Block[{ampname,optsnew},

Switch[mode,"Fast",ampname=ampfunc,"Acc",ampname=ampfuncAcc,_,ampname=ampfunc];
optsnew=Union[Complement[opts,FilterRules[{opts},Ampfuncname]],{Ampfuncname->ampname}];

FFWilson[calcspecoutput,optsnew]
];


(* ::Section:: *)
(*Function Information*)


Wilson::usage = "Wilson[{calcspecoutput}] evaluates Wilson coefficients for each loaded process from model spectrum output.";

BuildFF::usage = "BuildFF[proclist] perform major subsitutions for amplitudes in {proclist} for faster compiling at the expense of diskspace (<0.5 GB) for all running modes.  Partially evaluated amplitudes are stored in the SubAmps directory.
BuildFF[proclist,mode] perform major subsitutions for amplitudes for faster compiling at the expense of diskspace for running mode {mode}.  Partially evaluated amplitudes are stored in the SubAmps directory.";

CleanBuiltFFFiles::usage = "CleanBuiltFFFiles[] remove all built amplitudes in the SubAmps directory.";

CompileFF::usage = "CompileFF[proclist,mode] compiles all processes in {proclist} in running mode {mode}. 
CompileFF[proclist] compiles all processes in {proclist} in running mode \"Fast\".
Compiles sets default running mode $FFActiveRunningMode={mode}.";

CompileFFnoBuild::usage = "CompileFFnoBuild[proclist,mode] ignores built amplitudes to compile all processes in {proclist} in running mode {mode}.";
