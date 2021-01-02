(* ::Package:: *)

(* ::Title:: *)
(*CalcAmps Model MSSM*)


(* ::Subtitle:: *)
(*by Jared A. Evans and David Shih*)


CAModelName={"MSSMQCD","FV"};


(* ::Section:: *)
(*Model specific substitutions*)


(* ::Text:: *)
(*Note: model specific substitutions*)
(*- CASMlist*)
(*- CAandFFFieldList*)
(*-- CA2FFFieldMap*)
(*-- FF2CAFieldMap*)
(*- CAfermzerolist*)
(*- CAFCtermSubList*)
(*- CAHiggsAngleSubList*)
(*- CAMassSumThirdGenDomSub*)
(*- CAMMMBSub,CAMMMB\[Epsilon]Sub,CAMMMBUnSub*)
(*- CAKDSumSub*)
(*- CASumSub1,CASumSub2*)
(*must be set in order for CalcAmps to function.  If no substituion is desired set as, {}.*)


(* This list depends on the model being used. For instance, it's not the same between "SM" and "MSSM" in the FeynArts manual. *)
CASMlist={F[4,___],F[3,___],F[2,___],F[1,___],V[5,___],V[3,___],V[2,___],V[1,___],S[1,___],S[4,___],S[6,___]};
CASMlist=Join[CASMlist,-CASMlist];

(* Mapping of fields and mass into FF notation *)
CAandFFFieldList={
{F[4,{3}],"b",MB},{F[4,{2}],"s",MS},{F[4,{1}],"d",MD},
{F[3,{3}],"t",MT},{F[3,{2}],"c",MC},{F[3,{1}],"u",MU},
{F[2,{3}],"\[Tau]",ML},{F[2,{2}],"\[Mu]",MM},{F[2,{1}],"e",ME},
{F[1,{3}],"\[Nu]\[Tau]",0},{F[1,{2}],"\[Nu]\[Mu]",0},{F[1,{1}],"\[Nu]e",0},
{V[1],"\[Gamma]",0},{V[5],"g",0},{S[1],"h",MH}};

CA2FFFieldMap=Table[X[[1]]->X[[2]],{X,CAandFFFieldList}];
FF2CAFieldMap=Table[X[[2]]->X[[1]],{X,CAandFFFieldList}];

(* For Gordon Identity *)
ExtractMass[name_]:=Select[CAandFFFieldList,#[[1]]==name||#[[2]]==name &][[1,3]]


(* Name of SM Mass Parameters that will be set to zero in the third gen approximation *)
(* Note: to prevent false singularities, should be defined from least massive to most massive. *) 
(* Note: mmu is not set to zero here due to Bq\[Rule]\[Mu]\[Mu] *)
CAfermzerolist={ME,ME2,MU,MU2,MD,MD2,MS,MS2,MC,MC2};
CAfermzerolist=(#->0)&/@CAfermzerolist;


(* to be performed immediately after diagrams are translated to amplitudes *)
CAFCtermSubList={Af[a_,i_,j_]->af[a,i,j]/Mf[a,i]vv If[a==4,CB,SB],AfC[a_,i_,j_]->afc[a,i,j]/Mf[a,i]vv If[a==4,CB,SB]};


(* MSSM Higgs Angle Substitutions *)  
(* Assuming alignment limit *)
CAHiggsAngleSubList={TB->sb/cb,TB2->sb^2/cb^2,SB->sb,CB->cb,SB2->sb^2,CB2->cb^2,
SA->-cb,CA->sb,SA2->cb^2,CA2->sb^2,C2B->cb^2-sb^2,S2B->2 sb cb,SAB->-C2B,CAB->S2B,
SBA->1,CBA->0,S2A->-2sb cb,C2A->sb^2-cb^2};

(* General Alpha & Beta *)
(* Note: CAB = Cos[\[Alpha]+\[Beta]], CBA = Cos[\[Beta]-\[Alpha]] *)
CAHiggsAngleSubList={TB->sb/cb,TB2->sb^2/cb^2,SB->sb,CB->cb,SB2->sb^2,CB2->cb^2,
SA->sa,CA->ca,SA2->sa^2,CA2->ca^2,C2B->cb^2-sb^2,S2B->2 sb cb,S2A->2sa ca,C2A->ca^2-sa^2,
SAB->sa cb +ca sb,CAB->ca cb - sa sb,SBA->sb ca-sa cb,CBA->cb ca + sa sb};


(* Substitution for 3rd gen approximation *)
(* Should be used in all code, but Mf, Mf2 should be defined as in the FA model *)
(*
  Mf[4,i]  =  m^u_i,     Mf[3,i]  =   m^d_i 
  Mf2[4,i] = (m^u_i)^2,  Mf2[3,i] = (m^d_i)^2
  *)
CAMassSumThirdGenDomSub={SumOver[ind_,3]Mf[3,ind_]z_.:>(Mf[3,ind]z/.ind->3),
SumOver[ind_,3]Mf[4,ind_]z_.:>(Mf[4,ind]z/.ind->3),
SumOver[ind_,3]Mf2[3,ind_]z_.:>(Mf2[3,ind]z/.ind->3),
SumOver[ind_,3]Mf2[4,ind_]z_.:>(Mf2[4,ind]z/.ind->3),
SumOver[ind_,3]Mf2[3,ind_]^kk_ z_.:>(Mf2[3,ind]^kk z/.ind->3),
SumOver[ind_,3]Mf2[4,ind_]^kk_ z_.:>(Mf2[4,ind]^kk z/.ind->3)};


(*  These substitutions are necessary in the MSSM in order to keep the tanbeta^3 enhanced 
  portions of B_q\[Rule]\[Mu]\[Mu] without keeping many small terms that would further slow evaluation. 
 In essence, these are dropping non-tanbeta-enhanced fermion masses.
 Additionally, these keep higher mb powers in radiative operators, e.g. Op7/C_A^L. *)
(*  set to Yukawa*VEV *)
CAMMMBSub={MB2->ybv^2 \[Epsilon]f^2 cb^2,MM2->ymv^2 \[Epsilon]f^2 cb^2,MB->ybv \[Epsilon]f cb,MM->ymv \[Epsilon]f cb};
(* Here, cb is the small contribution *)
CAMMMB\[Epsilon]Sub={cb->\[Epsilon] cb};
(* undoes the first substitution after keeping only terms where \[Epsilon]f^k \[Epsilon]^j w/ k,j\[LessEqual]0 *)
CAMMMBUnSub={ybv->MB/cb,ymv->MM/cb};


(* Applies substitutions that result in Kronecker deltas prior to some model-independent 
Kronecker delta simplifications that remove and simplify expressions *)
CAKDSumSub={SumOver[Ind_,3] UASf[x_,Ind_,kk_] UASfC[y_,Ind_,kk_]z_.:>Expand[(KroneckerDelta[x,y]-SumOver[Ind,3]UASf[x,Ind+3,kk]UASfC[y,Ind+3,kk])z]/;TrueQ[D[z,Ind]==0],
SumOver[x_,6]UASf[x_,ind_,n_]UASfC[x_,ind2_,n_]z_.:>KroneckerDelta[ind,ind2]z/;TrueQ[D[z,x]==0]};


(* These substitutions are necessary in order to expedite the evaluation, compilation, and 
simplification of expressions.  Essentially what is happening here is the CKM elements are being 
joined to the sfermion mixing matrices so that FormFlavor does not try to continually simplify 
them further.  The second step is assigning a \[OpenCurlyDoubleQuote]none\[CloseCurlyDoubleQuote] if no CKM appears with the terms. *)
CASumSub1={SumOver[ind_,3]X_[ind_,i_]Y_[aa_,ind_,j_]z_.:>Y[aa,i,j,ToString[X]]z/;FreeQ[z,ind],
SumOver[ind_,3]X_[ind_,i_]Y_[aa_,ind_+3,j_]z_.:>Y[aa,i+3,j,ToString[X]]z/;FreeQ[z,ind],
SumOver[ind_,3]X_[i_,ind_]Y_[aa_,ind_,j_]z_.:>Y[aa,i,j,ToString[X]<>"tr"]z/;FreeQ[z,ind],
SumOver[ind_,3]X_[i_,ind_]Y_[aa_,ind_+3,j_]z_.:>Y[aa,i+3,j,ToString[X]<>"tr"]z/;FreeQ[z,ind]};
CASumSub2={UASf[aa_,ind_,j_]->UASf[aa,ind,j,"none"],UASfC[aa_,ind_,j_]->UASfC[aa,ind,j,"none"]};


(* These terms represent the orderThat terms are collected prior to storage with the 
operator list trumping all. *)
CACollection={MB,MB2,MT,MT2,MM,MM2,SumOver[__],C0i[__],B0i0[__],B0i1[__],D0i[__],
UASf[__],UASfC[__],ZNeu[__],ZNeuC[__],UCha[__],UChaC[__],VCha[__],VChaC[__]};
