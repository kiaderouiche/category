(* ::Package:: *)

(* ::Title:: *)
(*FormFlavor*)


(* ::Subtitle:: *)
(*Model Specific User Code*)


(* ::Section:: *)
(*User Functions*)


(* ::Subsection:: *)
(*Read from File*)


FFWilsonfromSLHA2[filename_,mode_]:=Block[{CalcSpecInput,CalcSpecOutput,ampname},
CalcSpecOutput=FFReadFile[filename];
Switch[mode,"Fast",ampname=ampfunc,"Acc",ampname=ampfuncAcc,_,ampname=ampfunc];
FFWilson[CalcSpecOutput,{Ampfuncname->ampname}]]

FFWilsonfromSLHA2[filename_]:=FFWilsonfromSLHA2[filename,$FFActiveRunningMode]


FFfromSLHA2[filename_,mode_]:=Block[{CalcSpecInput,CalcSpecOutput,ampname},
CalcSpecOutput=FFReadFile[filename];
Switch[mode,"Fast",ampname=ampfunc,"Acc",ampname=ampfuncAcc,_,ampname=ampfunc];
FormFlavor[CalcSpecOutput,{Ampfuncname->ampname}]]

FFfromSLHA2[filename_]:=FFfromSLHA2[filename,$FFActiveRunningMode]


FFConstraintsfromSLHA2[filename_,mode_]:=Block[{CalcSpecInput,CalcSpecOutput,ampname},
CalcSpecOutput=FFReadFile[filename];
Switch[mode,"Fast",ampname=ampfunc,"Acc",ampname=ampfuncAcc,_,ampname=ampfunc];
FFConstraints[FormFlavor[CalcSpecOutput,{Ampfuncname->ampname}]]]

FFConstraintsfromSLHA2[filename_]:=FFConstraintsfromSLHA2[filename,$FFActiveRunningMode]


(* ::Section:: *)
(*Function Information*)


FFWilsonfromSLHA2::usage = "FFWilsonfromSLHA2[file,mode] load SLHA2 file and run Wilson in mode {mode}.
FFWilsonfromSLHA2[file] load SLHA2 file and run Wilson in mode $FFActiveRunningMode.";

FFfromSLHA2::usage = "FFfromSLHA2[file,mode] load SLHA2 file and run FormFlavor in mode {mode}.
FFfromSLHA2[file] load SLHA2 file and run FormFlavor in mode $FFActiveRunningMode.";

FFConstraintsfromSLHA2::usage = "FFConstraintsfromSLHA2[file,mode] load SLHA2 file and run FFConstraints in mode {mode}.
FFConstraintsfromSLHA2[file] load SLHA2 file and run FFConstraints in mode $FFActiveRunningMode.";
