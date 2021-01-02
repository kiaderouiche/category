(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*Calc Amps / SLHA2 Readin (MSSM)*)


(* ::Section:: *)
(*Functions for calculating spectrum*)


Print["- Loading Spectrum Calculator"];


(* ::Subsection::Closed:: *)
(*Calc Spec*)


(* PRIMARY REFERENCE FOR FEYNARTS/FORMCALC MSSM CONVENTIONS: 1309.1692 *)


CalcSpec::tachyon="Soft parameters produced a `1` tachyon";
CalcSpec[gauginoin_,higgsin_,squarkQLLin_,squarkURRin_,squarkDRRin_,sleptonLLin_,sleptonRRin_,Auin_,Adin_,Aein_,\[Mu]SUSYin_:-999]:=Block[
{gaugino,higgs,squarkQLL,squarkURR,squarkDRR,sleptonLL,sleptonRR,Au,Ad,Ae,M1use,M2use,M3use,\[Mu]use,mh,mA,\[Alpha],
squarkQLLmat,squarkURRmat,squarkDRRmat,sleptonLLmat,sleptonRRmat,Aulist,Adlist,Aelist,sin\[Beta],cos\[Beta],cot\[Beta],tan\[Beta],
Mut2LLmat,Mut2RRmat,Mut2LRmat,Mut2RLmat,Mut2,Mutvals,Mutvecs,UutMixR,UutMixL,
Mdt2LLmat,Mdt2RRmat,Mdt2LRmat,Mdt2RLmat,Mdt2,Mdtvals,Mdtvecs,UdtMixR,UdtMixL,
Met2LLmat,Met2RRmat,Met2LRmat,Met2RLmat,Met2,Metvals,Metvecs,UetMixR,UetMixL,
M\[Nu]t2,M\[Nu]tvals,M\[Nu]tvecs,U\[Nu]tMixR,U\[Nu]tMixL,
Mneut,ULneuteig,ULneutvec,URneuteig,URneutvec,neuteig,UL2,
Mchargino,ULchgeig,ULchgvec,URchgeig,URchgvec,chargeig,
Aumat,Admat,Aemat,muval,\[Mu]SUSY,Mslvals,mhvals,mgluino,vhDown,vhUp,
mt,mb,mc,ms,md,mu,me,m\[Mu],m\[Tau],MWW,MZZ,\[Alpha]EMin,s\[Theta]w,c\[Theta]w,vhVEV,CKMnum},

If[!TrueQ[Head[gauginoin]==gaugino]||!TrueQ[Head[higgsin]==higgs]||
!TrueQ[Head[squarkQLLin]==squarkQLL]||!TrueQ[Head[squarkURRin]==squarkURR]||
!TrueQ[Head[squarkDRRin]==squarkDRR]||(*!TrueQ[Head[sleptonin]==slepton]||*)
!TrueQ[Head[sleptonLLin]==sleptonLL]||
!TrueQ[Head[sleptonRRin]==sleptonRR]||
!TrueQ[Head[Auin]==Au]||
!TrueQ[Head[Adin]==Ad]||
!TrueQ[Head[Aein]==Ae],Print["Error in Spectrum input format incorrect"];];

{M1use,M2use,M3use}=SetPrecision[Identity@@gauginoin,FormFlavor`$FFprecision];
{\[Mu]use,mh,mA,tan\[Beta],\[Alpha]}=SetPrecision[Identity@@higgsin,FormFlavor`$FFprecision];
squarkQLLmat=SetPrecision[Identity@@squarkQLLin,FormFlavor`$FFprecision];
squarkURRmat=SetPrecision[Identity@@squarkURRin,FormFlavor`$FFprecision];
squarkDRRmat=SetPrecision[Identity@@squarkDRRin,FormFlavor`$FFprecision];
sleptonLLmat=SetPrecision[Identity@@sleptonLLin,FormFlavor`$FFprecision];
sleptonRRmat=SetPrecision[Identity@@sleptonRRin,FormFlavor`$FFprecision];
(*sleptonlist=SetPrecision[Identity@@sleptonin,FormFlavor`$FFprecision];*)
Aulist=SetPrecision[Identity@@Auin,FormFlavor`$FFprecision];
Adlist=SetPrecision[Identity@@Adin,FormFlavor`$FFprecision];
Aelist=SetPrecision[Identity@@Aein,FormFlavor`$FFprecision];

CKMnum=GetSMParameter["CKM"];
mt=GetSMParameter["mt@mt"];
mb=GetSMParameter["mb@mt"];
mc=GetSMParameter["mc@mt"];
ms=GetSMParameter["ms@mt"];
mu=GetSMParameter["mu@mt"];
md=GetSMParameter["md@mt"];
me=GetSMParameter["me"];
m\[Mu]=GetSMParameter["m\[Mu]"];
m\[Tau]=GetSMParameter["m\[Tau]"];
MWW=GetSMParameter["mW"];
MZZ=GetSMParameter["mZ"];

\[Alpha]EMin=GetSMParameter["\[Alpha]EM@low"];
vhVEV=GetSMParameter["vhVEV"];
s\[Theta]w=GetSMParameter["s\[Theta]w"];
c\[Theta]w=Sqrt[1-s\[Theta]w^2];

sin\[Beta]= tan\[Beta]/Sqrt[1+tan\[Beta]^2];
cos\[Beta]= 1/Sqrt[1+tan\[Beta]^2];
cot\[Beta]= 1/tan\[Beta];
vhDown= vhVEV cos\[Beta];
vhUp= vhVEV sin\[Beta];

(* UdtMixL(s,f) = UASf(s,f,4) *)
(* UutMixL(s,f) = UASf(s,f,3) *)
(* UASf(s,f) squark(f) = squark(s) flavor basis -> mass eigenbasis *) 
(* UASfC(s,f') msqdiag(s) UASf(s,f) = msqmat(f',f) *)
(* sources http://indico.cern.ch/event/1308/session/1/contribution/62/material/slides/0.pdf, arXiv:1311.5546v4, etc *)

(* up squarks *)
(* A-terms are 3x3 matrices of the form A_{i,j} where i is an SU(3)_Q index and j is an SU(3)_{U,D} index. Confirmed by examining the amplitudes that contain the A-terms 
explicitly, e.g. Bs->mumu gluino Z-penguins *)
(* Furthermore, the A-terms appear there as UASf[All5,Ind2,4,"none"] afc[4,Ind2,Ind1] UASfC[All6,3+Ind1,4,"none"]. This fits with the A-terms appearing in the squark mass matrix as
M^2 = {{mQ^2,A^*},{A^T,mU^2}}, given that the squark mass matrix is diagonalized by UASf M^2 UASf^{dagger} = M_ {diag}^2 *)
(* These are also the conventions indicated in the references 1309.1692 and the Sparticles textbook. 
It is NOT the conventions in Martin who defines (a_u)_{ij} with i being an SU(3)_U index and j being an SU(3)_Q index *)
Mut2LLmat=SetPrecision[CKMnum.squarkQLLmat.Conjugate[Transpose[CKMnum]]+(1/2-2/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)MZZ^2 IdentityMatrix[3]+DiagonalMatrix[{mu^2,mc^2,mt^2}],FormFlavor`$FFprecision];
Mut2RRmat=SetPrecision[squarkURRmat+(2/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)MZZ^2 IdentityMatrix[3]+DiagonalMatrix[{mu^2,mc^2,mt^2}],FormFlavor`$FFprecision];
Mut2LRmat=SetPrecision[{{-mu*cot\[Beta]*\[Mu]use,0,0},{0,-mc*cot\[Beta]*\[Mu]use,0},{0,0,-mt*cot\[Beta]*\[Mu]use}}+vhUp Conjugate[Aulist],FormFlavor`$FFprecision];
Mut2RLmat=Transpose[Conjugate[Mut2LRmat]];
Mut2= SetPrecision[ArrayFlatten[{{Mut2LLmat,Mut2LRmat},{Mut2RLmat,Mut2RRmat}}],FormFlavor`$FFprecision];
{Mutvals,Mutvecs}=SetPrecision[Eigensystem[Mut2],FormFlavor`$FFprecision];
UutMixR=Transpose[Mutvecs];
UutMixL=Transpose[Conjugate[UutMixR]]; (* This is UASf *)

(* down squarks *)
Mdt2LLmat=SetPrecision[squarkQLLmat+(-1/2+1/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)MZZ^2 IdentityMatrix[3]+DiagonalMatrix[{md^2,ms^2,mb^2}],FormFlavor`$FFprecision];
Mdt2RRmat=SetPrecision[squarkDRRmat+(-1/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)MZZ^2 IdentityMatrix[3]+DiagonalMatrix[{md^2,ms^2,mb^2}],FormFlavor`$FFprecision];
Mdt2LRmat=SetPrecision[{{-md*tan\[Beta]*\[Mu]use,0,0},{0,-ms*tan\[Beta]*\[Mu]use,0},{0,0,-mb*tan\[Beta]*\[Mu]use}}+vhDown Conjugate[Adlist],FormFlavor`$FFprecision];
Mdt2RLmat=Transpose[Conjugate[Mdt2LRmat]];
Mdt2= SetPrecision[ArrayFlatten[{{Mdt2LLmat,Mdt2LRmat},{Mdt2RLmat,Mdt2RRmat}}],FormFlavor`$FFprecision];
{Mdtvals,Mdtvecs}=SetPrecision[Eigensystem[Mdt2],FormFlavor`$FFprecision];
UdtMixR=Transpose[Mdtvecs];
UdtMixL=Transpose[Conjugate[UdtMixR]]; (* This is UASf *)

(* neutralinos *)
(* According to 1309.1692, ZNeu^* Mneutralino ZNeu^dagger = Mdiag *)
Mneut=SetPrecision[{{M1use,0, -MZZ cos\[Beta] s\[Theta]w, MZZ sin\[Beta] s\[Theta]w },
{0,M2use,MZZ cos\[Beta] c\[Theta]w, -MZZ sin\[Beta] c\[Theta]w},
{-MZZ cos\[Beta] s\[Theta]w, MZZ cos\[Beta] c\[Theta]w,0, -\[Mu]use},
{MZZ sin\[Beta] s\[Theta]w, - MZZ sin\[Beta] c\[Theta]w, -\[Mu]use,0}},FormFlavor`$FFprecision];
{ULneuteig,ULneutvec}=SetPrecision[Eigensystem[Mneut.ConjugateTranspose[Mneut]],FormFlavor`$FFprecision];
{URneuteig,URneutvec}=SetPrecision[Eigensystem[ConjugateTranspose[Mneut].Mneut],FormFlavor`$FFprecision];
neuteig=SetPrecision[Diagonal[Conjugate[ULneutvec].Mneut.ConjugateTranspose[ULneutvec]],FormFlavor`$FFprecision];
UL2=DiagonalMatrix[Exp[I Arg[neuteig]/2]];
ULneutvec=UL2.ULneutvec; (* This is ZNeu *)
neuteig=SetPrecision[Diagonal[Conjugate[ULneutvec].Mneut.ConjugateTranspose[ULneutvec]],FormFlavor`$FFprecision];

(* charginos *)
(* According to 1309.1692, UCha^* Mchargino VCha^dagger = Mdiag *)
Mchargino=SetPrecision[{{M2use, Sqrt[2] MWW sin\[Beta]},{Sqrt[2] MWW cos\[Beta],\[Mu]use}},FormFlavor`$FFprecision];
{ULchgeig,ULchgvec}=SetPrecision[Eigensystem[Mchargino.ConjugateTranspose[Mchargino]],FormFlavor`$FFprecision];
{URchgeig,URchgvec}=SetPrecision[Eigensystem[ConjugateTranspose[Mchargino].Mchargino],FormFlavor`$FFprecision];
chargeig=SetPrecision[Diagonal[Conjugate[ULchgvec].Mchargino.Transpose[URchgvec]],FormFlavor`$FFprecision];
UL2=DiagonalMatrix[Exp[I Arg[chargeig]]];
ULchgvec=UL2.ULchgvec; (* This is UCha *)
URchgvec=Conjugate[URchgvec]; (* This is VCha *)
chargeig=SetPrecision[Diagonal[Conjugate[ULchgvec].Mchargino.ConjugateTranspose[URchgvec]],FormFlavor`$FFprecision];

(* sleptons *)
Met2LLmat=SetPrecision[sleptonLLmat+(-1/2+1 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)MZZ^2 IdentityMatrix[3]+DiagonalMatrix[{me^2,m\[Mu]^2,m\[Tau]^2}],FormFlavor`$FFprecision];
Met2RRmat=SetPrecision[sleptonRRmat+(-1 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)MZZ^2 IdentityMatrix[3]+DiagonalMatrix[{me^2,m\[Mu]^2,m\[Tau]^2}],FormFlavor`$FFprecision];
Met2LRmat=SetPrecision[{{-me*tan\[Beta]*\[Mu]use,0,0},{0,-m\[Mu]*tan\[Beta]*\[Mu]use,0},{0,0,-m\[Tau]*tan\[Beta]*\[Mu]use}}+vhDown Conjugate[Aelist],FormFlavor`$FFprecision];
Met2RLmat=Transpose[Conjugate[Met2LRmat]];
Met2= SetPrecision[ArrayFlatten[{{Met2LLmat,Met2LRmat},{Met2RLmat,Met2RRmat}}],FormFlavor`$FFprecision];
{Metvals,Metvecs}=SetPrecision[Eigensystem[Met2],FormFlavor`$FFprecision];
UetMixR=Transpose[Metvecs];
UetMixL=Transpose[Conjugate[UetMixR]]; (* This is UASf *)

(*sneutrinos*)
M\[Nu]t2=SetPrecision[sleptonLLmat+(1/2)(cos\[Beta]^2-sin\[Beta]^2)MZZ^2 IdentityMatrix[3],FormFlavor`$FFprecision];
{M\[Nu]tvals,M\[Nu]tvecs}=SetPrecision[Eigensystem[M\[Nu]t2],FormFlavor`$FFprecision];
U\[Nu]tMixR=Transpose[M\[Nu]tvecs];
U\[Nu]tMixL=Transpose[Conjugate[U\[Nu]tMixR]];


mhvals=SetPrecision[{mh,Sqrt[1/2(mA^2+MZZ^2+Sqrt[(mA^2-MZZ^2)^2+4MZZ^2 mA^2 (2sin\[Beta] cos\[Beta])^2])],mA,Sqrt[mA^2+MWW^2]},FormFlavor`$FFprecision];
mgluino=SetPrecision[M3use,FormFlavor`$FFprecision];

Aumat=Aulist;
Admat=Adlist;
Aemat=Aelist;
muval=\[Mu]use;
(***************)
(* END OUTPUTS *)
(***************)


If[Min[Re[Mutvals]]<0,Message[CalcSpec::tachyon,"up squark"]];
If[Min[Re[Mdtvals]]<0,Message[CalcSpec::tachyon,"down squark"]];
If[Min[Re[Metvals]]<0,Message[CalcSpec::tachyon,"slepton"]];
If[Min[Re[M\[Nu]tvals]]<0,Message[CalcSpec::tachyon,"snuetrino"]];

(* Take the SUSY scale to be an arbitrary average of the gluino and squark masses... *)
If[\[Mu]SUSYin>0,
\[Mu]SUSY=\[Mu]SUSYin,
\[Mu]SUSY=mgluino/2+(Re[Tr[Sqrt[Mutvals]]/12]+Re[Tr[Sqrt[Mdtvals]]/12])/2];

SetPrecision[{Re[Mdtvals],UdtMixL,Re[Mutvals],UutMixL,
mgluino,Re[chargeig],ULchgvec,URchgvec,Re[neuteig],ULneutvec,
mhvals,muval,tan\[Beta],\[Alpha],Admat,Aumat,
Re[Metvals],UetMixL,Re[M\[Nu]tvals],U\[Nu]tMixL,Aemat,
AlfasNLO[\[Mu]SUSY],\[Mu]SUSY},FormFlavor`$FFprecision]
];


(* ::Subsection::Closed:: *)
(*SLHA2 Readin*)


(*Removes some very odd formating *) 
CleanSLHAString[X_]:=ToExpression[X]/.{\[CapitalAHat]->1}


SLHA2::parameterMissing = "SLHA2 file is missing parameter `1` from BLOCK `2`";
SLHA2::matrixMissing = "SLHA2 file is missing parameter `1` `2` from BLOCK `3`";
GetSLHA2Block[SLHA2FileTable_,SLHA2Block_]:=Module[{tempassign},tempassign=Select[SLHA2FileTable,StringMatchQ[#[[1,2]],SLHA2Block,IgnoreCase->True]&];If[tempassign!={},tempassign[[1]],{}]]
GetSLHA2Param[paramnum_,blockname_]:=Module[{tempassign},tempassign=Select[blockname,CleanSLHAString[#[[1]]]==paramnum &];
If[tempassign=={},Message[SLHA2::parameterMissing,paramnum,blockname];
,tempassign[[1,2]]]];
GetSLHA2ParamZero[paramnum_,blockname_]:=Module[{tempassign},If[blockname=={},0,tempassign=Select[blockname,CleanSLHAString[#[[1]]]==paramnum &];
If[tempassign=={},0,tempassign[[1,2]]]]];
GetSLHA2Matrix[paramnum1_,paramnum2_,blockname_]:=Module[{tempassign},tempassign=Select[blockname,CleanSLHAString[#[[1]]]==paramnum1 && #[[2]]==paramnum2  &];
If[tempassign=={},Message[SLHA2::matrixMissing,paramnum1,paramnum2,blockname];
,tempassign[[1,3]]]];
GetSLHA2MatrixZeroed[paramnum1_,paramnum2_,blockname_]:=Module[{tempassign},tempassign=Select[blockname,CleanSLHAString[#[[1]]]==paramnum1 && #[[2]]==paramnum2  &];
If[tempassign=={},0,tempassign[[1,3]]]];

CheckSLHA2Block[SLHA2FileTable_,SLHA2Block_]:=Module[{tempassign},tempassign=Select[SLHA2FileTable,StringMatchQ[#[[1,2]],SLHA2Block,IgnoreCase->True]&]; If[tempassign!={},True,False]];


FFReadFile::notan\[Beta] = "No Value of Tan\[Beta] was found in `1`.  Setting Tan\[Beta]=`2`. To change, either:
1) In BLOCK MSOFT, Add 25 {tan\[Beta]} (preferred)
2) Set $FFDefaultTan\[Beta] (this error message will still appear)";
FFReadFile::no\[Alpha] = "No Value of \[Alpha] was found in `1`.  Setting \[Alpha]=\[Beta]-\[Pi]/2. To change, add 1 {\[Alpha]} in BLOCK ALPHA.";
$FFDefaultTan\[Beta]=10.0;


(* ::Subsubsection:: *)
(*In File*)


(* Readin file, output CalcSpec Input *)
FFReadInFile[Filename_]:=Module[{SLHA2OutFile,SLHA2FileTable,MASS,MSOFT,MINPAR,HMIX,MSQ2,MSU2,MSD2,MSL2,MSE2,TU,TD,TE,
IMMSQ2,IMMSU2,IMMSD2,IMMSL2,IMMSE2,IMTU,IMTD,IMTE,ALPHA,M1gaugino,M2gaugino,M3gaugino,\[Mu]higgsino,Mhmass,MAmass,
Mqt2LLmat,Mut2RRmat,Mdt2RRmat,Mlt2LLmat,Met2RRmat,Aumat,Admat,Aemat,T\[Beta],sin\[Beta],cos\[Beta],cot\[Beta],\[Alpha],iuse,juse},

SLHA2OutFile=Filename;

SLHA2FileTable=Split[Import[SLHA2OutFile,"Table"],((#1[[1]]=="Block"||#1[[1]]=="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))||((#1[[1]]!="Block"&&#1[[1]]!="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))&];

MASS=GetSLHA2Block[SLHA2FileTable,"MASS"] ;(* Particle Masses *)
MSOFT=GetSLHA2Block[SLHA2FileTable,"MSOFT"]; 
MINPAR=GetSLHA2Block[SLHA2FileTable,"MINPAR"];
ALPHA=GetSLHA2Block[SLHA2FileTable,"ALPHA"];
HMIX=GetSLHA2Block[SLHA2FileTable,"HMIX"]; (* H block at scale Q*)

MSQ2=GetSLHA2Block[SLHA2FileTable,"MSQ2"]; (* MSQ^2 block at scale Q*)
MSU2=GetSLHA2Block[SLHA2FileTable,"MSU2"]; (* MSU^2 block at scale Q*)
MSD2=GetSLHA2Block[SLHA2FileTable,"MSD2"]; (* MSD^2 block at scale Q*)
MSL2=GetSLHA2Block[SLHA2FileTable,"MSL2"]; (* MSL2 block at scale Q *)
MSE2=GetSLHA2Block[SLHA2FileTable,"MSE2"];  (* MSE2 block at scale Q *)

TU=GetSLHA2Block[SLHA2FileTable,"TU"]; (* TU block at scale Q*)
TD=GetSLHA2Block[SLHA2FileTable,"TD"]; (* TD block at scale Q*)
TE=GetSLHA2Block[SLHA2FileTable,"TE"]; (* TE block at scale Q*)

IMMSQ2=GetSLHA2Block[SLHA2FileTable,"IMMSQ2"];(* MSQ^2 block at scale MX*)
IMMSU2=GetSLHA2Block[SLHA2FileTable,"IMMSU2"]; (* MSU^2 block at scale MX*)
IMMSD2=GetSLHA2Block[SLHA2FileTable,"IMMSD2"]; (* MSD^2 block at scale MX*)
IMMSL2=GetSLHA2Block[SLHA2FileTable,"IMMSL2"]; (* MSL2 block at scale MX *)
IMMSE2=GetSLHA2Block[SLHA2FileTable,"IMMSE2"];  (* MSE2 block at scale MX *)
IMTU=GetSLHA2Block[SLHA2FileTable,"IMTU"]; (* TU block at scale MX*)
IMTD=GetSLHA2Block[SLHA2FileTable,"IMTD"]; (* TD block at scale MX*)
IMTE=GetSLHA2Block[SLHA2FileTable,"IMTE"]; (* TE block at scale MX*)

M1gaugino=GetSLHA2Param[1,MSOFT];
M2gaugino=GetSLHA2Param[2,MSOFT];
M3gaugino=GetSLHA2Param[3,MSOFT];

T\[Beta]=Max[GetSLHA2ParamZero[25,MSOFT],GetSLHA2ParamZero[3,MINPAR]];
If[T\[Beta]==0,Message[FFReadFile::notan\[Beta],Filename,$FFDefaultTan\[Beta]];T\[Beta]=$FFDefaultTan\[Beta]];
sin\[Beta]= T\[Beta] /Sqrt[1+T\[Beta]^2];
cos\[Beta]= 1/Sqrt[1+T\[Beta]^2];
cot\[Beta]= 1/T\[Beta];

\[Mu]higgsino=GetSLHA2Param[1,HMIX];
Mhmass=GetSLHA2Param[25,MASS];
MAmass=GetSLHA2Param[36,MASS];

\[Alpha]=GetSLHA2ParamZero[1,ALPHA];
(* go to decoupling limit if not provided *)
If[\[Alpha]==0,
If[ALPHA!={},
\[Alpha]=ALPHA[[2,1]];,Message[FFReadFile::no\[Alpha],Filename];\[Alpha]=ArcTan[T\[Beta]]-\[Pi]/2]];

Mqt2LLmat=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSQ2],GetSLHA2Matrix[iuse,juse,MSQ2]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSQ2],-I* GetSLHA2Matrix[iuse,juse,IMMSQ2]]],{i,1,3},{j,1,3}];

Mut2RRmat=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSU2],GetSLHA2Matrix[iuse,juse,MSU2]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSU2],-I* GetSLHA2Matrix[iuse,juse,IMMSU2]]],{i,1,3},{j,1,3}];

Mdt2RRmat=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSD2],GetSLHA2Matrix[iuse,juse,MSD2]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSD2],-I* GetSLHA2Matrix[iuse,juse,IMMSD2]]],{i,1,3},{j,1,3}];

Mlt2LLmat=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSL2],GetSLHA2Matrix[iuse,juse,MSL2]+If[i < j, I* GetSLHA2Matrix[iuse,juse,IMMSL2],-I* GetSLHA2Matrix[iuse,juse,IMMSL2]]],{i,1,3},{j,1,3}];

Met2RRmat=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSE2],GetSLHA2Matrix[iuse,juse,MSE2]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSE2],-I* GetSLHA2Matrix[iuse,juse,IMMSE2]]],{i,1,3},{j,1,3}];

Aumat=sin\[Beta]*ConjugateTranspose[Table[GetSLHA2Matrix[i,j,TU]+ I* GetSLHA2MatrixZeroed[i,j,IMTU],{i,1,3},{j,1,3}]];
Admat=cos\[Beta]*ConjugateTranspose[Table[GetSLHA2Matrix[i,j,TD]+ I* GetSLHA2MatrixZeroed[i,j,IMTD],{i,1,3},{j,1,3}]];
Aemat=cos\[Beta]*ConjugateTranspose[Table[GetSLHA2Matrix[i,j,TE]+ I* GetSLHA2MatrixZeroed[i,j,IMTE],{i,1,3},{j,1,3}]];

{gaugino[{M1gaugino,M2gaugino,M3gaugino}],
higgs[{\[Mu]higgsino,Mhmass,MAmass,T\[Beta],\[Alpha]}],
squarkQLL[Mqt2LLmat],
squarkURR[Mut2RRmat],
squarkDRR[Mdt2RRmat],
sleptonLL[Mlt2LLmat],
sleptonRR[Mlt2LLmat],
Au[Aumat],
Ad[Admat],
Ae[Aemat]}]


(* ::Subsubsection:: *)
(*Outfile*)


(* Read in SLHA2 outfile, output CalcSpec Output format (for read in to compileed amplitudes) *)
FFReadOutFile[Filename_]:=Module[{SLHA2OutFile,SLHA2FileTable,MASS,HMIX,MSOFT,MINPAR,
NMIX,UMIX,VMIX,USQMIX,DSQMIX,SELMIX,SNUMIX,TU,TD,TE,\[Alpha],ALPHA,
IMNMIX,IMUMIX,IMVMIX,IMUSQMIX,IMDSQMIX,IMSELMIX,IMSNUMIX,IMTU,IMTD,IMTE,
MGLUINO,MUVALS,MDVALS,MSLVALS,MSNUVALS,MCHVALS,MNEUVALS,
\[Mu]higgsino,Mhmass,MAmass,ULchgvec,URchgvec,UdtMixL,UutMixL,ULneutvec,mhvals,UetMixL,U\[Nu]tMixL,
\[Mu]SUSY,Aumat,Admat,Aemat,T\[Beta],sin\[Beta],cos\[Beta],cot\[Beta],iuse,juse},

SLHA2OutFile=Filename;

SLHA2FileTable=Split[Import[SLHA2OutFile,"Table"],((#1[[1]]=="Block"||#1[[1]]=="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))||((#1[[1]]!="Block"&&#1[[1]]!="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))&];

MASS=GetSLHA2Block[SLHA2FileTable,"MASS"];(* Particle Masses *)
MINPAR=GetSLHA2Block[SLHA2FileTable,"MINPAR"]; 
MSOFT=GetSLHA2Block[SLHA2FileTable,"MSOFT"]; 
HMIX=GetSLHA2Block[SLHA2FileTable,"HMIX"]; (* H block at scale Q*)
ALPHA=GetSLHA2Block[SLHA2FileTable,"ALPHA"];

NMIX=GetSLHA2Block[SLHA2FileTable,"NMIX"]; (* neutralino mixing mat *)
UMIX=GetSLHA2Block[SLHA2FileTable,"UMIX"]; (* chargino mixing mat U *)
VMIX=GetSLHA2Block[SLHA2FileTable,"VMIX"]; (* chargino mixing mat V *)

USQMIX=GetSLHA2Block[SLHA2FileTable,"USQMIX"]; (* 6x6 up squark mat *)
DSQMIX=GetSLHA2Block[SLHA2FileTable,"DSQMIX"]; (* 6x6 down squark mat *)
SELMIX=GetSLHA2Block[SLHA2FileTable,"SELMIX"]; (* 6x6 slepton squark mat *)
SNUMIX=GetSLHA2Block[SLHA2FileTable,"SNUMIX"]; (* 6x6 slepton squark mat *)

TU=GetSLHA2Block[SLHA2FileTable,"TU"]; (* TU block *)
TD=GetSLHA2Block[SLHA2FileTable,"TD"]; (* TD block *)
TE=GetSLHA2Block[SLHA2FileTable,"TE"]; (* TE block *)

IMNMIX=GetSLHA2Block[SLHA2FileTable,"IMNMIX"]; (* Imaginary part of neutralino mixing mat *)
IMUMIX=GetSLHA2Block[SLHA2FileTable,"IMUMIX"]; (* Imaginary part of chargino mixing mat U *)
IMVMIX=GetSLHA2Block[SLHA2FileTable,"IMVMIX"]; (* Imaginary part of chargino mixing mat V *)

IMUSQMIX=GetSLHA2Block[SLHA2FileTable,"IMUSQMIX"]; (* Imaginary part of 6x6 up squark mat *)
IMDSQMIX=GetSLHA2Block[SLHA2FileTable,"IMDSQMIX"]; (* Imaginary part of 6x6 down squark mat *)
IMSELMIX=GetSLHA2Block[SLHA2FileTable,"IMSELMIX"]; (* Imaginary part of 6x6 slepton squark mat *)
IMSNUMIX=GetSLHA2Block[SLHA2FileTable,"IMSNUMIX"]; (* Imaginary part of 6x6 slepton squark mat *)

IMTU=GetSLHA2Block[SLHA2FileTable,"IMTU"]; (* Imaginary part of TU block *)
IMTD=GetSLHA2Block[SLHA2FileTable,"IMTD"]; (* Imaginary part of TD block *)
IMTE=GetSLHA2Block[SLHA2FileTable,"IMTE"]; (* Imaginary part of TE block *)

MGLUINO=GetSLHA2Param[1000021,MASS]; (*NOTE: SLHA2 gluino phase not included *)
\[Mu]higgsino=GetSLHA2Param[1,HMIX]; (*NOTE: SLHA2 \[Mu] phase not included *)
mhvals={GetSLHA2Param[25,MASS],GetSLHA2Param[35,MASS],GetSLHA2Param[36,MASS],GetSLHA2Param[37,MASS]};


MUVALS={GetSLHA2Param[1000002,MASS],GetSLHA2Param[1000004,MASS],GetSLHA2Param[1000006,MASS],
GetSLHA2Param[2000002,MASS],GetSLHA2Param[2000004,MASS],GetSLHA2Param[2000006,MASS]};

MDVALS={GetSLHA2Param[1000001,MASS],GetSLHA2Param[1000003,MASS],GetSLHA2Param[1000005,MASS],
GetSLHA2Param[2000001,MASS],GetSLHA2Param[2000003,MASS],GetSLHA2Param[2000005,MASS]};

MSLVALS={GetSLHA2Param[1000011,MASS],GetSLHA2Param[1000013,MASS],GetSLHA2Param[1000015,MASS],
GetSLHA2Param[2000011,MASS],GetSLHA2Param[2000013,MASS],GetSLHA2Param[2000015,MASS]};

MSNUVALS={GetSLHA2Param[1000012,MASS],GetSLHA2Param[1000014,MASS],GetSLHA2Param[1000016,MASS]};

MCHVALS={GetSLHA2Param[1000024,MASS],GetSLHA2Param[1000037,MASS]};
MNEUVALS={GetSLHA2Param[1000022,MASS],GetSLHA2Param[1000023,MASS],GetSLHA2Param[1000025,MASS],GetSLHA2Param[1000035,MASS]};

ULchgvec=Table[GetSLHA2Matrix[i,j,UMIX]+ I* GetSLHA2MatrixZeroed[i,j,IMUMIX],{i,1,2},{j,1,2}];
URchgvec=Table[GetSLHA2Matrix[i,j,VMIX]+ I* GetSLHA2MatrixZeroed[i,j,IMVMIX],{i,1,2},{j,1,2}];
ULneutvec=Table[GetSLHA2Matrix[i,j,NMIX]+ I* GetSLHA2MatrixZeroed[i,j,IMNMIX],{i,1,4},{j,1,4}];

UdtMixL=Table[GetSLHA2Matrix[i,j,DSQMIX]+ I* GetSLHA2MatrixZeroed[i,j,IMDSQMIX],{i,1,6},{j,1,6}];
UutMixL=Table[GetSLHA2Matrix[i,j,USQMIX]+ I* GetSLHA2MatrixZeroed[i,j,IMUSQMIX],{i,1,6},{j,1,6}];
UetMixL=Table[GetSLHA2Matrix[i,j,SELMIX]+ I* GetSLHA2MatrixZeroed[i,j,IMSELMIX],{i,1,6},{j,1,6}];
U\[Nu]tMixL=Table[GetSLHA2Matrix[i,j,SNUMIX]+ I* GetSLHA2MatrixZeroed[i,j,IMSNUMIX],{i,1,3},{j,1,3}];

T\[Beta]=Max[GetSLHA2ParamZero[25,MSOFT],GetSLHA2ParamZero[3,MINPAR]];
If[T\[Beta]==0,Message[FFReadFile::notan\[Beta],Filename,$FFDefaultTan\[Beta]];T\[Beta]=$FFDefaultTan\[Beta]];
sin\[Beta]= T\[Beta] /Sqrt[1+T\[Beta]^2];
cos\[Beta]= 1/Sqrt[1+T\[Beta]^2];
cot\[Beta]= 1/T\[Beta];

\[Alpha]=GetSLHA2ParamZero[1,ALPHA];
(* go to decoupling limit if not provided *)
If[\[Alpha]==0,Message[FFReadFile::no\[Alpha],Filename];\[Alpha]=ArcTan[T\[Beta]]-\[Pi]/2];

Aumat=sin\[Beta]*ConjugateTranspose[Table[GetSLHA2Matrix[i,j,TU]+ I* GetSLHA2MatrixZeroed[i,j,IMTU],{i,1,3},{j,1,3}]];
Admat=cos\[Beta]*ConjugateTranspose[Table[GetSLHA2Matrix[i,j,TD]+ I* GetSLHA2MatrixZeroed[i,j,IMTD],{i,1,3},{j,1,3}]];
Aemat=cos\[Beta]*ConjugateTranspose[Table[GetSLHA2Matrix[i,j,TE]+ I* GetSLHA2MatrixZeroed[i,j,IMTE],{i,1,3},{j,1,3}]];

(* Take the SUSY scale to be an arbitrary average of the gluino and squark masses. *)
\[Mu]SUSY=MGLUINO/2+(Re[Tr[MDVALS]/12]+Re[Tr[MUVALS]/12])/2;

(*Note: sfermion masses are squared *)
SetPrecision[{Re[MDVALS^2],UdtMixL,Re[MUVALS^2],UutMixL,
MGLUINO,Re[MCHVALS],ULchgvec,URchgvec,Re[MNEUVALS],ULneutvec,
mhvals,\[Mu]higgsino,T\[Beta],\[Alpha],Admat,Aumat,
Re[MSLVALS^2],UetMixL,Re[MSNUVALS^2],U\[Nu]tMixL,Aemat,
AlfasNLO[\[Mu]SUSY],\[Mu]SUSY},FormFlavor`$FFprecision]
]


(* ::Subsubsection:: *)
(*All files*)


(* Readin file, deteermines whether file is SLHA infile or outfile, output CalcSpec Ouput *)
FFReadFile[Filename_]:=Module[{SLHA2OutFile,SLHA2FileTable,OutnotIn,
CalcSpecInFormat,CalcSpecOutFormat},

SLHA2OutFile=Filename;

SLHA2FileTable=Split[Import[SLHA2OutFile,"Table"],((#1[[1]]=="Block"||#1[[1]]=="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))||((#1[[1]]!="Block"&&#1[[1]]!="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))&];

(* we use the USQMIX block to assess whether it is an SLHA2 In vs Out file *)
OutnotIn=CheckSLHA2Block[SLHA2FileTable,"USQMIX"];
If[OutnotIn,
(* SLHA2 outfile *)
CalcSpecOutFormat=FFReadOutFile[Filename];,
(* SLHA2 infile *)
CalcSpecInFormat=FFReadInFile[Filename];
CalcSpecOutFormat=CalcSpec@@CalcSpecInFormat;];

CalcSpecOutFormat]


(* ::Subsection::Closed:: *)
(*SLHA2 write*)


OutNxNMatrixFormat[blockName_,matrix_,N_]:=With[{blockHead="Block"},
Flatten[{{{blockHead,blockName}},
Flatten[Table[{i,j,Re[Chop[matrix][[i,j]]]},{i,1,N},{j,1,N}],1]},1]]


(* Write compiled amplitude to SLHA2 outputfile *)
FFWriteFile[{Mdtvals_,UdtMixL_,Mutvals_,UutMixL_,
mgluino_,chargeig_,ULchg_,URchg_,neuteig_,ULneut_,
mhvals_,muval_,tan\[Beta]_,\[Alpha]_,Admat_,Aumat_,
Metvals_,UetMixL_,M\[Nu]tvals_,U\[Nu]tMixL_,Aemat_,
Alfas_,\[Mu]SUSY_},SLHA2OutFile_]:=Module[{cos\[Beta]=Sqrt[1/(1+tan\[Beta]^2)],sin\[Beta]=tan\[Beta]*Sqrt[1/(1+tan\[Beta]^2)],
(* order reversed here as mathematica put e.values into descending order *)
Muv=Reverse[Sqrt[Mutvals]],Mdv=Reverse[Sqrt[Mdtvals]],
Mev=Reverse[Sqrt[Metvals]],M\[Nu]v=Reverse[Sqrt[M\[Nu]tvals]],
Mnv=Reverse[neuteig],Mchv=Reverse[chargeig]},

Export[SLHA2OutFile,
Flatten[{{{"# FormFlavor FFWriteFile SLHA2 Output - version "<>ToString[FormFlavor`$FFVersion]}},
{{"Block","MSOFT"},
{0,\[Mu]SUSY},
{25,tan\[Beta]}},

{{"Block","ALPHA"},
{1,\[Alpha]}},

{{"Block","MASS", "# Q="<>ToString[\[Mu]SUSY]},
{25,mhvals[[1]],"# mh"},{35,mhvals[[2]],"# mH0"},{36,mhvals[[3]],"# mA0"},{37,mhvals[[4]],"# mH+"},
{1000021,mgluino,"# go"},
{1000022,Mnv[[1]],"# n1"},{1000023,Mnv[[2]],"# n2"},
{1000025,Mnv[[3]],"# n3"},{1000035,Mnv[[4]],"# n4"},
{1000024,Mchv[[1]],"# ch1"},{1000037,Mchv[[2]],"# ch2"},
{1000011,Mev[[1]],"# e1"},{1000013,Mev[[2]],"# e2"},{1000015,Mev[[3]],"# e3"},
{2000011,Mev[[4]],"# e4"},{2000013,Mev[[5]],"# e5"},{2000015,Mev[[6]],"# e6"},
{1000012,M\[Nu]v[[1]],"# nu1"},{1000014,M\[Nu]v[[2]],"# nu2"},{1000016,M\[Nu]v[[3]],"# nu3"},
{1000001,Mdv[[1]],"# d1"},{1000003,Mdv[[2]],"# d2"},{1000005,Mdv[[3]],"# d3"},
{2000001,Mdv[[4]],"# d4"},{2000003,Mdv[[5]],"# d5"},{2000005,Mdv[[6]],"# d6"},
{1000002,Muv[[1]],"# u1"},{1000004,Muv[[2]],"# u2"},{1000006,Muv[[3]],"# u3"},
{2000002,Muv[[4]],"# u4"},{2000004,Muv[[5]],"# u5"},{2000006,Muv[[6]],"# u6"}
},

(* Reversing matrix places into correct order as these map e.g. mass -> flavor *)
OutNxNMatrixFormat["NMIX",Re[Reverse[ULneut]],4],
OutNxNMatrixFormat["UMIX",Re[Reverse[ULchg]],2],
OutNxNMatrixFormat["VMIX",Re[Reverse[URchg]],2],

OutNxNMatrixFormat["USQMIX",Re[Reverse[UutMixL]],6],
OutNxNMatrixFormat["DSQMIX",Re[Reverse[UdtMixL]],6],
OutNxNMatrixFormat["SELMIX",Re[Reverse[UetMixL]],6],
OutNxNMatrixFormat["SNUMIX",Re[Reverse[U\[Nu]tMixL]],3],

OutNxNMatrixFormat["IMNMIX",Im[Reverse[ULneut]],4],
OutNxNMatrixFormat["IMUMIX",Im[Reverse[ULchg]],2],
OutNxNMatrixFormat["IMVMIX",Im[Reverse[URchg]],2],

OutNxNMatrixFormat["IMUSQMIX",Im[Reverse[UutMixL]],6],
OutNxNMatrixFormat["IMDSQMIX",Im[Reverse[UdtMixL]],6],
OutNxNMatrixFormat["IMSELMIX",Im[Reverse[UetMixL]],6],
OutNxNMatrixFormat["IMSNUMIX",Im[Reverse[U\[Nu]tMixL]],3],

OutNxNMatrixFormat["TU",Re[ConjugateTranspose[Aumat/sin\[Beta]]],3],
OutNxNMatrixFormat["TD",Re[ConjugateTranspose[Admat/cos\[Beta]]],3],
OutNxNMatrixFormat["TE",Re[ConjugateTranspose[Aemat/cos\[Beta]]],3],
OutNxNMatrixFormat["IMTU",Im[ConjugateTranspose[Aumat/sin\[Beta]]],3],
OutNxNMatrixFormat["IMTD",Im[ConjugateTranspose[Admat/cos\[Beta]]],3],
OutNxNMatrixFormat["IMTE",Im[ConjugateTranspose[Aemat/cos\[Beta]]],3],

{{"Block","HMIX"},
{1,muval}}
},1]];
]


(* ::Section:: *)
(*Function Information*)


FFReadFile::usage = "FFReadFile[file] read in an SLHA2 file (either input or output) and output spectrum in format for compiled amplitudes.";

FFReadOutFile::usage = "FFReadOutFile[file] read in an SLHA2 output file and output spectrum in format for compiled amplitudes.";

FFReadInFile::usage = "FFReadInFile[file] read in an SLHA2 input file and output CalcSpecInput format
CalcSpecInput: {gaugino[{\!\(\*SubscriptBox[\(M\), \(1\)]\),\!\(\*SubscriptBox[\(M\), \(2\)]\),\!\(\*SubscriptBox[\(M\), \(3\)]\)}],higgs[{\[Mu],\!\(\*SubscriptBox[\(M\), \(h\)]\),\!\(\*SubscriptBox[\(M\), \(A\)]\),tan\[Beta],\[Alpha]}],squarkQLL[\!\(\*SubsuperscriptBox[\(M\), \(Q, LL\), \(2\)]\)],squarkURR[\!\(\*SubsuperscriptBox[\(M\), \(U, RR\), \(2\)]\)],squarkDRR[\!\(\*SubsuperscriptBox[\(M\), \(D, RR\), \(2\)]\)],sleptonLL[\!\(\*SubsuperscriptBox[\(M\), \(L, LL\), \(2\)]\)],sleptonRR[\!\(\*SubsuperscriptBox[\(M\), \(E, RR\), \(2\)]\)],Au[\!\(\*SubscriptBox[\(A\), \(U\)]\)],Ad[\!\(\*SubscriptBox[\(A\), \(D\)]\)],Ae[\!\(\*SubscriptBox[\(A\), \(E\)]\)]}";

FFWriteFile::usage = "FFWriteFile[CalcSpecOutput,file] write CalcSpecOutput to an SLHA2 output file."

CalcSpec::usage = "CalcSpec[gaugino[{\!\(\*SubscriptBox[\(M\), \(1\)]\),\!\(\*SubscriptBox[\(M\), \(2\)]\),\!\(\*SubscriptBox[\(M\), \(3\)]\)}],higgs[{\[Mu],\!\(\*SubscriptBox[\(M\), \(h\)]\),\!\(\*SubscriptBox[\(M\), \(A\)]\),tan\[Beta],\[Alpha]}],squarkQLL[\!\(\*SubsuperscriptBox[\(M\), \(Q, LL\), \(2\)]\)],squarkURR[\!\(\*SubsuperscriptBox[\(M\), \(U, RR\), \(2\)]\)],squarkDRR[\!\(\*SubsuperscriptBox[\(M\), \(D, RR\), \(2\)]\)],sleptonLL[\!\(\*SubsuperscriptBox[\(M\), \(L, LL\), \(2\)]\)],sleptonRR[\!\(\*SubsuperscriptBox[\(M\), \(E, RR\), \(2\)]\)],Au[\!\(\*SubscriptBox[\(A\), \(U\)]\)],Ad[\!\(\*SubscriptBox[\(A\), \(D\)]\)],Ae[\!\(\*SubscriptBox[\(A\), \(E\)]\)]] converts SLHA2 input to spectrum in format for compiled amplitudes.";

