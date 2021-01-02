(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*Master File for MSSM Model*)


(* ::Section:: *)
(*Load MSSM Model*)


FormFlavor`$ModelVersion="1.0.0";
FormFlavor`$ModelVersionDate="31 May 2016";
FormFlavor`$ModelAuthors="Jared A. Evans and David Shih";

Print["Loading Model: ",FormFlavor`$FFModel," ",FormFlavor`$ModelVersion," by ",FormFlavor`$ModelAuthors ," (",FormFlavor`$ModelVersionDate,")"];

Get[FormFlavor`$FFModelPath<>"/CalcSpec.m"];
Get[FormFlavor`$FFModelPath<>"/CompileAmps.m"];
Get[FormFlavor`$FFModelPath<>"/RGEs.m"];
