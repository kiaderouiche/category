(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*FormFlavor Shell*)


If[CalcAmps`$LOADED =!= True
,
If[FormFlavor`$LOADED =!= True
,
(* Default to MSSM *)
If[!StringQ[FormFlavor`$FFModel],FormFlavor`$FFModel="MSSM"];
FormFlavor`$FFModelPath = FormFlavor`$FFPath<>"/"<>FormFlavor`$FFModel;
Get[ToFileName[FormFlavor`$FFPath, "Core/FFPackage.m"]];
,
Print["FormFlavor is already loaded!"];
];
,
Print["CalcAmps is loaded.  Please quit the Mathmatica kernel to load FormFlavor..."];
];
