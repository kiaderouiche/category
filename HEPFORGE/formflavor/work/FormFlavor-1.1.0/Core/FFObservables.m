(* ::Package:: *)

(* ::Title:: *)
(*FFObservables package*)


(* ::Section:: *)
(*Load FormFlavor Observables*)


(* ::Subsection:: *)
(*Running couplings*)


Nflav[qq_]:=Which[qq<4*10^-3,0,4*10^-3<=qq<7*10^-3,1,7*10^-3<=qq<0.094,2,0.094<=qq<1.279,3,1.279<=qq<4.17,4,4.17<=qq<163.5,5,163.5<=qq,6];


QCD\[CapitalLambda][nf_]:=Which[nf<=4,0.2759,nf==5,0.199,nf==6,0.0844];


AlfasNLO[qq_]:=Block[{Nf,b0,b1,b2,al,alfas,qquse},
qquse=Re[qq];
Nf=Nflav[qquse];
b0=11-2*Nf/3;
b1=102-38*Nf/3;
b2=1428.5-5033*Nf/18+325*Nf*Nf/54;
al=2*Log[qquse/QCD\[CapitalLambda][Nf]];
alfas=4\[Pi]/b0/al(1-b1/b0/b0*Log[al]/al+(b1/b0/b0*Log[al]/al)^2 (1-1/Log[al])+(b0 b2-b1 b1)/b0^4/al/al);

alfas];


(* ::Subsection:: *)
(*Meson Mixing*)


(* ::Text:: *)
(*Here is the translation from Buras's basis to our basis.*)
(**)
(* Subscript[Q, 1]^VLL -> Op2[6,6]SUNT[Col1,Col2]SUNT[Col3,Col4]*)
(* Subscript[Q, 1]^LR -> Op2[6,7] SUNT[Col1,Col2]SUNT[Col3,Col4]*)
(* Subscript[Q, 2]^LR-> Op1[6,7]SUNT[Col1,Col2]SUNT[Col3,Col4]*)
(* Subscript[Q, 1]^SLL->Op1[7,7]SUNT[Col1,Col2]SUNT[Col3,Col4]*)
(* Subscript[Q, 2]^SLL->Op3[7,7]SUNT[Col1,Col2]SUNT[Col3,Col4]*)
(* *)
(* Finally, Buras also defines Subscript[Q, 1]^VRR and Subscript[Q, i]^SRR; these map as above but with 6->7, 7->6. *)
(* *)
(*This covers all our operators with the SUNT[Col1,Col2]SUNT[Col3,Col4] color structure, except Op3[6,7]. Fortunately these are not generated. (Maybe they don't exist?)*)
(* *)
(*What about the operators with the other color structure SUNT[Col1,Col3]SUNT[Col2,Col4]? One can always Fierz these into the 1-2 3-4 color structure but with a different fermion ordering, so they will come from other contractions of the creation/annihilation operators when evaluating the matrix element. So they can safely be dropped.*)


DeltaF2RG[\[Mu]L_,\[Mu]SUSY_,{CVLL_,CVRR_,CLR1_,CLR2_,CSLL1_,CSLL2_,CSRR1_,CSRR2_}]:=Block[
{\[Eta],\[Eta]6sub,\[Eta]4sub,\[Eta]5sub,\[Eta]VLL,\[Eta]VRR,\[Eta]LR,\[Eta]SLL,\[Eta]SRR,CVLLtemp,CVRRtemp,CLRtemp,CSLLtemp,
CSRRtemp,CVLLout,CVRRout,CLRout,CSLLout,CSRRout,\[Alpha]s,mttsub,mbbin},
(* Formulas taken from hep-ph/0102316 *)
(* Use NDR with BMU evanescent operator scheme hep-ph/0005183 *)

mttsub=GetSMParameter["mt@mt"];
mbbin=GetSMParameter["mb@mb"];

\[Eta]6sub=AlfasNLO[\[Mu]SUSY]/AlfasNLO[mttsub];
\[Eta]VLL=Subscript[\[Eta], 6]^(6/21)+\[Alpha]s/(4\[Pi])*1.3707(1-Subscript[\[Eta], 6])Subscript[\[Eta], 6]^(6/21)/.{Subscript[\[Eta], 6]->\[Eta]6sub,\[Alpha]s->AlfasNLO[mttsub]};
\[Eta]VRR=Subscript[\[Eta], 6]^(6/21)+\[Alpha]s/(4\[Pi])*1.3707(1-Subscript[\[Eta], 6])Subscript[\[Eta], 6]^(6/21)/.{Subscript[\[Eta], 6]->\[Eta]6sub,\[Alpha]s->AlfasNLO[mttsub]};
\[Eta]LR={{Subscript[\[Eta], 6]^(3/21),0},{2/3(Subscript[\[Eta], 6]^(3/21)-Subscript[\[Eta], 6]^(-24/21)),Subscript[\[Eta], 6]^(-24/21)}}+\[Alpha]s/(4\[Pi]){{0.9219Subscript[\[Eta], 6]^(-24/21)+Subscript[\[Eta], 6]^(3/21) (-2.2194+1.2975Subscript[\[Eta], 6]),1.3828(Subscript[\[Eta], 6]^(24/21)-Subscript[\[Eta], 6]^(-24/21))},{Subscript[\[Eta], 6]^(3/21) (-10.1463+0.8650Subscript[\[Eta], 6])+Subscript[\[Eta], 6]^(-24/21) (-6.4603+15.7415Subscript[\[Eta], 6]),0.9219Subscript[\[Eta], 6]^(24/21)+Subscript[\[Eta], 6]^(-24/21) (9.6904-10.6122Subscript[\[Eta], 6])}}/.{Subscript[\[Eta], 6]->\[Eta]6sub,\[Alpha]s->AlfasNLO[mttsub]};
\[Eta]SLL={{1.0153 Subscript[\[Eta], 6]^-0.6916-0.0153Subscript[\[Eta], 6]^0.7869,1.9325(Subscript[\[Eta], 6]^-0.6916-Subscript[\[Eta], 6]^0.7869)},{0.0081(-Subscript[\[Eta], 6]^-0.6916+Subscript[\[Eta], 6]^0.7869),1.0153Subscript[\[Eta], 6]^0.7869-0.0153Subscript[\[Eta], 6]^-0.6916}}+\[Alpha]s/(4\[Pi]){{Subscript[\[Eta], 6]^-0.6916 (5.6478-6.0350Subscript[\[Eta], 6])+Subscript[\[Eta], 6]^0.7869 (0.3272+0.06Subscript[\[Eta], 6]),Subscript[\[Eta], 6]^-0.6916 (10.7494-37.9209Subscript[\[Eta], 6])+Subscript[\[Eta], 6]^0.7869 (41.2556-14.0841Subscript[\[Eta], 6])},{Subscript[\[Eta], 6]^-0.6916 (-0.0618-0.0315Subscript[\[Eta], 6])+Subscript[\[Eta], 6]^0.7869 (0.0454+0.0479Subscript[\[Eta], 6]),Subscript[\[Eta], 6]^-0.6916 (0.0865+0.3007Subscript[\[Eta], 6])+Subscript[\[Eta], 6]^0.7869 (-7.7870+7.3999Subscript[\[Eta], 6])}}/.{Subscript[\[Eta], 6]->\[Eta]6sub,\[Alpha]s->AlfasNLO[mttsub]};
\[Eta]SRR=\[Eta]SLL;


CVLLtemp=\[Eta]VLL CVLL;
CVRRtemp=\[Eta]VRR CVRR;
CLRtemp=\[Eta]LR.{CLR1,CLR2};
CSLLtemp=\[Eta]SLL.{CSLL1,CSLL2};
CSRRtemp=\[Eta]SRR.{CSRR1,CSRR2};

\[Eta]4sub=AlfasNLO[mbbin]/AlfasNLO[\[Mu]L];
\[Eta]5sub=AlfasNLO[mttsub]/AlfasNLO[mbbin];

\[Eta]VLL=Subscript[\[Eta], 4]^(6/25) Subscript[\[Eta], 5]^(6/23)+\[Alpha]s/(4\[Pi]) Subscript[\[Eta], 4]^(6/25) Subscript[\[Eta], 5]^(6/23) (1.7917-0.1644Subscript[\[Eta], 4]-1.6273Subscript[\[Eta], 4] Subscript[\[Eta], 5])/.{Subscript[\[Eta], 4]->\[Eta]4sub,Subscript[\[Eta], 5]->\[Eta]5sub,\[Alpha]s->AlfasNLO[\[Mu]L]};
\[Eta]VRR=\[Eta]VLL;
\[Eta]LR={{Subscript[\[Eta], 4]^(3/25) Subscript[\[Eta], 5]^(3/23),0},{2/3(Subscript[\[Eta], 4]^(3/25) Subscript[\[Eta], 5]^(3/23)-Subscript[\[Eta], 4]^(-24/25) Subscript[\[Eta], 5]^(-24/23)),Subscript[\[Eta], 4]^(-24/25) Subscript[\[Eta], 5]^(-24/23)}}+\[Alpha]s/(4\[Pi]){{0.9279Subscript[\[Eta], 4]^(-24/25) Subscript[\[Eta], 5]^(-24/23)-0.0029Subscript[\[Eta], 4]^(28/25) Subscript[\[Eta], 5]^(-24/23)+Subscript[\[Eta], 4]^(3/25) Subscript[\[Eta], 5]^(3/23) (-2.0241-0.0753Subscript[\[Eta], 4]+1.1744Subscript[\[Eta], 4] Subscript[\[Eta], 5]),-1.3918 Subscript[\[Eta], 4]^(-24/25) Subscript[\[Eta], 5]^(-24/23)+0.0043Subscript[\[Eta], 4]^(28/25) Subscript[\[Eta], 5]^(-24/23)+1.3875Subscript[\[Eta], 4]^(28/25) Subscript[\[Eta], 5]^(26/23)},{-0.0019 Subscript[\[Eta], 4]^(28/25) Subscript[\[Eta], 5]^(-24/23)+5Subscript[\[Eta], 4]^(1/25) Subscript[\[Eta], 5]^(3/23)+Subscript[\[Eta], 4]^(3/25) Subscript[\[Eta], 5]^(3/23) (-16.6828-0.0502Subscript[\[Eta], 4]+0.7829Subscript[\[Eta], 4] Subscript[\[Eta], 5])+Subscript[\[Eta], 4]^(-24/25) Subscript[\[Eta], 5]^(-24/23) (-4.4701-0.8327Subscript[\[Eta], 4]+16.2548Subscript[\[Eta], 4] Subscript[\[Eta], 5]),0.0029Subscript[\[Eta], 4]^(28/25) Subscript[\[Eta], 5]^(-24/23)+0.9250Subscript[\[Eta], 4]^(28/25) Subscript[\[Eta], 5]^(26/23)+Subscript[\[Eta], 4]^(-24/25) Subscript[\[Eta], 5]^(-24/23) (6.7052+1.2491Subscript[\[Eta], 4]-8.8822Subscript[\[Eta], 4] Subscript[\[Eta], 5])}}/.{Subscript[\[Eta], 4]->\[Eta]4sub,Subscript[\[Eta], 5]->\[Eta]5sub,\[Alpha]s->AlfasNLO[\[Mu]L]};
\[Eta]SLL={{1.0153Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315-0.0153Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184,1.9325(Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315-Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184)},{0.0081(Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184-Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315),1.0153Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184-0.0153Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315}}+\[Alpha]s/(4\[Pi]){{0.0020Subscript[\[Eta], 4]^1.6610 Subscript[\[Eta], 5]^-0.6315-0.0334Subscript[\[Eta], 4]^0.4190 Subscript[\[Eta], 5]^0.7184+Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315 (4.2458+0.5700Subscript[\[Eta], 4]-5.2272Subscript[\[Eta], 4] Subscript[\[Eta], 5])+Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184 (0.3640+0.0064Subscript[\[Eta], 4]+0.0724Subscript[\[Eta], 4] Subscript[\[Eta], 5]),0.0038Subscript[\[Eta], 4]^1.6610 Subscript[\[Eta], 5]^-0.6315-4.2075Subscript[\[Eta], 4]^0.4190 Subscript[\[Eta], 5]^0.7184+Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315 (8.0810+1.0848Subscript[\[Eta], 4]-38.8778Subscript[\[Eta], 4] Subscript[\[Eta], 5])+Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184 (45.9008+0.8087Subscript[\[Eta], 4]+12.7939Subscript[\[Eta], 4] Subscript[\[Eta], 5])},{-0.0011 Subscript[\[Eta], 4]^1.6610 Subscript[\[Eta], 5]^-0.6315-0.0003Subscript[\[Eta], 4]^0.4190 Subscript[\[Eta], 5]^0.7184+Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184 (-0.0534-0.0034Subscript[\[Eta], 4]-0.0380Subscript[\[Eta], 4] Subscript[\[Eta], 5])+Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315 (0.0587-0.0045Subscript[\[Eta], 4]+0.0415Subscript[\[Eta], 4] Subscript[\[Eta], 5]),-0.0020 Subscript[\[Eta], 4]^1.6610 Subscript[\[Eta], 5]^-0.6315+0.0334Subscript[\[Eta], 4]^0.4190 Subscript[\[Eta], 5]^0.7184+Subscript[\[Eta], 4]^-0.5810 Subscript[\[Eta], 5]^-0.6315 (0.1117-0.0086Subscript[\[Eta], 4]+0.3083Subscript[\[Eta], 4] Subscript[\[Eta], 5])+Subscript[\[Eta], 4]^0.6610 Subscript[\[Eta], 5]^0.7184 (-6.7398-0.4249Subscript[\[Eta], 4]+6.7219Subscript[\[Eta], 4] Subscript[\[Eta], 5])}}/.{Subscript[\[Eta], 4]->\[Eta]4sub,Subscript[\[Eta], 5]->\[Eta]5sub,\[Alpha]s->AlfasNLO[\[Mu]L]};
\[Eta]SRR=\[Eta]SLL;

CVLLout=\[Eta]VLL CVLLtemp;
CVRRout=\[Eta]VRR CVRRtemp;
CLRout=\[Eta]LR.CLRtemp;
CSLLout=\[Eta]SLL.CSLLtemp;
CSRRout=\[Eta]SRR.CSRRtemp;

Flatten[{\[Mu]L,CVLLout,CVRRout,CLRout,CSLLout,CSRRout}]
];


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsKKmixing.m"]


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsDDmixing.m"]


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsBsBsmixing.m"]


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsBdBdmixing.m"]


(* ::Subsection:: *)
(*K->pi nu nu*)


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsKtopinunu.m"]


(* ::Subsection:: *)
(*Bq->mumu*)


(* DRbar running b mass (for B_q->\[Mu]\[Mu]), taken from 0812.4320 *)
mbDRbar[Qq_]:=Block[{mbpole=4.6},mbpole(1-5AlfasNLO[mbpole]/(3\[Pi]))((AlfasNLO[Qq]/AlfasNLO[mbpole])^(4/(11-2*5/3)))]


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsBstomumu.m"]


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsBdtomumu.m"]


(* ::Subsection:: *)
(*b->qgamma*)


(* This routine gives the LO evolution of the contribution to the Wilson coefficients 
from SUSY, from the SUSY scale down to the b scale. We will add these to the 
SM Wilson coefficients taken from the literature. This works because the 
evolution is linear in the Wilson coefficients, and C7-C10 do not induce 
the other operators C1-C6, but only mix among themselves. *) 
btosgammaRG[\[Mu]1_,\[Mu]2_,\[Beta]_,{C7L_,C8L_,C7R_,C8R_}]:=Module[{\[Eta],\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0},
\[Eta]=AlfasNLO[\[Mu]2]/AlfasNLO[\[Mu]1];
(* Taken from 9806471 eq (12.23) adapted to the case of SUSY scale -> \[Mu]b *)
\[Delta]C7L\[Mu]b0=\[Eta]^(16/\[Beta]) C7L+8/3(\[Eta]^(14/\[Beta])-\[Eta]^(16/\[Beta]))C8L;
\[Delta]C8L\[Mu]b0=\[Eta]^(14/\[Beta]) C8L;
\[Delta]C7R\[Mu]b0=\[Eta]^(16/\[Beta]) C7R+8/3(\[Eta]^(14/\[Beta])-\[Eta]^(16/\[Beta]))C8R;
\[Delta]C8R\[Mu]b0=\[Eta]^(14/\[Beta]) C8R;

{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}
];

btosgammaRG[\[Mu]L_,\[Mu]SUSY_,{C7L_,C8L_,C7R_,C8R_}]:=Block[{\[Eta],\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R,
\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0,mtop,mb,\[Mu]curr},
mtop=GetSMParameter["mt@pole"];
mb=GetSMParameter["mb@1S"];
Which[\[Mu]L<mb&&\[Mu]SUSY>mtop,
{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}=btosgammaRG[mtop,\[Mu]SUSY,21,{C7L,C8L,C7R,C8R}];
{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}=btosgammaRG[mb,mtop,23,{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}];
{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}=btosgammaRG[\[Mu]L,mb,25,{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}];,
\[Mu]L<mb&&\[Mu]SUSY>mb,
{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}=btosgammaRG[mb,\[Mu]SUSY,23,{C7L,C8L,C7R,C8R}];
{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}=btosgammaRG[\[Mu]L,mb,25,{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}];,
\[Mu]L<mtop&&\[Mu]SUSY>mtop,
{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}=btosgammaRG[mtop,\[Mu]SUSY,21,{C7L,C8L,C7R,C8R}];
{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}=btosgammaRG[\[Mu]L,mtop,23,{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}];,
\[Mu]L>=mtop&&\[Mu]SUSY>mtop,
{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}=btosgammaRG[\[Mu]L,\[Mu]SUSY,21,{C7L,C8L,C7R,C8R}];,
\[Mu]L>=mb&&\[Mu]SUSY>mb,
{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}=btosgammaRG[\[Mu]L,\[Mu]SUSY,23,{C7L,C8L,C7R,C8R}];,
True,{0,0,0,0}];

{\[Delta]C7L\[Mu]b0,\[Delta]C8L\[Mu]b0,\[Delta]C7R\[Mu]b0,\[Delta]C8R\[Mu]b0}
];


Get[FormFlavor`$FFPath<>"/Core/Observables/Obsbtosgamma.m"]


Get[FormFlavor`$FFPath<>"/Core/Observables/Obsbtodgamma.m"]


(* ::Subsection:: *)
(*neutron EDM*)


Get[FormFlavor`$FFPath<>"/Core/Observables/ObsnEDM.m"]


(* ::Subsection:: *)
(*Lepton flavor violation*)


Get[FormFlavor`$FFPath<>"/Core/Observables/Obsmutoegamma.m"]


Get[FormFlavor`$FFPath<>"/Core/Observables/Obstautomugamma.m"]


Get[FormFlavor`$FFPath<>"/Core/Observables/Obstautoegamma.m"]


(* ::Section:: *)
(*Master routine: FFObservables*)


FFObservables[QSUSYuse_,obslist_,Heff_,opts:OptionsPattern[]]:=Block[{iobs,output},

output=Table[ObservableFunction[obslist[[iobs]]][QSUSYuse,Heff,FilterRules[{opts},Options[ObservableFunction[obslist[[iobs]]]]]],{iobs,1,Length[obslist]}];

output

];


(* ::Section:: *)
(*Function Information*)


AlfasNLO::usage = "AlfasNLO[\[CapitalLambda]] return NLO \!\(\*SubscriptBox[\(\[Alpha]\), \(S\)]\)(\[CapitalLambda])";

DeltaF2RG::usage = "DeltaF2RG[\[Mu]L,\[Mu]SUSY,{CVLL,CVRR,CLR1,CLR2,CSLL1,CSLL2,CSRR1,CSRR2}] runs the 8 Wilson coefficients relevant for meson mixing observables from the scale \[Mu]SUSY to \[Mu]L.
Running follows hep-ph/0102316 (in the BMU evanescent operator scheme hep-ph/0005183)."; 

btosgammaRG::usage = "btosgammaRG[\[Mu]L,\[Mu]SUSY,{C7L,C8L,C7R,C8R}] runs radiative operators from the scale \[Mu]SUSY to \[Mu]L.
Running at LO following hep-ph/9806471.";

mbDRbar::usage = "mbDRbar[\[CapitalLambda]] gets \!\(\*SubscriptBox[\(m\), \(b, \*OverscriptBox[\(DR\), \(_\)]\)]\)(\[CapitalLambda]) from \!\(\*SubscriptBox[\(m\), \(b, pole\)]\) following 0812.4320";
