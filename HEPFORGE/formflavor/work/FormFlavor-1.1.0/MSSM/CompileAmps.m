(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*Compile Amps (MSSM)*)


(* ::Section:: *)
(*Functions for compiling amps*)


Print["- Loading Amplitude Compiler"];


SMnumsubinit=Block[{s\[Theta]w,c\[Theta]w,mW,mZ,mt,mb,mc,ms,mu,md,me,m\[Mu],m\[Tau],vhVEV,\[Alpha]EMin},
vhVEV=GetSMParameter["vhVEV"];
mW=GetSMParameter["mW"];
mZ=GetSMParameter["mZ"];
\[Alpha]EMin=GetSMParameter["\[Alpha]EM@mZ"];
s\[Theta]w=GetSMParameter["s\[Theta]w"];
c\[Theta]w=Sqrt[1-s\[Theta]w^2];

mb=GetSMParameter["mb@mt"];
ms=GetSMParameter["ms@mt"];
md=GetSMParameter["md@mt"];
mt=GetSMParameter["mt@mt"];
mc=GetSMParameter["mc@mt"];
mu=GetSMParameter["mu@mt"];
me=GetSMParameter["me"];
m\[Mu]=GetSMParameter["m\[Mu]"];
m\[Tau]=GetSMParameter["m\[Tau]"];

(* Names of SM parmeters in FeynArts *)
{CW->c\[Theta]w,CW2->c\[Theta]w^2,SW->s\[Theta]w,SW2->s\[Theta]w^2,MW->mW,MW2->mW^2,MZ->mZ,MZ2->mZ^2,
MB->mb,MB2->mb^2,MS->ms,MS2->ms^2,MC->mc,MC2->mc^2,MT->mt,MT2->mt^2,
MU->mu,MU2->mu^2,MD->md,MD2->md^2,
Alfa->\[Alpha]EMin,Alfa2->\[Alpha]EMin^2,ME->me,ME2->me^2,MM->m\[Mu],MM2->m\[Mu]^2,ML->m\[Tau],ML2->m\[Tau]^2,vv->vhVEV,EL->Sqrt[4*\[Pi]*Alfa],GS->Sqrt[4*\[Pi]*Alfas]}];


(* ::Subsection:: *)
(*MSSM Substitutions*)


SfermMixingSub1={UASf[aa_,ind_,j_,"none"]->UASf[aa,ind,j],UASfC[aa_,ind_,j_,"none"]->UASfC[aa,ind,j]};

SfermMixingSub2={X_[aa_,i_,j_,y_]:>Sum[ToExpression[y][ind,i]X[aa,ind,j],{ind,1,3}]/;i<=3&&(y==="CKM"||y==="CKMC"||y==="CKMCtr"||y==="CKMtr"),
X_[aa_,i_,j_,y_]:>Sum[ToExpression[y][ind,i-3]X[aa,ind+3,j],{ind,1,3}]/;i>3&&(y==="CKM"||y==="CKMC"||y==="CKMCtr"||y==="CKMtr")};

SfermMixingSub3={CKMCtr[i_,j_]->CKMC[j,i],CKMtr[i_,j_]->CKM[j,i]};


MSSMParamSub={MGl2->Abs[mgl]^2,Mino3->mgl,Mino3C->Conjugate[mgl],
UASf[a_,b_,4]:>uasfd[a,b],UASfC[a_,b_,4]:>Conjugate[uasfd[a,b]],
UASf[a_,b_,3]:>uasfu[a,b],UASfC[a_,b_,3]:>Conjugate[uasfu[a,b]],
UASf[a_,b_,2]:>uasfe[a,b],UASfC[a_,b_,2]:>Conjugate[uasfe[a,b]],
UASf[a_,b_,1]:>uasf\[Nu][a,b],UASfC[a_,b_,1]:>Conjugate[uasf\[Nu][a,b]],
MASf2[a_,4]:>masf2d[a],MASf2[a_,3]:>masf2u[a],
MASf2[a_,2]:>masf2e[a],MASf2[a_,1]:>masf2\[Nu][a],
MCha[a_]:>mcha[a],MCha2[a_]:>mcha[a]^2,MNeu[a_]:>mneu[a],
MNeu2[a_]:>mneu[a]^2,UCha[a_,b_]:>ucha[a,b],VCha[a_,b_]:>vcha[a,b],
UChaC[a_,b_]:>Conjugate[ucha[a,b]],VChaC[a_,b_]:>Conjugate[vcha[a,b]],
ZNeu[a_,b_]:>zneu[a,b],ZNeuC[a_,b_]:>Conjugate[zneu[a,b]],
Mh0->mhvec[1],Mh02->mhvec[1]^2,MHH->mhvec[2],MHH2->mhvec[2]^2,
MA0->mhvec[3],MA02->mhvec[3]^2,MHp->mhvec[4],
MHp2->mhvec[4]^2,MUE->mu,MUEC->Conjugate[mu],
af[4,a_,b_]:>afd[a,b],afc[4,a_,b_]:>Conjugate[afd[a,b]],
af[3,a_,b_]:>afu[a,b],afc[3,a_,b_]:>Conjugate[afu[a,b]],
af[2,a_,b_]:>afe[a,b],afc[2,a_,b_]:>Conjugate[afe[a,b]],
Af[4,a_,b_]:>afd[a,b],AfC[4,a_,b_]:>Conjugate[afd[a,b]],
Af[3,a_,b_]:>afu[a,b],AfC[3,a_,b_]:>Conjugate[afu[a,b]],
Af[2,a_,b_]:>afe[a,b],AfC[2,a_,b_]:>Conjugate[afe[a,b]],
vhDown->vv cb,vhUp->vv sb};


MSSMTan\[Beta]Sub={sb->tan\[Beta]/Sqrt[1+tan\[Beta]^2],cb->1/Sqrt[1+tan\[Beta]^2],sa->Sin[\[Alpha]],ca->Cos[\[Alpha]]}; 


(* ::Subsection:: *)
(*Compiled Function Variable List*)


$FFCompileVarList={{masf2d[1],_Real},{masf2d[2],_Real},{masf2d[3],_Real},{masf2d[4],_Real},{masf2d[5],_Real},{masf2d[6],_Real},
{uasfd[1,1],_Complex},{uasfd[1,2],_Complex},{uasfd[1,3],_Complex},{uasfd[1,4],_Complex},{uasfd[1,5],_Complex},{uasfd[1,6],_Complex},
{uasfd[2,1],_Complex},{uasfd[2,2],_Complex},{uasfd[2,3],_Complex},{uasfd[2,4],_Complex},{uasfd[2,5],_Complex},{uasfd[2,6],_Complex},
{uasfd[3,1],_Complex},{uasfd[3,2],_Complex},{uasfd[3,3],_Complex},{uasfd[3,4],_Complex},{uasfd[3,5],_Complex},{uasfd[3,6],_Complex},
{uasfd[4,1],_Complex},{uasfd[4,2],_Complex},{uasfd[4,3],_Complex},{uasfd[4,4],_Complex},{uasfd[4,5],_Complex},{uasfd[4,6],_Complex},
{uasfd[5,1],_Complex},{uasfd[5,2],_Complex},{uasfd[5,3],_Complex},{uasfd[5,4],_Complex},{uasfd[5,5],_Complex},{uasfd[5,6],_Complex},
{uasfd[6,1],_Complex},{uasfd[6,2],_Complex},{uasfd[6,3],_Complex},{uasfd[6,4],_Complex},{uasfd[6,5],_Complex},{uasfd[6,6],_Complex},
{masf2u[1],_Real},{masf2u[2],_Real},{masf2u[3],_Real},{masf2u[4],_Real},{masf2u[5],_Real},{masf2u[6],_Real},{uasfu[1,1],_Complex},
{uasfu[1,2],_Complex},{uasfu[1,3],_Complex},{uasfu[1,4],_Complex},{uasfu[1,5],_Complex},{uasfu[1,6],_Complex},{uasfu[2,1],_Complex},
{uasfu[2,2],_Complex},{uasfu[2,3],_Complex},{uasfu[2,4],_Complex},{uasfu[2,5],_Complex},{uasfu[2,6],_Complex},{uasfu[3,1],_Complex},
{uasfu[3,2],_Complex},{uasfu[3,3],_Complex},{uasfu[3,4],_Complex},{uasfu[3,5],_Complex},{uasfu[3,6],_Complex},{uasfu[4,1],_Complex},
{uasfu[4,2],_Complex},{uasfu[4,3],_Complex},{uasfu[4,4],_Complex},{uasfu[4,5],_Complex},{uasfu[4,6],_Complex},{uasfu[5,1],_Complex},
{uasfu[5,2],_Complex},{uasfu[5,3],_Complex},{uasfu[5,4],_Complex},{uasfu[5,5],_Complex},{uasfu[5,6],_Complex},{uasfu[6,1],_Complex},
{uasfu[6,2],_Complex},{uasfu[6,3],_Complex},{uasfu[6,4],_Complex},{uasfu[6,5],_Complex},{uasfu[6,6],_Complex},{mgl,_Complex},
{mcha[1],_Real},{mcha[2],_Real},{ucha[1,1],_Complex},{ucha[1,2],_Complex},{ucha[2,1],_Complex},{ucha[2,2],_Complex},
{vcha[1,1],_Complex},{vcha[1,2],_Complex},{vcha[2,1],_Complex},{vcha[2,2],_Complex},{mneu[1],_Real},{mneu[2],_Real},
{mneu[3],_Real},{mneu[4],_Real},{zneu[1,1],_Complex},{zneu[1,2],_Complex},{zneu[1,3],_Complex},{zneu[1,4],_Complex},
{zneu[2,1],_Complex},{zneu[2,2],_Complex},{zneu[2,3],_Complex},{zneu[2,4],_Complex},{zneu[3,1],_Complex},{zneu[3,2],_Complex},
{zneu[3,3],_Complex},{zneu[3,4],_Complex},{zneu[4,1],_Complex},{zneu[4,2],_Complex},{zneu[4,3],_Complex},{zneu[4,4],_Complex},
{mhvec[1],_Real},{mhvec[2],_Real},{mhvec[3],_Real},{mhvec[4],_Real},{mu,_Complex},{tan\[Beta],_Real},{\[Alpha],_Real},{afd[1,1],_Complex},{afd[1,2],_Complex},
{afd[1,3],_Complex},{afd[2,1],_Complex},{afd[2,2],_Complex},{afd[2,3],_Complex},{afd[3,1],_Complex},{afd[3,2],_Complex},
{afd[3,3],_Complex},{afu[1,1],_Complex},{afu[1,2],_Complex},{afu[1,3],_Complex},{afu[2,1],_Complex},{afu[2,2],_Complex},
{afu[2,3],_Complex},{afu[3,1],_Complex},{afu[3,2],_Complex},{afu[3,3],_Complex},
{masf2e[1],_Real},{masf2e[2],_Real},{masf2e[3],_Real},{masf2e[4],_Real},{masf2e[5],_Real},{masf2e[6],_Real},
{uasfe[1,1],_Complex},{uasfe[1,2],_Complex},{uasfe[1,3],_Complex},{uasfe[1,4],_Complex},{uasfe[1,5],_Complex},{uasfe[1,6],_Complex},
{uasfe[2,1],_Complex},{uasfe[2,2],_Complex},{uasfe[2,3],_Complex},{uasfe[2,4],_Complex},{uasfe[2,5],_Complex},{uasfe[2,6],_Complex},
{uasfe[3,1],_Complex},{uasfe[3,2],_Complex},{uasfe[3,3],_Complex},{uasfe[3,4],_Complex},{uasfe[3,5],_Complex},{uasfe[3,6],_Complex},
{uasfe[4,1],_Complex},{uasfe[4,2],_Complex},{uasfe[4,3],_Complex},{uasfe[4,4],_Complex},{uasfe[4,5],_Complex},{uasfe[4,6],_Complex},
{uasfe[5,1],_Complex},{uasfe[5,2],_Complex},{uasfe[5,3],_Complex},{uasfe[5,4],_Complex},{uasfe[5,5],_Complex},{uasfe[5,6],_Complex},
{uasfe[6,1],_Complex},{uasfe[6,2],_Complex},{uasfe[6,3],_Complex},{uasfe[6,4],_Complex},{uasfe[6,5],_Complex},{uasfe[6,6],_Complex},
{masf2\[Nu][1],_Real},{masf2\[Nu][2],_Real},{masf2\[Nu][3],_Real},
{uasf\[Nu][1,1],_Complex},{uasf\[Nu][1,2],_Complex},{uasf\[Nu][1,3],_Complex},
{uasf\[Nu][2,1],_Complex},{uasf\[Nu][2,2],_Complex},{uasf\[Nu][2,3],_Complex},
{uasf\[Nu][3,1],_Complex},{uasf\[Nu][3,2],_Complex},{uasf\[Nu][3,3],_Complex},
{afe[1,1],_Complex},{afe[1,2],_Complex},{afe[1,3],_Complex},
{afe[2,1],_Complex},{afe[2,2],_Complex},{afe[2,3],_Complex},
{afe[3,1],_Complex},{afe[3,2],_Complex},{afe[3,3],_Complex},
{alfas,_Real},{QSUSY,_Real}};


(* ::Subsection:: *)
(*Compiling*)


(* must be named CompileAmp *)
CompileAmp[ampname_,amplitude_,mode_]:=Module[{modeset,amplitudestemp,oplisttemp},

modeset=If[MemberQ[FFRunningModes,mode],mode,FFRunningModes[[1]]];

oplisttemp=(#@@ampname)&/@Oplist;

amplitudestemp=Join[{QSUSY},D[amplitude,{oplisttemp}]/.SMnumsubinit
/.ColorContractionSub//.IndexSub
/.SfermMixingSub1/.SfermMixingSub2/.SfermMixingSub3
/.CKMSub/.SMnumsubinit/.integralsublist[modeset]
/.MSSMParamSub/.MSSMTan\[Beta]Sub
/.SMParamSub/.SMnumsubinit/. \[Delta]->1/inv\[Delta]/.inv\[Delta]->0];

ReleaseHold[
Compile[Evaluate[$FFCompileVarList]
,Evaluate[amplitudestemp]
,CompilationOptions->{"ExpressionOptimization"->True}
]]];


(* ::Subsubsection:: *)
(*Building*)


(* must be named ConvertSubAmp *)
ConvertSubAmp[ampname_,amp_,mode_]:=Module[{oplisttemp,modeset},

modeset=If[MemberQ[FFRunningModes,mode],mode,FFRunningModes[[1]]];
oplisttemp=(#@@ampname)&/@Oplist;

Join[{QSUSY},D[amp,{oplisttemp}]/.SMnumsubinit
/.ColorContractionSub//.IndexSub
/.SfermMixingSub1/.SfermMixingSub2/.SfermMixingSub3
/.CKMSub/.SMnumsubinit/.integralsublist[modeset]
/.MSSMParamSub/.MSSMTan\[Beta]Sub
/.SMParamSub/.SMnumsubinit/.\[Delta]->1/inv\[Delta]/.inv\[Delta]->0]]


(* must be named CompileSubAmp *)
CompileSubAmp[amplitude_]:=Block[{},
ReleaseHold[
Compile[Evaluate[$FFCompileVarList]
,Evaluate[amplitude]
,CompilationOptions->{"ExpressionOptimization"->True}
]]];


(* ::Subsubsection:: *)
(*Test Compile*)


(* must be named testCompile *)
testCompile::NAN = "Compiliation of `1` amplitudes gives non-numeric argument in process `2`.";  
testCompile[runningmode_]:=Block[{dataStore,testRun,ii,jj,testworked=True},
PrintTemporary["Testing for successful compile"];
testRun=FormFlavor[CalcSpec[gaugino[{600,400,300}],higgs[{250,125,2000,10,\[Pi]/2-ArcTan[10.]}],
squarkQLL[{{500^2,800+100I,120},{800-100I,530^2,220},{120,220,720^2}}],
squarkURR[{{550^2,120,263},{120,600^2,323},{263,323,300^2}}],
squarkDRR[{{200^2,40,70},{40,200^2,90},{70,90,700^2}}],
sleptonLL[{{350^2,0,0},{0,350^2,0},{0,0,320^2}}],
sleptonRR[{{550^2,100,120},{100,550^2,220},{120,220,420^2}}],
Au[{{10,100,10},{20,200,40},{30,100,300}}],
Ad[{{100,80,50},{40,240,77},{80,230,320}}],
Ae[{{10,3,5},{3,20,7},{2,3,30}}]],
{Ampfuncname->Which[runningmode=="Fast",ampfunc,runningmode=="Acc",ampfuncAcc,True,ampfunc]}];

For[ii=1,ii<=Length[testRun],ii++,
For[jj=1,jj<=Length[testRun[[ii]]],jj++,
If[!NumericQ[testRun[[ii,jj,2]]],Message[testCompile::NAN,runningmode,testRun[[ii,jj,1]]];testworked=False;]
]];

If[testworked,Print["Compiliation of ",runningmode," mode successful"]];
]


(* ::Section:: *)
(*Function Information*)


ConvertSubAmp::usage = "ConvertSubAmp[amp,mode] expand amplitude {amp} for mode {mode} and substitute parameter names before storing in SubAmps directory.";

CompileSubAmp::usage = "CompileSubAmp[amp] compilation instructions for built amplitudes.";

CompileAmp::usage = "CompileAmp[amp,mode] compilation instructions for unbuilt amplitudes in mode {mode}.";

testCompile::usage = "testCompile[mode] automatically run after compiling to check that a simple point evaluates to numerical expressions.";

