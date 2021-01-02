(* ::Package:: *)

(* ::Title:: *)
(*b->s\[Gamma]*)


(* ::Subtitle:: *)
(*by Jared A Evans and David Shih (v1 May 31 2016)*)


(* ::Text:: *)
(*Note:  we are indebted to M. Misiak for provided the tools to generate the SM NNLO contributions*)


TempAmpFileName="btosgamma.m";
AppendTo[$FFAmpFileList,TempAmpFileName];
(* automatically extract the correct module name *)
TempProcessName=Get[FormFlavor`$FFModelPath<>"/ObservableAmps/"<>TempAmpFileName][[1,1]];
AppendTo[$FFProcessList,TempProcessName];
(* Observable function name must match the main function in the last block *)
ObservableFunction[TempProcessName]=btosgamma;


TempObsName="b\[Rule]s\[Gamma]";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* PDG 2015 (BR) *)
FFExpValue[TempObsName]=3.49*10^-4;
FFExpUnc[TempObsName]=0.19*10^-4;
(* Misiak et al: 1503.01791 *)
FFSMValue[TempObsName]=3.36*10^-4;
FFSMUnc[TempObsName]=0.23*10^-4;
AppendTo[$FFObsNameList,TempObsName];
FFbsgName=TempObsName;

TempObsName="ACP(b\[Rule]s\[Gamma])";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* HFAG 2014 *)
FFExpValue[TempObsName]=1.5*10^-2;
FFExpUnc[TempObsName]=2.0*10^-2;
(* Benzke, Lee, Neubert, Paz: 1012.3167 *)
FFSMValue[TempObsName]=1.1*10^-2;;
FFSMUnc[TempObsName]=1.7*10^-2;
AppendTo[$FFObsNameList,TempObsName];
FFACPbsgName=TempObsName;

TempObsName="\[CapitalDelta]ACP(b\[Rule]s\[Gamma])";
FFObsClass[TempObsName]=0; (*0=normal; 1=exp UB only; 2=no good SM prediction *)
(* BaBar: 1406.0534 *)
FFExpValue[TempObsName]=5.0*10^-2;
FFExpUnc[TempObsName]=4.2*10^-2;
(* Benzke, Lee, Neubert, Paz: 1012.3167 *)
FFSMValue[TempObsName]=0.0*10^-2;;
FFSMUnc[TempObsName]=0.0*10^-2;
AppendTo[$FFObsNameList,TempObsName];
FF\[CapitalDelta]ACPbsgName=TempObsName;


(* Load bs\[Gamma] specfic paramters, too slow for realtime evaluation *)
(* Loads bs\[Gamma]CPS (phase-space factor), bs\[Gamma]K1mat (Subsuperscript[K, ij, (1)]), and bs\[Gamma]K2mat (Subsuperscript[K, ij, (2)]) *)
Block[{\[Mu]b,\[Mu]c,mbMSbar,mbkin,mcat2gev,BRce\[Nu],\[Mu]\[Pi]sq,\[Rho]Dcbd,\[Mu]Gsq,\[Rho]LScbd,
Vud,Vus,Vub,Vcd,Vcs,Vcb,Vtd,Vts,Vtb,gofz,\[Alpha]ts,afunc,bfunc,mb1S,rbsg,Lb,zuse,
r21,Gfunc,\[Phi]1,msat2gev,K1mat,\[Gamma]0effbsg,Xb,K2mat,C0eff\[Mu]b,PofE0,NofE0,
A1,A2,Y1,Y2,Lc,fNLO,fq,fc,fb,h272,Rr22,\[Delta]val,E0},

(* begin common parameters *)
\[Mu]b=2; \[Mu]c=2;
(* end common parameters *)

mbMSbar=GetSMParameter["mb@MSbar"];

{{Vud,Vus,Vub},{Vcd,Vcs,Vcb},{Vtd,Vts,Vtb}}=GetSMParameter["CKM"];
mbkin=GetSMParameter["mb@kinetic"];
mcat2gev=GetSMParameter["mc@MSbar@2GeV"];
msat2gev=GetSMParameter["ms@MSbar@2GeV"];
mb1S=GetSMParameter["mb@1S"];

(* Eq D .1 of 1503.01791 *)
BRce\[Nu]=GetSMParameter["BRb2ce\[Nu]"];
\[Mu]\[Pi]sq=0.470;
\[Rho]Dcbd=0.171;
\[Mu]Gsq=0.309;
\[Rho]LScbd=-0.135;
E0=1.6;
\[Alpha]ts=AlfasNLO[\[Mu]b]/(4\[Pi]);

(* Phase-space factor Eq D .3 of 1503.01791 (currently 0.56927) *)
(* only difference is in AlfasNLO[mbkin].  We use 0.215419, 1503.01791 has 0.220011 *)
gofz[z_]:=1-8z+8z^3-z^4-12z^2 Log[z];
bs\[Gamma]CPS=gofz[(mcat2gev/mbkin)^2]/BRce\[Nu](0.903-0.588(AlfasNLO[mbkin]-0.22)+0.0650(mbkin-4.55)-0.1080(mcat2gev-1.05)-0.0122\[Mu]Gsq-0.199\[Rho]Dcbd+0.004\[Rho]LScbd);

(* Calculate Subsuperscript[K, ij, (1)] see 0609241 *)
(* From eq (3.9) and (3.10) of 0609241 *)
afunc[z_]:=16/9((5/2-\[Pi]^2/3-3Zeta[3]+(5/2-3\[Pi]^2/4)Log[z]+1/4 Log[z]^2+1/12 Log[z]^3)z+(7/4+2\[Pi]^2/3-\[Pi]^2/2Log[z]-1/4 Log[z]^2+1/12 Log[z]^3)z^2+(-7/6-\[Pi]^2/4+2Log[z]-3/4 Log[z]^2)z^3+(457/216-5\[Pi]^2/18-1/72Log[z]-5/6 Log[z]^2)z^4+I \[Pi]((4-\[Pi]^2/3+Log[z]+Log[z]^2)z/2+(1/2-\[Pi]^2/6-Log[z]+1/2 Log[z]^2)z^2+z^3+5/9 z^4));
bfunc[z_]:=-8/9((-3+\[Pi]^2/6-Log[z])z-2\[Pi]^2/3 z^(3/2)+(1/2+\[Pi]^2-2Log[z]-1/2 Log[z]^2)z^2+(-25/12-1/9 \[Pi]^2-19/18Log[z]+2Log[z]^2)z^3+(-1376/225+137/30Log[z]+2Log[z]^2+2\[Pi]^2/3)z^4+I \[Pi](-z+(1-2Log[z])z^2+(-10/9+4/3Log[z])z^3+z^4));

(* From eq 3.1 of 0203135, as referenced in 0609241 *)
Lb=Log[(\[Mu]b/mbkin)^2];
zuse=(mcat2gev/mbkin)^2;

(* from 0104034 *)
Gfunc[t_?NumericQ]:=If[t<4,-2 ArcTan[Sqrt[t/(4-t)]]^2,-\[Pi]^2/2+2Log[(Sqrt[t]+Sqrt[t-4])/2]^2-2I \[Pi] Log[(Sqrt[t]+Sqrt[t-4])/2]];

\[Phi]1[i_,j_][\[Delta]_]:=0;
\[Phi]1[7,7][\[Delta]_]:=-2/3 Log[\[Delta]]^2-7/3Log[\[Delta]]-31/9+10/3\[Delta]+1/3 \[Delta]^2-2/9 \[Delta]^3+1/3\[Delta](\[Delta]-4)Log[\[Delta]];
\[Phi]1[8,8][\[Delta]_]:=1/27(-2*Log[mbMSbar/msat2gev](\[Delta]^2+2\[Delta]+4Log[1-\[Delta]])+4PolyLog[2,1-\[Delta]]-2\[Pi]^2/3-\[Delta](2+\[Delta])Log[\[Delta]]+8Log[1-\[Delta]]-2/3 \[Delta]^3+3\[Delta]^2+7\[Delta]);
\[Phi]1[7,8][\[Delta]_]:=8/9(PolyLog[2,1-\[Delta]]-\[Pi]^2/6-\[Delta] Log[\[Delta]]+9/4 \[Delta]-1/4 \[Delta]^2+1/12 \[Delta]^3);

\[Phi]1[2,2][\[Delta]_?NumericQ]:=
16zuse/27(\[Delta] NIntegrate[(1-zuse t)Abs[Gfunc[t]/t+1/2]^2,{t,0,4}]+\[Delta] NIntegrate[(1-zuse t)Abs[Gfunc[t]/t+1/2]^2,{t,4,(1-\[Delta])/zuse}]+NIntegrate[(1-zuse t)^2 Abs[Gfunc[t]/t+1/2]^2,{t,(1-\[Delta])/zuse,1/zuse}]);
\[Phi]1[2,7][\[Delta]_?NumericQ]:=
-8zuse^2/9(\[Delta] NIntegrate[Re[Gfunc[t]+t/2],{t,0,4}]+\[Delta] NIntegrate[Re[Gfunc[t]+t/2],{t,4,(1-\[Delta])/zuse}]+NIntegrate[(1-zuse t) Re[Gfunc[t]+t/2],{t,(1-\[Delta])/zuse,1/zuse}]);
\[Phi]1[2,8][\[Delta]_]:=-1/3\[Phi]1[2,7][\[Delta]];
\[Phi]1[1,1][\[Delta]_]:=1/36\[Phi]1[2,2][\[Delta]];
\[Phi]1[1,2][\[Delta]_]:=-1/3\[Phi]1[2,2][\[Delta]];
\[Phi]1[1,7][\[Delta]_]:=-1/6\[Phi]1[2,7][\[Delta]];
\[Phi]1[1,8][\[Delta]_]:=1/18\[Phi]1[2,7][\[Delta]];

(* from 1411.7677 *)
\[Phi]1[4,7][\[Delta]_]:=\[Pi]/54 (3Sqrt[3]-\[Pi])+\[Delta]^3/81-25/108 \[Delta]^2+5/54 \[Delta]+2/9 (\[Delta]^2+2\[Delta]+3)ArcTan[Sqrt[(1-\[Delta])/(3+\[Delta])]]^2-1/3 (\[Delta]^2+4\[Delta]+3)Sqrt[(1-\[Delta])/(3+\[Delta])]ArcTan[Sqrt[(1-\[Delta])/(3+\[Delta])]]+(34\[Delta]^2+59\[Delta]+18)/486 (\[Delta]^2 Log[\[Delta]])/(1-\[Delta])+(433\[Delta]^3+429\[Delta]^2-720\[Delta])/2916;
(* ignoring 0.1% corrections for other \[Phi]1s *)

Do[
\[Phi]1[i,j][\[Delta]_]:=Evaluate[Conjugate[\[Phi]1[j,i][\[Delta]]]]
,{i,1,10},{j,1,i-1}];

(* Eq 6.3 of 0203135, as referenced in 0609241 *)
\[Gamma]0effbsg=
{{-4,8/3,0,-2/9,0,0,-208/243,173/162,0,0},
{12,0,0,4/3,0,0,416/81,70/27,0,0},
{0,0,0,-52/3,0,2,-176/81,14/27,0,0},
{0,0,-40/9,-100/9,4/9,5/6,-152/243,-587/162,0,0},
{0,0,0,-256/3,0,20,-6272/81,6596/27,0,0},
{0,0,-256/9,56/9,40/9,-2/3,4624/243,4772/81,0,0},
{0,0,0,0,0,0,32/3,0,0,0},
{0,0,0,0,0,0,-32/9,28/3,0,0},
{0,0,0,0,0,0,0,0,32/3,0},
{0,0,0,0,0,0,0,0,-32/9,28/3}};

(* Eq 3.1 of 0203135, as referenced in 0609241 *)
Xb=-0.1684;
rbsg=N[{
833/729-1/3(afunc[zuse]+bfunc[zuse])+40/243I \[Pi],
-1666/243+2(afunc[zuse]+bfunc[zuse])-80/81I \[Pi],
2392/243+8\[Pi]/(3Sqrt[3])+32/9Xb-afunc[1]+2bfunc[1]+56/81I \[Pi],
-761/729-4\[Pi]/(9Sqrt[3])-16/27Xb+1/6afunc[1]+5/3bfunc[1]+2bfunc[zuse]-148/243I \[Pi],
56680/243+32\[Pi]/(3Sqrt[3])+128/9Xb-16afunc[1]+32bfunc[1]+896/81I \[Pi],
5710/729-16\[Pi]/(9Sqrt[3])-64/27Xb-10/3afunc[1]+44/3bfunc[1]+12afunc[zuse]+20bfunc[zuse]-2296/243I \[Pi],
(64/9)-(16 \[Pi]^2)/9,
44/9-8/27 \[Pi]^2+8/9I \[Pi],
(64/9)-(16 \[Pi]^2)/9,
44/9-8/27 \[Pi]^2+8/9I \[Pi]
}];

K1mat[i_,j_]:=0;
Do[
K1mat[i,7]=Re[rbsg[[i]]]-1/2\[Gamma]0effbsg[[i,7]]Lb;
K1mat[7,i]=Conjugate[K1mat[i,7]]; (* Not 100% sure about the treatment of the complex conjugate here. 
In 0609241, they focus on the SM where the Wilson coeffs are real and so K can be taken to be a real symmetric matrix. *)
,{i,1,6}];
K1mat[7,7]=(64-16\[Pi]^2)/9-\[Gamma]0effbsg[[7,7]]Lb; (* In 0609241 they want -182/9+8/9\[Pi]^2. But I have checked that this contradicts Chetyrkin, Misiak & Munz which is the authoritative reference for the NLO corrections. So I have reverted back to the Chetyrkin numbers. *)
K1mat[7,7]=-182/9+8/9\[Pi]^2-\[Gamma]0effbsg[[7,7]]Lb;
K1mat[7,8]=Re[rbsg[[8]]]-1/2\[Gamma]0effbsg[[8,7]]Lb;
K1mat[8,7]=Conjugate[K1mat[7,8]];
(* Not completely sure about the 9,10 entries here. I'm extrapolating based on my interpretation of what the K's mean. *)
K1mat[9,9]=(64-16\[Pi]^2)/9-\[Gamma]0effbsg[[9,9]]Lb;
K1mat[9,10]=Conjugate[rbsg[[8]]]-1/2\[Gamma]0effbsg[[10,9]]Lb;
K1mat[10,9]=Conjugate[K1mat[9,10]];

zuse=(mcat2gev/mbkin)^2;

(* Eq 3.4 in 1503.01791 *)
\[Delta]val=1-2*E0/mbkin;

bs\[Gamma]K1mat=(Table[K1mat[i,j]+2(1+KroneckerDelta[i,j])\[Phi]1[i,j][\[Delta]val],{i,1,10},{j,1,10}]);

(* Get Subsuperscript[K, ij, (2)] - currently not implemented *)

K2mat[i_,j_]:=0;
(* Getting P22 From 1503.01791 *)
(* derived from 1005.5587 & 0805.3911 *)

(*bs\[Gamma]K2mat=(Table[K2mat[i,j],{i,1,10},{j,1,10}]);*)

(* produced via M.Misiak's code *)
bs\[Gamma]K1mat={{0.002890536772046062`,-0.01734322063227637`,0.0004910235973264775`,0.004249875430938758`,0.005401888435588118`,-0.06175401448911613`,0.091326659495189`,-0.001668754849595253`,0,0},{-0.01734322063227637`,0.10405932379365822`,-0.0029461415839588667`,-0.025499252585632542`,-0.032411330613528716`,0.37052408693469674`,-0.547959956971134`,0.01001252909757152`,0,0},{0.0004910235973264775`,-0.0029461415839588667`,0.02882804309336999`,-0.004804673848894998`,0.3186961186874658`,-0.02828956783865965`,8.371862950620125`,-0.05493477058438317`,0,0},{0.004249875430938758`,-0.025499252585632542`,-0.004804673848894998`,0.000800778974815833`,-0.05311601978124429`,0.004714927973109942`,-1.7257130559629517`,-0.20382828419154872`,0,0},{0.005401888435588118`,-0.032411330613528716`,0.3186961186874658`,-0.05311601978124429`,3.5491919336528226`,-0.08400808252283154`,123.52234849172221`,-0.8377957635020634`,0,0},{-0.06175401448911613`,0.37052408693469674`,-0.02828956783865965`,0.004714927973109942`,-0.08400808252283154`,1.8069671545748145`,18.356156569910482`,-1.9249879203226776`,0,0},{0.091326659495189`,-0.547959956971134`,8.371862950620125`,-1.7257130559629517`,123.52234849172221`,18.356156569910482`,5.618192379470251`,-0.5072801710896453`,0,0},{-0.001668754849595253`,0.01001252909757152`,-0.05493477058438317`,-0.20382828419154872`,-0.8377957635020634`,-1.9249879203226776`,-0.5072801710896453`,0.4523621623271802`,0,0},{0,0,0,0,0,0,0,0,5.618192379470251`,-0.5072801710896453`},{0,0,0,0,0,0,0,0,-0.5072801710896453`,0.4523621623271802`}};
bs\[Gamma]K2mat={{0.11438133795790796`,-0.6862880277474478`,0,0,0,0,9.112170547986135`,0.2157450830297229`,0,0},{-0.6862880277474478`,4.117728166484687`,0,0,0,0,-8.859176797021359`,-1.2944704981783375`,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{9.112170547986135`,-8.859176797021359`,0,0,0,0,-37.3173261338619`,-13.411166922282376`,0,0},{0.2157450830297229`,-1.2944704981783375`,0,0,0,0,-13.411166922282376`,22.31841900470379`,0,0},{0,0,0,0,0,0,0,0,-37.3173261338619`,-13.411166922282376`},{0,0,0,0,0,0,0,0,-13.411166922282376`,22.31841900470379`}};

];


(* We are using the updated reference 1503.01791 *)
Options[btosgamma]={IncludeSM->True,QCDRG->True};
btosgamma[\[Mu]SUSY_,wilson_,opts:OptionsPattern[]]:=Block[{\[Delta]C7L,\[Delta]C7R,\[Delta]C8L,\[Delta]C8R,doQCDRG,output,useSM,
\[Mu]b,\[Mu]c,mbkin,mcat2gev,C0eff\[Mu]bSM,C1eff\[Mu]bSM,C2eff\[Mu]bSM,Ceff\[Mu]bSM,\[Alpha]EMin,C0eff\[Mu]b,mbhigh,
Vud,Vus,Vub,Vcd,Vcs,Vcb,Vtd,Vts,Vtb,GFF,P00,P11,P12,P21,P32,P22,\[Alpha]ts,PofE0,NofE0,
zval,mcuse,\[CapitalLambda]c,ACP,\[CapitalLambda]t78,\[CapitalDelta]ACP,ACPdir,ACPres,\[Epsilon]s,\[CapitalLambda]27u,\[CapitalLambda]27c,\[CapitalLambda]78B},

(* begin common parameters *)
\[Mu]b=2; \[Mu]c=2;
(* end common parameters *)

(*Note: high scale m_b value to use RGE (alternatively could shift RG \[Gamma] by 4) *)
mbhigh=GetSMParameter["mb@mt"]; 

useSM=If[OptionValue[IncludeSM],1,0];
doQCDRG=OptionValue[QCDRG];

{{Vud,Vus,Vub},{Vcd,Vcs,Vcb},{Vtd,Vts,Vtb}}=GetSMParameter["CKM"];
\[Alpha]EMin=GetSMParameter["\[Alpha]EM@low"];
GFF=GetSMParameter["GFF"];
\[Alpha]ts=AlfasNLO[\[Mu]b]/(4\[Pi]);

\[Delta]C7L=Coefficient[wilson,OpA["R"][{"s","b"},{"\[Gamma]"}]];
\[Delta]C7R=Coefficient[wilson,OpA["L"][{"s","b"},{"\[Gamma]"}]];
\[Delta]C8L=Coefficient[wilson,OpG["R"][{"s","b"},{"g"}]];
\[Delta]C8R=Coefficient[wilson,OpG["L"][{"s","b"},{"g"}]];

(* C7, C8, C9, C10 *)
If[doQCDRG,{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}=btosgammaRG[\[Mu]b,\[Mu]SUSY,{\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R}]];

(* calculated for \[Mu]b=2.0 GeV from 0612329, using 0512066, 9707243 and 9910220 with updated parameter values of:
s\[Theta]wsq=0.23126, mW=80.385, mZ=91.1876,mtMSbar=160.,Mh=125.7,\[Alpha]s(mZ)=0.1184. Run to \[Mu]_b=2.0 GeV *)

(* Provided by M.Misiak's code*)
C0eff\[Mu]bSM={-0.8999028014454444`,1.073090726504828`,-0.015085102212003494`,-0.13934108332283923`,0.0014069426729863468`,0.0032402937752613135`,-0.38479562688136415`,-0.17746199294572002`,0,0};
C1eff\[Mu]bSM={14.942168074091072`,-2.2098727402136`,0.0842172046852192`,-0.5902116824366594`,-0.020745706336565847`,-0.006895514784382963`,2.087138717825406`,-0.6311054902962924`,0,0};
(* only need C_ 7^(2) *)
C2eff\[Mu]bSM={0,0,0,0,0,0,18.85954361715042`,0,0,0};

(* we run NP and SM separately, as these are linear, should be okay since C7 & C8 do not affect C1-6 *)
(* There is a minus sign here in front of the NP contribution because when FormFlavor is used to calculate 
the SM Wilson coefficient we obtain the literature value up to this sign *)
C0eff\[Mu]b=C0eff\[Mu]bSM-(4\[Pi]^2Sqrt[2]/(GFF mbhigh Conjugate[Vts] Vtb)){0,0,0,0,0,0,\[Delta]C7L,\[Delta]C8L,\[Delta]C7R,\[Delta]C8R};

P00=Re[(C0eff\[Mu]b[[7]])^2+(C0eff\[Mu]b[[9]])^2];
P11=Re[2(C0eff\[Mu]b[[7]]*C1eff\[Mu]bSM[[7]])];
P12=Re[(C1eff\[Mu]bSM[[7]])^2+2(C0eff\[Mu]b[[7]]*C2eff\[Mu]bSM[[7]])];
P21=Re[Conjugate[C0eff\[Mu]b].bs\[Gamma]K1mat.C0eff\[Mu]b];
P32=Re[Conjugate[C0eff\[Mu]b].bs\[Gamma]K1mat.C1eff\[Mu]bSM+Conjugate[C1eff\[Mu]bSM].bs\[Gamma]K1mat.C0eff\[Mu]b];

(* from 0609241 and 1503.01791 *)
P22=Re[Conjugate[C0eff\[Mu]b].bs\[Gamma]K2mat.C0eff\[Mu]b];

(* Provided by M.Misiak's code *)
NofE0=3.81745295062768`*^-7;

PofE0=P00+\[Alpha]ts(P11+P21)+\[Alpha]ts^2 (P12+P22+P32);

(* BRce\[Nu] was absorbed into the phasespace factor bs\[Gamma]CPS *)
output= Abs[Conjugate[Vts]Vtb/Vcb]^2 6 \[Alpha]EMin/(\[Pi] bs\[Gamma]CPS)(PofE0+NofE0);

(* CP asymmetries from 1012.3167 *)
mbkin=GetSMParameter["mb@kinetic"];
mcuse=GetSMParameter["mc@MSbar@2GeV"];
\[CapitalLambda]c=(mcuse^2/mbkin)*(1+2/5*Log[mcuse/mbkin]+4/5*Log[mcuse/mbkin]^2-\[Pi]^2/15);
\[Epsilon]s=(Vub Conjugate[Vus])/(Vtb Conjugate[Vts]);
(* Eq 3 from 1012.3167  -- note C_ 1 is actually C_ 2 in the orginal reference, and supported by their assumed value *)
ACPdir=AlfasNLO[\[Mu]b](40/81 Im[C0eff\[Mu]b[[2]]/C0eff\[Mu]b[[7]]]-4/9 Im[C0eff\[Mu]b[[8]]/C0eff\[Mu]b[[7]]]-(40\[CapitalLambda]c)/(9 mbkin) Im[(1+\[Epsilon]s) C0eff\[Mu]b[[2]]/C0eff\[Mu]b[[7]]]);

(* from 1012.3167 (Note: more precise QCD sum rule suggests \[Lambda]B^2 is lower than 
result used to estimate this, now \[CapitalLambda]t78~300 MeV might be a more precise estimate *)
\[CapitalLambda]t78=0.100;
\[CapitalLambda]78B=-0.18\[CapitalLambda]t78;
\[CapitalLambda]27u=0.10;
\[CapitalLambda]27c=0.001;
ACPres=\[Pi]/mbkin*(Im[(1+\[Epsilon]s) C0eff\[Mu]b[[2]]/C0eff\[Mu]b[[7]]]*\[CapitalLambda]27c-Im[(\[Epsilon]s) C0eff\[Mu]b[[2]]/C0eff\[Mu]b[[7]]]*\[CapitalLambda]27u +4\[Pi] AlfasNLO[\[Mu]b]Im[C0eff\[Mu]b[[8]]/C0eff\[Mu]b[[7]]]*\[CapitalLambda]78B);
ACP=ACPdir+ACPres;


\[CapitalDelta]ACP=4\[Pi]^2 AlfasNLO[\[Mu]b]*\[CapitalLambda]t78/mbkin*Im[C0eff\[Mu]b[[8]]/C0eff\[Mu]b[[7]]];

{{FFbsgName,Re[output]},{FFACPbsgName,ACP},{FF\[CapitalDelta]ACPbsgName,\[CapitalDelta]ACP}}
];
