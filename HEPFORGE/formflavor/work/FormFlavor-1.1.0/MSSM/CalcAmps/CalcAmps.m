(* ::Package:: *)

(* ::Title:: *)
(*CalcAmps (Part of FormFlavor)*)


(* ::Subtitle:: *)
(*CalcAmps Shell*)


If[FormFlavor`$LOADED =!= True
,
If[CalcAmps`$LOADED =!= True
,
CalcAmps`$CalcAmpsPackagePath = CalcAmps`$CalcAmpsPath<>"/../../Core/";
CalcAmps`$CalcAmpsOutputPath = CalcAmps`$CalcAmpsPath<>"/../ObservableAmps/";
Get[ToFileName[CalcAmps`$CalcAmpsPackagePath, "CalcAmpsPackage.m"]];
(* Disable FA and FC messages *)
FeynArts`$FAVerbose=0;
$FCVerbose=0;
,
Print["CalcAmps is already loaded!"];
];
,
Print["FormFlavor is loaded.  Please quit the Mathmatica kernel to load CalcAmps..."];
];
