(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*RGEs *)


(* ::Section:: *)
(*Functions for RGE calculations*)


Print["- Loading MSSM RGEs"];


(* ::Subsection::Closed:: *)
(*Hardcoded RGE parameters*)


GetCKMRGE[]:=GenCKM[];

GetSMparamsRGE[]:=Module[{
RGg1EW=GetSMParameter["g1@mZ"],RGg2EW=GetSMParameter["g2@mZ"],RGg3EW=GetSMParameter["g3@mZ"],
RGmuu=GetSMParameter["mu@mt"],RGmcc=GetSMParameter["mc@mt"],RGmtt=GetSMParameter["mt@mt"],
RGmdd=GetSMParameter["md@mt"],RGmss=GetSMParameter["ms@mt"],RGmbb=GetSMParameter["mb@mt"],
RGmee=GetSMParameter["me"],RGm\[Mu]\[Mu]=GetSMParameter["m\[Mu]"],RGm\[Tau]\[Tau]=GetSMParameter["m\[Tau]"],
vh=GetSMParameter["vhVEV"],s\[Theta]w=GetSMParameter["s\[Theta]w"],mz=GetSMParameter["mZ"],mw=GetSMParameter["mW"]},

{{RGg1EW,RGg2EW,RGg3EW},{RGmuu,RGmcc,RGmtt},{RGmdd,RGmss,RGmbb},{RGmee,RGm\[Mu]\[Mu],RGm\[Tau]\[Tau]},{vh,mz,s\[Theta]w},GenCKM[]}
]


(* ::Subsection::Closed:: *)
(*Beta functions*)


(* ::Text:: *)
(*Generated with the help of the SARAH package (Staub: 1002.0840)*)


LoadMSSM\[Beta]functions[]:=Block[{O16\[Pi]sq=1/(16 Pi^2),t,g1,g2,g3,Yumat,Ydmat,Ylmat,
M1,M2,M3,Tumat,Tdmat,Tlmat,mq2mat,mu2mat,md2mat,ml2mat,me2mat,KroneckerDeltaMat,
MHd2,MHu2,\[Mu]h,B\[Mu]h,vdh,vuh},
\[Beta]MSSM["g1"]=33/5 g1[t]^3 O16\[Pi]sq;
\[Beta]MSSM["g2"]=g2[t]^3 O16\[Pi]sq;
\[Beta]MSSM["g3"]=-3 g3[t]^3 O16\[Pi]sq;
\[Beta]MSSM["Yumat"]=O16\[Pi]sq(Yumat[t].ConjugateTranspose[Ydmat[t]].Ydmat[t]+3 Yumat[t].ConjugateTranspose[Yumat[t]].Yumat[t]-1/15 (13 g1[t]^2+45 g2[t]^2+80 g3[t]^2-45 Tr[Yumat[t].ConjugateTranspose[Yumat[t]]]) Yumat[t]);
\[Beta]MSSM["Ydmat"]=O16\[Pi]sq(3 Ydmat[t].ConjugateTranspose[Ydmat[t]].Ydmat[t]+Ydmat[t].ConjugateTranspose[Yumat[t]].Yumat[t]+(-(7/15) g1[t]^2-3 g2[t]^2-(16 g3[t]^2)/3+3 Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]]+Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]]) Ydmat[t]);
\[Beta]MSSM["Ylmat"]=O16\[Pi]sq(3 Ylmat[t].ConjugateTranspose[Ylmat[t]].Ylmat[t]+(-(9/5) g1[t]^2-3 g2[t]^2+3 Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]]+Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]]) Ylmat[t]);

\[Beta]MSSM["M1"]=2*(33/5 g1[t]^2 M1[t] O16\[Pi]sq);
\[Beta]MSSM["M2"]=2*(g2[t]^2 M2[t] O16\[Pi]sq);
\[Beta]MSSM["M3"]=2*(-3 g3[t]^2 M3[t] O16\[Pi]sq);
\[Beta]MSSM["mq2mat"]=O16\[Pi]sq(2 ConjugateTranspose[Tdmat[t]].Tdmat[t]+2 ConjugateTranspose[Tumat[t]].Tumat[t]+2 ConjugateTranspose[Ydmat[t]].md2mat[t].Ydmat[t]+ConjugateTranspose[Ydmat[t]].Ydmat[t].mq2mat[t]+2 ConjugateTranspose[Yumat[t]].mu2mat[t].Yumat[t]+ConjugateTranspose[Yumat[t]].Yumat[t].mq2mat[t]+mq2mat[t].ConjugateTranspose[Ydmat[t]].Ydmat[t]+mq2mat[t].ConjugateTranspose[Yumat[t]].Yumat[t]-2/15 Conjugate[M1[t]] g1[t]^2 KroneckerDeltaMat[t] M1[t]-6 Conjugate[M2[t]] g2[t]^2 KroneckerDeltaMat[t] M2[t]-32/3 Conjugate[M3[t]] g3[t]^2 KroneckerDeltaMat[t] M3[t]+2 ConjugateTranspose[Ydmat[t]].Ydmat[t] MHd2[t]+2 ConjugateTranspose[Yumat[t]].Yumat[t] MHu2[t]+1/5 g1[t]^2 KroneckerDeltaMat[t] (-Conjugate[Tr[ml2mat[t]]]+Conjugate[Tr[mq2mat[t]]]-MHd2[t]+MHu2[t]+Tr[md2mat[t]]+Tr[me2mat[t]]-2 Tr[mu2mat[t]]));
\[Beta]MSSM["mu2mat"]=O16\[Pi]sq(4 Tumat[t].ConjugateTranspose[Tumat[t]]+2 mu2mat[t].Yumat[t].ConjugateTranspose[Yumat[t]]+2 Yumat[t].ConjugateTranspose[Yumat[t]].mu2mat[t]+4 Yumat[t].mq2mat[t].ConjugateTranspose[Yumat[t]]-32/15 Conjugate[M1[t]] g1[t]^2 KroneckerDeltaMat[t] M1[t]-32/3 Conjugate[M3[t]] g3[t]^2 KroneckerDeltaMat[t] M3[t]+4 Yumat[t].ConjugateTranspose[Yumat[t]] MHu2[t]-4/5 g1[t]^2 KroneckerDeltaMat[t] (-Conjugate[Tr[ml2mat[t]]]+Conjugate[Tr[mq2mat[t]]]-MHd2[t]+MHu2[t]+Tr[md2mat[t]]+Tr[me2mat[t]]-2 Tr[mu2mat[t]]));
\[Beta]MSSM["md2mat"]=O16\[Pi]sq(4 Tdmat[t].ConjugateTranspose[Tdmat[t]]+2 md2mat[t].Ydmat[t].ConjugateTranspose[Ydmat[t]]+2 Ydmat[t].ConjugateTranspose[Ydmat[t]].md2mat[t]+4 Ydmat[t].mq2mat[t].ConjugateTranspose[Ydmat[t]]-8/15 Conjugate[M1[t]] g1[t]^2 KroneckerDeltaMat[t] M1[t]-32/3 Conjugate[M3[t]] g3[t]^2 KroneckerDeltaMat[t] M3[t]+4 Ydmat[t].ConjugateTranspose[Ydmat[t]] MHd2[t]+2/5 g1[t]^2 KroneckerDeltaMat[t] (-Conjugate[Tr[ml2mat[t]]]+Conjugate[Tr[mq2mat[t]]]-MHd2[t]+MHu2[t]+Tr[md2mat[t]]+Tr[me2mat[t]]-2 Tr[mu2mat[t]]));
\[Beta]MSSM["ml2mat"]=O16\[Pi]sq(2 ConjugateTranspose[Tlmat[t]].Tlmat[t]+2 ConjugateTranspose[Ylmat[t]].me2mat[t].Ylmat[t]+ConjugateTranspose[Ylmat[t]].Ylmat[t].ml2mat[t]+ml2mat[t].ConjugateTranspose[Ylmat[t]].Ylmat[t]-6/5 Conjugate[M1[t]] g1[t]^2 KroneckerDeltaMat[t] M1[t]-6 Conjugate[M2[t]] g2[t]^2 KroneckerDeltaMat[t] M2[t]+2 ConjugateTranspose[Ylmat[t]].Ylmat[t] MHd2[t]-3/5 g1[t]^2 KroneckerDeltaMat[t] (-Conjugate[Tr[ml2mat[t]]]+Conjugate[Tr[mq2mat[t]]]-MHd2[t]+MHu2[t]+Tr[md2mat[t]]+Tr[me2mat[t]]-2 Tr[mu2mat[t]]));
\[Beta]MSSM["me2mat"]=O16\[Pi]sq(-(24/5) Conjugate[M1[t]] g1[t]^2 KroneckerDeltaMat[t] M1[t]+2 (2 Tlmat[t].ConjugateTranspose[Tlmat[t]]+me2mat[t].Ylmat[t].ConjugateTranspose[Ylmat[t]]+Ylmat[t].ConjugateTranspose[Ylmat[t]].me2mat[t]+2 Ylmat[t].ml2mat[t].ConjugateTranspose[Ylmat[t]]+2 Ylmat[t].ConjugateTranspose[Ylmat[t]] MHd2[t])+6/5 g1[t]^2 KroneckerDeltaMat[t] (-Conjugate[Tr[ml2mat[t]]]+Conjugate[Tr[mq2mat[t]]]-MHd2[t]+MHu2[t]+Tr[md2mat[t]]+Tr[me2mat[t]]-2 Tr[mu2mat[t]]));

\[Beta]MSSM["MHd2"]=O16\[Pi]sq(-(6/5) Conjugate[M1[t]] g1[t]^2 M1[t]-6 Conjugate[M2[t]] g2[t]^2 M2[t]+6 Tr[Conjugate[Tdmat[t]].Transpose[Tdmat[t]]]+2 Tr[Conjugate[Tlmat[t]].Transpose[Tlmat[t]]]+6 MHd2[t] Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]]+2 MHd2[t] Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]]+6 Tr[md2mat[t].Ydmat[t].ConjugateTranspose[Ydmat[t]]]+2 Tr[me2mat[t].Ylmat[t].ConjugateTranspose[Ylmat[t]]]+2 Tr[ml2mat[t].ConjugateTranspose[Ylmat[t]].Ylmat[t]]+6 Tr[mq2mat[t].ConjugateTranspose[Ydmat[t]].Ydmat[t]]-3/5 g1[t]^2 (-Conjugate[Tr[ml2mat[t]]]+Conjugate[Tr[mq2mat[t]]]-MHd2[t]+MHu2[t]+Tr[md2mat[t]]+Tr[me2mat[t]]-2 Tr[mu2mat[t]]));
\[Beta]MSSM["MHu2"]=O16\[Pi]sq(-(6/5) Conjugate[M1[t]] g1[t]^2 M1[t]-6 Conjugate[M2[t]] g2[t]^2 M2[t]+6 Tr[Conjugate[Tumat[t]].Transpose[Tumat[t]]]+6 MHu2[t] Tr[Yumat[t].ConjugateTranspose[Yumat[t]]]+6 Tr[mq2mat[t].ConjugateTranspose[Yumat[t]].Yumat[t]]+6 Tr[mu2mat[t].Yumat[t].ConjugateTranspose[Yumat[t]]]+3/5 g1[t]^2 (-Conjugate[Tr[ml2mat[t]]]+Conjugate[Tr[mq2mat[t]]]-MHd2[t]+MHu2[t]+Tr[md2mat[t]]+Tr[me2mat[t]]-2 Tr[mu2mat[t]]));

\[Beta]MSSM["\[Mu]h"]=O16\[Pi]sq(3 Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]] \[Mu]h[t]+Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]] \[Mu]h[t]-3/5 (g1[t]^2+5 g2[t]^2-5 Tr[Yumat[t].ConjugateTranspose[Yumat[t]]]) \[Mu]h[t]);
\[Beta]MSSM["B\[Mu]h"]=O16\[Pi]sq(B\[Mu]h[t] (-(3/5) g1[t]^2-3 g2[t]^2+3 Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]]+Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]]+3 Tr[Yumat[t].ConjugateTranspose[Yumat[t]]])+6/5 g1[t]^2 M1[t] \[Mu]h[t]+6 g2[t]^2 M2[t] \[Mu]h[t]+6 Tr[ConjugateTranspose[Ydmat[t]].Tdmat[t]] \[Mu]h[t]+2 Tr[ConjugateTranspose[Ylmat[t]].Tlmat[t]] \[Mu]h[t]+6 Tr[ConjugateTranspose[Yumat[t]].Tumat[t]] \[Mu]h[t]);

\[Beta]MSSM["vdh"]=O16\[Pi]sq/10*(3 (g1[t]^2+5 g2[t]^2)-30 Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]]-10 Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]]) vdh[t];
\[Beta]MSSM["vuh"]=O16\[Pi]sq/10*3 (g1[t]^2+5 g2[t]^2-10 Tr[Yumat[t].ConjugateTranspose[Yumat[t]]]) vuh[t];

\[Beta]MSSM["Tumat"]=O16\[Pi]sq(Tumat[t].ConjugateTranspose[Ydmat[t]].Ydmat[t]+5 Tumat[t].ConjugateTranspose[Yumat[t]].Yumat[t]+2 Yumat[t].ConjugateTranspose[Ydmat[t]].Tdmat[t]+4 Yumat[t].ConjugateTranspose[Yumat[t]].Tumat[t]-13/15 g1[t]^2 Tumat[t]-3 g2[t]^2 Tumat[t]-16/3 g3[t]^2 Tumat[t]+3 Tr[Yumat[t].ConjugateTranspose[Yumat[t]]] Tumat[t]+26/15 g1[t]^2 M1[t] Yumat[t]+6 g2[t]^2 M2[t] Yumat[t]+32/3 g3[t]^2 M3[t] Yumat[t]+6 Tr[ConjugateTranspose[Yumat[t]].Tumat[t]] Yumat[t]);
\[Beta]MSSM["Tdmat"]=O16\[Pi]sq(5 Tdmat[t].ConjugateTranspose[Ydmat[t]].Ydmat[t]+Tdmat[t].ConjugateTranspose[Yumat[t]].Yumat[t]+4 Ydmat[t].ConjugateTranspose[Ydmat[t]].Tdmat[t]+2 Ydmat[t].ConjugateTranspose[Yumat[t]].Tumat[t]-7/15 g1[t]^2 Tdmat[t]-3 g2[t]^2 Tdmat[t]-16/3 g3[t]^2 Tdmat[t]+3 Tdmat[t] Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]]+Tdmat[t] Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]]+14/15 g1[t]^2 M1[t] Ydmat[t]+6 g2[t]^2 M2[t] Ydmat[t]+32/3 g3[t]^2 M3[t] Ydmat[t]+6 Tr[ConjugateTranspose[Ydmat[t]].Tdmat[t]] Ydmat[t]+2 Tr[ConjugateTranspose[Ylmat[t]].Tlmat[t]] Ydmat[t]);
\[Beta]MSSM["Tlmat"]=O16\[Pi]sq(5 Tlmat[t].ConjugateTranspose[Ylmat[t]].Ylmat[t]+4 Ylmat[t].ConjugateTranspose[Ylmat[t]].Tlmat[t]-9/5 g1[t]^2 Tlmat[t]-3 g2[t]^2 Tlmat[t]+3 Tlmat[t] Tr[Ydmat[t].ConjugateTranspose[Ydmat[t]]]+Tlmat[t] Tr[Ylmat[t].ConjugateTranspose[Ylmat[t]]]+18/5 g1[t]^2 M1[t] Ylmat[t]+6 g2[t]^2 M2[t] Ylmat[t]+6 Tr[ConjugateTranspose[Ydmat[t]].Tdmat[t]] Ylmat[t]+2 Tr[ConjugateTranspose[Ylmat[t]].Tlmat[t]] Ylmat[t]);
]


LoadSM\[Beta]functions[]:=Block[{O16\[Pi]sq=1/(16 Pi^2),t,g1,g2,g3,Yumat,Ydmat,Ylmat,
KroneckerDeltaMat,\[Lambda]h,\[Mu]hSq},

\[Beta]SM["g1"]=41/10 g1[t]^3 O16\[Pi]sq;
\[Beta]SM["g2"]=-19/6 g2[t]^3 O16\[Pi]sq;
\[Beta]SM["g3"]=-7 g3[t]^3 O16\[Pi]sq;
\[Beta]SM["Yumat"]=O16\[Pi]sq(Yumat[t].(3/2 (-ConjugateTranspose[Ydmat[t]].Ydmat[t]+ConjugateTranspose[Yumat[t]].Yumat[t]))-((17 g1[t]^2)/20+(9 g2[t]^2)/4+8 g3[t]^2) Yumat[t]+Tr[3 ConjugateTranspose[Ydmat[t]].Ydmat[t]+ConjugateTranspose[Ylmat[t]].Ylmat[t]+3 ConjugateTranspose[Yumat[t]].Yumat[t]] Yumat[t]);
\[Beta]SM["Ydmat"]=O16\[Pi]sq(Ydmat[t].(3/2 (ConjugateTranspose[Ydmat[t]].Ydmat[t]-ConjugateTranspose[Yumat[t]].Yumat[t]))-(g1[t]^2/4+(9 g2[t]^2)/4+8 g3[t]^2) Ydmat[t]+Tr[3 ConjugateTranspose[Ydmat[t]].Ydmat[t]+ConjugateTranspose[Ylmat[t]].Ylmat[t]+3 ConjugateTranspose[Yumat[t]].Yumat[t]] Ydmat[t]);
\[Beta]SM["Ylmat"]=O16\[Pi]sq(Ylmat[t].(3/2 ConjugateTranspose[Ylmat[t]].Ylmat[t])-9/4 (g1[t]^2+g2[t]^2) Ylmat[t]+Tr[3 ConjugateTranspose[Ydmat[t]].Ydmat[t]+ConjugateTranspose[Ylmat[t]].Ylmat[t]+3 ConjugateTranspose[Yumat[t]].Yumat[t]] Ylmat[t]);

\[Beta]SM["\[Lambda]h"]=O16\[Pi]sq((27 g1[t]^4)/100+(9 g2[t]^2)/4+9/10 g1[t]^2 g2[t]^2-((9 g1[t]^2)/5+9 g2[t]^2) \[Lambda]h[t]+12 \[Lambda]h[t]^2);
\[Beta]SM["\[Mu]hSq"]=O16\[Pi]sq(-(9/10) g1[t]^2-(9 g2[t]^2)/2+2 Tr[3 ConjugateTranspose[Ydmat[t]].Ydmat[t]+ConjugateTranspose[Ylmat[t]].Ylmat[t]+3 ConjugateTranspose[Yumat[t]].Yumat[t]]+6 \[Lambda]h[t]) \[Mu]hSq[t];
]


(* ::Subsection::Closed:: *)
(*Basis transformations*)


(* converts to/from SARAH basis *)
Convert2SARAHBasis[Yuin_,Ydin_,mqt2in_,mut2in_,mdt2in_,mlt2in_,
met2in_,Tuin_,Tdin_,Tlin_]:=Module[{YumatSARAH,YdmatSARAH,mqt2SARAH,mut2SARAH,
mdt2SARAH,TuSARAH,TdSARAH,mlt2SARAH,met2SARAH,TlSARAH},
YumatSARAH=Transpose[Yuin];
YdmatSARAH=Transpose[Ydin];
mqt2SARAH=Transpose[mqt2in];
mut2SARAH=Transpose[mut2in];
mdt2SARAH=Transpose[mdt2in];
mlt2SARAH=Transpose[mlt2in];
met2SARAH=Transpose[met2in];
TuSARAH=Transpose[Tuin];
TdSARAH=Transpose[Tdin];
TlSARAH=Transpose[Tlin];

{YumatSARAH,YdmatSARAH,mqt2SARAH,mut2SARAH,
mdt2SARAH,mlt2SARAH,met2SARAH,TuSARAH,TdSARAH,TlSARAH}
]


Realinator[MATX_]:=Module[{MATNEW,\[Phi]1,\[Phi]2,\[Phi]3,PhaseSub},
\[Phi]1=Arg[MATX[[1,1]]];
\[Phi]2=Arg[MATX[[2,2]]];
\[Phi]3=Arg[MATX[[3,3]]];

MATNEW=MATX.({
 {E^(-I \[Phi]1), 0, 0},
 {0, E^(-I \[Phi]2), 0},
 {0, 0, E^(-I \[Phi]3)}
})]

Swap13[mat_]:= mat.({
 {0, 0, 1},
 {0, 1, 0},
 {1, 0, 0}
});

Convert2SLHA2Basis[Yu_,Yd_,mq2_,mu2_,md2_,ml2_,me2_,Tu_,Td_,Tl_]:=
Module[{Yuin,Ydin,mqt2in,mut2in,mdt2in,mlt2in,met2in,Tuin,Tdin,Tlin,
URYu,URYd,ULYu,ULYd,VdSLHA2,VuSLHA2,UdSLHA2,UuSLHA2, CKMphys,
YumatSCKM,YdmatSCKM,mqt2SCKM,mut2SCKM,mdt2SCKM,mlt2SCKM,met2SCKM,TuSCKM,TdSCKM,TlSCKM},

(* Converts out of SARAH basis as well as into SARAH basis *)
{Yuin,Ydin,mqt2in,mut2in,mdt2in,mlt2in,met2in,Tuin,Tdin,Tlin}=
Convert2SARAHBasis[Yu,Yd,mq2,mu2,md2,ml2,me2,Tu,Td,Tl];

CKMphys=GetCKMRGE[];

mqt2SCKM=Chop[mqt2in];
mut2SCKM=Chop[Transpose[mut2in]];
mdt2SCKM=Chop[Transpose[mdt2in]];
mlt2SCKM=mlt2in;
met2SCKM=met2in;
TuSCKM=Chop[ConjugateTranspose[CKMphys].Transpose[Tuin]];
TdSCKM=Chop[Transpose[Tdin]];
TlSCKM=Tlin;

YumatSCKM=Chop[Yuin.ConjugateTranspose[CKMphys]];
YdmatSCKM=Chop[Ydin];

{YumatSCKM,YdmatSCKM,mqt2SCKM,mut2SCKM,mdt2SCKM,mlt2SCKM,met2SCKM,TuSCKM,TdSCKM,TlSCKM}
]


(* ::Subsection::Closed:: *)
(*BMPZ threshold corrections*)


BMPZ\[Alpha]scomp[Qsc_]:=Module[{\[Alpha]sMZ=0.118,\[Beta]QCD=-(11-12/3),g0,gnew},g0=Sqrt[4\[Pi]*\[Alpha]sMZ];gnew=Re[g0/Sqrt[1-(2*\[Beta]QCD*g0^2)/(16\[Pi]^2) Log[Qsc/91.18]]];gnew^2/(4\[Pi])]


BMPZThreshSQ[xv_,mst2_,Qsc_,\[Alpha]sa_]:=(1+(2\[Alpha]sa)/(3\[Pi]) (1+3xv+(xv-1)^2 Log[Abs[xv-1]]-xv^2 Log[xv]+2xv Log[Qsc^2/mst2]))*mst2


BMPZ\[CapitalDelta]GG[mgo_,Qsc_,\[Alpha]sa_]:=(3\[Alpha]sa)/(4\[Pi]) (3 Log[Qsc^2/mgo^2]+5)
BMPZ\[CapitalDelta]QQ[xv_,Msq_,Qsc_,\[Alpha]sa_]:=(-3\[Alpha]sa)/\[Pi] (1/2 Log[Qsc^2/Msq]+1-1/(2xv) (1+(xv-1)^2/xv Log[Abs[xv-1]])+1/2 Log[xv]HeavisideTheta[xv-1])
BMPZThreshGo[mgo_,msq2_,Qsc_,\[Alpha]sa_]:=mgo*(1-BMPZ\[CapitalDelta]GG[mgo,Qsc,\[Alpha]sa]-BMPZ\[CapitalDelta]QQ[mgo^2/msq2,Max[mgo^2,msq2],Qsc,\[Alpha]sa])^-1


ApplyBMPZThresh[Qsc_,Mgo_,msq2_,msu2_,msd2_]:=Module[{\[Alpha]sval,MgoN,Msq2N=msq2,Msu2N=msu2,Msd2N=msd2,Msqav},
\[Alpha]sval=BMPZ\[Alpha]scomp[Qsc];
Msqav=Re[(2*Tr[msq2]+Tr[msu2]+Tr[msd2])]/12;

MgoN=BMPZThreshGo[Mgo,Msqav,Qsc,\[Alpha]sval];
Msq2N[[1,1]]=BMPZThreshSQ[Mgo^2/msq2[[1,1]],msq2[[1,1]],Qsc,\[Alpha]sval];
Msq2N[[2,2]]=BMPZThreshSQ[Mgo^2/msq2[[2,2]],msq2[[2,2]],Qsc,\[Alpha]sval];
Msq2N[[3,3]]=BMPZThreshSQ[Mgo^2/msq2[[3,3]],msq2[[3,3]],Qsc,\[Alpha]sval];
Msu2N[[1,1]]=BMPZThreshSQ[Mgo^2/msu2[[1,1]],msu2[[1,1]],Qsc,\[Alpha]sval];
Msu2N[[2,2]]=BMPZThreshSQ[Mgo^2/msu2[[2,2]],msu2[[2,2]],Qsc,\[Alpha]sval];
Msu2N[[3,3]]=BMPZThreshSQ[Mgo^2/msu2[[3,3]],msu2[[3,3]],Qsc,\[Alpha]sval];
Msd2N[[1,1]]=BMPZThreshSQ[Mgo^2/msd2[[1,1]],msd2[[1,1]],Qsc,\[Alpha]sval];
Msd2N[[2,2]]=BMPZThreshSQ[Mgo^2/msd2[[2,2]],msd2[[2,2]],Qsc,\[Alpha]sval];
Msd2N[[3,3]]=BMPZThreshSQ[Mgo^2/msd2[[3,3]],msd2[[3,3]],Qsc,\[Alpha]sval];
{MgoN,Msq2N,Msu2N,Msd2N}
]


(* ::Subsection::Closed:: *)
(*SLHA2 I/O Functions*)


(* ::Text:: *)
(*Requires some code defined in CalcSpec.m*)


OutHighScaleFileFormat[matrix_]:=With[{},
{{Re[Chop[matrix][[1,1]]],Im[Chop[matrix][[1,1]]],
Re[Chop[matrix][[1,2]]],Im[Chop[matrix][[1,2]]],
Re[Chop[matrix][[1,3]]],Im[Chop[matrix][[1,3]]]},
{Re[Chop[matrix][[2,1]]],Im[Chop[matrix][[2,1]]],
Re[Chop[matrix][[2,2]]],Im[Chop[matrix][[2,2]]],
Re[Chop[matrix][[2,3]]],Im[Chop[matrix][[2,3]]]},
{Re[Chop[matrix][[3,1]]],Im[Chop[matrix][[3,1]]],
Re[Chop[matrix][[3,2]]],Im[Chop[matrix][[3,2]]],
Re[Chop[matrix][[3,3]]],Im[Chop[matrix][[3,3]]]}}
]


ReadInFileForRG[SLHA2OutFile_]:=Module[{SLHA2FileTable,
EXTPAR,YU,YD,MSQ2IN,MSU2IN,MSD2IN,MSL2IN,MSE2IN,TUIN,TDIN,TLIN,
IMYU,IMYD,IMMSQ2IN,IMMSU2IN,IMMSD2IN,IMMSL2IN,IMMSE2IN,IMTUIN,IMTDIN,IMTLIN,
\[CapitalLambda]Messenger,M1gauginoIn,M2gauginoIn,M3gauginoIn,MHD2IN,MHU2IN,tan\[Beta],
YumatIn,YdmatIn,Mqt2LLmatIn,Mut2RRmatIn,Mdt2RRmatIn,
Mlt2LLmatIn,Met2RRmatIn,TumatIn,TdmatIn,TlmatIn,iuse,juse},

SLHA2FileTable=Split[Import[SLHA2OutFile,"Table"],((#1[[1]]=="Block"||#1[[1]]=="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))||((#1[[1]]!="Block"&&#1[[1]]!="BLOCK")&&(#2[[1]]!="Block"&&#2[[1]]!="BLOCK"))&];

EXTPAR=GetSLHA2Block[SLHA2FileTable,"EXTPAR"]; (* EXTPAR Block *)

YU= GetSLHA2Block[SLHA2FileTable,"YU"];(* YU block at scale MX*)
YD= GetSLHA2Block[SLHA2FileTable,"YD"];(* YD block at scale MX*)
MSQ2IN=GetSLHA2Block[SLHA2FileTable,"MSQ2IN"];(* MSQ^2 block at scale MX*)
MSU2IN=GetSLHA2Block[SLHA2FileTable,"MSU2IN"]; (* MSU^2 block at scale MX*)
MSD2IN=GetSLHA2Block[SLHA2FileTable,"MSD2IN"]; (* MSD^2 block at scale MX*)
MSL2IN=GetSLHA2Block[SLHA2FileTable,"MSL2IN"]; (* MSL2 block at scale MX *)
MSE2IN=GetSLHA2Block[SLHA2FileTable,"MSE2IN"];  (* MSE2 block at scale MX *)
TUIN=GetSLHA2Block[SLHA2FileTable,"TUIN"]; (* TU block at scale MX*)
TDIN=GetSLHA2Block[SLHA2FileTable,"TDIN"]; (* TD block at scale MX*)
TLIN=GetSLHA2Block[SLHA2FileTable,"TEIN"]; (* TL block at scale MX*)

IMYU= GetSLHA2Block[SLHA2FileTable,"IMYU"];(* IMYU block at scale MX*)
IMYD= GetSLHA2Block[SLHA2FileTable,"IMYD"];(* IMYD block at scale MX*)
IMMSQ2IN=GetSLHA2Block[SLHA2FileTable,"IMMSQ2IN"];(* IMMSQ^2 block at scale MX*)
IMMSU2IN=GetSLHA2Block[SLHA2FileTable,"IMMSU2IN"]; (* IMMSU^2 block at scale MX*)
IMMSD2IN=GetSLHA2Block[SLHA2FileTable,"IMMSD2IN"]; (* IMMSD^2 block at scale MX*)
IMMSL2IN=GetSLHA2Block[SLHA2FileTable,"IMMSL2IN"]; (* IMMSL2 block at scale MX *)
IMMSE2IN=GetSLHA2Block[SLHA2FileTable,"IMMSE2IN"];  (* IMMSE2 block at scale MX *) 
IMTUIN=GetSLHA2Block[SLHA2FileTable,"IMTUIN"]; (* IMTU block at scale MX*)
IMTDIN=GetSLHA2Block[SLHA2FileTable,"IMTDIN"]; (* IMTD block at scale MX*)
IMTLIN=GetSLHA2Block[SLHA2FileTable,"IMTEIN"]; (* IMTL block at scale MX*)
 
\[CapitalLambda]Messenger=GetSLHA2Param[31,EXTPAR];
M1gauginoIn=GetSLHA2Param[1,EXTPAR];
M2gauginoIn=GetSLHA2Param[2,EXTPAR];
M3gauginoIn=GetSLHA2Param[3,EXTPAR];
MHD2IN=GetSLHA2Param[21,EXTPAR];
MHU2IN=GetSLHA2Param[22,EXTPAR];
tan\[Beta]=GetSLHA2Param[25,EXTPAR];

(*check here to remove invalid solutions*)
If[M1gauginoIn =="nan",Print["Invalid point: ",Filename];Continue[]];

YumatIn=Table[GetSLHA2Matrix[i,j,YU]+ I* GetSLHA2Matrix[i,j,IMYU],{i,1,3},{j,1,3}];
YdmatIn=Table[GetSLHA2Matrix[i,j,YD]+ I* GetSLHA2Matrix[i,j,IMYD],{i,1,3},{j,1,3}];

Mqt2LLmatIn=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSQ2IN],GetSLHA2Matrix[iuse,juse,MSQ2IN]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSQ2IN],-I* GetSLHA2Matrix[iuse,juse,IMMSQ2IN]]],{i,1,3},{j,1,3}];
Mut2RRmatIn=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSU2IN],GetSLHA2Matrix[iuse,juse,MSU2IN]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSU2IN],-I* GetSLHA2Matrix[iuse,juse,IMMSU2IN]]],{i,1,3},{j,1,3}];
Mdt2RRmatIn=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSD2IN],GetSLHA2Matrix[iuse,juse,MSD2IN]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSD2IN],-I* GetSLHA2Matrix[iuse,juse,IMMSD2IN]]],{i,1,3},{j,1,3}];

Mlt2LLmatIn=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSL2IN],GetSLHA2Matrix[iuse,juse,MSL2IN]+If[i < j, I* GetSLHA2Matrix[iuse,juse,IMMSL2IN],-I* GetSLHA2Matrix[iuse,juse,IMMSL2IN]]],{i,1,3},{j,1,3}];
Met2RRmatIn=Table[If[i<j,iuse=i;juse=j;,iuse=j;juse=i];
If[iuse==juse,GetSLHA2Matrix[iuse,juse,MSE2IN],GetSLHA2Matrix[iuse,juse,MSE2IN]+ If[i < j,I* GetSLHA2Matrix[iuse,juse,IMMSE2IN],-I* GetSLHA2Matrix[iuse,juse,IMMSE2IN]]],{i,1,3},{j,1,3}];

TumatIn=Table[GetSLHA2Matrix[i,j,TUIN]+ I* GetSLHA2Matrix[i,j,IMTUIN],{i,1,3},{j,1,3}];
TdmatIn=Table[GetSLHA2Matrix[i,j,TDIN]+ I* GetSLHA2Matrix[i,j,IMTDIN],{i,1,3},{j,1,3}];
TlmatIn=Table[GetSLHA2Matrix[i,j,TLIN]+ I* GetSLHA2Matrix[i,j,IMTLIN],{i,1,3},{j,1,3}];

{\[CapitalLambda]Messenger,M1gauginoIn,M2gauginoIn,M3gauginoIn,MHD2IN,MHU2IN,tan\[Beta],
YumatIn,YdmatIn,Mqt2LLmatIn,Mut2RRmatIn,Mdt2RRmatIn,
Mlt2LLmatIn,Met2RRmatIn,TumatIn,TdmatIn,TlmatIn}
]


(* ::Subsection::Closed:: *)
(*Initialization Functions*)


GetEWInitCond[tan\[Beta]_]:=Module[{g1,g2,g3,yumat,ydmat,ylmat,CKMphys,RGg1EW,RGg2EW,RGg3EW,
RGmuu,RGmcc,RGmtt,RGmdd,RGmss,RGmbb,RGmee,RGm\[Mu]\[Mu],RGm\[Tau]\[Tau],vh,mz,s\[Theta]w,vu,vd},

{{RGg1EW,RGg2EW,RGg3EW},{RGmuu,RGmcc,RGmtt},{RGmdd,RGmss,RGmbb},{RGmee,RGm\[Mu]\[Mu],RGm\[Tau]\[Tau]},{vh,mz,s\[Theta]w},CKMphys}
=GetSMparamsRGE[];

vu=vh*tan\[Beta]/Sqrt[1+tan\[Beta]^2];
vd=vh*1/Sqrt[1+tan\[Beta]^2];

yumat=DiagonalMatrix[{RGmuu/vu,RGmcc/vu,RGmtt/vu}].CKMphys;
ydmat=DiagonalMatrix[{RGmdd/vd,RGmss/vd,RGmbb/vd}];
ylmat=DiagonalMatrix[{RGmee/vd,RGm\[Mu]\[Mu]/vd,RGm\[Tau]\[Tau]/vd}];
{RGg1EW,RGg2EW,RGg3EW,yumat,ydmat,ylmat}
]


(* ::Subsection::Closed:: *)
(*Testing Functions*)


TestEWSBCond[mHu2_,mHd2_,\[Mu]sq_,B\[Mu]_]:=Block[{cond1,cond2,cond3},

cond1=(\[Mu]sq>0); (* as this is |\[Mu]|^2, it must be positive *)
cond2=(B\[Mu]^2>(mHd2+\[Mu]sq)(mHu2+\[Mu]sq));
cond3=((mHd2+mHu2+2\[Mu]sq)> 2 Abs[B\[Mu]]); (* I don't understand the Abs[] here *)

cond1&&cond2&&cond3
]


TestTachyon[mq2matLE_,mu2matLE_,md2matLE_,ml2matLE_,me2matLE_,TumatLE_,TdmatLE_,TlmatLE_,\[Mu]use_,tan\[Beta]_]:=Module[
{CKMphys,g1EW,g2EW,g3EW,muu,mcc,mtt,mdd,mss,mbb,mee,m\[Mu]\[Mu],m\[Tau]\[Tau],vh,cot\[Beta],cos\[Beta],sin\[Beta],vu,vd,mz,s\[Theta]w,Aulist,Adlist,
Mut2LLmat,Mut2RRmat,Mut2LRmat,Mut2RLmat,Mut2,Mdt2LLmat,Mdt2RRmat,Mdt2LRmat,Mdt2RLmat,Mdt2,
Mdtvals,Mdtvecs,Mutvals,Mutvecs},

{{g1EW,g2EW,g3EW},{muu,mcc,mtt},{mdd,mss,mbb},{mee,m\[Mu]\[Mu],m\[Tau]\[Tau]},{vh,mz,s\[Theta]w},CKMphys}=GetSMparamsRGE[];

cot\[Beta]=1/tan\[Beta];
sin\[Beta]=tan\[Beta]/Sqrt[1+tan\[Beta]^2];
cos\[Beta]=sin\[Beta]/tan\[Beta];
vu=vh sin\[Beta];
vd=vh cos\[Beta];

Aulist=vu Inverse[DiagonalMatrix[{muu,mcc,mtt}]].ConjugateTranspose[TumatLE];
Adlist=vd Inverse[DiagonalMatrix[{mdd,mss,mbb}]].ConjugateTranspose[TdmatLE];

(* up squarks *)
Mut2LLmat=CKMphys.mq2matLE.Conjugate[Transpose[CKMphys]]+(1/2-2/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)mz^2 IdentityMatrix[3]+DiagonalMatrix[{muu^2,mcc^2,mtt^2}];
Mut2RRmat=mu2matLE+(2/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)mz^2 IdentityMatrix[3]+DiagonalMatrix[{muu^2,mcc^2,mtt^2}];
Mut2LRmat={{-muu*cot\[Beta]*\[Mu]use,0,0},{0,-mcc*cot\[Beta]*\[Mu]use,0},{0,0,-mtt*cot\[Beta]*\[Mu]use}}+DiagonalMatrix[{muu,mcc,mtt}].Aulist;
Mut2RLmat=Transpose[Conjugate[Mut2LRmat]];
Mut2=ArrayFlatten[{{Mut2LLmat,Mut2LRmat},{Mut2RLmat,Mut2RRmat}}];

(* down squarks *)
Mdt2LLmat=mq2matLE+(-1/2+1/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)mz^2 IdentityMatrix[3]+DiagonalMatrix[{mdd^2,mss^2,mbb^2}];
Mdt2RRmat=md2matLE+(-1/3 s\[Theta]w^2)(cos\[Beta]^2-sin\[Beta]^2)mz^2 IdentityMatrix[3]+DiagonalMatrix[{mdd^2,mss^2,mbb^2}];
Mdt2LRmat={{-mdd*tan\[Beta]*\[Mu]use,0,0},{0,-mss*tan\[Beta]*\[Mu]use,0},{0,0,-mbb*tan\[Beta]*\[Mu]use}}+DiagonalMatrix[{mdd,mss,mbb}].Adlist;
Mdt2RLmat=Transpose[Conjugate[Mdt2LRmat]];
Mdt2=ArrayFlatten[{{Mdt2LLmat,Mdt2LRmat},{Mdt2RLmat,Mdt2RRmat}}];

{Mdtvals,Mdtvecs}=SetPrecision[Eigensystem[Mdt2],30];
{Mutvals,Mutvecs}=SetPrecision[Eigensystem[Mut2],30];

(Min[Re[Mutvals]]<0 || Min[Re[Mdtvals]]<0)

]


(* ::Subsection::Closed:: *)
(*Generate high scale input file*)


(* ::Text:: *)
(*This code outputs a text  file in the form:*)
(*g1 g2 g3*)
(*Re[yu11] Im[yu11] Re[yu12] Im[yu12] Re[yu13] Im[yu13]*)
(*Re[yu21] Im[yu21] Re[yu22] Im[yu22] Re[yu23] Im[yu23]*)
(*Re[yu31] Im[yu31] Re[yu32] Im[yu32] Re[yu33] Im[yu33]*)
(*Re[yd11] Im[yd11] Re[yd12] Im[yd12] Re[yd13] Im[yd13]*)
(*Re[yd21] Im[yd21] Re[yd22] Im[yd22] Re[yd23] Im[yd23]*)
(*Re[yd31] Im[yd31] Re[yd32] Im[yd32] Re[yd33] Im[yd33]*)
(*me m\[Mu] m\[Tau]*)
(**)
(*all evaulted at the high scale \[CapitalLambda]high, with an intermediate SUSY scale of \[CapitalLambda]1*)


ProduceHighScaleInputFile[HighScaleFileName_,tan\[Beta]_,\[CapitalLambda]1_,\[CapitalLambda]high_]:=Block[{
\[CapitalLambda]Messenger,Varlist4Boundary={"g1","g2","g3","Yumat","Ydmat","Ylmat"},
vh=GetSMParameter["vhVEV"],
g1,g2,g3,Yumat,Ydmat,Ylmat,
g1temp,g2temp,g3temp,yutemp,ydtemp,yltemp,
g1H,g2H,g3H,yuH,ydH,ylH,
\[CapitalLambda]SUSY,\[CapitalLambda]EW,EWInitValues,EWInitCond,SolsLE2SUSY,
SolsSUSY2MessengerBoundary,SUSYInitCond,
YumatLE,YdmatLE,YlmatLE,leptonmasses,sin\[Beta],cos\[Beta],cot\[Beta]},

\[CapitalLambda]Messenger=\[CapitalLambda]high;
\[CapitalLambda]SUSY=\[CapitalLambda]1;
\[CapitalLambda]EW=vh;

sin\[Beta]=tan\[Beta]/Sqrt[1+tan\[Beta]^2];
cos\[Beta]=sin\[Beta]/tan\[Beta];
cot\[Beta]=1/tan\[Beta];

EWInitValues=Chop[GetEWInitCond[tan\[Beta]]];

EWInitCond={g1[Log[\[CapitalLambda]EW]]==EWInitValues[[1]],
g2[Log[\[CapitalLambda]EW]]==EWInitValues[[2]],
g3[Log[\[CapitalLambda]EW]]==EWInitValues[[3]],
Yumat[Log[\[CapitalLambda]EW]]==EWInitValues[[4]],
Ydmat[Log[\[CapitalLambda]EW]]==EWInitValues[[5]],
Ylmat[Log[\[CapitalLambda]EW]]==EWInitValues[[6]]};

(* EW TO SUSY Scale Evolution using SM beta functions *)
LoadSM\[Beta]functions[];

SolsLE2SUSY=NDSolve[Join[Table[\[Beta]SM[var]-ToExpression[var]'[t]==0,
{var,Varlist4Boundary}],EWInitCond],Flatten[ToExpression[#]&/@Varlist4Boundary],
{t,Log[\[CapitalLambda]EW],Log[\[CapitalLambda]SUSY]}][[1]];

g1temp=g1[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
g2temp=g2[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
g3temp=g3[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
yutemp=Yumat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
ydtemp=Ydmat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
yltemp=Ylmat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;

SUSYInitCond=Flatten[{
g1[Log[\[CapitalLambda]SUSY]]==g1temp,
g2[Log[\[CapitalLambda]SUSY]]==g2temp,
g3[Log[\[CapitalLambda]SUSY]]==g3temp,
Yumat[Log[\[CapitalLambda]SUSY]]==yutemp,
Ydmat[Log[\[CapitalLambda]SUSY]]==ydtemp,
Ylmat[Log[\[CapitalLambda]SUSY]]==yltemp}];

(* SUSY scale to Messenger scale evolution*)
LoadMSSM\[Beta]functions[];

SolsSUSY2MessengerBoundary=NDSolve[Join[Table[\[Beta]MSSM[var]-ToExpression[var]'[t]==0,
{var,Varlist4Boundary}],SUSYInitCond],Flatten[ToExpression[#]&/@Varlist4Boundary],
{t,Log[\[CapitalLambda]SUSY],Log[\[CapitalLambda]Messenger]}][[1]];

g1H=g1[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
g2H=g2[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
g3H=g3[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
yuH=Yumat[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
ydH=Ydmat[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
ylH=Ylmat[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;

leptonmasses=Re[Eigenvalues[ylH]];

Export[HighScaleFileName,
Flatten[{{{Re[g1temp],Re[g2temp],Re[g3temp]}},
OutHighScaleFileFormat[yuH],
OutHighScaleFileFormat[ydH],
{{leptonmasses[[3]],leptonmasses[[2]],leptonmasses[[1]]}}
},1]
];

]


(* ::Subsection::Closed:: *)
(*Master RGE*)


RGFile[SLHA2InFile_,SLHA2OutFile_,Scale_]:=Block[{
\[CapitalLambda]Messenger,M1gauginoIn,M2gauginoIn,M3gauginoIn,MHD2IN,MHU2IN,tan\[Beta],
YumatIn,YdmatIn,Mqt2LLmatIn,Mut2RRmatIn,Mdt2RRmatIn,
Mlt2LLmatIn,Met2RRmatIn,TumatIn,TdmatIn,TlmatIn,
VarlistMSSM={"g1","g2","g3","Yumat","Ydmat","Ylmat","M1","M2","M3",
"mq2mat","mu2mat","md2mat","ml2mat","me2mat","MHd2","MHu2","Tumat","Tdmat","Tlmat"},
Varlist4Boundary={"g1","g2","g3","Yumat","Ydmat","Ylmat"},
vh=GetSMParameter["vhVEV"],MZZ=GetSMParameter["mZ"],mhMass=GetSMParameter["mh"],
g1,g2,g3,Yumat,Ydmat,Ylmat,g1temp,g2temp,g3temp,yutemp,ydtemp,yltemp,
\[CapitalLambda]SUSY,\[CapitalLambda]EW,M1,M2,M3,mq2mat,mu2mat,md2mat,ml2mat,me2mat,MHd2,MHu2,Tumat,Tdmat,Tlmat,\[Lambda]h,
EWInitValues,EWInitCond,vu,vd,SolsLE2SUSY,SolsSUSY2MessengerBoundary,SUSYInitCond,
MessengerInitCond,SolsSUSY2Messenger,\[CapitalLambda]LE,t\[Beta]EW,s\[Beta]EW,c\[Beta]EW,ct\[Beta]EW,KroneckerDeltaMat,\[Mu]use,
mHu2SUSY,mHd2SUSY,abs\[Mu]sqEWCalc,B\[Mu]EWCalc,EWSBFlag,mAmMass,
mq2matLE,mu2matLE,md2matLE,ml2matLE,me2matLE,TumatLE,TdmatLE,TlmatLE,YumatLE,YdmatLE,YlmatLE,
M3val,mq2mattemp,mu2mattemp,md2mattemp,CKMphys,TachyonFlag,sin\[Beta],cos\[Beta],cot\[Beta]},

If[!FileExistsQ[SLHA2InFile],"File "<>SLHA2InFile<>" Does Not Exist",

(* ----- Read in high-scale file ----- *)
{\[CapitalLambda]Messenger,M1gauginoIn,M2gauginoIn,M3gauginoIn,MHD2IN,MHU2IN,tan\[Beta],
YumatIn,YdmatIn,Mqt2LLmatIn,Mut2RRmatIn,Mdt2RRmatIn,
Mlt2LLmatIn,Met2RRmatIn,TumatIn,TdmatIn,TlmatIn}=ReadInFileForRG[SLHA2InFile];
(* ------------------------------------ *)

(* ----- Convert to SARAH basis ----- *)
{YumatIn,YdmatIn,Mqt2LLmatIn,Mut2RRmatIn,Mdt2RRmatIn,
Mlt2LLmatIn,Met2RRmatIn,TumatIn,TdmatIn,TlmatIn}=
Convert2SARAHBasis[YumatIn,YdmatIn,Mqt2LLmatIn,Mut2RRmatIn,Mdt2RRmatIn,
Mlt2LLmatIn,Met2RRmatIn,TumatIn,TdmatIn,TlmatIn];
(* ----------------------------------- *)

\[CapitalLambda]SUSY=Scale;
\[CapitalLambda]EW=vh;

sin\[Beta]=tan\[Beta]/Sqrt[1+tan\[Beta]^2];
cos\[Beta]=sin\[Beta]/tan\[Beta];
cot\[Beta]=1/tan\[Beta];

EWInitValues=Chop[GetEWInitCond[tan\[Beta]]];

EWInitCond={g1[Log[\[CapitalLambda]EW]]==EWInitValues[[1]],
g2[Log[\[CapitalLambda]EW]]==EWInitValues[[2]],
g3[Log[\[CapitalLambda]EW]]==EWInitValues[[3]],
Yumat[Log[\[CapitalLambda]EW]]==EWInitValues[[4]],
Ydmat[Log[\[CapitalLambda]EW]]==EWInitValues[[5]],
Ylmat[Log[\[CapitalLambda]EW]]==EWInitValues[[6]]};

(* EW TO SUSY Scale Evolution using SM beta functions *)
LoadSM\[Beta]functions[];

SolsLE2SUSY=NDSolve[Join[Table[\[Beta]SM[var]-ToExpression[var]'[t]==0,
{var,Varlist4Boundary}],EWInitCond],Flatten[ToExpression[#]&/@Varlist4Boundary],
{t,Log[\[CapitalLambda]EW],Log[\[CapitalLambda]SUSY]}][[1]];

g1temp=Chop[g1[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY];
g2temp=Chop[g2[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY];
g3temp=Chop[g3[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY];
yutemp=Chop[Yumat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY];
ydtemp=Chop[Ydmat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY];
yltemp=Chop[Ylmat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY];

g1temp=g1[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
g2temp=g2[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
g3temp=g3[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
yutemp=Yumat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
ydtemp=Ydmat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;
yltemp=Ylmat[Log[\[CapitalLambda]SUSY]]/.SolsLE2SUSY;

SUSYInitCond=Flatten[{
g1[Log[\[CapitalLambda]SUSY]]==g1temp,
g2[Log[\[CapitalLambda]SUSY]]==g2temp,
g3[Log[\[CapitalLambda]SUSY]]==g3temp,
Yumat[Log[\[CapitalLambda]SUSY]]==yutemp,
Ydmat[Log[\[CapitalLambda]SUSY]]==ydtemp,
Ylmat[Log[\[CapitalLambda]SUSY]]==yltemp}];

(* SUSY scale to Messenger scale evolution*)
LoadMSSM\[Beta]functions[];

SolsSUSY2MessengerBoundary=NDSolve[Join[Table[\[Beta]MSSM[var]-ToExpression[var]'[t]==0,
{var,Varlist4Boundary}],SUSYInitCond],Flatten[ToExpression[#]&/@Varlist4Boundary],
{t,Log[\[CapitalLambda]SUSY],Log[\[CapitalLambda]Messenger]}][[1]];

g1temp=Chop[g1[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary];
g2temp=Chop[g2[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary];
g3temp=Chop[g3[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary];
yutemp=YumatIn;
ydtemp=YdmatIn;
yltemp=Chop[Ylmat[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary];

g1temp=g1[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
g2temp=g2[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
g3temp=g3[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;
yutemp=YumatIn;
ydtemp=YdmatIn;
yltemp=Ylmat[Log[\[CapitalLambda]Messenger]]/.SolsSUSY2MessengerBoundary;

(* Messenger scale to LE scale Evolution *)
MessengerInitCond=Flatten[{
g1[Log[\[CapitalLambda]Messenger]]== g1temp,
g2[Log[\[CapitalLambda]Messenger]]== g2temp,
g3[Log[\[CapitalLambda]Messenger]]== g3temp,
Yumat[Log[\[CapitalLambda]Messenger]]== yutemp,
Ydmat[Log[\[CapitalLambda]Messenger]]== ydtemp,
Ylmat[Log[\[CapitalLambda]Messenger]]== yltemp,
M1[Log[\[CapitalLambda]Messenger]]== M1gauginoIn,
M2[Log[\[CapitalLambda]Messenger]]== M2gauginoIn,
M3[Log[\[CapitalLambda]Messenger]]== M3gauginoIn,
mq2mat[Log[\[CapitalLambda]Messenger]]== Mqt2LLmatIn,
mu2mat[Log[\[CapitalLambda]Messenger]]== Mut2RRmatIn,
md2mat[Log[\[CapitalLambda]Messenger]]== Mdt2RRmatIn,
ml2mat[Log[\[CapitalLambda]Messenger]]== Mlt2LLmatIn,
me2mat[Log[\[CapitalLambda]Messenger]]== Met2RRmatIn, 
Tumat[Log[\[CapitalLambda]Messenger]]== TumatIn, 
Tdmat[Log[\[CapitalLambda]Messenger]]== TdmatIn,
Tlmat[Log[\[CapitalLambda]Messenger]]== TlmatIn,
MHd2[Log[\[CapitalLambda]Messenger]]== MHD2IN,
MHu2[Log[\[CapitalLambda]Messenger]]== MHU2IN}];

SolsSUSY2Messenger= NDSolve[Join[Table[\[Beta]MSSM[var]-ToExpression[var]'[t]==0,
{var,VarlistMSSM}],{KroneckerDeltaMat'[t]==ConstantArray[0,{3,3}],
KroneckerDeltaMat[Log[\[CapitalLambda]Messenger]]==IdentityMatrix[3]},
MessengerInitCond],Flatten[ToExpression[#]&/@VarlistMSSM],
{t,Log[\[CapitalLambda]SUSY],Log[\[CapitalLambda]Messenger]}][[1]];

(* Scale at which to write the output SLHA2 file *)

\[CapitalLambda]LE=\[CapitalLambda]SUSY;

t\[Beta]EW= tan\[Beta];
s\[Beta]EW= t\[Beta]EW /Sqrt[1+t\[Beta]EW^2];
c\[Beta]EW= 1/Sqrt[1+t\[Beta]EW^2];
ct\[Beta]EW= 1/t\[Beta]EW;

mHu2SUSY=Re[MHu2[Log[\[CapitalLambda]SUSY]]/.SolsSUSY2Messenger];
mHd2SUSY=Re[MHd2[Log[\[CapitalLambda]SUSY]]/.SolsSUSY2Messenger];

abs\[Mu]sqEWCalc=Re[1/(c\[Beta]EW^2-s\[Beta]EW^2)*(mHu2SUSY s\[Beta]EW^2- mHd2SUSY c\[Beta]EW^2 ) - (1/2) MZZ^2]; 
B\[Mu]EWCalc=(-1/2)Re[(mHd2SUSY - mHu2SUSY) (2 t\[Beta]EW/(1-t\[Beta]EW^2) ) + MZZ^2 (2 s\[Beta]EW c\[Beta]EW)];

EWSBFlag=TestEWSBCond[mHu2SUSY,mHd2SUSY,abs\[Mu]sqEWCalc,B\[Mu]EWCalc];
\[Mu]use=Sqrt[abs\[Mu]sqEWCalc];
mAmMass=Chop[Sqrt[2 * B\[Mu]EWCalc /(2 s\[Beta]EW c\[Beta]EW )]];

mq2matLE=mq2mat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
mu2matLE=mu2mat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
md2matLE=md2mat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
ml2matLE=ml2mat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
me2matLE=me2mat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
TumatLE=Tumat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
TdmatLE=Tdmat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
TlmatLE=Tlmat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
YumatLE=Yumat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
YdmatLE=Ydmat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;
YlmatLE=Ylmat[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger ;

(* ----------- Convert to SARAH -> SCKM basis ------------- *)
{YumatLE,YdmatLE,mq2matLE,mu2matLE,md2matLE,ml2matLE,me2matLE,TumatLE,TdmatLE,TlmatLE}=
Convert2SLHA2Basis[YumatLE,YdmatLE,mq2matLE,mu2matLE,md2matLE,ml2matLE,me2matLE,TumatLE,TdmatLE,TlmatLE];
(* ---------------------------------------------- *)

(* ------ Apply BMPZ Threshold Corrections ------- *)
M3val=Chop[M3[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger];
mq2mattemp=Chop[mq2matLE];
mu2mattemp=Chop[mu2matLE];
md2mattemp=Chop[md2matLE];
{M3val,mq2matLE,mu2matLE,md2matLE}=ApplyBMPZThresh[\[CapitalLambda]LE,M3val,mq2mattemp,mu2mattemp,md2mattemp];
(* ---------------------------------------------- *)

(* Tachyon Flag Check *)
TachyonFlag=TestTachyon[mq2matLE,mu2matLE,md2matLE,ml2matLE,me2matLE,TumatLE,TdmatLE,TlmatLE,\[Mu]use,tan\[Beta]];

If[!TachyonFlag||!EWSBFlag,

Export[SLHA2OutFile,
Flatten[{{{"# FormFlavor RGFile SLHA2 Input - version "<>ToString[FormFlavor`$FFVersion]}},
{{"Block","MSOFT"},
{0,\[CapitalLambda]LE},
{1,Chop[M1[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger]},
{2,Chop[M2[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger]},
{3,M3val},
{21,Chop[MHd2[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger]},
{22,Chop[MHu2[Log[\[CapitalLambda]LE]]/.SolsSUSY2Messenger]},
{25,t\[Beta]EW}},

OutNxNMatrixFormat["MSQ2",Re[mq2matLE],3],
OutNxNMatrixFormat["MSU2",Re[mu2matLE],3],
OutNxNMatrixFormat["MSD2",Re[md2matLE],3],
OutNxNMatrixFormat["MSL2",Re[ml2matLE],3],
OutNxNMatrixFormat["MSE2",Re[me2matLE],3],
OutNxNMatrixFormat["TU",Re[TumatLE],3],
OutNxNMatrixFormat["TD",Re[TdmatLE],3],
OutNxNMatrixFormat["TE",Re[TlmatLE],3],

OutNxNMatrixFormat["IMMSQ2",Im[mq2matLE],3],
OutNxNMatrixFormat["IMMSU2",Im[mu2matLE],3],
OutNxNMatrixFormat["IMMSD2",Im[md2matLE],3],
OutNxNMatrixFormat["IMMSL2",Im[ml2matLE],3],
OutNxNMatrixFormat["IMMSE2",Im[me2matLE],3],
OutNxNMatrixFormat["IMTU",Im[TumatLE],3],
OutNxNMatrixFormat["IMTD",Im[TdmatLE],3],
OutNxNMatrixFormat["IMTE",Im[TlmatLE],3],

{{"Block","HMIX"},
{1,\[Mu]use}},

{{"Block","MASS"},
{25,mhMass},
{36,mAmMass}}
},1]

]

, Print["Tachyonic Solution"]];
](* End File Exists If *)

]


RGFile[Filename_,Scale_]:=RGFile[Filename,StringJoin[Filename,".dat"],Scale]


(* ::Section:: *)
(*Function Information*)


RGFile::usage = "RGFile[SLHA2InFile,SLHA2OutFile,\[Mu]] RG evolve high scale SLHA2InFile down to scale \[Mu] and output SLHA2OutFile (generated with the help of SARAH by F. Staub).";
