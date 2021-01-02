(* ::Package:: *)

(* ::Title:: *)
(*CalcAmps*)


(* ::Subtitle:: *)
(*by Jared A. Evans and David Shih*)


(* ::Section:: *)
(*Load FeynArts and FormCalc*)


(* AVOID SHADOWING ERRORS *)
BeginPackage["FormCalc`"];
{T12,T13,T23,S12,S13,S23,U12,U13,U23}
EndPackage[];


CalcAmps`$LOADED=True;

CalcAmps`$CAVersion="1.0.2";
CalcAmps`$CAVersionDate="30 August 2016";

Print[""];
Print["CalcAmps ",CalcAmps`$CAVersion," (",CalcAmps`$CAVersionDate,")"];
Print["by Jared A. Evans and David Shih"];
Print["Documentation:"];
Print["  arXiv:1606.00003"];


Get[CalcAmps`$FeynArtsPath<>"/FeynArts.m"];
Get[CalcAmps`$FormCalcPath<>"/FormCalc.m"];
$FV={11,12,13,14}; (* for slepton flavor vioaltion *)


BeginPackage["CalcAmps`",{"Global`","FormCalc`","Form`","OPP`","LoopTools`","FeynArts`"}];


(* ::Section:: *)
(*Load CA model file*)


Get[ToFileName[CalcAmps`$CalcAmpsPath, "CalcAmpsModel.m"]];


(* ::Section:: *)
(*Functions for generating diagrams*)


CountDiagrams[diags_]:=Length[StringPosition[ToString[diags],"FeynmanGraph[1, Classes"]]


FreeAnyQ[expr_,list_]:=And@@Table[FreeQ[expr,list[[i]]],{i,1,Length[list]}]


SMOnlyQ[fieldlist_]:=Module[{fieldlist2,iSM},
fieldlist2=fieldlist;
Do[
fieldlist2=DeleteCases[fieldlist2,CASMlist[[iSM]]];

,{iSM,1,Length[CASMlist]}];
TrueQ[Length[fieldlist2]==0]

];

DiagramFieldList[diag_]:=(List@@diag)/.{(Field[_]->x_)->x};


(* This routine generates diagrams corresponding to the 4-fermi operator f1bar (...) f2 f3bar(...) f4 or the dipole type operator f1bar (...) f2 Fmunu. 

In the first case, the input must be operator1={f1,f2}, operator2={f3,f4}. Then the diagrams correspond to 2->2 scattering processes with initial state 
|f2,-f1>:=a_ {f2}^dagger b_ {f1}^dagger |0> and final state <f3,-f4|:=<0|b_{f4}a_ {f3}. 

In the second case, input must be operator1={f1,f2}, operator2={V} or operator1={V}, operator2={f1,f2}. Then the diagrams correspond to 1->2
scattering with initial state V and final state <f1,-f2|. *)

(* The order is very important. FeynArts+FormCalc will differ by a sign when asked to generate {a,b}->{c,d} vs {b,a}->{c,d} where a and b are fermions. *)

Options[GenerateDiagrams]={GenerateSM->False,ExcludeTopologies->Tadpoles,ExcludeParticles->{},Model->CAModelName};
GenerateDiagrams[initstate_,finalstate_,OptionsPattern[]]:=Module[
{ninit,nfinal,model,includefields,excludefields,excludeinteractions,ndiag,tops,
ins,alltops,alldiags,topologylist,diaglist,output,GenerateSMQ,ExcludeTopologiesList,
ExcludeParticlesList,ModelUse},

GenerateSMQ=OptionValue[GenerateSM];
ExcludeTopologiesList=OptionValue[ExcludeTopologies];
If[!(Head[ExcludeTopologiesList]===List),ExcludeTopologiesList={ExcludeTopologiesList}];
ExcludeParticlesList=OptionValue[ExcludeParticles];
If[!(Head[ExcludeParticlesList]===List),ExcludeParticlesList={ExcludeParticlesList}];
ModelUse=OptionValue[Model];


ClearProcess[];
ClearSubexpr[];
 
(* Syntax for initial and final states: 
F[m,{n}]=down-type quark of generation n (m=4); up-type quark of generation n (m=3); neutrino of generation n (m=1), charged lepton of generaton n (m=2). 
-F[m,{n}] is the corresponding anti-particle.
V[1] = photon
V[2] = Z
V[3]= W-
V[5]=gluon 

For example F[4,{1}] is the down quark, F[4,{2}] is the strange. *)

ninit=Length[initstate];
nfinal=Length[finalstate];

topologylist={"boxes","penguins","wavefncorr"};
(* Exclude photon and gluon penguins from EDM type diagrams (e.g. d->dgamma). They are superficially singular and are zero *)
If[ninit+nfinal==3&&((SameQ@@Abs[initstate]&&SameQ@@Abs[finalstate]))&&(MemberQ[Join[initstate,finalstate],V[1]]||MemberQ[Join[initstate,finalstate],V[5]]),
   topologylist=DeleteCases[topologylist,"wavefncorr"];
];


tops["boxes"]=CreateTopologies[1,ninit->nfinal,BoxesOnly];
tops["penguins"]=CreateTopologies[1,ninit->nfinal,ExcludeTopologies->{Boxes,SelfEnergies,Tadpoles}];
tops["wavefncorr"]=CreateTopologies[1,ninit->nfinal,ExcludeTopologies->{Boxes,Triangles,Tadpoles}];

output=Select[
Table[
ins[topologytype]=InsertFields[tops[topologytype],initstate->finalstate,Model->ModelUse,InsertionLevel->{Classes}];
(* Exclude photon and gluon penguins from 2->2 processes! If needed (e.g. for b->sss), must add them back in by computing 1->2 photon *)
If[ninit+nfinal==4&&(topologytype=="penguins"||topologytype=="wavefncorr"),
ins[topologytype]=DiagramSelect[ins[topologytype],FreeQ[#,Field[5]->V[1]]&&FreeQ[#,Field[5]->V[5,___]]&];
];

(* If GenerateSM option set to false (default), remove SM diagrams *)
If[!GenerateSMQ,
ins[topologytype]=DiagramSelect[ins[topologytype],!SMOnlyQ[DiagramFieldList[#]]&];
];


{topologytype,ins[topologytype]},{topologytype,topologylist}],CountDiagrams[#[[-1]]]>0&];

output

];


ShowDiagrams[diagrams_]:=
(* Input is a list of the form {topologytype,diagtype,diagram} *)
Do[If[CountDiagrams[diagrams[[i,3]]]!=0,Print[diagrams[[i,1]],diagrams[[i,2]]];Paint[diagrams[[i,3]],PaintLevel->{Classes}]],{i,1,Length[diagrams]}]


(* ::Section:: *)
(*Functions for calculating amplitudes*)


(* ::Subsection:: *)
(*Identifying operators for Wilson coefficients*)


(* Our operator definitions are related to those in section IV of 9512380 Buchalla, Buras & Lautenbacher *) 


(* initstate and finalstate are lists of the SM particles. *)


PLRfunc[6]="R";
PLRfunc[7]="L";
LtoRfunc["L"]="R";
LtoRfunc["R"]="L";


(* For the four-fermi operators, can send external momenta to zero smoothly *)
id[r_. DiracChain[s2_Spinor,x3___,s1_Spinor]DiracChain[s3_Spinor,x1___,k[i_],x2___,s4_Spinor],___]:=0

(* EXTRA FACTOR OF 2 FOR DeltaF=2 operators which come from (bilinear)^2 *)

(* The dirac chain <u1|P_{L,R}|u2><u3|P_{L,R}|u4> *)
id[r_. DiracChain[s1_Spinor,om1_,s2_Spinor]DiracChain[s3_Spinor,om2_,s4_Spinor],op1_,op2_]:=If[Length[op1]+Length[op2]==4&&op1===op2,1/2 r (OpS@@Sort[{PLRfunc[om1],PLRfunc[om2]}])[op1,op2],r OpS[PLRfunc[om1],PLRfunc[om2]][op1,op2]]

(* The dirac chain <u1|P_{L,R}\[Gamma]^\[Mu]|u2><u3|P_{L,R}Subscript[\[Gamma], \[Mu]]|u4> *)
id[r_. DiracChain[s1_Spinor,om1_,Lor[1],s2_Spinor]DiracChain[s3_Spinor,om2_,Lor[1],s4_Spinor],op1_,op2_]:=If[Length[op1]+Length[op2]==4&&op1===op2,1/2 r (OpV@@Sort[{LtoRfunc[PLRfunc[om1]],LtoRfunc[PLRfunc[om2]]}])[op1,op2],r OpV[LtoRfunc[PLRfunc[om1]],LtoRfunc[PLRfunc[om2]]][op1,op2]]

(* The dirac chain 1/4 <u1|P_ {L,R}[\[Gamma]^\[Mu],\[Gamma]^\[Nu]]|u2><u3|P_ {L,R}[Subscript[\[Gamma], \[Mu]],Subscript[\[Gamma], \[Nu]]]|u4> *)
id[r_. DiracChain[s1_Spinor,om1_,Lor[1],Lor[2],s2_Spinor]DiracChain[s3_Spinor,om2_,Lor[1],Lor[2],s4_Spinor],op1_,op2_]:=If[Length[op1]+Length[op2]==4&&op1===op2,1/2 r (OpT@@Sort[{PLRfunc[-om1],PLRfunc[-om2]}])[op1,op2],r OpT[PLRfunc[-om1],PLRfunc[-om2]][op1,op2]]


(* Gordon identities, see hep-ph/0607049 *)


(* Op4[om,{k1,m1},{k2,m2}] = ubar(k1,m1) P_{L,R} u(k2,m2) *)
id[r_. DiracChain[s1:Spinor[p2_,m2_,_], om_, s2:Spinor[p1_, m1_, _]],op1_,op2_] :=r Op4[PLRfunc[om]][op1,op2]


id[r_. DiracChain[s2_Spinor, om_, ec[i_], s1_Spinor], op1_,{V[1]}] := r  OpA10[LtoRfunc[PLRfunc[om]]][op1,{V[1]}];
id[r_. DiracChain[s2_Spinor, om_, e[i_], s1_Spinor], op1_,{V[1]}] := r  OpA10[LtoRfunc[PLRfunc[om]]][op1,{V[1]}];
id[r_. DiracChain[s2_Spinor, om_, ec[i_], s1_Spinor], op1_,{V[5]}] := r  OpG10[LtoRfunc[PLRfunc[om]]][op1,{V[5]}];
id[r_. DiracChain[s2_Spinor, om_, e[i_], s1_Spinor], op1_,{V[5]}] := r  OpG10[LtoRfunc[PLRfunc[om]]][op1,{V[5]}];


Oplist=Flatten[{Table[OpS[i,j][__],{i,{"L","R"}},{j,{"L","R"}}],Table[OpV[i,j][__],{i,{"L","R"}},{j,{"L","R"}}],Table[OpT[i,j][__],{i,{"L","R"}},{j,{"L","R"}}],Table[OpA[i][__],{i,{"L","R"}}],Table[OpA10[i][__],{i,{"L","R"}}],Table[OpG[i][__],{i,{"L","R"}}],Table[OpG10[i][__],{i,{"L","R"}}]}];


(* Trade k1 and k2 for (k1+k2)/2 because terms proportional to q=(k1-k2) will vanish when contracted with the photon propagator. *)
(* EL Op4[om,{k1,m1},{k2,m2}]Pair[ec[i],k1] = EL ubar(k1,m1) P_{L,R} u(k2,m2) \[Epsilon]_ \[Mu] k1^\[Mu] 
-> EL ubar(k1,m1) 1/2(-(m1+m2) \[Gamma]^\[Mu]+I \[Sigma]^\[Mu]\[Nu] q_ \[Nu])P_{L,R}u(k2,m2) \[Epsilon]_ \[Mu]
-> -1/2 EL^2 (m1+m2) ubar(k1,m1)\[Gamma]^\[Mu] P_{L,R} u(k2,m2) Sum_q Qe(q) qbar \[Gamma]_ \[Mu] q 
          + 1/4 I EL ubar(k1,m1) \[Sigma]^\[Mu]\[Nu] P_{L,R} u(k2,m2) F_{\[Mu]\[Nu]} 
:= -1/2 EL^2 (m1+m2) O_{10} + 1/4 EL O_ 7 *)

(* GS Op4[om,{k1,m1},{k2,m2}]Pair[ec[i],k1] (T^A)_{\[Alpha]\[Beta]} = GS ubar(k1,m1) P_{L,R} u(k2,m2) \[Epsilon]_ \[Mu] k1^\[Mu] (T^A)_{\[Alpha]\[Beta]}
-> GS ubar(k1,m1) 1/2(-(m1+m2) \[Gamma]^\[Mu]+I \[Sigma]^\[Mu]\[Nu] q_ \[Nu])P_{L,R}u(k2,m2) \[Epsilon]_ \[Mu] (T^A)_{\[Alpha]\[Beta]}
-> -1/2 GS^2 (m1+m2) ubar(k1,m1)\[Gamma]^\[Mu] P_{L,R} u(k2,m2) Sum_q qbar \[Gamma]_ \[Mu] q Sum_A (T^A)_{\[Alpha]\[Beta]} (T^A)_{\[Gamma]\[Delta]}
+ 1/4 I GS ubar(k1,m1) \[Sigma]^\[Mu]\[Nu] P_{L,R} u(k2,m2) G_{\[Mu]\[Nu]} 
:= -1/2 EL^2 (m1+m2)(1/2 O_ 4-1/6 O_ 3) + 1/4 EL O_ 8 *)


(* We will absorb a factor of EL and GS into OpA and OpG respectively *)
GordonIdentity[terms_]:=Expand[terms]//.
{Op4[om_][op1_,{V[1]}]Pair[ec[3],k[_]]:>1/4 OpA[om][op1,{V[1]}]+1/2(ExtractMass[op1[[1]]]+ExtractMass[op1[[2]]])OpA10[om][op1,{V[1]}],
Op4[om_][op1_,{V[5]}]Pair[ec[3],k[_]]:>1/4 OpG[om][op1,{V[5]}]+1/2(ExtractMass[op1[[1]]]+ExtractMass[op1[[2]]])OpG10[om][op1,{V[5]}]}/.OpA[om_][op1_,op2_]->1/EL OpA[om][op1,op2]/. OpG[om_][op1_,op2_]->1/GS OpG[om][op1,op2]


(* Set the F1 operators to zero for EDM-type processes *)
OpA10[om_][{x_,x_},{V[1]}]:=0;
OpG10[om_][{x_,x_},{V[5]}]:=0;


(* ::Subsection:: *)
(*Functions for calculating amplitudes*)


(* Process depenedent mass substitution list - separates radiative / EDM *)
(* Function added 1.0.2  (29 Aug 2016) *)
extractZeroingMasses::BadZeroList = "List `1` has length `2` instead of length 10.  
Needs to be of form {ME\[Rule]0,ME2\[Rule]0,MU\[Rule]0,MU2\[Rule]0,MD\[Rule]0,MD2\[Rule]0,MS\[Rule]0,MS2\[Rule]0,MC\[Rule]0,MC2\[Rule]0},
but the specific naming convention is FeynArts model dependent"; 
extractZeroingMasses[is_,fs_,CAfermzerolist_]:=Module[{net=Union[is,fs]/.CA2FFFieldMap},
If[Length[CAfermzerolist]!=10,Message[extractZeroingMasses::BadZeroList,CAfermzerolist,Length[CAfermzerolist]];,
If[MemberQ[net,"\[Gamma]"]||MemberQ[net,"g"],
Which[MemberQ[net,"t"]||MemberQ[net,"b"],CAfermzerolist,MemberQ[net,"c"],CAfermzerolist[[1;;8]],
MemberQ[net,"s"],CAfermzerolist[[1;;6]],MemberQ[net,"u"]||MemberQ[net,"d"],CAfermzerolist[[1;;2]],True,CAfermzerolist],
CAfermzerolist]]]


(* diaglist should be of the format: {observable,initial state, final state, topology, FeynArts diagram} *)
Options[CalcAmps]={ThirdGenDominance->True};
CalcAmps[procname_,operator1_,operator2_,OptionsPattern[]]:=Block[
{fermionorder,initstate,finalstate,amptemp,amptemp2,verttemp,minit,minit2,
x,i,ii,j,bb,aa,Inda,Indb,kk,Sfe,t,g,y,topology,diagtype,diagram,nbody,
ThirdGenDominanceQ,diaglist,output,time,diagtemp,amptemptemp,amptempsave,
amptempsave2,amptempsavebeforeCKM,amptempsavebeforeMMMB,amptempsavebeafterMMMB,
amptempsaveafterCKM,tempCAfermzerolist},

ThirdGenDominanceQ=OptionValue[ThirdGenDominance];

Which[Length[operator1]==2&&Length[operator2]==2,
initstate={operator1[[2]],-operator1[[1]]};
finalstate={operator2[[1]],-operator2[[2]]};
,
Length[operator1]==2&&Length[operator2]==1,
initstate={operator1[[2]],-operator1[[1]]};
finalstate=operator2;
,
Length[operator1]==1&&Length[operator2]==2,
initstate={operator2[[2]],-operator2[[1]]};
finalstate=operator1;
,
True,
Print["Error in CalcAmp! Operator format not recognized!"];Return[];
];
If[Length[initstate]+Length[finalstate]==4,fermionorder={2,1,3,4},fermionorder={2,1}];

Print["Generating diagrams..."];
diaglist=GenerateDiagrams[initstate,finalstate];
(* GenerateDiagrams returns a list of the form {{topology1,diag1},{topology2,diag2},...} *)

output=Table[

topology=diaglist[[idiag,1]];
diagram=diaglist[[idiag,2]];

Print["Calculating ",procname," ",topology];

time=AbsoluteTiming[
amptemp=Sum[

ClearProcess[];
ClearSubexpr[];

diagtemp=DiagramExtract[diagram,{nn}];

(* According to source: "Flavor in the era of the LHC" talk 05/2006 by S Penaranda the A-terms in FormCalc/FeynArts are defined such that they contribute to the sfermion masses as m_i Af[i,j]. We will work instead with A-terms defined such that they contribute as v af[i,j]. *)
amptemptemp=CreateFeynAmp[diagtemp]/.CAFCtermSubList;

(* Function added 1.0.2  (29 Aug 2016) *)
tempCAfermzerolist=extractZeroingMasses[initstate,finalstate,CAfermzerolist];

If[ThirdGenDominanceQ&&!(topology==="wavefncorr"),
amptemptemp=amptemptemp/.tempCAfermzerolist;
];

(* All external particles should be kept ON-SHELL in the calculation. At the end of the calculation, we want to set most fermion masses to zero,
 as these generally correspond to higher dimension operators. There are also additional operators of the form <1|2><3|k1slash|4> generated by
FormCalc. These are definitely higher dimension operators. *)

If[Length[initstate]+Length[finalstate]==3,amptemptemp=OffShell[amptemptemp,3->qq];];

amptemptemp=(Plus@@CalcFeynAmp[amptemptemp,FermionChains->Chiral,NoCostly->True,SortDen->False,FermionOrder->fermionorder])//.Subexpr[]//.Abbr[]/.Den[x_,y_]->1/(x-y)/.IGram[x_]->1/x/.Mat[x_]->id[x,operator1,operator2];

amptemptemp
,{nn,1,CountDiagrams[diagram]}];
];

amptempbeforeGordon=amptemp;
(* Print[amptempbeforeGordon]; *)
amptemp=GordonIdentity[amptemp];

amptempsave=amptemp;
(* Print[amptempsave]; *)
time=AbsoluteTiming[

amptemp=amptemp/.{S->0,T->0,U->0,T12->0,T13->0,T23->0,S12->0,S13->0,S23->0,U12->0,U13->0,U23->0}/.B0i[zz_,qq1_,x_,y_]->B0i0[zz,x,y]+qq1 B0i1[zz,x,y]/.{C0i[z_,x1_,qq^2,x3_,x__]->(C0i0[z,x]+qq^2 C0i1[z,x]),C0i[z_,x1_,x2_,x3_,x__]->(C0i0[z,x]),D0i[z_,x1_,x2_,x3_,x4_,x5_,x6_,x__]->(D0i[z,x])};
amptempsave2=amptemp;

(* For photon/gluon penguin corrections to F1 form factor, the q^0 term cancels out by gauge invariance, while the q^2 term will cancel
with the 1/q^2 photon/gluon propagator in a 4-fermion amplitude *)
(* Meanwhile for the magnetic dipole operators, can set q=0 *)
amptemp=Expand[amptemp]/.{OpA10[x__][y__]z_.:>OpA10[x][y]Coefficient[z,qq,2],OpG10[x__][y__]z_.:>OpG10[x][y]Coefficient[z,qq,2],OpA[x__][y__]z_.:>OpA[x][y](z/.qq->0),OpG[x__][y__]z_.:>OpG[x][y](z/.qq->0)};

(* Perform Higgs angle substitutions substitutions (defined in CalcAmpsModel.m) *)
amptemp=amptemp//.CAHiggsAngleSubList;

amptempsavebeforeCKM=amptemp;
amptemp=Expand[amptemp]//.SumOver[ind_,3]CKM[ind_,i_]CKMC[ind_,j_]z_.:>KroneckerDelta[i,j]z/;FreeQ[z,ind];

];


time=AbsoluteTiming[
If[ThirdGenDominanceQ,
(* By this point the singularity in the wavefunction correction diagrams 
have been dealt with, so it should be safe to set these fermion masses to zero *)
amptemp=Expand[amptemp];
(* order of zeroing masses matters *)
For[ii=1,ii<=Length[tempCAfermzerolist],ii++,
amptemp=amptemp/.{tempCAfermzerolist[[ii]]};
];

amptemp=Expand[amptemp]//.CAMassSumThirdGenDomSub]; 
];

(* Get rid of terms that can come from operators with dimension higher than 6 -- any factor of remaining fermion masses
that is not a Yukawa coupling. Treat the dipole operators specially since these are superficially 
dimension 5, but actually effective dimension 6 *) 
amptempsavebeforeMMMB=amptemp;
time=AbsoluteTiming[
(* \[Epsilon]f counts powers of yb and y\[Mu]. \[Epsilon] counts powers of 1/tanbeta. Drop all terms 
that are proportional to non-tanbeta-enhanced fermion masses, i.e.
of the form \[Epsilon]f^a \[Epsilon]^b with a>0 and b>0 *)
(* For dimension 5 operators OpA and OpG, allow one power of fermion mass, which makes it effective dimension 6 and comparable to the 4-fermi operators *)
amptemp=Expand[amptemp/.CAMMMBSub/.CAMMMB\[Epsilon]Sub];
amptemp=amptemp/.{OpA[x__][y__]->OpA[x][y]/(\[Epsilon]f \[Epsilon]),OpG[x__][y__]->OpG[x][y]/(\[Epsilon]f \[Epsilon])}/.\[Epsilon]f \[Epsilon]->0/.\[Epsilon]f \[Epsilon]^k_:>0/;k>0/.\[Epsilon]f^k_ \[Epsilon]:>0/;k>0/.\[Epsilon]f^j_ \[Epsilon]^k_:>0/;k>0&&j>0;
amptemp=amptemp/.{\[Epsilon]f->1,\[Epsilon]->1}/.CAMMMBUnSub;
];
amptempsavebeafterMMMB=amptemp;


time=AbsoluteTiming[
amptemp=Expand[amptemp]/.IndexDelta->KroneckerDelta/.KroneckerDelta[x__]^k_:>KroneckerDelta[x]
//.CAKDSumSub
//.{SumOver[ind1_,n_]SumOver[ind2_,n_]KroneckerDelta[ind1_,ind2_]z_.:>(SumOver[ind2,n]z/.ind1->ind2),
SumOver[ind1_,n_]SumOver[ind2_,n_]KroneckerDelta[ind1_+3,ind2_+3]z_.:>(SumOver[ind2,n]z/.ind1->ind2),
SumOver[ind1_,n_]SumOver[ind2_,n_]KroneckerDelta[ind1_,ind2_+3]z_.->0,
SumOver[ind1_,n_]SumOver[ind2_,n_]KroneckerDelta[ind1_+3,ind2_]z_.->0}
//.{SumOver[ind_,3]KroneckerDelta[3,ind_]z_.:>(z/.ind->3),
SumOver[ind_,3]KroneckerDelta[ind_,3]z_.:>(z/.ind->3),
SumOver[ind_,3]KroneckerDelta[6,ind_]z_.:>0,
SumOver[ind_,3]KroneckerDelta[ind_,6]z_.:>0};
amptempsaveafterCKM=amptemp;
];

time=AbsoluteTiming[
If[Head[Expand[amptemp]]===Plus,amptemp=List@@Expand[amptemp],amptemp={Expand[amptemp]}];
amptemp=Tr[amptemp//.CASumSub1/.CASumSub2];

];


time=AbsoluteTiming[
amptemp=Collect[amptemp,Flatten[{Oplist,CACollection}],Simplify]; 
];

{procname,{operator1,operator2},topology,amptemp}

,{idiag,1,Length[diaglist]}];

output/.CA2FFFieldMap

];


(* ::Section:: *)
(*Functions for writing files*)


WriteAmp[Amplist_,Filename_]:=Module[{PathName=CalcAmps`$CalcAmpsOutputPath<>Filename},
Put[Amplist,PathName];];


(* ::Section:: *)
(*End Package*)


EndPackage[];
