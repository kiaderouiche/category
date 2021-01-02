"(* Loop Integral Library *)"
B0func0[x_, y_] := 1 - EulerGamma + Log[4*Pi] + (x*Log[x])/(-x + y) + 
    (y*Log[y])/(x - y)
B0func0d12[x_, \[Epsilon]_] := -EulerGamma - \[Epsilon]/(2*x) + 
    \[Epsilon]^2/(6*x^2) - \[Epsilon]^3/(12*x^3) + \[Epsilon]^4/(20*x^4) + 
    Log[4*Pi] - Log[x]
B0func0d1[x_] := 1 - EulerGamma + Log[4*Pi] - Log[x]
B0func1[x_, y_] := (x + y)/(2*(x - y)^2) - (x*y*Log[x])/(x - y)^3 + 
    (x*y*Log[y])/(x - y)^3
B0func1d12[x_, \[Epsilon]_] := 1/(6*x) - \[Epsilon]/(12*x^2) + 
    \[Epsilon]^2/(20*x^3) - \[Epsilon]^3/(30*x^4) + \[Epsilon]^4/(42*x^5)
B0func1d1[x_] := 1/(2*x)
B1func0[x_, y_] := (1/4)*(-1 + 2*EulerGamma + (2*x)/(-x + y)) - 
    (x*(x^2 + 3*y^2)*Log[2])/(x - y)^3 + (y^3*Log[16])/(4*(x - y)^3) + 
    (x^2*y*Log[4096])/(4*(x - y)^3) - Log[Pi]/2 + 
    (x^2*Log[x])/(2*(x - y)^2) + (y*(-2*x + y)*Log[y])/(2*(x - y)^2)
B1func0d12[x_, \[Epsilon]_] := \[Epsilon]/(3*x) - \[Epsilon]^2/(8*x^2) + 
    \[Epsilon]^3/(15*x^3) - \[Epsilon]^4/(24*x^4) + 
    (1/4)*(2*EulerGamma - Log[16] - 2*Log[Pi] + 2*Log[x])
B1func0d1[x_] := (1/4)*(-1 + 2*EulerGamma - Log[16] - 2*Log[Pi] + 2*Log[x])
B1func0d2[x_] := (1/4)*(-3 + 2*EulerGamma - 4*Log[2] - 2*Log[Pi] + 2*Log[x])
B1func1[x_, y_] := (-2*x^2 - 5*x*y + y^2)/(6*(x - y)^3) + 
    (x^2*y*Log[x])/(x - y)^4 - (x^2*y*Log[y])/(x - y)^4
B1func1d12[x_, \[Epsilon]_] := -(1/(12*x)) + \[Epsilon]/(20*x^2) - 
    \[Epsilon]^2/(30*x^3) + \[Epsilon]^3/(42*x^4) - \[Epsilon]^4/(56*x^5)
B1func1d1[x_] := -(1/(6*x))
B1func1d2[x_] := -(1/(3*x))
B00funcAcc[x_, y_] := With[{\[Epsilon] = y - x, S = x + y}, 
    ReleaseHold[Which[S == 0, 0, x == 0, Evaluate[B0func0d1[y]], y == 0, 
      Evaluate[B0func0d1[x]], Abs[\[Epsilon]/S] < 0.01, 
      Evaluate[B0func0d12[x, \[Epsilon]]], True, Evaluate[B0func0[x, y]]]]]
B01funcAcc[x_, y_] := With[{\[Epsilon] = y - x, S = x + y}, 
    ReleaseHold[Which[S == 0, 0, x == 0, Evaluate[B0func1d1[y]], y == 0, 
      Evaluate[B0func1d1[x]], Abs[\[Epsilon]/S] < 0.003, 
      Evaluate[B0func1d12[x, \[Epsilon]]], True, Evaluate[B0func1[x, y]]]]]
B10funcAcc[x_, y_] := With[{\[Epsilon] = y - x, S = x + y}, 
    ReleaseHold[Which[S == 0, 0, x == 0, Evaluate[B1func0d1[y]], y == 0, 
      Evaluate[B1func0d2[x]], Abs[\[Epsilon]/S] < 0.003, 
      Evaluate[B1func0d12[x, \[Epsilon]]], True, Evaluate[B1func0[x, y]]]]]
B11funcAcc[x_, y_] := With[{\[Epsilon] = y - x, S = x + y}, 
    ReleaseHold[Which[S == 0, 0, x == 0, Evaluate[B1func1d1[y]], y == 0, 
      Evaluate[B1func1d2[x]], Abs[\[Epsilon]/S] < 0.015, 
      Evaluate[B1func1d12[x, \[Epsilon]]], True, Evaluate[B1func1[x, y]]]]]
C0funcbase[q_, x_, y_, z_] := 
   -16*Pi^2*((q*(2*y*z - x*(y + z)))/(32*Pi^2*(x - y)*(x - z)*(y - z)^2) + 
     ((q*x^2)/(32*Pi^2*(x - y)^2*(x - z)^2) + x/(16*Pi^2*(x - y)*(x - z)))*
      Log[x] + (-(y/(16*Pi^2*(x - y)*(y - z))) - (q*y*(y^2 - 2*x*z + y*z))/
        (32*Pi^2*(x - y)^2*(y - z)^3))*Log[y] + 
     (-(z/(16*Pi^2*(x - z)*(-y + z))) - (q*z*(-2*x*y + z*(y + z)))/
        (32*Pi^2*(x - z)^2*(-y + z)^3))*Log[z])
C0funcz12[q_, x_, y_, z_] := DirectedInfinity[q - 2*z]/Sign[z]^2
C0funcz23[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/Sign[x]]
C0funcz13[q_, x_, y_, z_] := DirectedInfinity[q - 2*y]/Sign[y]^2
C0funcz1d[q_, x_, \[Epsilon]_] := (q - 12*x)/(12*x^2) + 
    ((-q + 6*x)*\[Epsilon])/(12*x^3) + ((9*q - 40*x)*\[Epsilon]^2)/
     (120*x^4) + ((-4*q + 15*x)*\[Epsilon]^3)/(60*x^5) + 
    ((25*q - 84*x)*\[Epsilon]^4)/(420*x^6)
C0funcz2d[q_, x_, \[Epsilon]_] := (q - 4*x)/(4*x^2) + 
    ((-2*q + 3*x)*\[Epsilon])/(6*x^3) + ((9*q - 8*x)*\[Epsilon]^2)/(24*x^4) + 
    ((-8*q + 5*x)*\[Epsilon]^3)/(20*x^5) + ((25*q - 12*x)*\[Epsilon]^4)/
     (60*x^6)
C0funcz3d[q_, x_, \[Epsilon]_] := (q - 4*x)/(4*x^2) + 
    ((-2*q + 3*x)*\[Epsilon])/(6*x^3) + ((9*q - 8*x)*\[Epsilon]^2)/(24*x^4) + 
    ((-8*q + 5*x)*\[Epsilon]^3)/(20*x^5) + ((25*q - 12*x)*\[Epsilon]^4)/
     (60*x^6)
C0funcz1[q_, x_, y_, z_] := (2*q*(-y + z) + (-2*(y - z)^2 + q*(y + z))*
      Log[y] - (-2*(y - z)^2 + q*(y + z))*Log[z])/(2*(y - z)^3)
C0funcz2[q_, x_, y_, z_] := (q*(x - z) - (q + 2*x - 2*z)*z*Log[x] + 
     (q + 2*x - 2*z)*z*Log[z])/(2*(x - z)^2*z)
C0funcz3[q_, x_, y_, z_] := (q*(x - y) - (q + 2*x - 2*y)*y*Log[x] + 
     (q + 2*x - 2*y)*y*Log[y])/(2*(x - y)^2*y)
C0funcd123[q_, x_, \[Delta]1_, \[Delta]2_] := 
   (70*q*x^4 - 840*x^5 - 56*q*x^3*\[Delta]1 + 280*x^4*\[Delta]1 + 
      42*q*x^2*\[Delta]1^2 - 140*x^3*\[Delta]1^2 - 32*q*x*\[Delta]1^3 + 
      84*x^2*\[Delta]1^3 + 25*q*\[Delta]1^4 - 56*x*\[Delta]1^4)/(1680*x^6) + 
    ((-42*q*x^4 + 210*x^5 + 42*q*x^3*\[Delta]1 - 105*x^4*\[Delta]1 - 
       36*q*x^2*\[Delta]1^2 + 63*x^3*\[Delta]1^2 + 30*q*x*\[Delta]1^3 - 
       42*x^2*\[Delta]1^3 - 25*q*\[Delta]1^4 + 30*x*\[Delta]1^4)*\[Delta]2)/
     (1260*x^7) + ((42*q*x^4 - 140*x^5 - 48*q*x^3*\[Delta]1 + 
       84*x^4*\[Delta]1 + 45*q*x^2*\[Delta]1^2 - 56*x^3*\[Delta]1^2 - 
       40*q*x*\[Delta]1^3 + 40*x^2*\[Delta]1^3 + 35*q*\[Delta]1^4 - 
       30*x*\[Delta]1^4)*\[Delta]2^2)/(1680*x^8) + 
    ((-528*q*x^4 + 1386*x^5 + 660*q*x^3*\[Delta]1 - 924*x^4*\[Delta]1 - 
       660*q*x^2*\[Delta]1^2 + 660*x^3*\[Delta]1^2 + 616*q*x*\[Delta]1^3 - 
       495*x^2*\[Delta]1^3 - 560*q*\[Delta]1^4 + 385*x*\[Delta]1^4)*
      \[Delta]2^3)/(27720*x^9) + 
    ((825*q*x^4 - 1848*x^5 - 1100*q*x^3*\[Delta]1 + 1320*x^4*\[Delta]1 + 
       1155*q*x^2*\[Delta]1^2 - 990*x^3*\[Delta]1^2 - 1120*q*x*\[Delta]1^3 + 
       770*x^2*\[Delta]1^3 + 1050*q*\[Delta]1^4 - 616*x*\[Delta]1^4)*
      \[Delta]2^4)/(55440*x^10)
C0funcd13[q_, x_, y_, \[Epsilon]_] := 
   (q*x^2 - 4*x^3 + 4*q*x*y + 12*x^2*y - 5*q*y^2 - 12*x*y^2 + 4*y^3 - 
      4*q*x*y*Log[x] + 4*x^2*y*Log[x] - 2*q*y^2*Log[x] - 8*x*y^2*Log[x] + 
      4*y^3*Log[x] + 4*q*x*y*Log[y] - 4*x^2*y*Log[y] + 2*q*y^2*Log[y] + 
      8*x*y^2*Log[y] - 4*y^3*Log[y])/(4*(x - y)^4) - 
    (\[Epsilon]*(2*q*x^3 - 3*x^4 + 18*q*x^2*y + 6*x^3*y - 18*q*x*y^2 - 
       2*q*y^3 - 6*x*y^3 + 3*y^4 - 12*q*x^2*y*Log[x] + 6*x^3*y*Log[x] - 
       12*q*x*y^2*Log[x] - 12*x^2*y^2*Log[x] + 6*x*y^3*Log[x] + 
       12*q*x^2*y*Log[y] - 6*x^3*y*Log[y] + 12*q*x*y^2*Log[y] + 
       12*x^2*y^2*Log[y] - 6*x*y^3*Log[y]))/(6*x*(x - y)^5) - 
    (\[Epsilon]^2*(-9*q*x^4 + 8*x^5 - 132*q*x^3*y - 4*x^4*y + 108*q*x^2*y^2 - 
       40*x^3*y^2 + 36*q*x*y^3 + 64*x^2*y^3 - 3*q*y^4 - 32*x*y^4 + 4*y^5 + 
       72*q*x^3*y*Log[x] - 24*x^4*y*Log[x] + 108*q*x^2*y^2*Log[x] + 
       48*x^3*y^2*Log[x] - 24*x^2*y^3*Log[x] - 72*q*x^3*y*Log[y] + 
       24*x^4*y*Log[y] - 108*q*x^2*y^2*Log[y] - 48*x^3*y^2*Log[y] + 
       24*x^2*y^3*Log[y]))/(24*x^2*(x - y)^6) - 
    (\[Epsilon]^3*(24*q*x^5 - 15*x^6 + 500*q*x^4*y - 20*x^5*y - 
       320*q*x^3*y^2 + 175*x^4*y^2 - 240*q*x^2*y^3 - 260*x^3*y^3 + 
       40*q*x*y^4 + 155*x^2*y^4 - 4*q*y^5 - 40*x*y^5 + 5*y^6 - 
       240*q*x^4*y*Log[x] + 60*x^5*y*Log[x] - 480*q*x^3*y^2*Log[x] - 
       120*x^4*y^2*Log[x] + 60*x^3*y^3*Log[x] + 240*q*x^4*y*Log[y] - 
       60*x^5*y*Log[y] + 480*q*x^3*y^2*Log[y] + 120*x^4*y^2*Log[y] - 
       60*x^3*y^3*Log[y]))/(60*x^3*(x - y)^7) - 
    (\[Epsilon]^4*(-50*q*x^6 + 24*x^7 - 1370*q*x^5*y + 82*x^6*y + 
       625*q*x^4*y^2 - 476*x^5*y^2 + 1000*q*x^3*y^3 + 730*x^4*y^3 - 
       250*q*x^2*y^4 - 520*x^3*y^4 + 50*q*x*y^5 + 206*x^2*y^5 - 5*q*y^6 - 
       52*x*y^6 + 6*y^7 + 600*q*x^5*y*Log[x] - 120*x^6*y*Log[x] + 
       1500*q*x^4*y^2*Log[x] + 240*x^5*y^2*Log[x] - 120*x^4*y^3*Log[x] - 
       600*q*x^5*y*Log[y] + 120*x^6*y*Log[y] - 1500*q*x^4*y^2*Log[y] - 
       240*x^5*y^2*Log[y] + 120*x^4*y^3*Log[y]))/(120*x^4*(x - y)^8)
C0funcd12[q_, x_, z_, \[Epsilon]_] := 
   (q*x^2 - 4*x^3 + 4*q*x*z + 12*x^2*z - 5*q*z^2 - 12*x*z^2 + 4*z^3 - 
      4*q*x*z*Log[x] + 4*x^2*z*Log[x] - 2*q*z^2*Log[x] - 8*x*z^2*Log[x] + 
      4*z^3*Log[x] + 4*q*x*z*Log[z] - 4*x^2*z*Log[z] + 2*q*z^2*Log[z] + 
      8*x*z^2*Log[z] - 4*z^3*Log[z])/(4*(x - z)^4) - 
    (\[Epsilon]*(2*q*x^3 - 3*x^4 + 18*q*x^2*z + 6*x^3*z - 18*q*x*z^2 - 
       2*q*z^3 - 6*x*z^3 + 3*z^4 - 12*q*x^2*z*Log[x] + 6*x^3*z*Log[x] - 
       12*q*x*z^2*Log[x] - 12*x^2*z^2*Log[x] + 6*x*z^3*Log[x] + 
       12*q*x^2*z*Log[z] - 6*x^3*z*Log[z] + 12*q*x*z^2*Log[z] + 
       12*x^2*z^2*Log[z] - 6*x*z^3*Log[z]))/(6*x*(x - z)^5) - 
    (\[Epsilon]^2*(-9*q*x^4 + 8*x^5 - 132*q*x^3*z - 4*x^4*z + 108*q*x^2*z^2 - 
       40*x^3*z^2 + 36*q*x*z^3 + 64*x^2*z^3 - 3*q*z^4 - 32*x*z^4 + 4*z^5 + 
       72*q*x^3*z*Log[x] - 24*x^4*z*Log[x] + 108*q*x^2*z^2*Log[x] + 
       48*x^3*z^2*Log[x] - 24*x^2*z^3*Log[x] - 72*q*x^3*z*Log[z] + 
       24*x^4*z*Log[z] - 108*q*x^2*z^2*Log[z] - 48*x^3*z^2*Log[z] + 
       24*x^2*z^3*Log[z]))/(24*x^2*(x - z)^6) - 
    (\[Epsilon]^3*(24*q*x^5 - 15*x^6 + 500*q*x^4*z - 20*x^5*z - 
       320*q*x^3*z^2 + 175*x^4*z^2 - 240*q*x^2*z^3 - 260*x^3*z^3 + 
       40*q*x*z^4 + 155*x^2*z^4 - 4*q*z^5 - 40*x*z^5 + 5*z^6 - 
       240*q*x^4*z*Log[x] + 60*x^5*z*Log[x] - 480*q*x^3*z^2*Log[x] - 
       120*x^4*z^2*Log[x] + 60*x^3*z^3*Log[x] + 240*q*x^4*z*Log[z] - 
       60*x^5*z*Log[z] + 480*q*x^3*z^2*Log[z] + 120*x^4*z^2*Log[z] - 
       60*x^3*z^3*Log[z]))/(60*x^3*(x - z)^7) - 
    (\[Epsilon]^4*(-50*q*x^6 + 24*x^7 - 1370*q*x^5*z + 82*x^6*z + 
       625*q*x^4*z^2 - 476*x^5*z^2 + 1000*q*x^3*z^3 + 730*x^4*z^3 - 
       250*q*x^2*z^4 - 520*x^3*z^4 + 50*q*x*z^5 + 206*x^2*z^5 - 5*q*z^6 - 
       52*x*z^6 + 6*z^7 + 600*q*x^5*z*Log[x] - 120*x^6*z*Log[x] + 
       1500*q*x^4*z^2*Log[x] + 240*x^5*z^2*Log[x] - 120*x^4*z^3*Log[x] - 
       600*q*x^5*z*Log[z] + 120*x^6*z*Log[z] - 1500*q*x^4*z^2*Log[z] - 
       240*x^5*z^2*Log[z] + 120*x^4*z^3*Log[z]))/(120*x^4*(x - z)^8)
C0funcd23[q_, x_, y_, \[Epsilon]_] := 
   (2*q*x^3 + 3*q*x^2*y + 12*x^3*y - 6*q*x*y^2 - 36*x^2*y^2 + q*y^3 + 
      36*x*y^3 - 12*y^4 - 6*q*x^2*y*Log[x] - 12*x^3*y*Log[x] + 
      24*x^2*y^2*Log[x] - 12*x*y^3*Log[x] + 6*q*x^2*y*Log[y] + 
      12*x^3*y*Log[y] - 24*x^2*y^2*Log[y] + 12*x*y^3*Log[y])/
     (12*(x - y)^4*y) - (\[Epsilon]*(q*x^4 - 8*q*x^3*y - 6*x^4*y + 
       12*x^3*y^2 + 8*q*x*y^3 - q*y^4 - 12*x*y^4 + 6*y^5 + 
       12*q*x^2*y^2*Log[x] + 12*x^3*y^2*Log[x] - 24*x^2*y^3*Log[x] + 
       12*x*y^4*Log[x] - 12*q*x^2*y^2*Log[y] - 12*x^3*y^2*Log[y] + 
       24*x^2*y^3*Log[y] - 12*x*y^4*Log[y]))/(12*(x - y)^5*y^2) - 
    (\[Epsilon]^2*(-6*q*x^5 + 45*q*x^4*y + 20*x^5*y - 180*q*x^3*y^2 - 
       160*x^4*y^2 + 60*q*x^2*y^3 + 320*x^3*y^3 + 90*q*x*y^4 - 200*x^2*y^4 - 
       9*q*y^5 - 20*x*y^5 + 40*y^6 + 180*q*x^2*y^3*Log[x] + 
       120*x^3*y^3*Log[x] - 240*x^2*y^4*Log[x] + 120*x*y^5*Log[x] - 
       180*q*x^2*y^3*Log[y] - 120*x^3*y^3*Log[y] + 240*x^2*y^4*Log[y] - 
       120*x*y^5*Log[y]))/(120*(x - y)^6*y^3) - 
    (\[Epsilon]^3*(2*q*x^6 - 16*q*x^5*y - 5*x^6*y + 60*q*x^4*y^2 + 
       40*x^5*y^2 - 160*q*x^3*y^3 - 155*x^4*y^3 + 70*q*x^2*y^4 + 
       260*x^3*y^4 + 48*q*x*y^5 - 175*x^2*y^5 - 4*q*y^6 + 20*x*y^6 + 15*y^7 + 
       120*q*x^2*y^4*Log[x] + 60*x^3*y^4*Log[x] - 120*x^2*y^5*Log[x] + 
       60*x*y^6*Log[x] - 120*q*x^2*y^4*Log[y] - 60*x^3*y^4*Log[y] + 
       120*x^2*y^5*Log[y] - 60*x*y^6*Log[y]))/(60*(x - y)^7*y^4) - 
    (\[Epsilon]^4*(-20*q*x^7 + 175*q*x^6*y + 42*x^7*y - 700*q*x^5*y^2 - 
       364*x^6*y^2 + 1750*q*x^4*y^3 + 1442*x^5*y^3 - 3500*q*x^3*y^4 - 
       3640*x^4*y^4 + 1645*q*x^2*y^5 + 5110*x^3*y^5 + 700*q*x*y^6 - 
       3332*x^2*y^6 - 50*q*y^7 + 574*x*y^7 + 168*y^8 + 
       2100*q*x^2*y^5*Log[x] + 840*x^3*y^5*Log[x] - 1680*x^2*y^6*Log[x] + 
       840*x*y^7*Log[x] - 2100*q*x^2*y^5*Log[y] - 840*x^3*y^5*Log[y] + 
       1680*x^2*y^6*Log[y] - 840*x*y^7*Log[y]))/(840*(x - y)^8*y^5)
C0func0Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[C0funcz1d[0, y, z - y]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[C0funcz2d[0, x, z - x]], z == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[C0funcz3d[0, x, y - x]], x == 0, 
      Evaluate[C0funcz1[0, x, y, z]], y == 0, Evaluate[C0funcz2[0, x, y, z]], 
      z == 0, Evaluate[C0funcz3[0, x, y, z]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[C0funcd123[0, x, y - x, z - x]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[C0funcd23[0, x, y, z - y]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[C0funcd13[0, x, y, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[C0funcd12[0, x, z, y - x]], 
      True, Evaluate[C0funcbase[0, x, y, z]]]]]
C0func1Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[Coefficient[C0funcz1d[qsq, y, z - y], qsq]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[Coefficient[C0funcz2d[qsq, x, z - x], qsq]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[Coefficient[C0funcz3d[qsq, x, y - x], qsq]], x == 0, 
      Evaluate[Coefficient[C0funcz1[qsq, x, y, z], qsq]], y == 0, 
      Evaluate[Coefficient[C0funcz2[qsq, x, y, z], qsq]], z == 0, 
      Evaluate[Coefficient[C0funcz3[qsq, x, y, z], qsq]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[Coefficient[C0funcd123[0, x, y - x, z - x], qsq]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[Coefficient[
        C0funcd23[qsq, x, y, z - y], qsq]], Abs[\[Epsilon]13/S13] < d2comp, 
      Evaluate[Coefficient[C0funcd13[qsq, x, y, z - x], qsq]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[Coefficient[
        C0funcd12[qsq, x, z, y - x], qsq]], True, 
      Evaluate[Coefficient[C0funcbase[qsq, x, y, z], qsq]]]]]
C1funcbase[q_, x_, y_, z_] := -16*Pi^2*(y/(32*Pi^2*(x - y)*(y - z)) + 
     (q*((-y^2)*z*(y + 5*z) + x^2*(y^2 - 5*y*z - 2*z^2) + 
        x*y*(y^2 + 2*y*z + 9*z^2)))/(96*Pi^2*(x - y)^2*(x - z)*(y - z)^3) + 
     (-((q*x^3)/(48*Pi^2*(x - y)^3*(x - z)^2)) - 
       x^2/(32*Pi^2*(x - y)^2*(x - z)))*Log[x] + 
     ((y*(x*(y - 2*z) + y*z))/(32*Pi^2*(x - y)^2*(y - z)^2) + 
       (q*y*(3*x^2*z^2 + y^2*z*(2*y + z) + x*y*(y^2 - 4*y*z - 3*z^2)))/
        (48*Pi^2*(x - y)^3*(y - z)^4))*Log[y] + 
     (z^2/(32*Pi^2*(x - z)*(y - z)^2) + (q*z^2*(-3*x*y + z*(2*y + z)))/
        (48*Pi^2*(x - z)^2*(y - z)^4))*Log[z])
C1funcz12[q_, x_, y_, z_] := DirectedInfinity[-2*q + 3*z]/Sign[z]^2
C1funcz23[q_, x_, y_, z_] := DirectedInfinity[-(Sign[q]/Sign[x])]
C1funcz13[q_, x_, y_, z_] := -(q - 3*y)/(6*y^2)
C1funcz1d[q_, x_, \[Epsilon]_] := (-q + 9*x)/(36*x^2) + 
    ((4*q - 15*x)*\[Epsilon])/(180*x^3) + ((-2*q + 5*x)*\[Epsilon]^2)/
     (120*x^4) + ((32*q - 63*x)*\[Epsilon]^3)/(2520*x^5) + 
    ((-25*q + 42*x)*\[Epsilon]^4)/(2520*x^6)
C1funcz2d[q_, x_, \[Epsilon]_] := (-q + 3*x)/(6*x^2) + 
    ((8*q - 9*x)*\[Epsilon])/(36*x^3) + ((-3*q + 2*x)*\[Epsilon]^2)/
     (12*x^4) + ((32*q - 15*x)*\[Epsilon]^3)/(120*x^5) + 
    ((-25*q + 9*x)*\[Epsilon]^4)/(90*x^6)
C1funcz3d[q_, x_, \[Epsilon]_] := (-2*q + 9*x)/(36*x^2) + 
    ((q - 2*x)*\[Epsilon])/(12*x^3) + ((-4*q + 5*x)*\[Epsilon]^2)/(40*x^4) + 
    ((10*q - 9*x)*\[Epsilon]^3)/(90*x^5) + ((-10*q + 7*x)*\[Epsilon]^4)/
     (84*x^6)
C1funcz1[q_, x_, y_, z_] := -((y - z)*(-3*(y - z)^2 + q*(y + 5*z)) + 
      z*(3*(y - z)^2 - 2*q*(2*y + z))*Log[y] + 
      z*(-3*(y - z)^2 + 2*q*(2*y + z))*Log[z])/(6*(y - z)^4)
C1funcz2[q_, x_, y_, z_] := (2*q*(-x + z) + (2*q + 3*x - 3*z)*z*Log[x] + 
     z*(-2*q - 3*x + 3*z)*Log[z])/(6*(x - z)^2*z)
C1funcz3[q_, x_, y_, z_] := -((x - y)*(3*(x - y)*y + q*(x + y)) + 
      x*y*(-2*q - 3*x + 3*y)*Log[x] + x*(2*q + 3*x - 3*y)*y*Log[y])/
    (6*(x - y)^3*y)
C1funcd123[q_, x_, \[Delta]1_, \[Delta]2_] := 
   (-42*q*x^4 + 420*x^5 + 42*q*x^3*\[Delta]1 - 210*x^4*\[Delta]1 - 
      36*q*x^2*\[Delta]1^2 + 126*x^3*\[Delta]1^2 + 30*q*x*\[Delta]1^3 - 
      84*x^2*\[Delta]1^3 - 25*q*\[Delta]1^4 + 60*x*\[Delta]1^4)/(2520*x^6) + 
    ((168*q*x^4 - 630*x^5 - 216*q*x^3*\[Delta]1 + 504*x^4*\[Delta]1 + 
       216*q*x^2*\[Delta]1^2 - 378*x^3*\[Delta]1^2 - 200*q*x*\[Delta]1^3 + 
       288*x^2*\[Delta]1^3 + 180*q*\[Delta]1^4 - 225*x*\[Delta]1^4)*
      \[Delta]2)/(15120*x^7) + ((-198*q*x^4 + 462*x^5 + 297*q*x^3*\[Delta]1 - 
       462*x^4*\[Delta]1 - 330*q*x^2*\[Delta]1^2 + 396*x^3*\[Delta]1^2 + 
       330*q*x*\[Delta]1^3 - 330*x^2*\[Delta]1^3 - 315*q*\[Delta]1^4 + 
       275*x*\[Delta]1^4)*\[Delta]2^2)/(27720*x^8) + 
    ((264*q*x^4 - 462*x^5 - 440*q*x^3*\[Delta]1 + 528*x^4*\[Delta]1 + 
       528*q*x^2*\[Delta]1^2 - 495*x^3*\[Delta]1^2 - 560*q*x*\[Delta]1^3 + 
       440*x^2*\[Delta]1^3 + 560*q*\[Delta]1^4 - 385*x*\[Delta]1^4)*
      \[Delta]2^3)/(55440*x^9) + 
    ((-3575*q*x^4 + 5148*x^5 + 6435*q*x^3*\[Delta]1 - 6435*x^4*\[Delta]1 - 
       8190*q*x^2*\[Delta]1^2 + 6435*x^3*\[Delta]1^2 + 9100*q*x*\[Delta]1^3 - 
       6006*x^2*\[Delta]1^3 - 9450*q*\[Delta]1^4 + 5460*x*\[Delta]1^4)*
      \[Delta]2^4)/(1081080*x^10)
C1funcd13[q_, x_, y_, \[Epsilon]_] := 
   -(q*x^3 - 3*x^4 + 9*q*x^2*y + 6*x^3*y - 9*q*x*y^2 - q*y^3 - 6*x*y^3 + 
       3*y^4 - 6*q*x^2*y*Log[x] + 6*x^3*y*Log[x] - 6*q*x*y^2*Log[x] - 
       12*x^2*y^2*Log[x] + 6*x*y^3*Log[x] + 6*q*x^2*y*Log[y] - 
       6*x^3*y*Log[y] + 6*q*x*y^2*Log[y] + 12*x^2*y^2*Log[y] - 
       6*x*y^3*Log[y])/(6*(x - y)^5) - 
    (\[Epsilon]*(-8*q*x^3 + 9*x^4 - 144*q*x^2*y + 18*x^3*y + 72*q*x*y^2 - 
       108*x^2*y^2 + 80*q*y^3 + 126*x*y^3 - 45*y^4 + 72*q*x^2*y*Log[x] - 
       36*x^3*y*Log[x] + 144*q*x*y^2*Log[x] + 54*x^2*y^2*Log[x] + 
       24*q*y^3*Log[x] - 18*y^4*Log[x] - 72*q*x^2*y*Log[y] + 
       36*x^3*y*Log[y] - 144*q*x*y^2*Log[y] - 54*x^2*y^2*Log[y] - 
       24*q*y^3*Log[y] + 18*y^4*Log[y]))/(36*(x - y)^6) - 
    (\[Epsilon]^2*(3*q*x^4 - 2*x^5 + 84*q*x^3*y - 14*x^4*y + 52*x^3*y^2 - 
       84*q*x*y^3 - 52*x^2*y^3 - 3*q*y^4 + 14*x*y^4 + 2*y^5 - 
       36*q*x^3*y*Log[x] + 12*x^4*y*Log[x] - 108*q*x^2*y^2*Log[x] - 
       12*x^3*y^2*Log[x] - 36*q*x*y^3*Log[x] - 12*x^2*y^3*Log[x] + 
       12*x*y^4*Log[x] + 36*q*x^3*y*Log[y] - 12*x^4*y*Log[y] + 
       108*q*x^2*y^2*Log[y] + 12*x^3*y^2*Log[y] + 36*q*x*y^3*Log[y] + 
       12*x^2*y^3*Log[y] - 12*x*y^4*Log[y]))/(12*x*(x - y)^7) - 
    (\[Epsilon]^3*(-32*q*x^5 + 15*x^6 - 1240*q*x^4*y + 190*x^5*y - 
       640*q*x^3*y^2 - 605*x^4*y^2 + 1760*q*x^2*y^3 + 520*x^3*y^3 + 
       160*q*x*y^4 - 55*x^2*y^4 - 8*q*y^5 - 70*x*y^5 + 5*y^6 + 
       480*q*x^4*y*Log[x] - 120*x^5*y*Log[x] + 1920*q*x^3*y^2*Log[x] + 
       60*x^4*y^2*Log[x] + 960*q*x^2*y^3*Log[x] + 240*x^3*y^3*Log[x] - 
       180*x^2*y^4*Log[x] - 480*q*x^4*y*Log[y] + 120*x^5*y*Log[y] - 
       1920*q*x^3*y^2*Log[y] - 60*x^4*y^2*Log[y] - 960*q*x^2*y^3*Log[y] - 
       240*x^3*y^3*Log[y] + 180*x^2*y^4*Log[y]))/(120*x^2*(x - y)^8) - 
    (\[Epsilon]^4*(50*q*x^6 - 18*x^7 + 2505*q*x^5*y - 339*x^6*y + 
       2625*q*x^4*y^2 + 972*x^5*y^2 - 4500*q*x^3*y^3 - 675*x^4*y^3 - 
       750*q*x^2*y^4 - 150*x^3*y^4 + 75*q*x*y^5 + 243*x^2*y^5 - 5*q*y^6 - 
       36*x*y^6 + 3*y^7 - 900*q*x^5*y*Log[x] + 180*x^6*y*Log[x] - 
       4500*q*x^4*y^2*Log[x] - 3000*q*x^3*y^3*Log[x] - 540*x^4*y^3*Log[x] + 
       360*x^3*y^4*Log[x] + 900*q*x^5*y*Log[y] - 180*x^6*y*Log[y] + 
       4500*q*x^4*y^2*Log[y] + 3000*q*x^3*y^3*Log[y] + 540*x^4*y^3*Log[y] - 
       360*x^3*y^4*Log[y]))/(180*x^3*(x - y)^9)
C1funcd12[q_, x_, z_, \[Epsilon]_] := 
   -(2*q*x^3 - 9*x^4 - 18*q*x^2*z + 54*x^3*z - 18*q*x*z^2 - 108*x^2*z^2 + 
       34*q*z^3 + 90*x*z^3 - 27*z^4 + 36*q*x*z^2*Log[x] - 18*x^2*z^2*Log[x] + 
       12*q*z^3*Log[x] + 36*x*z^3*Log[x] - 18*z^4*Log[x] - 
       36*q*x*z^2*Log[z] + 18*x^2*z^2*Log[z] - 12*q*z^3*Log[z] - 
       36*x*z^3*Log[z] + 18*z^4*Log[z])/(36*(x - z)^5) + 
    (\[Epsilon]*(q*x^4 - 2*x^5 - 12*q*x^3*z + 16*x^4*z - 36*q*x^2*z^2 - 
       32*x^3*z^2 + 44*q*x*z^3 + 20*x^2*z^3 + 3*q*z^4 + 2*x*z^4 - 4*z^5 + 
       36*q*x^2*z^2*Log[x] - 12*x^3*z^2*Log[x] + 24*q*x*z^3*Log[x] + 
       24*x^2*z^3*Log[x] - 12*x*z^4*Log[x] - 36*q*x^2*z^2*Log[z] + 
       12*x^3*z^2*Log[z] - 24*q*x*z^3*Log[z] - 24*x^2*z^3*Log[z] + 
       12*x*z^4*Log[z]))/(12*x*(x - z)^6) - 
    (\[Epsilon]^2*(4*q*x^5 - 5*x^6 - 60*q*x^4*z + 50*x^5*z - 320*q*x^3*z^2 - 
       85*x^4*z^2 + 320*q*x^2*z^3 + 60*q*x*z^4 + 85*x^2*z^4 - 4*q*z^5 - 
       50*x*z^5 + 5*z^6 + 240*q*x^3*z^2*Log[x] - 60*x^4*z^2*Log[x] + 
       240*q*x^2*z^3*Log[x] + 120*x^3*z^3*Log[x] - 60*x^2*z^4*Log[x] - 
       240*q*x^3*z^2*Log[z] + 60*x^4*z^2*Log[z] - 240*q*x^2*z^3*Log[z] - 
       120*x^3*z^3*Log[z] + 60*x^2*z^4*Log[z]))/(40*x^2*(x - z)^7) - 
    (\[Epsilon]^3*(-10*q*x^6 + 9*x^7 + 180*q*x^5*z - 108*x^6*z + 
       1425*q*x^4*z^2 + 129*x^5*z^2 - 1200*q*x^3*z^3 + 210*x^4*z^3 - 
       450*q*x^2*z^4 - 465*x^3*z^4 + 60*q*x*z^5 + 276*x^2*z^5 - 5*q*z^6 - 
       57*x*z^6 + 6*z^7 - 900*q*x^4*z^2*Log[x] + 180*x^5*z^2*Log[x] - 
       1200*q*x^3*z^3*Log[x] - 360*x^4*z^3*Log[x] + 180*x^3*z^4*Log[x] + 
       900*q*x^4*z^2*Log[z] - 180*x^5*z^2*Log[z] + 1200*q*x^3*z^3*Log[z] + 
       360*x^4*z^3*Log[z] - 180*x^3*z^4*Log[z]))/(90*x^3*(x - z)^8) - 
    (\[Epsilon]^4*(20*q*x^7 - 14*x^8 - 420*q*x^6*z + 196*x^7*z - 
       4494*q*x^5*z^2 - 105*x^6*z^2 + 3150*q*x^4*z^3 - 882*x^5*z^3 + 
       2100*q*x^3*z^4 + 1575*x^4*z^4 - 420*q*x^2*z^5 - 1036*x^3*z^5 + 
       70*q*x*z^6 + 329*x^2*z^6 - 6*q*z^7 - 70*x*z^7 + 7*z^8 + 
       2520*q*x^5*z^2*Log[x] - 420*x^6*z^2*Log[x] + 4200*q*x^4*z^3*Log[x] + 
       840*x^5*z^3*Log[x] - 420*x^4*z^4*Log[x] - 2520*q*x^5*z^2*Log[z] + 
       420*x^6*z^2*Log[z] - 4200*q*x^4*z^3*Log[z] - 840*x^5*z^3*Log[z] + 
       420*x^4*z^4*Log[z]))/(168*x^4*(x - z)^9)
C1funcd23[q_, x_, y_, \[Epsilon]_] := 
   (-3*q*x^4 - 10*q*x^3*y - 27*x^4*y + 18*q*x^2*y^2 + 90*x^3*y^2 - 
      6*q*x*y^3 - 108*x^2*y^3 + q*y^4 + 54*x*y^4 - 9*y^5 + 
      12*q*x^3*y*Log[x] + 18*x^4*y*Log[x] - 36*x^3*y^2*Log[x] + 
      18*x^2*y^3*Log[x] - 12*q*x^3*y*Log[y] - 18*x^4*y*Log[y] + 
      36*x^3*y^2*Log[y] - 18*x^2*y^3*Log[y])/(36*(x - y)^5*y) - 
    (\[Epsilon]*(-6*q*x^5 + 60*q*x^4*y + 30*x^5*y + 40*q*x^3*y^2 - 
       15*x^4*y^2 - 120*q*x^2*y^3 - 150*x^3*y^3 + 30*q*x*y^4 + 240*x^2*y^4 - 
       4*q*y^5 - 120*x*y^5 + 15*y^6 - 120*q*x^3*y^2*Log[x] - 
       90*x^4*y^2*Log[x] + 180*x^3*y^3*Log[x] - 90*x^2*y^4*Log[x] + 
       120*q*x^3*y^2*Log[y] + 90*x^4*y^2*Log[y] - 180*x^3*y^3*Log[y] + 
       90*x^2*y^4*Log[y]))/(180*(x - y)^6*y^2) - 
    (\[Epsilon]^2*(2*q*x^6 - 18*q*x^5*y - 5*x^6*y + 90*q*x^4*y^2 + 
       50*x^5*y^2 - 85*x^4*y^3 - 90*q*x^2*y^4 + 18*q*x*y^5 + 85*x^2*y^5 - 
       2*q*y^6 - 50*x*y^6 + 5*y^7 - 120*q*x^3*y^3*Log[x] - 
       60*x^4*y^3*Log[x] + 120*x^3*y^4*Log[x] - 60*x^2*y^5*Log[x] + 
       120*q*x^3*y^3*Log[y] + 60*x^4*y^3*Log[y] - 120*x^3*y^4*Log[y] + 
       60*x^2*y^5*Log[y]))/(120*(x - y)^7*y^3) - 
    (\[Epsilon]^3*(-24*q*x^7 + 224*q*x^6*y + 42*x^7*y - 1008*q*x^5*y^2 - 
       399*x^6*y^2 + 3360*q*x^4*y^3 + 1932*x^5*y^3 - 840*q*x^3*y^4 - 
       3255*x^4*y^4 - 2016*q*x^2*y^5 + 1470*x^3*y^5 + 336*q*x*y^6 + 
       903*x^2*y^6 - 32*q*y^7 - 756*x*y^7 + 63*y^8 - 3360*q*x^3*y^4*Log[x] - 
       1260*x^4*y^4*Log[x] + 2520*x^3*y^5*Log[x] - 1260*x^2*y^6*Log[x] + 
       3360*q*x^3*y^4*Log[y] + 1260*x^4*y^4*Log[y] - 2520*x^3*y^5*Log[y] + 
       1260*x^2*y^6*Log[y]))/(2520*(x - y)^8*y^4) - 
    (\[Epsilon]^4*(15*q*x^8 - 150*q*x^7*y - 21*x^8*y + 700*q*x^6*y^2 + 
       210*x^7*y^2 - 2100*q*x^5*y^3 - 987*x^6*y^3 + 5250*q*x^4*y^4 + 
       3108*x^5*y^4 - 1890*q*x^3*y^5 - 4725*x^4*y^5 - 2100*q*x^2*y^6 + 
       2646*x^3*y^6 + 300*q*x*y^7 + 315*x^2*y^7 - 25*q*y^8 - 588*x*y^8 + 
       42*y^9 - 4200*q*x^3*y^5*Log[x] - 1260*x^4*y^5*Log[x] + 
       2520*x^3*y^6*Log[x] - 1260*x^2*y^7*Log[x] + 4200*q*x^3*y^5*Log[y] + 
       1260*x^4*y^5*Log[y] - 2520*x^3*y^6*Log[y] + 1260*x^2*y^7*Log[y]))/
     (2520*(x - y)^9*y^5)
C1func0Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[C1funcz1d[0, y, z - y]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[C1funcz2d[0, x, z - x]], z == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[C1funcz3d[0, x, y - x]], x == 0, 
      Evaluate[C1funcz1[0, x, y, z]], y == 0, Evaluate[C1funcz2[0, x, y, z]], 
      z == 0, Evaluate[C1funcz3[0, x, y, z]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[C1funcd123[0, x, y - x, z - x]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[C1funcd23[0, x, y, z - y]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[C1funcd13[0, x, y, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[C1funcd12[0, x, z, y - x]], 
      True, Evaluate[C1funcbase[0, x, y, z]]]]]
C1func1Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[Coefficient[C1funcz1d[qsq, y, z - y], qsq]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[Coefficient[C1funcz2d[qsq, x, z - x], qsq]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[Coefficient[C1funcz3d[qsq, x, y - x], qsq]], x == 0, 
      Evaluate[Coefficient[C1funcz1[qsq, x, y, z], qsq]], y == 0, 
      Evaluate[Coefficient[C1funcz2[qsq, x, y, z], qsq]], z == 0, 
      Evaluate[Coefficient[C1funcz3[qsq, x, y, z], qsq]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[Coefficient[C1funcd123[0, x, y - x, z - x], qsq]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[Coefficient[
        C1funcd23[qsq, x, y, z - y], qsq]], Abs[\[Epsilon]13/S13] < d2comp, 
      Evaluate[Coefficient[C1funcd13[qsq, x, y, z - x], qsq]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[Coefficient[
        C1funcd12[qsq, x, z, y - x], qsq]], True, 
      Evaluate[Coefficient[C1funcbase[qsq, x, y, z], qsq]]]]]
C2funcbase[q_, x_, y_, z_] := -16*Pi^2*(z/(32*Pi^2*(x - z)*(-y + z)) + 
     (q*(y*z^2*(5*y + z) + x^2*(2*y^2 + 5*y*z - z^2) - 
        x*z*(9*y^2 + 2*y*z + z^2)))/(96*Pi^2*(x - y)*(x - z)^2*(y - z)^3) + 
     (-((q*x^3)/(48*Pi^2*(x - y)^2*(x - z)^3)) - 
       x^2/(32*Pi^2*(x - y)*(x - z)^2))*Log[x] + 
     (y^2/(32*Pi^2*(x - y)*(y - z)^2) + (q*y^2*(y^2 - 3*x*z + 2*y*z))/
        (48*Pi^2*(x - y)^2*(y - z)^4))*Log[y] + 
     ((z*(y*z + x*(-2*y + z)))/(32*Pi^2*(x - z)^2*(y - z)^2) + 
       (q*z*(3*x^2*y^2 + y*z^2*(y + 2*z) + x*z*(-3*y^2 - 4*y*z + z^2)))/
        (48*Pi^2*(x - z)^3*(y - z)^4))*Log[z])
C2funcz12[q_, x_, y_, z_] := -(q - 3*z)/(6*z^2)
C2funcz23[q_, x_, y_, z_] := DirectedInfinity[-(Sign[q]/Sign[x])]
C2funcz13[q_, x_, y_, z_] := DirectedInfinity[-2*q + 3*y]/Sign[y]^2
C2funcz1d[q_, x_, \[Epsilon]_] := (-q + 9*x)/(36*x^2) + 
    ((q - 5*x)*\[Epsilon])/(30*x^3) + ((-4*q + 15*x)*\[Epsilon]^2)/
     (120*x^4) + ((20*q - 63*x)*\[Epsilon]^3)/(630*x^5) + 
    ((-5*q + 14*x)*\[Epsilon]^4)/(168*x^6)
C2funcz2d[q_, x_, \[Epsilon]_] := (-2*q + 9*x)/(36*x^2) + 
    ((q - 2*x)*\[Epsilon])/(12*x^3) + ((-4*q + 5*x)*\[Epsilon]^2)/(40*x^4) + 
    ((10*q - 9*x)*\[Epsilon]^3)/(90*x^5) + ((-10*q + 7*x)*\[Epsilon]^4)/
     (84*x^6)
C2funcz3d[q_, x_, \[Epsilon]_] := (-q + 3*x)/(6*x^2) + 
    ((8*q - 9*x)*\[Epsilon])/(36*x^3) + ((-3*q + 2*x)*\[Epsilon]^2)/
     (12*x^4) + ((32*q - 15*x)*\[Epsilon]^3)/(120*x^5) + 
    ((-25*q + 9*x)*\[Epsilon]^4)/(90*x^6)
C2funcz1[q_, x_, y_, z_] := ((y - z)*(-3*(y - z)^2 + q*(5*y + z)) + 
     y*(3*(y - z)^2 - 2*q*(y + 2*z))*Log[y] + 
     y*(-3*(y - z)^2 + 2*q*(y + 2*z))*Log[z])/(6*(y - z)^4)
C2funcz2[q_, x_, y_, z_] := -((x - z)*(3*(x - z)*z + q*(x + z)) + 
      x*z*(-2*q - 3*x + 3*z)*Log[x] + x*(2*q + 3*x - 3*z)*z*Log[z])/
    (6*(x - z)^3*z)
C2funcz3[q_, x_, y_, z_] := (2*q*(-x + y) + (2*q + 3*x - 3*y)*y*Log[x] + 
     y*(-2*q - 3*x + 3*y)*Log[y])/(6*(x - y)^2*y)
C2funcd123[q_, x_, \[Delta]1_, \[Delta]2_] := 
   (-126*q*x^4 + 1260*x^5 + 84*q*x^3*\[Delta]1 - 315*x^4*\[Delta]1 - 
      54*q*x^2*\[Delta]1^2 + 126*x^3*\[Delta]1^2 + 36*q*x*\[Delta]1^3 - 
      63*x^2*\[Delta]1^3 - 25*q*\[Delta]1^4 + 36*x*\[Delta]1^4)/(7560*x^6) + 
    ((42*q*x^4 - 210*x^5 - 36*q*x^3*\[Delta]1 + 84*x^4*\[Delta]1 + 
       27*q*x^2*\[Delta]1^2 - 42*x^3*\[Delta]1^2 - 20*q*x*\[Delta]1^3 + 
       24*x^2*\[Delta]1^3 + 15*q*\[Delta]1^4 - 15*x*\[Delta]1^4)*\[Delta]2)/
     (2520*x^7) + ((-264*q*x^4 + 924*x^5 + 264*q*x^3*\[Delta]1 - 
       462*x^4*\[Delta]1 - 220*q*x^2*\[Delta]1^2 + 264*x^3*\[Delta]1^2 + 
       176*q*x*\[Delta]1^3 - 165*x^2*\[Delta]1^3 - 140*q*\[Delta]1^4 + 
       110*x*\[Delta]1^4)*\[Delta]2^2)/(18480*x^8) + 
    ((495*q*x^4 - 1386*x^5 - 550*q*x^3*\[Delta]1 + 792*x^4*\[Delta]1 + 
       495*q*x^2*\[Delta]1^2 - 495*x^3*\[Delta]1^2 - 420*q*x*\[Delta]1^3 + 
       330*x^2*\[Delta]1^3 + 350*q*\[Delta]1^4 - 231*x*\[Delta]1^4)*
      \[Delta]2^3)/(41580*x^9) + 
    ((-1430*q*x^4 + 3432*x^5 + 1716*q*x^3*\[Delta]1 - 2145*x^4*\[Delta]1 - 
       1638*q*x^2*\[Delta]1^2 + 1430*x^3*\[Delta]1^2 + 1456*q*x*\[Delta]1^3 - 
       1001*x^2*\[Delta]1^3 - 1260*q*\[Delta]1^4 + 728*x*\[Delta]1^4)*
      \[Delta]2^4)/(144144*x^10)
C2funcd13[q_, x_, y_, \[Epsilon]_] := 
   -(2*q*x^3 - 9*x^4 - 18*q*x^2*y + 54*x^3*y - 18*q*x*y^2 - 108*x^2*y^2 + 
       34*q*y^3 + 90*x*y^3 - 27*y^4 + 36*q*x*y^2*Log[x] - 18*x^2*y^2*Log[x] + 
       12*q*y^3*Log[x] + 36*x*y^3*Log[x] - 18*y^4*Log[x] - 
       36*q*x*y^2*Log[y] + 18*x^2*y^2*Log[y] - 12*q*y^3*Log[y] - 
       36*x*y^3*Log[y] + 18*y^4*Log[y])/(36*(x - y)^5) + 
    (\[Epsilon]*(q*x^4 - 2*x^5 - 12*q*x^3*y + 16*x^4*y - 36*q*x^2*y^2 - 
       32*x^3*y^2 + 44*q*x*y^3 + 20*x^2*y^3 + 3*q*y^4 + 2*x*y^4 - 4*y^5 + 
       36*q*x^2*y^2*Log[x] - 12*x^3*y^2*Log[x] + 24*q*x*y^3*Log[x] + 
       24*x^2*y^3*Log[x] - 12*x*y^4*Log[x] - 36*q*x^2*y^2*Log[y] + 
       12*x^3*y^2*Log[y] - 24*q*x*y^3*Log[y] - 24*x^2*y^3*Log[y] + 
       12*x*y^4*Log[y]))/(12*x*(x - y)^6) - 
    (\[Epsilon]^2*(4*q*x^5 - 5*x^6 - 60*q*x^4*y + 50*x^5*y - 320*q*x^3*y^2 - 
       85*x^4*y^2 + 320*q*x^2*y^3 + 60*q*x*y^4 + 85*x^2*y^4 - 4*q*y^5 - 
       50*x*y^5 + 5*y^6 + 240*q*x^3*y^2*Log[x] - 60*x^4*y^2*Log[x] + 
       240*q*x^2*y^3*Log[x] + 120*x^3*y^3*Log[x] - 60*x^2*y^4*Log[x] - 
       240*q*x^3*y^2*Log[y] + 60*x^4*y^2*Log[y] - 240*q*x^2*y^3*Log[y] - 
       120*x^3*y^3*Log[y] + 60*x^2*y^4*Log[y]))/(40*x^2*(x - y)^7) - 
    (\[Epsilon]^3*(-10*q*x^6 + 9*x^7 + 180*q*x^5*y - 108*x^6*y + 
       1425*q*x^4*y^2 + 129*x^5*y^2 - 1200*q*x^3*y^3 + 210*x^4*y^3 - 
       450*q*x^2*y^4 - 465*x^3*y^4 + 60*q*x*y^5 + 276*x^2*y^5 - 5*q*y^6 - 
       57*x*y^6 + 6*y^7 - 900*q*x^4*y^2*Log[x] + 180*x^5*y^2*Log[x] - 
       1200*q*x^3*y^3*Log[x] - 360*x^4*y^3*Log[x] + 180*x^3*y^4*Log[x] + 
       900*q*x^4*y^2*Log[y] - 180*x^5*y^2*Log[y] + 1200*q*x^3*y^3*Log[y] + 
       360*x^4*y^3*Log[y] - 180*x^3*y^4*Log[y]))/(90*x^3*(x - y)^8) - 
    (\[Epsilon]^4*(20*q*x^7 - 14*x^8 - 420*q*x^6*y + 196*x^7*y - 
       4494*q*x^5*y^2 - 105*x^6*y^2 + 3150*q*x^4*y^3 - 882*x^5*y^3 + 
       2100*q*x^3*y^4 + 1575*x^4*y^4 - 420*q*x^2*y^5 - 1036*x^3*y^5 + 
       70*q*x*y^6 + 329*x^2*y^6 - 6*q*y^7 - 70*x*y^7 + 7*y^8 + 
       2520*q*x^5*y^2*Log[x] - 420*x^6*y^2*Log[x] + 4200*q*x^4*y^3*Log[x] + 
       840*x^5*y^3*Log[x] - 420*x^4*y^4*Log[x] - 2520*q*x^5*y^2*Log[y] + 
       420*x^6*y^2*Log[y] - 4200*q*x^4*y^3*Log[y] - 840*x^5*y^3*Log[y] + 
       420*x^4*y^4*Log[y]))/(168*x^4*(x - y)^9)
C2funcd12[q_, x_, z_, \[Epsilon]_] := 
   -(q*x^3 - 3*x^4 + 9*q*x^2*z + 6*x^3*z - 9*q*x*z^2 - q*z^3 - 6*x*z^3 + 
       3*z^4 - 6*q*x^2*z*Log[x] + 6*x^3*z*Log[x] - 6*q*x*z^2*Log[x] - 
       12*x^2*z^2*Log[x] + 6*x*z^3*Log[x] + 6*q*x^2*z*Log[z] - 
       6*x^3*z*Log[z] + 6*q*x*z^2*Log[z] + 12*x^2*z^2*Log[z] - 
       6*x*z^3*Log[z])/(6*(x - z)^5) - 
    (\[Epsilon]*(-8*q*x^3 + 9*x^4 - 144*q*x^2*z + 18*x^3*z + 72*q*x*z^2 - 
       108*x^2*z^2 + 80*q*z^3 + 126*x*z^3 - 45*z^4 + 72*q*x^2*z*Log[x] - 
       36*x^3*z*Log[x] + 144*q*x*z^2*Log[x] + 54*x^2*z^2*Log[x] + 
       24*q*z^3*Log[x] - 18*z^4*Log[x] - 72*q*x^2*z*Log[z] + 
       36*x^3*z*Log[z] - 144*q*x*z^2*Log[z] - 54*x^2*z^2*Log[z] - 
       24*q*z^3*Log[z] + 18*z^4*Log[z]))/(36*(x - z)^6) - 
    (\[Epsilon]^2*(3*q*x^4 - 2*x^5 + 84*q*x^3*z - 14*x^4*z + 52*x^3*z^2 - 
       84*q*x*z^3 - 52*x^2*z^3 - 3*q*z^4 + 14*x*z^4 + 2*z^5 - 
       36*q*x^3*z*Log[x] + 12*x^4*z*Log[x] - 108*q*x^2*z^2*Log[x] - 
       12*x^3*z^2*Log[x] - 36*q*x*z^3*Log[x] - 12*x^2*z^3*Log[x] + 
       12*x*z^4*Log[x] + 36*q*x^3*z*Log[z] - 12*x^4*z*Log[z] + 
       108*q*x^2*z^2*Log[z] + 12*x^3*z^2*Log[z] + 36*q*x*z^3*Log[z] + 
       12*x^2*z^3*Log[z] - 12*x*z^4*Log[z]))/(12*x*(x - z)^7) - 
    (\[Epsilon]^3*(-32*q*x^5 + 15*x^6 - 1240*q*x^4*z + 190*x^5*z - 
       640*q*x^3*z^2 - 605*x^4*z^2 + 1760*q*x^2*z^3 + 520*x^3*z^3 + 
       160*q*x*z^4 - 55*x^2*z^4 - 8*q*z^5 - 70*x*z^5 + 5*z^6 + 
       480*q*x^4*z*Log[x] - 120*x^5*z*Log[x] + 1920*q*x^3*z^2*Log[x] + 
       60*x^4*z^2*Log[x] + 960*q*x^2*z^3*Log[x] + 240*x^3*z^3*Log[x] - 
       180*x^2*z^4*Log[x] - 480*q*x^4*z*Log[z] + 120*x^5*z*Log[z] - 
       1920*q*x^3*z^2*Log[z] - 60*x^4*z^2*Log[z] - 960*q*x^2*z^3*Log[z] - 
       240*x^3*z^3*Log[z] + 180*x^2*z^4*Log[z]))/(120*x^2*(x - z)^8) - 
    (\[Epsilon]^4*(50*q*x^6 - 18*x^7 + 2505*q*x^5*z - 339*x^6*z + 
       2625*q*x^4*z^2 + 972*x^5*z^2 - 4500*q*x^3*z^3 - 675*x^4*z^3 - 
       750*q*x^2*z^4 - 150*x^3*z^4 + 75*q*x*z^5 + 243*x^2*z^5 - 5*q*z^6 - 
       36*x*z^6 + 3*z^7 - 900*q*x^5*z*Log[x] + 180*x^6*z*Log[x] - 
       4500*q*x^4*z^2*Log[x] - 3000*q*x^3*z^3*Log[x] - 540*x^4*z^3*Log[x] + 
       360*x^3*z^4*Log[x] + 900*q*x^5*z*Log[z] - 180*x^6*z*Log[z] + 
       4500*q*x^4*z^2*Log[z] + 3000*q*x^3*z^3*Log[z] + 540*x^4*z^3*Log[z] - 
       360*x^3*z^4*Log[z]))/(180*x^3*(x - z)^9)
C2funcd23[q_, x_, y_, \[Epsilon]_] := 
   (-3*q*x^4 - 10*q*x^3*y - 27*x^4*y + 18*q*x^2*y^2 + 90*x^3*y^2 - 
      6*q*x*y^3 - 108*x^2*y^3 + q*y^4 + 54*x*y^4 - 9*y^5 + 
      12*q*x^3*y*Log[x] + 18*x^4*y*Log[x] - 36*x^3*y^2*Log[x] + 
      18*x^2*y^3*Log[x] - 12*q*x^3*y*Log[y] - 18*x^4*y*Log[y] + 
      36*x^3*y^2*Log[y] - 18*x^2*y^3*Log[y])/(36*(x - y)^5*y) - 
    (\[Epsilon]*(-3*q*x^5 + 30*q*x^4*y + 20*x^5*y + 20*q*x^3*y^2 - 
       10*x^4*y^2 - 60*q*x^2*y^3 - 100*x^3*y^3 + 15*q*x*y^4 + 160*x^2*y^4 - 
       2*q*y^5 - 80*x*y^5 + 10*y^6 - 60*q*x^3*y^2*Log[x] - 
       60*x^4*y^2*Log[x] + 120*x^3*y^3*Log[x] - 60*x^2*y^4*Log[x] + 
       60*q*x^3*y^2*Log[y] + 60*x^4*y^2*Log[y] - 120*x^3*y^3*Log[y] + 
       60*x^2*y^4*Log[y]))/(60*(x - y)^6*y^2) - 
    (\[Epsilon]^2*(4*q*x^6 - 36*q*x^5*y - 15*x^6*y + 180*q*x^4*y^2 + 
       150*x^5*y^2 - 255*x^4*y^3 - 180*q*x^2*y^4 + 36*q*x*y^5 + 255*x^2*y^5 - 
       4*q*y^6 - 150*x*y^6 + 15*y^7 - 240*q*x^3*y^3*Log[x] - 
       180*x^4*y^3*Log[x] + 360*x^3*y^4*Log[x] - 180*x^2*y^5*Log[x] + 
       240*q*x^3*y^3*Log[y] + 180*x^4*y^3*Log[y] - 360*x^3*y^4*Log[y] + 
       180*x^2*y^5*Log[y]))/(120*(x - y)^7*y^3) - 
    (\[Epsilon]^3*(-15*q*x^7 + 140*q*x^6*y + 42*x^7*y - 630*q*x^5*y^2 - 
       399*x^6*y^2 + 2100*q*x^4*y^3 + 1932*x^5*y^3 - 525*q*x^3*y^4 - 
       3255*x^4*y^4 - 1260*q*x^2*y^5 + 1470*x^3*y^5 + 210*q*x*y^6 + 
       903*x^2*y^6 - 20*q*y^7 - 756*x*y^7 + 63*y^8 - 2100*q*x^3*y^4*Log[x] - 
       1260*x^4*y^4*Log[x] + 2520*x^3*y^5*Log[x] - 1260*x^2*y^6*Log[x] + 
       2100*q*x^3*y^4*Log[y] + 1260*x^4*y^4*Log[y] - 2520*x^3*y^5*Log[y] + 
       1260*x^2*y^6*Log[y]))/(630*(x - y)^8*y^4) - 
    (\[Epsilon]^4*(3*q*x^8 - 30*q*x^7*y - 7*x^8*y + 140*q*x^6*y^2 + 
       70*x^7*y^2 - 420*q*x^5*y^3 - 329*x^6*y^3 + 1050*q*x^4*y^4 + 
       1036*x^5*y^4 - 378*q*x^3*y^5 - 1575*x^4*y^5 - 420*q*x^2*y^6 + 
       882*x^3*y^6 + 60*q*x*y^7 + 105*x^2*y^7 - 5*q*y^8 - 196*x*y^8 + 
       14*y^9 - 840*q*x^3*y^5*Log[x] - 420*x^4*y^5*Log[x] + 
       840*x^3*y^6*Log[x] - 420*x^2*y^7*Log[x] + 840*q*x^3*y^5*Log[y] + 
       420*x^4*y^5*Log[y] - 840*x^3*y^6*Log[y] + 420*x^2*y^7*Log[y]))/
     (168*(x - y)^9*y^5)
C2func0Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[C2funcz1d[0, y, z - y]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[C2funcz2d[0, x, z - x]], z == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[C2funcz3d[0, x, y - x]], x == 0, 
      Evaluate[C2funcz1[0, x, y, z]], y == 0, Evaluate[C2funcz2[0, x, y, z]], 
      z == 0, Evaluate[C2funcz3[0, x, y, z]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[C2funcd123[0, x, y - x, z - x]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[C2funcd23[0, x, y, z - y]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[C2funcd13[0, x, y, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[C2funcd12[0, x, z, y - x]], 
      True, Evaluate[C2funcbase[0, x, y, z]]]]]
C2func1Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[Coefficient[C2funcz1d[qsq, y, z - y], qsq]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[Coefficient[C2funcz2d[qsq, x, z - x], qsq]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[Coefficient[C2funcz3d[qsq, x, y - x], qsq]], x == 0, 
      Evaluate[Coefficient[C2funcz1[qsq, x, y, z], qsq]], y == 0, 
      Evaluate[Coefficient[C2funcz2[qsq, x, y, z], qsq]], z == 0, 
      Evaluate[Coefficient[C2funcz3[qsq, x, y, z], qsq]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[Coefficient[C2funcd123[0, x, y - x, z - x], qsq]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[Coefficient[
        C2funcd23[qsq, x, y, z - y], qsq]], Abs[\[Epsilon]13/S13] < d2comp, 
      Evaluate[Coefficient[C2funcd13[qsq, x, y, z - x], qsq]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[Coefficient[
        C2funcd12[qsq, x, z, y - x], qsq]], True, 
      Evaluate[Coefficient[C2funcbase[qsq, x, y, z], qsq]]]]]
C00funcbase[q_, x_, y_, z_] := 16*Pi^2*(3/(128*Pi^2) - EulerGamma/(64*Pi^2) + 
     (q*x*y^2)/(192*Pi^2*(x - y)*(x - z)*(y - z)^2) - 
     (q*y^2*z)/(192*Pi^2*(x - y)*(x - z)*(y - z)^2) + 
     (q*x*z^2)/(192*Pi^2*(x - y)*(x - z)*(y - z)^2) - 
     (q*y*z^2)/(192*Pi^2*(x - y)*(x - z)*(y - z)^2) + Log[2]/(32*Pi^2) + 
     Log[Pi]/(64*Pi^2) - (q*x^3*Log[x])/(192*Pi^2*(x - y)^2*(x - z)^2) - 
     (x^2*Log[x])/(64*Pi^2*(x - y)*(x - z)) + (q*x*y^3*Log[y])/
      (192*Pi^2*(x - y)^2*(y - z)^3) + (y^2*Log[y])/
      (64*Pi^2*(x - y)*(y - z)) - (q*x*y^2*z*Log[y])/
      (64*Pi^2*(x - y)^2*(y - z)^3) + (q*y^3*z*Log[y])/
      (96*Pi^2*(x - y)^2*(y - z)^3) - (q*x*y*z^2*Log[z])/
      (64*Pi^2*(x - z)^2*(-y + z)^3) + (q*x*z^3*Log[z])/
      (192*Pi^2*(x - z)^2*(-y + z)^3) + (q*y*z^3*Log[z])/
      (96*Pi^2*(x - z)^2*(-y + z)^3) + (z^2*Log[z])/
      (64*Pi^2*(x - z)*(-y + z)))
C00funcz12[q_, x_, y_, z_] := 
   (-2*q + z*(9 - 6*EulerGamma + Log[4096] + 6*Log[Pi]) - 6*z*Log[z])/(24*z)
C00funcz23[q_, x_, y_, z_] := DirectedInfinity[-Sign[q]]/Sign[x]
C00funcz13[q_, x_, y_, z_] := 
   (-2*q + y*(9 - 6*EulerGamma + Log[4096] + 6*Log[Pi]) - 6*y*Log[y])/(24*y)
C00funcz1d[q_, x_, \[Epsilon]_] := ((q - 9*x)*\[Epsilon])/(72*x^2) + 
    ((-q + 5*x)*\[Epsilon]^2)/(120*x^3) + ((4*q - 15*x)*\[Epsilon]^3)/
     (720*x^4) + ((-20*q + 63*x)*\[Epsilon]^4)/(5040*x^5) + 
    (-2*q + 9*x - 18*EulerGamma*x + 9*x*Log[16] + 18*x*Log[Pi] - 18*x*Log[x])/
     (72*x)
C00funcz2d[q_, x_, \[Epsilon]_] := ((2*q - 9*x)*\[Epsilon])/(72*x^2) + 
    ((-q + 2*x)*\[Epsilon]^2)/(48*x^3) + ((4*q - 5*x)*\[Epsilon]^3)/
     (240*x^4) + ((-10*q + 9*x)*\[Epsilon]^4)/(720*x^5) + 
    (-q + 3*x - 6*EulerGamma*x + 3*x*Log[16] + 6*x*Log[Pi] - 6*x*Log[x])/
     (24*x)
C00funcz3d[q_, x_, \[Epsilon]_] := ((2*q - 9*x)*\[Epsilon])/(72*x^2) + 
    ((-q + 2*x)*\[Epsilon]^2)/(48*x^3) + ((4*q - 5*x)*\[Epsilon]^3)/
     (240*x^4) + ((-10*q + 9*x)*\[Epsilon]^4)/(720*x^5) + 
    (-q + 3*x - 6*EulerGamma*x + 3*x*Log[16] + 6*x*Log[Pi] - 6*x*Log[x])/
     (24*x)
C00funcz1[q_, x_, y_, z_] := 
   (-((y - z)*(2*q*(y + z) + 3*(y - z)^2*(-3 + 2*EulerGamma - 4*Log[2] - 
          2*Log[Pi]))) + 2*y*(-3*y^2 + 6*y*z + (2*q - 3*z)*z)*Log[y] + 
     2*(-2*q*y + 3*(y - z)^2)*z*Log[z])/(24*(y - z)^3)
C00funcz2[q_, x_, y_, z_] := 
   ((x - z)*(2*q - 3*(x - z)*(-3 + 2*EulerGamma - 4*Log[2] - 2*Log[Pi])) - 
     2*x*(q + 3*x - 3*z)*Log[x] + 2*(q*x + 3*(x - z)*z)*Log[z])/(24*(x - z)^2)
C00funcz3[q_, x_, y_, z_] := 
   ((x - y)*(2*q - 3*(x - y)*(-3 + 2*EulerGamma - 4*Log[2] - 2*Log[Pi])) - 
     2*x*(q + 3*x - 3*y)*Log[x] + 2*(q*x + 3*(x - y)*y)*Log[y])/(24*(x - y)^2)
C00funcd123[q_, x_, \[Delta]1_, \[Delta]2_] := 
   ((q - 10*x)*\[Delta]1)/(120*x^2) - ((q - 5*x)*\[Delta]1^2)/(240*x^3) + 
    ((2*q - 7*x)*\[Delta]1^3)/(840*x^4) - ((5*q - 14*x)*\[Delta]1^4)/
     (3360*x^5) + ((126*q*x^4 - 1260*x^5 - 84*q*x^3*\[Delta]1 + 
       315*x^4*\[Delta]1 + 54*q*x^2*\[Delta]1^2 - 126*x^3*\[Delta]1^2 - 
       36*q*x*\[Delta]1^3 + 63*x^2*\[Delta]1^3 + 25*q*\[Delta]1^4 - 
       36*x*\[Delta]1^4)*\[Delta]2)/(15120*x^6) + 
    ((-42*q*x^4 + 210*x^5 + 36*q*x^3*\[Delta]1 - 84*x^4*\[Delta]1 - 
       27*q*x^2*\[Delta]1^2 + 42*x^3*\[Delta]1^2 + 20*q*x*\[Delta]1^3 - 
       24*x^2*\[Delta]1^3 - 15*q*\[Delta]1^4 + 15*x*\[Delta]1^4)*\[Delta]2^2)/
     (10080*x^7) + ((264*q*x^4 - 924*x^5 - 264*q*x^3*\[Delta]1 + 
       462*x^4*\[Delta]1 + 220*q*x^2*\[Delta]1^2 - 264*x^3*\[Delta]1^2 - 
       176*q*x*\[Delta]1^3 + 165*x^2*\[Delta]1^3 + 140*q*\[Delta]1^4 - 
       110*x*\[Delta]1^4)*\[Delta]2^3)/(110880*x^8) + 
    ((-495*q*x^4 + 1386*x^5 + 550*q*x^3*\[Delta]1 - 792*x^4*\[Delta]1 - 
       495*q*x^2*\[Delta]1^2 + 495*x^3*\[Delta]1^2 + 420*q*x*\[Delta]1^3 - 
       330*x^2*\[Delta]1^3 - 350*q*\[Delta]1^4 + 231*x*\[Delta]1^4)*
      \[Delta]2^4)/(332640*x^9) + (-q - 12*EulerGamma*x + 24*x*Log[2] + 
      12*x*Log[Pi] - 12*x*Log[x])/(48*x)
C00funcd13[q_, x_, y_, \[Epsilon]_] := 
   (-(q*x^3) + 3*x^4 - 6*EulerGamma*x^4 + 6*q*x^2*y - 18*x^3*y + 
      24*EulerGamma*x^3*y - 3*q*x*y^2 + 36*x^2*y^2 - 36*EulerGamma*x^2*y^2 - 
      2*q*y^3 - 30*x*y^3 + 24*EulerGamma*x*y^3 + 9*y^4 - 6*EulerGamma*y^4 + 
      12*x^4*Log[2] - 48*x^3*y*Log[2] + 72*x^2*y^2*Log[2] - 48*x*y^3*Log[2] + 
      12*y^4*Log[2] + 6*x^4*Log[Pi] - 24*x^3*y*Log[Pi] + 36*x^2*y^2*Log[Pi] - 
      24*x*y^3*Log[Pi] + 6*y^4*Log[Pi] - 6*x^4*Log[x] + 24*x^3*y*Log[x] - 
      6*q*x*y^2*Log[x] - 30*x^2*y^2*Log[x] + 12*x*y^3*Log[x] + 
      6*q*x*y^2*Log[y] - 6*x^2*y^2*Log[y] + 12*x*y^3*Log[y] - 6*y^4*Log[y])/
     (24*(x - y)^4) + (\[Epsilon]*(2*q*x^3 - 9*x^4 - 18*q*x^2*y + 54*x^3*y - 
       18*q*x*y^2 - 108*x^2*y^2 + 34*q*y^3 + 90*x*y^3 - 27*y^4 + 
       36*q*x*y^2*Log[x] - 18*x^2*y^2*Log[x] + 12*q*y^3*Log[x] + 
       36*x*y^3*Log[x] - 18*y^4*Log[x] - 36*q*x*y^2*Log[y] + 
       18*x^2*y^2*Log[y] - 12*q*y^3*Log[y] - 36*x*y^3*Log[y] + 
       18*y^4*Log[y]))/(72*(x - y)^5) + 
    (\[Epsilon]^2*(-(q*x^4) + 2*x^5 + 12*q*x^3*y - 16*x^4*y + 36*q*x^2*y^2 + 
       32*x^3*y^2 - 44*q*x*y^3 - 20*x^2*y^3 - 3*q*y^4 - 2*x*y^4 + 4*y^5 - 
       36*q*x^2*y^2*Log[x] + 12*x^3*y^2*Log[x] - 24*q*x*y^3*Log[x] - 
       24*x^2*y^3*Log[x] + 12*x*y^4*Log[x] + 36*q*x^2*y^2*Log[y] - 
       12*x^3*y^2*Log[y] + 24*q*x*y^3*Log[y] + 24*x^2*y^3*Log[y] - 
       12*x*y^4*Log[y]))/(48*x*(x - y)^6) + 
    (\[Epsilon]^3*(4*q*x^5 - 5*x^6 - 60*q*x^4*y + 50*x^5*y - 320*q*x^3*y^2 - 
       85*x^4*y^2 + 320*q*x^2*y^3 + 60*q*x*y^4 + 85*x^2*y^4 - 4*q*y^5 - 
       50*x*y^5 + 5*y^6 + 240*q*x^3*y^2*Log[x] - 60*x^4*y^2*Log[x] + 
       240*q*x^2*y^3*Log[x] + 120*x^3*y^3*Log[x] - 60*x^2*y^4*Log[x] - 
       240*q*x^3*y^2*Log[y] + 60*x^4*y^2*Log[y] - 240*q*x^2*y^3*Log[y] - 
       120*x^3*y^3*Log[y] + 60*x^2*y^4*Log[y]))/(240*x^2*(x - y)^7) + 
    (\[Epsilon]^4*(-10*q*x^6 + 9*x^7 + 180*q*x^5*y - 108*x^6*y + 
       1425*q*x^4*y^2 + 129*x^5*y^2 - 1200*q*x^3*y^3 + 210*x^4*y^3 - 
       450*q*x^2*y^4 - 465*x^3*y^4 + 60*q*x*y^5 + 276*x^2*y^5 - 5*q*y^6 - 
       57*x*y^6 + 6*y^7 - 900*q*x^4*y^2*Log[x] + 180*x^5*y^2*Log[x] - 
       1200*q*x^3*y^3*Log[x] - 360*x^4*y^3*Log[x] + 180*x^3*y^4*Log[x] + 
       900*q*x^4*y^2*Log[y] - 180*x^5*y^2*Log[y] + 1200*q*x^3*y^3*Log[y] + 
       360*x^4*y^3*Log[y] - 180*x^3*y^4*Log[y]))/(720*x^3*(x - y)^8)
C00funcd12[q_, x_, z_, \[Epsilon]_] := 
   (-(q*x^3) + 3*x^4 - 6*EulerGamma*x^4 + 6*q*x^2*z - 18*x^3*z + 
      24*EulerGamma*x^3*z - 3*q*x*z^2 + 36*x^2*z^2 - 36*EulerGamma*x^2*z^2 - 
      2*q*z^3 - 30*x*z^3 + 24*EulerGamma*x*z^3 + 9*z^4 - 6*EulerGamma*z^4 + 
      12*x^4*Log[2] - 48*x^3*z*Log[2] + 72*x^2*z^2*Log[2] - 48*x*z^3*Log[2] + 
      12*z^4*Log[2] + 6*x^4*Log[Pi] - 24*x^3*z*Log[Pi] + 36*x^2*z^2*Log[Pi] - 
      24*x*z^3*Log[Pi] + 6*z^4*Log[Pi] - 6*x^4*Log[x] + 24*x^3*z*Log[x] - 
      6*q*x*z^2*Log[x] - 30*x^2*z^2*Log[x] + 12*x*z^3*Log[x] + 
      6*q*x*z^2*Log[z] - 6*x^2*z^2*Log[z] + 12*x*z^3*Log[z] - 6*z^4*Log[z])/
     (24*(x - z)^4) + (\[Epsilon]*(2*q*x^3 - 9*x^4 - 18*q*x^2*z + 54*x^3*z - 
       18*q*x*z^2 - 108*x^2*z^2 + 34*q*z^3 + 90*x*z^3 - 27*z^4 + 
       36*q*x*z^2*Log[x] - 18*x^2*z^2*Log[x] + 12*q*z^3*Log[x] + 
       36*x*z^3*Log[x] - 18*z^4*Log[x] - 36*q*x*z^2*Log[z] + 
       18*x^2*z^2*Log[z] - 12*q*z^3*Log[z] - 36*x*z^3*Log[z] + 
       18*z^4*Log[z]))/(72*(x - z)^5) + 
    (\[Epsilon]^2*(-(q*x^4) + 2*x^5 + 12*q*x^3*z - 16*x^4*z + 36*q*x^2*z^2 + 
       32*x^3*z^2 - 44*q*x*z^3 - 20*x^2*z^3 - 3*q*z^4 - 2*x*z^4 + 4*z^5 - 
       36*q*x^2*z^2*Log[x] + 12*x^3*z^2*Log[x] - 24*q*x*z^3*Log[x] - 
       24*x^2*z^3*Log[x] + 12*x*z^4*Log[x] + 36*q*x^2*z^2*Log[z] - 
       12*x^3*z^2*Log[z] + 24*q*x*z^3*Log[z] + 24*x^2*z^3*Log[z] - 
       12*x*z^4*Log[z]))/(48*x*(x - z)^6) + 
    (\[Epsilon]^3*(4*q*x^5 - 5*x^6 - 60*q*x^4*z + 50*x^5*z - 320*q*x^3*z^2 - 
       85*x^4*z^2 + 320*q*x^2*z^3 + 60*q*x*z^4 + 85*x^2*z^4 - 4*q*z^5 - 
       50*x*z^5 + 5*z^6 + 240*q*x^3*z^2*Log[x] - 60*x^4*z^2*Log[x] + 
       240*q*x^2*z^3*Log[x] + 120*x^3*z^3*Log[x] - 60*x^2*z^4*Log[x] - 
       240*q*x^3*z^2*Log[z] + 60*x^4*z^2*Log[z] - 240*q*x^2*z^3*Log[z] - 
       120*x^3*z^3*Log[z] + 60*x^2*z^4*Log[z]))/(240*x^2*(x - z)^7) + 
    (\[Epsilon]^4*(-10*q*x^6 + 9*x^7 + 180*q*x^5*z - 108*x^6*z + 
       1425*q*x^4*z^2 + 129*x^5*z^2 - 1200*q*x^3*z^3 + 210*x^4*z^3 - 
       450*q*x^2*z^4 - 465*x^3*z^4 + 60*q*x*z^5 + 276*x^2*z^5 - 5*q*z^6 - 
       57*x*z^6 + 6*z^7 - 900*q*x^4*z^2*Log[x] + 180*x^5*z^2*Log[x] - 
       1200*q*x^3*z^3*Log[x] - 360*x^4*z^3*Log[x] + 180*x^3*z^4*Log[x] + 
       900*q*x^4*z^2*Log[z] - 180*x^5*z^2*Log[z] + 1200*q*x^3*z^3*Log[z] + 
       360*x^4*z^3*Log[z] - 180*x^3*z^4*Log[z]))/(720*x^3*(x - z)^8)
C00funcd23[q_, x_, y_, \[Epsilon]_] := 
   (\[Epsilon]*(3*q*x^4 + 10*q*x^3*y + 27*x^4*y - 18*q*x^2*y^2 - 90*x^3*y^2 + 
       6*q*x*y^3 + 108*x^2*y^3 - q*y^4 - 54*x*y^4 + 9*y^5 - 
       12*q*x^3*y*Log[x] - 18*x^4*y*Log[x] + 36*x^3*y^2*Log[x] - 
       18*x^2*y^3*Log[x] + 12*q*x^3*y*Log[y] + 18*x^4*y*Log[y] - 
       36*x^3*y^2*Log[y] + 18*x^2*y^3*Log[y]))/(72*(x - y)^5*y) + 
    (11*q*x^3 + 27*x^4 - 18*EulerGamma*x^4 - 18*q*x^2*y - 90*x^3*y + 
      72*EulerGamma*x^3*y + 9*q*x*y^2 + 108*x^2*y^2 - 
      108*EulerGamma*x^2*y^2 - 2*q*y^3 - 54*x*y^3 + 72*EulerGamma*x*y^3 + 
      9*y^4 - 18*EulerGamma*y^4 + 36*x^4*Log[2] - 144*x^3*y*Log[2] + 
      216*x^2*y^2*Log[2] - 144*x*y^3*Log[2] + 36*y^4*Log[2] + 
      18*x^4*Log[Pi] - 72*x^3*y*Log[Pi] + 108*x^2*y^2*Log[Pi] - 
      72*x*y^3*Log[Pi] + 18*y^4*Log[Pi] - 6*q*x^3*Log[x] - 18*x^4*Log[x] + 
      36*x^3*y*Log[x] - 18*x^2*y^2*Log[x] + 6*q*x^3*Log[y] + 
      36*x^3*y*Log[y] - 90*x^2*y^2*Log[y] + 72*x*y^3*Log[y] - 18*y^4*Log[y])/
     (72*(x - y)^4) + (\[Epsilon]^2*(-3*q*x^5 + 30*q*x^4*y + 20*x^5*y + 
       20*q*x^3*y^2 - 10*x^4*y^2 - 60*q*x^2*y^3 - 100*x^3*y^3 + 15*q*x*y^4 + 
       160*x^2*y^4 - 2*q*y^5 - 80*x*y^5 + 10*y^6 - 60*q*x^3*y^2*Log[x] - 
       60*x^4*y^2*Log[x] + 120*x^3*y^3*Log[x] - 60*x^2*y^4*Log[x] + 
       60*q*x^3*y^2*Log[y] + 60*x^4*y^2*Log[y] - 120*x^3*y^3*Log[y] + 
       60*x^2*y^4*Log[y]))/(240*(x - y)^6*y^2) + 
    (\[Epsilon]^3*(4*q*x^6 - 36*q*x^5*y - 15*x^6*y + 180*q*x^4*y^2 + 
       150*x^5*y^2 - 255*x^4*y^3 - 180*q*x^2*y^4 + 36*q*x*y^5 + 255*x^2*y^5 - 
       4*q*y^6 - 150*x*y^6 + 15*y^7 - 240*q*x^3*y^3*Log[x] - 
       180*x^4*y^3*Log[x] + 360*x^3*y^4*Log[x] - 180*x^2*y^5*Log[x] + 
       240*q*x^3*y^3*Log[y] + 180*x^4*y^3*Log[y] - 360*x^3*y^4*Log[y] + 
       180*x^2*y^5*Log[y]))/(720*(x - y)^7*y^3) + 
    (\[Epsilon]^4*(-15*q*x^7 + 140*q*x^6*y + 42*x^7*y - 630*q*x^5*y^2 - 
       399*x^6*y^2 + 2100*q*x^4*y^3 + 1932*x^5*y^3 - 525*q*x^3*y^4 - 
       3255*x^4*y^4 - 1260*q*x^2*y^5 + 1470*x^3*y^5 + 210*q*x*y^6 + 
       903*x^2*y^6 - 20*q*y^7 - 756*x*y^7 + 63*y^8 - 2100*q*x^3*y^4*Log[x] - 
       1260*x^4*y^4*Log[x] + 2520*x^3*y^5*Log[x] - 1260*x^2*y^6*Log[x] + 
       2100*q*x^3*y^4*Log[y] + 1260*x^4*y^4*Log[y] - 2520*x^3*y^5*Log[y] + 
       1260*x^2*y^6*Log[y]))/(5040*(x - y)^8*y^4)
C00func0Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[C00funcz1d[0, y, z - y]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[C00funcz2d[0, x, z - x]], z == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[C00funcz3d[0, x, y - x]], x == 0, 
      Evaluate[C00funcz1[0, x, y, z]], y == 0, 
      Evaluate[C00funcz2[0, x, y, z]], z == 0, 
      Evaluate[C00funcz3[0, x, y, z]], Abs[\[Epsilon]23/S23] + 
        Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < d3comp, 
      Evaluate[C00funcd123[0, x, y - x, z - x]], Abs[\[Epsilon]23/S23] < 
       d2comp, Evaluate[C00funcd23[0, x, y, z - y]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[C00funcd13[0, x, y, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[C00funcd12[0, x, z, y - x]], 
      True, Evaluate[C00funcbase[0, x, y, z]]]]]
C00func1Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[Coefficient[C00funcz1d[qsq, y, z - y], qsq]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[Coefficient[C00funcz2d[qsq, x, z - x], qsq]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[Coefficient[C00funcz3d[qsq, x, y - x], qsq]], x == 0, 
      Evaluate[Coefficient[C00funcz1[qsq, x, y, z], qsq]], y == 0, 
      Evaluate[Coefficient[C00funcz2[qsq, x, y, z], qsq]], z == 0, 
      Evaluate[Coefficient[C00funcz3[qsq, x, y, z], qsq]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[Coefficient[C00funcd123[0, x, y - x, z - x], qsq]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[Coefficient[
        C00funcd23[qsq, x, y, z - y], qsq]], Abs[\[Epsilon]13/S13] < d2comp, 
      Evaluate[Coefficient[C00funcd13[qsq, x, y, z - x], qsq]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[Coefficient[
        C00funcd12[qsq, x, z, y - x], qsq]], True, 
      Evaluate[Coefficient[C00funcbase[qsq, x, y, z], qsq]]]]]
C11funcbase[q_, x_, y_, z_] := 
   -16*Pi^2*((y*(-3*x*y + y^2 + 5*x*z - 3*y*z))/(96*Pi^2*(x - y)^2*
       (y - z)^2) + (q*(y^3*z*(-y^2 + 8*y*z + 17*z^2) + 
        x*y^2*(y^3 - 3*y^2*z - 21*y*z^2 - 49*z^3) - 
        2*x^3*(y^3 - 5*y^2*z + 13*y*z^2 + 3*z^3) + 
        x^2*y*(-5*y^3 + 12*y^2*z + 21*y*z^2 + 44*z^3)))/
      (384*Pi^2*(x - y)^3*(x - z)*(y - z)^4) + 
     ((q*x^4)/(64*Pi^2*(x - y)^4*(x - z)^2) + 
       x^3/(48*Pi^2*(x - y)^3*(x - z)))*Log[x] + 
     (-((y*(x*y*(y - 3*z)*z + y^2*z^2 + x^2*(y^2 - 3*y*z + 3*z^2)))/
         (48*Pi^2*(x - y)^3*(y - z)^3)) - 
       (q*y*(-4*x^3*z^3 + y^3*z^2*(3*y + z) + 2*x*y^2*z*(y^2 - 5*y*z - 
            2*z^2) + x^2*y*(y^3 - 5*y^2*z + 10*y*z^2 + 6*z^3)))/
        (64*Pi^2*(x - y)^4*(y - z)^5))*Log[y] + 
     (-(z^3/(48*Pi^2*(x - z)*(-y + z)^3)) - (q*z^3*(-4*x*y + z*(3*y + z)))/
        (64*Pi^2*(x - z)^2*(-y + z)^5))*Log[z])
C11funcz12[q_, x_, y_, z_] := DirectedInfinity[6*q - 8*z]/Sign[z]^2
C11funcz23[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/Sign[x]]
C11funcz13[q_, x_, y_, z_] := (q - 4*y)/(24*y^2)
C11funcz1d[q_, x_, \[Epsilon]_] := (9*q - 80*x)/(720*x^2) + 
    ((-3*q + 10*x)*\[Epsilon])/(360*x^3) + ((27*q - 56*x)*\[Epsilon]^2)/
     (5040*x^4) + ((-9*q + 14*x)*\[Epsilon]^3)/(2520*x^5) + 
    ((25*q - 32*x)*\[Epsilon]^4)/(10080*x^6)
C11funcz2d[q_, x_, \[Epsilon]_] := (3*q - 8*x)/(24*x^2) + 
    ((-q + x)*\[Epsilon])/(6*x^3) + ((27*q - 16*x)*\[Epsilon]^2)/(144*x^4) + 
    ((-12*q + 5*x)*\[Epsilon]^3)/(60*x^5) + ((25*q - 8*x)*\[Epsilon]^4)/
     (120*x^6)
C11funcz3d[q_, x_, \[Epsilon]_] := (3*q - 16*x)/(144*x^2) + 
    ((-2*q + 5*x)*\[Epsilon])/(60*x^3) + ((5*q - 8*x)*\[Epsilon]^2)/
     (120*x^4) + ((-6*q + 7*x)*\[Epsilon]^3)/(126*x^5) + 
    ((35*q - 32*x)*\[Epsilon]^4)/(672*x^6)
C11funcz1[q_, x_, y_, z_] := 
   ((y - z)*(-4*(y - 3*z)*(y - z)^2 + q*(y^2 - 8*y*z - 17*z^2)) + 
     2*z^2*(-4*(y - z)^2 + 3*q*(3*y + z))*Log[y] + 
     2*z^2*(4*(y - z)^2 - 3*q*(3*y + z))*Log[z])/(24*(y - z)^5)
C11funcz2[q_, x_, y_, z_] := (3*q*(x - z) + z*(-3*q - 4*x + 4*z)*Log[x] + 
     (3*q + 4*x - 4*z)*z*Log[z])/(12*(x - z)^2*z)
C11funcz3[q_, x_, y_, z_] := 
   ((x - y)*(q*(2*x^2 + 5*x*y - y^2) + 4*y*(3*x^2 - 4*x*y + y^2)) - 
     2*x^2*(3*q + 4*x - 4*y)*y*Log[x] + 2*x^2*(3*q + 4*x - 4*y)*y*Log[y])/
    (24*(x - y)^4*y)
C11funcd123[q_, x_, \[Delta]1_, \[Delta]2_] := 
   (42*q*x^4 - 420*x^5 - 48*q*x^3*\[Delta]1 + 252*x^4*\[Delta]1 + 
      45*q*x^2*\[Delta]1^2 - 168*x^3*\[Delta]1^2 - 40*q*x*\[Delta]1^3 + 
      120*x^2*\[Delta]1^3 + 35*q*\[Delta]1^4 - 90*x*\[Delta]1^4)/(5040*x^6) + 
    ((-132*q*x^4 + 462*x^5 + 198*q*x^3*\[Delta]1 - 462*x^4*\[Delta]1 - 
       220*q*x^2*\[Delta]1^2 + 396*x^3*\[Delta]1^2 + 220*q*x*\[Delta]1^3 - 
       330*x^2*\[Delta]1^3 - 210*q*\[Delta]1^4 + 275*x*\[Delta]1^4)*
      \[Delta]2)/(27720*x^7) + 
    ((891*q*x^4 - 1848*x^5 - 1584*q*x^3*\[Delta]1 + 2376*x^4*\[Delta]1 + 
       1980*q*x^2*\[Delta]1^2 - 2376*x^3*\[Delta]1^2 - 2160*q*x*\[Delta]1^3 + 
       2200*x^2*\[Delta]1^3 + 2205*q*\[Delta]1^4 - 1980*x*\[Delta]1^4)*
      \[Delta]2^2)/(332640*x^8) + 
    ((-572*q*x^4 + 858*x^5 + 1144*q*x^3*\[Delta]1 - 1287*x^4*\[Delta]1 - 
       1560*q*x^2*\[Delta]1^2 + 1430*x^3*\[Delta]1^2 + 1820*q*x*\[Delta]1^3 - 
       1430*x^2*\[Delta]1^3 - 1960*q*\[Delta]1^4 + 1365*x*\[Delta]1^4)*
      \[Delta]2^3)/(360360*x^9) + 
    ((715*q*x^4 - 858*x^5 - 1560*q*x^3*\[Delta]1 + 1430*x^4*\[Delta]1 + 
       2275*q*x^2*\[Delta]1^2 - 1716*x^3*\[Delta]1^2 - 2800*q*x*\[Delta]1^3 + 
       1820*x^2*\[Delta]1^3 + 3150*q*\[Delta]1^4 - 1820*x*\[Delta]1^4)*
      \[Delta]2^4)/(720720*x^10)
C11funcd13[q_, x_, y_, \[Epsilon]_] := 
   (3*q*x^4 - 8*x^5 + 44*q*x^3*y + 4*x^4*y - 36*q*x^2*y^2 + 40*x^3*y^2 - 
      12*q*x*y^3 - 64*x^2*y^3 + q*y^4 + 32*x*y^4 - 4*y^5 - 
      24*q*x^3*y*Log[x] + 24*x^4*y*Log[x] - 36*q*x^2*y^2*Log[x] - 
      48*x^3*y^2*Log[x] + 24*x^2*y^3*Log[x] + 24*q*x^3*y*Log[y] - 
      24*x^4*y*Log[y] + 36*q*x^2*y^2*Log[y] + 48*x^3*y^2*Log[y] - 
      24*x^2*y^3*Log[y])/(24*(x - y)^6) - 
    (\[Epsilon]*(q*x^4 - x^5 + 28*q*x^3*y - 7*x^4*y + 26*x^3*y^2 - 
       28*q*x*y^3 - 26*x^2*y^3 - q*y^4 + 7*x*y^4 + y^5 - 12*q*x^3*y*Log[x] + 
       6*x^4*y*Log[x] - 36*q*x^2*y^2*Log[x] - 6*x^3*y^2*Log[x] - 
       12*q*x*y^3*Log[x] - 6*x^2*y^3*Log[x] + 6*x*y^4*Log[x] + 
       12*q*x^3*y*Log[y] - 6*x^4*y*Log[y] + 36*q*x^2*y^2*Log[y] + 
       6*x^3*y^2*Log[y] + 12*q*x*y^3*Log[y] + 6*x^2*y^3*Log[y] - 
       6*x*y^4*Log[y]))/(6*(x - y)^7) - 
    (\[Epsilon]^2*(-27*q*x^4 + 16*x^5 - 1152*q*x^3*y + 256*x^4*y - 
       972*q*x^2*y^2 - 704*x^3*y^2 + 1728*q*x*y^3 + 416*x^2*y^3 + 423*q*y^4 + 
       176*x*y^4 - 160*y^5 + 432*q*x^3*y*Log[x] - 144*x^4*y*Log[x] + 
       1944*q*x^2*y^2*Log[x] + 1296*q*x*y^3*Log[x] + 384*x^2*y^3*Log[x] + 
       108*q*y^4*Log[x] - 192*x*y^4*Log[x] - 48*y^5*Log[x] - 
       432*q*x^3*y*Log[y] + 144*x^4*y*Log[y] - 1944*q*x^2*y^2*Log[y] - 
       1296*q*x*y^3*Log[y] - 384*x^2*y^3*Log[y] - 108*q*y^4*Log[y] + 
       192*x*y^4*Log[y] + 48*y^5*Log[y]))/(144*(x - y)^8) - 
    (\[Epsilon]^3*(12*q*x^5 - 5*x^6 + 700*q*x^4*y - 130*x^5*y + 
       1200*q*x^3*y^2 + 275*x^4*y^2 - 1200*q*x^2*y^3 - 700*q*x*y^4 - 
       275*x^2*y^4 - 12*q*y^5 + 130*x*y^5 + 5*y^6 - 240*q*x^4*y*Log[x] + 
       60*x^5*y*Log[x] - 1440*q*x^3*y^2*Log[x] + 60*x^4*y^2*Log[x] - 
       1440*q*x^2*y^3*Log[x] - 240*x^3*y^3*Log[x] - 240*q*x*y^4*Log[x] + 
       60*x^2*y^4*Log[x] + 60*x*y^5*Log[x] + 240*q*x^4*y*Log[y] - 
       60*x^5*y*Log[y] + 1440*q*x^3*y^2*Log[y] - 60*x^4*y^2*Log[y] + 
       1440*q*x^2*y^3*Log[y] + 240*x^3*y^3*Log[y] + 240*q*x*y^4*Log[y] - 
       60*x^2*y^4*Log[y] - 60*x*y^5*Log[y]))/(60*x*(x - y)^9) - 
    (\[Epsilon]^4*(-25*q*x^6 + 8*x^7 - 1870*q*x^5*y + 294*x^6*y - 
       4875*q*x^4*y^2 - 452*x^5*y^2 + 3000*q*x^3*y^3 - 450*x^4*y^3 + 
       3625*q*x^2*y^4 + 1000*x^3*y^4 + 150*q*x*y^5 - 358*x^2*y^5 - 5*q*y^6 - 
       44*x*y^6 + 2*y^7 + 600*q*x^5*y*Log[x] - 120*x^6*y*Log[x] + 
       4500*q*x^4*y^2*Log[x] - 240*x^5*y^2*Log[x] + 6000*q*x^3*y^3*Log[x] + 
       600*x^4*y^3*Log[x] + 1500*q*x^2*y^4*Log[x] - 240*x^2*y^5*Log[x] - 
       600*q*x^5*y*Log[y] + 120*x^6*y*Log[y] - 4500*q*x^4*y^2*Log[y] + 
       240*x^5*y^2*Log[y] - 6000*q*x^3*y^3*Log[y] - 600*x^4*y^3*Log[y] - 
       1500*q*x^2*y^4*Log[y] + 240*x^2*y^5*Log[y]))/(120*x^2*(x - y)^10)
C11funcd12[q_, x_, z_, \[Epsilon]_] := 
   -(-3*q*x^4 + 16*x^5 + 24*q*x^3*z - 104*x^4*z - 108*q*x^2*z^2 + 
       304*x^3*z^2 - 24*q*x*z^3 - 448*x^2*z^3 + 111*q*z^4 + 320*x*z^4 - 
       88*z^5 + 144*q*x*z^3*Log[x] - 48*x^2*z^3*Log[x] + 36*q*z^4*Log[x] + 
       96*x*z^4*Log[x] - 48*z^5*Log[x] - 144*q*x*z^3*Log[z] + 
       48*x^2*z^3*Log[z] - 36*q*z^4*Log[z] - 96*x*z^4*Log[z] + 48*z^5*Log[z])/
     (144*(x - z)^6) - (\[Epsilon]*(2*q*x^5 - 5*x^6 - 20*q*x^4*z + 40*x^5*z + 
       120*q*x^3*z^2 - 155*x^4*z^2 + 160*q*x^2*z^3 + 260*x^3*z^3 - 
       250*q*x*z^4 - 175*x^2*z^4 - 12*q*z^5 + 20*x*z^5 + 15*z^6 - 
       240*q*x^2*z^3*Log[x] + 60*x^3*z^3*Log[x] - 120*q*x*z^4*Log[x] - 
       120*x^2*z^4*Log[x] + 60*x*z^5*Log[x] + 240*q*x^2*z^3*Log[z] - 
       60*x^3*z^3*Log[z] + 120*q*x*z^4*Log[z] + 120*x^2*z^4*Log[z] - 
       60*x*z^5*Log[z]))/(60*x*(x - z)^7) - 
    (\[Epsilon]^2*(-5*q*x^6 + 8*x^7 + 60*q*x^5*z - 76*x^6*z - 450*q*x^4*z^2 + 
       368*x^5*z^2 - 1200*q*x^3*z^3 - 620*x^4*z^3 + 1425*q*x^2*z^4 + 
       280*x^3*z^4 + 180*q*x*z^5 + 172*x^2*z^5 - 10*q*z^6 - 144*x*z^6 + 
       12*z^7 + 1200*q*x^3*z^3*Log[x] - 240*x^4*z^3*Log[x] + 
       900*q*x^2*z^4*Log[x] + 480*x^3*z^4*Log[x] - 240*x^2*z^5*Log[x] - 
       1200*q*x^3*z^3*Log[z] + 240*x^4*z^3*Log[z] - 900*q*x^2*z^4*Log[z] - 
       480*x^3*z^4*Log[z] + 240*x^2*z^5*Log[z]))/(120*x^2*(x - z)^8) - 
    (\[Epsilon]^3*(6*q*x^7 - 7*x^8 - 84*q*x^6*z + 77*x^7*z + 756*q*x^5*z^2 - 
       448*x^6*z^2 + 3150*q*x^4*z^3 + 693*x^5*z^3 - 3150*q*x^3*z^4 - 
       756*q*x^2*z^5 - 693*x^3*z^5 + 84*q*x*z^6 + 448*x^2*z^6 - 6*q*z^7 - 
       77*x*z^7 + 7*z^8 - 2520*q*x^4*z^3*Log[x] + 420*x^5*z^3*Log[x] - 
       2520*q*x^3*z^4*Log[x] - 840*x^4*z^4*Log[x] + 420*x^3*z^5*Log[x] + 
       2520*q*x^4*z^3*Log[z] - 420*x^5*z^3*Log[z] + 2520*q*x^3*z^4*Log[z] + 
       840*x^4*z^4*Log[z] - 420*x^3*z^5*Log[z]))/(126*x^3*(x - z)^9) - 
    (\[Epsilon]^4*(-35*q*x^8 + 32*x^9 + 560*q*x^7*z - 400*x^8*z - 
       5880*q*x^6*z^2 + 2720*x^7*z^2 - 34104*q*x^5*z^3 - 3528*x^6*z^3 + 
       29400*q*x^4*z^4 - 3024*x^5*z^4 + 11760*q*x^3*z^5 + 8568*x^4*z^5 - 
       1960*q*x^2*z^6 - 5600*x^3*z^6 + 280*q*x*z^7 + 1480*x^2*z^7 - 
       21*q*z^8 - 272*x*z^8 + 24*z^9 + 23520*q*x^5*z^3*Log[x] - 
       3360*x^6*z^3*Log[x] + 29400*q*x^4*z^4*Log[x] + 6720*x^5*z^4*Log[x] - 
       3360*x^4*z^5*Log[x] - 23520*q*x^5*z^3*Log[z] + 3360*x^6*z^3*Log[z] - 
       29400*q*x^4*z^4*Log[z] - 6720*x^5*z^4*Log[z] + 3360*x^4*z^5*Log[z]))/
     (672*x^4*(x - z)^10)
C11funcd23[q_, x_, y_, \[Epsilon]_] := 
   -(-36*q*x^5 - 195*q*x^4*y - 440*x^5*y + 360*q*x^3*y^2 + 1600*x^4*y^2 - 
       180*q*x^2*y^3 - 2240*x^3*y^3 + 60*q*x*y^4 + 1520*x^2*y^4 - 9*q*y^5 - 
       520*x*y^5 + 80*y^6 + 180*q*x^4*y*Log[x] + 240*x^5*y*Log[x] - 
       480*x^4*y^2*Log[x] + 240*x^3*y^3*Log[x] - 180*q*x^4*y*Log[y] - 
       240*x^5*y*Log[y] + 480*x^4*y^2*Log[y] - 240*x^3*y^3*Log[y])/
     (720*(x - y)^6*y) - (\[Epsilon]*(6*q*x^6 - 72*q*x^5*y - 30*x^6*y - 
       105*q*x^4*y^2 - 40*x^5*y^2 + 240*q*x^3*y^3 + 350*x^4*y^3 - 
       90*q*x^2*y^4 - 520*x^3*y^4 + 24*q*x*y^5 + 310*x^2*y^5 - 3*q*y^6 - 
       80*x*y^6 + 10*y^7 + 180*q*x^4*y^2*Log[x] + 120*x^5*y^2*Log[x] - 
       240*x^4*y^3*Log[x] + 120*x^3*y^4*Log[x] - 180*q*x^4*y^2*Log[y] - 
       120*x^5*y^2*Log[y] + 240*x^4*y^3*Log[y] - 120*x^3*y^4*Log[y]))/
     (360*(x - y)^7*y^2) - (\[Epsilon]^2*(-36*q*x^7 + 378*q*x^6*y + 
       84*x^7*y - 2268*q*x^5*y^2 - 1008*x^6*y^2 - 945*q*x^4*y^3 + 
       1204*x^5*y^3 + 3780*q*x^3*y^4 + 1960*x^4*y^4 - 1134*q*x^2*y^5 - 
       4340*x^3*y^5 + 252*q*x*y^6 + 2576*x^2*y^6 - 27*q*y^7 - 532*x*y^7 + 
       56*y^8 + 3780*q*x^4*y^3*Log[x] + 1680*x^5*y^3*Log[x] - 
       3360*x^4*y^4*Log[x] + 1680*x^3*y^5*Log[x] - 3780*q*x^4*y^3*Log[y] - 
       1680*x^5*y^3*Log[y] + 3360*x^4*y^4*Log[y] - 1680*x^3*y^5*Log[y]))/
     (5040*(x - y)^8*y^3) - (\[Epsilon]^3*(9*q*x^8 - 96*q*x^7*y - 14*x^8*y + 
       504*q*x^6*y^2 + 154*x^7*y^2 - 2016*q*x^5*y^3 - 896*x^6*y^3 + 
       1386*x^5*y^4 + 2016*q*x^3*y^5 - 504*q*x^2*y^6 - 1386*x^3*y^6 + 
       96*q*x*y^7 + 896*x^2*y^7 - 9*q*y^8 - 154*x*y^8 + 14*y^9 + 
       2520*q*x^4*y^4*Log[x] + 840*x^5*y^4*Log[x] - 1680*x^4*y^5*Log[x] + 
       840*x^3*y^6*Log[x] - 2520*q*x^4*y^4*Log[y] - 840*x^5*y^4*Log[y] + 
       1680*x^4*y^5*Log[y] - 840*x^3*y^6*Log[y]))/(2520*(x - y)^9*y^4) - 
    (\[Epsilon]^4*(-20*q*x^9 + 225*q*x^8*y + 24*x^9*y - 1200*q*x^7*y^2 - 
       272*x^8*y^2 + 4200*q*x^6*y^3 + 1480*x^7*y^3 - 12600*q*x^5*y^4 - 
       5600*x^6*y^4 + 2520*q*x^4*y^5 + 8568*x^5*y^5 + 8400*q*x^3*y^6 - 
       3024*x^4*y^6 - 1800*q*x^2*y^7 - 3528*x^3*y^7 + 300*q*x*y^8 + 
       2720*x^2*y^8 - 25*q*y^9 - 400*x*y^9 + 32*y^10 + 
       12600*q*x^4*y^5*Log[x] + 3360*x^5*y^5*Log[x] - 6720*x^4*y^6*Log[x] + 
       3360*x^3*y^7*Log[x] - 12600*q*x^4*y^5*Log[y] - 3360*x^5*y^5*Log[y] + 
       6720*x^4*y^6*Log[y] - 3360*x^3*y^7*Log[y]))/(10080*(x - y)^10*y^5)
C11func0Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[C11funcz1d[0, y, z - y]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[C11funcz2d[0, x, z - x]], z == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[C11funcz3d[0, x, y - x]], x == 0, 
      Evaluate[C11funcz1[0, x, y, z]], y == 0, 
      Evaluate[C11funcz2[0, x, y, z]], z == 0, 
      Evaluate[C11funcz3[0, x, y, z]], Abs[\[Epsilon]23/S23] + 
        Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < d3comp, 
      Evaluate[C11funcd123[0, x, y - x, z - x]], Abs[\[Epsilon]23/S23] < 
       d2comp, Evaluate[C11funcd23[0, x, y, z - y]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[C11funcd13[0, x, y, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[C11funcd12[0, x, z, y - x]], 
      True, Evaluate[C11funcbase[0, x, y, z]]]]]
C11func1Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[Coefficient[C11funcz1d[qsq, y, z - y], qsq]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[Coefficient[C11funcz2d[qsq, x, z - x], qsq]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[Coefficient[C11funcz3d[qsq, x, y - x], qsq]], x == 0, 
      Evaluate[Coefficient[C11funcz1[qsq, x, y, z], qsq]], y == 0, 
      Evaluate[Coefficient[C11funcz2[qsq, x, y, z], qsq]], z == 0, 
      Evaluate[Coefficient[C11funcz3[qsq, x, y, z], qsq]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[Coefficient[C11funcd123[0, x, y - x, z - x], qsq]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[Coefficient[
        C11funcd23[qsq, x, y, z - y], qsq]], Abs[\[Epsilon]13/S13] < d2comp, 
      Evaluate[Coefficient[C11funcd13[qsq, x, y, z - x], qsq]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[Coefficient[
        C11funcd12[qsq, x, z, y - x], qsq]], True, 
      Evaluate[Coefficient[C11funcbase[qsq, x, y, z], qsq]]]]]
C12funcbase[q_, x_, y_, z_] := 
   -16*Pi^2*((y*z*(y + z) - x*(y^2 + z^2))/(96*Pi^2*(x - y)*(x - z)*
       (y - z)^2) - (q*(x^3*(y^2 + 10*y*z + z^2) + 
        y*z*(y^3 - 7*y^2*z - 7*y*z^2 + z^3) - 
        2*x^2*(y^3 + 8*y^2*z + 8*y*z^2 + z^3) + 
        x*(y^4 + 3*y^3*z + 28*y^2*z^2 + 3*y*z^3 + z^4)))/
      (192*Pi^2*(x - y)^2*y*(x - z)^2*(y - z)^4*z) + 
     (-((q*x)/(96*Pi^2*(x - y)^3*(x - z)^3)) + 
       x^3/(96*Pi^2*(x - y)^2*(x - z)^2))*Log[x] + 
     (-((y^2*(x*(y - 3*z) + 2*y*z))/(96*Pi^2*(x - y)^2*(y - z)^3)) + 
       (q*(6*y^3 + 3*x^2*(y + z) + x*(-8*y^2 - 5*y*z + z^2)))/
        (96*Pi^2*(x - y)^3*(y - z)^5))*Log[y] + 
     (-((z^2*(2*y*z + x*(-3*y + z)))/(96*Pi^2*(x - z)^2*(-y + z)^3)) + 
       (q*(6*z^3 + 3*x^2*(y + z) + x*(y^2 - 5*y*z - 8*z^2)))/
        (96*Pi^2*(x - z)^3*(-y + z)^5))*Log[z])
C12funcz12[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/Sign[z]]/z^2
C12funcz23[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/Sign[x]]
C12funcz13[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/Sign[y]]/y^2
C12funcz1d[q_, x_, \[Epsilon]_] := (3*q - 5*x^4)/(90*x^5) + 
    ((-3*q + x^4)*\[Epsilon])/(36*x^6) + ((60*q - 7*x^4)*\[Epsilon]^2)/
     (420*x^7) + ((-75*q + 4*x^4)*\[Epsilon]^3)/(360*x^8) + 
    ((35*q - x^4)*\[Epsilon]^4)/(126*x^9)
C12funcz2d[q_, x_, \[Epsilon]_] := DirectedInfinity[
    Sign[q]/(Sign[x]*Sign[x + \[Epsilon]]^3)]
C12funcz3d[q_, x_, \[Epsilon]_] := DirectedInfinity[
    Sign[q]/(Sign[x]*Sign[x + \[Epsilon]]^3)]
C12funcz1[q_, x_, y_, z_] := 
   ((y^2 - z^2)*(-2*y^2*(y - z)^2*z^2 + q*(y^2 - 8*y*z + z^2)) + 
     4*y^2*z^2*(3*q + y*(y - z)^2*z)*Log[y] - 4*y^2*z^2*(3*q + y*(y - z)^2*z)*
      Log[z])/(12*y^2*(y - z)^5*z^2)
C12funcz2[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/(Sign[x]*Sign[z]^3)]
C12funcz3[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/(Sign[x]*Sign[y]^3)]
C12funcd123[q_, x_, \[Delta]1_, \[Delta]2_] := 
   (84*q*x^4 - 630*x^8 - 180*q*x^3*\[Delta]1 + 252*x^7*\[Delta]1 + 
      270*q*x^2*\[Delta]1^2 - 126*x^6*\[Delta]1^2 - 350*q*x*\[Delta]1^3 + 
      72*x^5*\[Delta]1^3 + 420*q*\[Delta]1^4 - 45*x^4*\[Delta]1^4)/
     (15120*x^9) + ((-1980*q*x^4 + 2772*x^8 + 4455*q*x^3*\[Delta]1 - 
       1848*x^7*\[Delta]1 - 6930*q*x^2*\[Delta]1^2 + 1188*x^6*\[Delta]1^2 + 
       9240*q*x*\[Delta]1^3 - 792*x^5*\[Delta]1^3 - 11340*q*\[Delta]1^4 + 
       550*x^4*\[Delta]1^4)*\[Delta]2)/(166320*x^10) + 
    ((990*q*x^4 - 462*x^8 - 2310*q*x^3*\[Delta]1 + 396*x^7*\[Delta]1 + 
       3696*q*x^2*\[Delta]1^2 - 297*x^6*\[Delta]1^2 - 5040*q*x*\[Delta]1^3 + 
       220*x^5*\[Delta]1^3 + 6300*q*\[Delta]1^4 - 165*x^4*\[Delta]1^4)*
      \[Delta]2^2)/(55440*x^11) + 
    ((-25025*q*x^4 + 5148*x^8 + 60060*q*x^3*\[Delta]1 - 5148*x^7*\[Delta]1 - 
       98280*q*x^2*\[Delta]1^2 + 4290*x^6*\[Delta]1^2 + 
       136500*q*x*\[Delta]1^3 - 3432*x^5*\[Delta]1^3 - 173250*q*\[Delta]1^4 + 
       2730*x^4*\[Delta]1^4)*\[Delta]2^3)/(1081080*x^12) + 
    ((12012*q*x^4 - 1287*x^8 - 29484*q*x^3*\[Delta]1 + 1430*x^7*\[Delta]1 + 
       49140*q*x^2*\[Delta]1^2 - 1287*x^6*\[Delta]1^2 - 
       69300*q*x*\[Delta]1^3 + 1092*x^5*\[Delta]1^3 + 89100*q*\[Delta]1^4 - 
       910*x^4*\[Delta]1^4)*\[Delta]2^4)/(432432*x^13)
C12funcd13[q_, x_, y_, \[Epsilon]_] := 
   -(\[Epsilon]*(18*q*x^5 + 375*q*x^4*y - 4*x^8*y - 240*q*x^3*y^2 + 
        44*x^7*y^2 - 180*q*x^2*y^3 - 40*x^6*y^3 + 30*q*x*y^4 - 104*x^5*y^4 - 
        3*q*y^5 + 172*x^4*y^5 - 68*x^3*y^6 - 180*q*x^4*y*Log[x] - 
        360*q*x^3*y^2*Log[x] - 72*x^6*y^3*Log[x] + 120*x^5*y^4*Log[x] - 
        24*x^4*y^5*Log[x] - 24*x^3*y^6*Log[x] + 180*q*x^4*y*Log[y] + 
        360*q*x^3*y^2*Log[y] + 72*x^6*y^3*Log[y] - 120*x^5*y^4*Log[y] + 
        24*x^4*y^5*Log[y] + 24*x^3*y^6*Log[y]))/(72*x^3*(x - y)^7*y) - 
    (\[Epsilon]^2*(-60*q*x^6 - 1644*q*x^5*y + 5*x^9*y + 750*q*x^4*y^2 - 
       70*x^8*y^2 + 1200*q*x^3*y^3 - 55*x^7*y^3 - 300*q*x^2*y^4 + 
       520*x^6*y^4 + 60*q*x*y^5 - 605*x^5*y^5 - 6*q*y^6 + 190*x^4*y^6 + 
       15*x^3*y^7 + 720*q*x^5*y*Log[x] + 1800*q*x^4*y^2*Log[x] + 
       180*x^7*y^3*Log[x] - 240*x^6*y^4*Log[x] - 60*x^5*y^5*Log[x] + 
       120*x^4*y^6*Log[x] - 720*q*x^5*y*Log[y] - 1800*q*x^4*y^2*Log[y] - 
       180*x^7*y^3*Log[y] + 240*x^6*y^4*Log[y] + 60*x^5*y^5*Log[y] - 
       120*x^4*y^6*Log[y]))/(120*x^4*(x - y)^8*y) - 
    (\[Epsilon]^3*(150*q*x^7 + 5145*q*x^6*y - 6*x^10*y - 1365*q*x^5*y^2 + 
       102*x^9*y^2 - 5250*q*x^4*y^3 + 294*x^8*y^3 + 1750*q*x^3*y^4 - 
       1350*x^7*y^4 - 525*q*x^2*y^5 + 1350*x^6*y^5 + 105*q*x*y^6 - 
       294*x^5*y^6 - 10*q*y^7 - 102*x^4*y^7 + 6*x^3*y^8 - 
       2100*q*x^6*y*Log[x] - 6300*q*x^5*y^2*Log[x] - 360*x^8*y^3*Log[x] + 
       360*x^7*y^4*Log[x] + 360*x^6*y^5*Log[x] - 360*x^5*y^6*Log[x] + 
       2100*q*x^6*y*Log[y] + 6300*q*x^5*y^2*Log[y] + 360*x^8*y^3*Log[y] - 
       360*x^7*y^4*Log[y] - 360*x^6*y^5*Log[y] + 360*x^5*y^6*Log[y]))/
     (180*x^5*(x - y)^9*y) - (\[Epsilon]^4*(-630*q*x^8 - 26136*q*x^7*y + 
       14*x^11*y + 1764*q*x^6*y^2 - 280*x^10*y^2 + 35280*q*x^5*y^3 - 
       1477*x^9*y^3 - 14700*q*x^4*y^4 + 5418*x^8*y^4 + 5880*q*x^3*y^5 - 
       4725*x^7*y^5 - 1764*q*x^2*y^6 + 336*x^6*y^6 + 336*q*x*y^7 + 
       805*x^5*y^7 - 30*q*y^8 - 98*x^4*y^8 + 7*x^3*y^9 + 
       10080*q*x^7*y*Log[x] + 35280*q*x^6*y^2*Log[x] + 1260*x^9*y^3*Log[x] - 
       840*x^8*y^4*Log[x] - 2100*x^7*y^5*Log[x] + 1680*x^6*y^6*Log[x] - 
       10080*q*x^7*y*Log[y] - 35280*q*x^6*y^2*Log[y] - 1260*x^9*y^3*Log[y] + 
       840*x^8*y^4*Log[y] + 2100*x^7*y^5*Log[y] - 1680*x^6*y^6*Log[y]))/
     (504*x^6*(x - y)^10*y) - 16*Pi^2*(-q/(288*Pi^2*x^2*(x - y)^3) + 
      x/(192*Pi^2*(x - y)^2) + (-2*x*y - y^2)/(96*Pi^2*(x - y)^3) - 
      (q*(x^3 + 15*x^2*y + 5*x*y^2 - y^3))/(192*Pi^2*x^2*(x - y)^5*y) + 
      ((x*y^2)/(32*Pi^2*(x - y)^4) + (q*(2*x + 3*y))/(48*Pi^2*(x - y)^6))*
       Log[x] + (-(x*y^2)/(32*Pi^2*(x - y)^4) - (q*(2*x + 3*y))/
         (48*Pi^2*(x - y)^6))*Log[y])
C12funcd12[q_, x_, z_, \[Epsilon]_] := 
   -(\[Epsilon]*(18*q*x^5 + 375*q*x^4*z - 4*x^8*z - 240*q*x^3*z^2 + 
        44*x^7*z^2 - 180*q*x^2*z^3 - 40*x^6*z^3 + 30*q*x*z^4 - 104*x^5*z^4 - 
        3*q*z^5 + 172*x^4*z^5 - 68*x^3*z^6 - 180*q*x^4*z*Log[x] - 
        360*q*x^3*z^2*Log[x] - 72*x^6*z^3*Log[x] + 120*x^5*z^4*Log[x] - 
        24*x^4*z^5*Log[x] - 24*x^3*z^6*Log[x] + 180*q*x^4*z*Log[z] + 
        360*q*x^3*z^2*Log[z] + 72*x^6*z^3*Log[z] - 120*x^5*z^4*Log[z] + 
        24*x^4*z^5*Log[z] + 24*x^3*z^6*Log[z]))/(72*x^3*(x - z)^7*z) - 
    (\[Epsilon]^2*(-60*q*x^6 - 1644*q*x^5*z + 5*x^9*z + 750*q*x^4*z^2 - 
       70*x^8*z^2 + 1200*q*x^3*z^3 - 55*x^7*z^3 - 300*q*x^2*z^4 + 
       520*x^6*z^4 + 60*q*x*z^5 - 605*x^5*z^5 - 6*q*z^6 + 190*x^4*z^6 + 
       15*x^3*z^7 + 720*q*x^5*z*Log[x] + 1800*q*x^4*z^2*Log[x] + 
       180*x^7*z^3*Log[x] - 240*x^6*z^4*Log[x] - 60*x^5*z^5*Log[x] + 
       120*x^4*z^6*Log[x] - 720*q*x^5*z*Log[z] - 1800*q*x^4*z^2*Log[z] - 
       180*x^7*z^3*Log[z] + 240*x^6*z^4*Log[z] + 60*x^5*z^5*Log[z] - 
       120*x^4*z^6*Log[z]))/(120*x^4*(x - z)^8*z) - 
    (\[Epsilon]^3*(150*q*x^7 + 5145*q*x^6*z - 6*x^10*z - 1365*q*x^5*z^2 + 
       102*x^9*z^2 - 5250*q*x^4*z^3 + 294*x^8*z^3 + 1750*q*x^3*z^4 - 
       1350*x^7*z^4 - 525*q*x^2*z^5 + 1350*x^6*z^5 + 105*q*x*z^6 - 
       294*x^5*z^6 - 10*q*z^7 - 102*x^4*z^7 + 6*x^3*z^8 - 
       2100*q*x^6*z*Log[x] - 6300*q*x^5*z^2*Log[x] - 360*x^8*z^3*Log[x] + 
       360*x^7*z^4*Log[x] + 360*x^6*z^5*Log[x] - 360*x^5*z^6*Log[x] + 
       2100*q*x^6*z*Log[z] + 6300*q*x^5*z^2*Log[z] + 360*x^8*z^3*Log[z] - 
       360*x^7*z^4*Log[z] - 360*x^6*z^5*Log[z] + 360*x^5*z^6*Log[z]))/
     (180*x^5*(x - z)^9*z) - (\[Epsilon]^4*(-630*q*x^8 - 26136*q*x^7*z + 
       14*x^11*z + 1764*q*x^6*z^2 - 280*x^10*z^2 + 35280*q*x^5*z^3 - 
       1477*x^9*z^3 - 14700*q*x^4*z^4 + 5418*x^8*z^4 + 5880*q*x^3*z^5 - 
       4725*x^7*z^5 - 1764*q*x^2*z^6 + 336*x^6*z^6 + 336*q*x*z^7 + 
       805*x^5*z^7 - 30*q*z^8 - 98*x^4*z^8 + 7*x^3*z^9 + 
       10080*q*x^7*z*Log[x] + 35280*q*x^6*z^2*Log[x] + 1260*x^9*z^3*Log[x] - 
       840*x^8*z^4*Log[x] - 2100*x^7*z^5*Log[x] + 1680*x^6*z^6*Log[x] - 
       10080*q*x^7*z*Log[z] - 35280*q*x^6*z^2*Log[z] - 1260*x^9*z^3*Log[z] + 
       840*x^8*z^4*Log[z] + 2100*x^7*z^5*Log[z] - 1680*x^6*z^6*Log[z]))/
     (504*x^6*(x - z)^10*z) - 16*Pi^2*(-q/(288*Pi^2*x^2*(x - z)^3) + 
      x/(192*Pi^2*(x - z)^2) + (-2*x*z - z^2)/(96*Pi^2*(x - z)^3) - 
      (q*(x^3 + 15*x^2*z + 5*x*z^2 - z^3))/(192*Pi^2*x^2*(x - z)^5*z) + 
      ((x*z^2)/(32*Pi^2*(x - z)^4) + (q*(2*x + 3*z))/(48*Pi^2*(x - z)^6))*
       Log[x] + (-(x*z^2)/(32*Pi^2*(x - z)^4) - (q*(2*x + 3*z))/
         (48*Pi^2*(x - z)^6))*Log[z])
C12funcd23[q_, x_, y_, \[Epsilon]_] := 
   -(-3*q*x^5 + 20*q*x^4*y - 60*q*x^3*y^2 + 120*q*x^2*y^3 - 65*q*x*y^4 - 
       110*x^5*y^4 - 12*q*y^5 + 400*x^4*y^5 - 560*x^3*y^6 + 380*x^2*y^7 - 
       130*x*y^8 + 20*y^9 - 60*q*x*y^4*Log[x] + 60*x^5*y^4*Log[x] - 
       120*x^4*y^5*Log[x] + 60*x^3*y^6*Log[x] + 60*q*x*y^4*Log[y] - 
       60*x^5*y^4*Log[y] + 120*x^4*y^5*Log[y] - 60*x^3*y^6*Log[y])/
     (360*(x - y)^6*y^4) - (\[Epsilon]*(6*q*x^6 - 45*q*x^5*y + 
       150*q*x^4*y^2 - 300*q*x^3*y^3 + 450*q*x^2*y^4 - 30*x^6*y^4 - 
       231*q*x*y^5 - 40*x^5*y^5 - 30*q*y^6 + 350*x^4*y^6 - 520*x^3*y^7 + 
       310*x^2*y^8 - 80*x*y^9 + 10*y^10 - 180*q*x*y^5*Log[x] + 
       120*x^5*y^5*Log[x] - 240*x^4*y^6*Log[x] + 120*x^3*y^7*Log[x] + 
       180*q*x*y^5*Log[y] - 120*x^5*y^5*Log[y] + 240*x^4*y^6*Log[y] - 
       120*x^3*y^7*Log[y]))/(360*(x - y)^7*y^5) - 
    (\[Epsilon]^2*(-20*q*x^7 + 168*q*x^6*y - 630*q*x^5*y^2 + 1400*q*x^4*y^3 - 
       2100*q*x^3*y^4 + 21*x^7*y^4 + 2520*q*x^2*y^5 - 252*x^6*y^5 - 
       1218*q*x*y^6 + 301*x^5*y^6 - 120*q*y^7 + 490*x^4*y^7 - 1085*x^3*y^8 + 
       644*x^2*y^9 - 133*x*y^10 + 14*y^11 - 840*q*x*y^6*Log[x] + 
       420*x^5*y^6*Log[x] - 840*x^4*y^7*Log[x] + 420*x^3*y^8*Log[x] + 
       840*q*x*y^6*Log[y] - 420*x^5*y^6*Log[y] + 840*x^4*y^7*Log[y] - 
       420*x^3*y^8*Log[y]))/(840*(x - y)^8*y^6) - 
    (\[Epsilon]^3*(75*q*x^8 - 700*q*x^7*y + 2940*q*x^6*y^2 - 7350*q*x^5*y^3 + 
       12250*q*x^4*y^4 - 28*x^8*y^4 - 14700*q*x^3*y^5 + 308*x^7*y^5 + 
       14700*q*x^2*y^6 - 1792*x^6*y^6 - 6690*q*x*y^7 + 2772*x^5*y^7 - 
       525*q*y^8 - 2772*x^3*y^9 + 1792*x^2*y^10 - 308*x*y^11 + 28*y^12 - 
       4200*q*x*y^7*Log[x] + 1680*x^5*y^7*Log[x] - 3360*x^4*y^8*Log[x] + 
       1680*x^3*y^9*Log[x] + 4200*q*x*y^7*Log[y] - 1680*x^5*y^7*Log[y] + 
       3360*x^4*y^8*Log[y] - 1680*x^3*y^9*Log[y]))/(2520*(x - y)^9*y^7) - 
    (\[Epsilon]^4*(-35*q*x^9 + 360*q*x^8*y - 1680*q*x^7*y^2 + 
       4704*q*x^6*y^3 - 8820*q*x^5*y^4 + 6*x^9*y^4 + 11760*q*x^4*y^5 - 
       68*x^8*y^5 - 11760*q*x^3*y^6 + 370*x^7*y^6 + 10080*q*x^2*y^7 - 
       1400*x^6*y^7 - 4329*q*x*y^8 + 2142*x^5*y^8 - 280*q*y^9 - 756*x^4*y^9 - 
       882*x^3*y^10 + 680*x^2*y^11 - 100*x*y^12 + 8*y^13 - 
       2520*q*x*y^8*Log[x] + 840*x^5*y^8*Log[x] - 1680*x^4*y^9*Log[x] + 
       840*x^3*y^10*Log[x] + 2520*q*x*y^8*Log[y] - 840*x^5*y^8*Log[y] + 
       1680*x^4*y^9*Log[y] - 840*x^3*y^10*Log[y]))/(1008*(x - y)^10*y^8)
C12func0Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[C12funcz1d[0, y, z - y]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[C12funcz2d[0, x, z - x]], z == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[C12funcz3d[0, x, y - x]], x == 0, 
      Evaluate[C12funcz1[0, x, y, z]], y == 0, 
      Evaluate[C12funcz2[0, x, y, z]], z == 0, 
      Evaluate[C12funcz3[0, x, y, z]], Abs[\[Epsilon]23/S23] + 
        Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < d3comp, 
      Evaluate[C12funcd123[0, x, y - x, z - x]], Abs[\[Epsilon]23/S23] < 
       d2comp, Evaluate[C12funcd23[0, x, y, z - y]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[C12funcd13[0, x, y, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[C12funcd12[0, x, z, y - x]], 
      True, Evaluate[C12funcbase[0, x, y, z]]]]]
C12func1Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[Coefficient[C12funcz1d[qsq, y, z - y], qsq]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[Coefficient[C12funcz2d[qsq, x, z - x], qsq]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[Coefficient[C12funcz3d[qsq, x, y - x], qsq]], x == 0, 
      Evaluate[Coefficient[C12funcz1[qsq, x, y, z], qsq]], y == 0, 
      Evaluate[Coefficient[C12funcz2[qsq, x, y, z], qsq]], z == 0, 
      Evaluate[Coefficient[C12funcz3[qsq, x, y, z], qsq]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[Coefficient[C12funcd123[0, x, y - x, z - x], qsq]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[Coefficient[
        C12funcd23[qsq, x, y, z - y], qsq]], Abs[\[Epsilon]13/S13] < d2comp, 
      Evaluate[Coefficient[C12funcd13[qsq, x, y, z - x], qsq]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[Coefficient[
        C12funcd12[qsq, x, z, y - x], qsq]], True, 
      Evaluate[Coefficient[C12funcbase[qsq, x, y, z], qsq]]]]]
C22funcbase[q_, x_, y_, z_] := 
   -16*Pi^2*((z*(5*x*y - 3*x*z - 3*y*z + z^2))/(96*Pi^2*(x - z)^2*
       (y - z)^2) + (q*(y*z^3*(17*y^2 + 8*y*z - z^2) + 
        x^2*z*(44*y^3 + 21*y^2*z + 12*y*z^2 - 5*z^3) - 
        2*x^3*(3*y^3 + 13*y^2*z - 5*y*z^2 + z^3) + 
        x*z^2*(-49*y^3 - 21*y^2*z - 3*y*z^2 + z^3)))/
      (384*Pi^2*(x - y)*(x - z)^3*(y - z)^4) + 
     ((q*x^4)/(64*Pi^2*(x - y)^2*(x - z)^4) + 
       x^3/(48*Pi^2*(x - y)*(x - z)^3))*Log[x] + 
     (-(y^3/(48*Pi^2*(x - y)*(y - z)^3)) - (q*y^3*(y^2 - 4*x*z + 3*y*z))/
        (64*Pi^2*(x - y)^2*(y - z)^5))*Log[y] + 
     (-((z*(y^2*z^2 + x*y*z*(-3*y + z) + x^2*(3*y^2 - 3*y*z + z^2)))/
         (48*Pi^2*(x - z)^3*(-y + z)^3)) - 
       (q*z*(-4*x^3*y^3 + y^2*z^3*(y + 3*z) - 2*x*y*z^2*(2*y^2 + 5*y*z - 
            z^2) + x^2*z*(6*y^3 + 10*y^2*z - 5*y*z^2 + z^3)))/
        (64*Pi^2*(x - z)^4*(-y + z)^5))*Log[z])
C22funcz12[q_, x_, y_, z_] := (q - 4*z)/(24*z^2)
C22funcz23[q_, x_, y_, z_] := DirectedInfinity[Sign[q]/Sign[x]]
C22funcz13[q_, x_, y_, z_] := DirectedInfinity[6*q - 8*y]/Sign[y]^2
C22funcz1d[q_, x_, \[Epsilon]_] := (9*q - 80*x)/(720*x^2) + 
    ((-q + 5*x)*\[Epsilon])/(60*x^3) + ((15*q - 56*x)*\[Epsilon]^2)/
     (840*x^4) + ((-9*q + 28*x)*\[Epsilon]^3)/(504*x^5) + 
    ((35*q - 96*x)*\[Epsilon]^4)/(2016*x^6)
C22funcz2d[q_, x_, \[Epsilon]_] := (3*q - 16*x)/(144*x^2) + 
    ((-2*q + 5*x)*\[Epsilon])/(60*x^3) + ((5*q - 8*x)*\[Epsilon]^2)/
     (120*x^4) + ((-6*q + 7*x)*\[Epsilon]^3)/(126*x^5) + 
    ((35*q - 32*x)*\[Epsilon]^4)/(672*x^6)
C22funcz3d[q_, x_, \[Epsilon]_] := (3*q - 8*x)/(24*x^2) + 
    ((-q + x)*\[Epsilon])/(6*x^3) + ((27*q - 16*x)*\[Epsilon]^2)/(144*x^4) + 
    ((-12*q + 5*x)*\[Epsilon]^3)/(60*x^5) + ((25*q - 8*x)*\[Epsilon]^4)/
     (120*x^6)
C22funcz1[q_, x_, y_, z_] := 
   ((y - z)*(4*(y - z)^2*(3*y - z) + q*(-17*y^2 - 8*y*z + z^2)) + 
     2*y^2*(-4*(y - z)^2 + 3*q*(y + 3*z))*Log[y] + 
     2*y^2*(4*(y - z)^2 - 3*q*(y + 3*z))*Log[z])/(24*(y - z)^5)
C22funcz2[q_, x_, y_, z_] := 
   ((x - z)*(q*(2*x^2 + 5*x*z - z^2) + 4*z*(3*x^2 - 4*x*z + z^2)) - 
     2*x^2*(3*q + 4*x - 4*z)*z*Log[x] + 2*x^2*(3*q + 4*x - 4*z)*z*Log[z])/
    (24*(x - z)^4*z)
C22funcz3[q_, x_, y_, z_] := (3*q*(x - y) + y*(-3*q - 4*x + 4*y)*Log[x] + 
     (3*q + 4*x - 4*y)*y*Log[y])/(12*(x - y)^2*y)
C22funcd123[q_, x_, \[Delta]1_, \[Delta]2_] := 
   (84*q*x^4 - 840*x^5 - 48*q*x^3*\[Delta]1 + 168*x^4*\[Delta]1 + 
      27*q*x^2*\[Delta]1^2 - 56*x^3*\[Delta]1^2 - 16*q*x*\[Delta]1^3 + 
      24*x^2*\[Delta]1^3 + 10*q*\[Delta]1^4 - 12*x*\[Delta]1^4)/(10080*x^6) + 
    ((-264*q*x^4 + 1386*x^5 + 198*q*x^3*\[Delta]1 - 462*x^4*\[Delta]1 - 
       132*q*x^2*\[Delta]1^2 + 198*x^3*\[Delta]1^2 + 88*q*x*\[Delta]1^3 - 
       99*x^2*\[Delta]1^3 - 60*q*\[Delta]1^4 + 55*x*\[Delta]1^4)*\[Delta]2)/
     (27720*x^7) + ((495*q*x^4 - 1848*x^5 - 440*q*x^3*\[Delta]1 + 
       792*x^4*\[Delta]1 + 330*q*x^2*\[Delta]1^2 - 396*x^3*\[Delta]1^2 - 
       240*q*x*\[Delta]1^3 + 220*x^2*\[Delta]1^3 + 175*q*\[Delta]1^4 - 
       132*x*\[Delta]1^4)*\[Delta]2^2)/(55440*x^8) + 
    ((-858*q*x^4 + 2574*x^5 + 858*q*x^3*\[Delta]1 - 1287*x^4*\[Delta]1 - 
       702*q*x^2*\[Delta]1^2 + 715*x^3*\[Delta]1^2 + 546*q*x*\[Delta]1^3 - 
       429*x^2*\[Delta]1^3 - 420*q*\[Delta]1^4 + 273*x*\[Delta]1^4)*
      \[Delta]2^3)/(108108*x^9) + 
    ((2002*q*x^4 - 5148*x^5 - 2184*q*x^3*\[Delta]1 + 2860*x^4*\[Delta]1 + 
       1911*q*x^2*\[Delta]1^2 - 1716*x^3*\[Delta]1^2 - 1568*q*x*\[Delta]1^3 + 
       1092*x^2*\[Delta]1^3 + 1260*q*\[Delta]1^4 - 728*x*\[Delta]1^4)*
      \[Delta]2^4)/(288288*x^10)
C22funcd13[q_, x_, y_, \[Epsilon]_] := 
   -(-3*q*x^4 + 16*x^5 + 24*q*x^3*y - 104*x^4*y - 108*q*x^2*y^2 + 
       304*x^3*y^2 - 24*q*x*y^3 - 448*x^2*y^3 + 111*q*y^4 + 320*x*y^4 - 
       88*y^5 + 144*q*x*y^3*Log[x] - 48*x^2*y^3*Log[x] + 36*q*y^4*Log[x] + 
       96*x*y^4*Log[x] - 48*y^5*Log[x] - 144*q*x*y^3*Log[y] + 
       48*x^2*y^3*Log[y] - 36*q*y^4*Log[y] - 96*x*y^4*Log[y] + 48*y^5*Log[y])/
     (144*(x - y)^6) - (\[Epsilon]*(2*q*x^5 - 5*x^6 - 20*q*x^4*y + 40*x^5*y + 
       120*q*x^3*y^2 - 155*x^4*y^2 + 160*q*x^2*y^3 + 260*x^3*y^3 - 
       250*q*x*y^4 - 175*x^2*y^4 - 12*q*y^5 + 20*x*y^5 + 15*y^6 - 
       240*q*x^2*y^3*Log[x] + 60*x^3*y^3*Log[x] - 120*q*x*y^4*Log[x] - 
       120*x^2*y^4*Log[x] + 60*x*y^5*Log[x] + 240*q*x^2*y^3*Log[y] - 
       60*x^3*y^3*Log[y] + 120*q*x*y^4*Log[y] + 120*x^2*y^4*Log[y] - 
       60*x*y^5*Log[y]))/(60*x*(x - y)^7) - 
    (\[Epsilon]^2*(-5*q*x^6 + 8*x^7 + 60*q*x^5*y - 76*x^6*y - 450*q*x^4*y^2 + 
       368*x^5*y^2 - 1200*q*x^3*y^3 - 620*x^4*y^3 + 1425*q*x^2*y^4 + 
       280*x^3*y^4 + 180*q*x*y^5 + 172*x^2*y^5 - 10*q*y^6 - 144*x*y^6 + 
       12*y^7 + 1200*q*x^3*y^3*Log[x] - 240*x^4*y^3*Log[x] + 
       900*q*x^2*y^4*Log[x] + 480*x^3*y^4*Log[x] - 240*x^2*y^5*Log[x] - 
       1200*q*x^3*y^3*Log[y] + 240*x^4*y^3*Log[y] - 900*q*x^2*y^4*Log[y] - 
       480*x^3*y^4*Log[y] + 240*x^2*y^5*Log[y]))/(120*x^2*(x - y)^8) - 
    (\[Epsilon]^3*(6*q*x^7 - 7*x^8 - 84*q*x^6*y + 77*x^7*y + 756*q*x^5*y^2 - 
       448*x^6*y^2 + 3150*q*x^4*y^3 + 693*x^5*y^3 - 3150*q*x^3*y^4 - 
       756*q*x^2*y^5 - 693*x^3*y^5 + 84*q*x*y^6 + 448*x^2*y^6 - 6*q*y^7 - 
       77*x*y^7 + 7*y^8 - 2520*q*x^4*y^3*Log[x] + 420*x^5*y^3*Log[x] - 
       2520*q*x^3*y^4*Log[x] - 840*x^4*y^4*Log[x] + 420*x^3*y^5*Log[x] + 
       2520*q*x^4*y^3*Log[y] - 420*x^5*y^3*Log[y] + 2520*q*x^3*y^4*Log[y] + 
       840*x^4*y^4*Log[y] - 420*x^3*y^5*Log[y]))/(126*x^3*(x - y)^9) - 
    (\[Epsilon]^4*(-35*q*x^8 + 32*x^9 + 560*q*x^7*y - 400*x^8*y - 
       5880*q*x^6*y^2 + 2720*x^7*y^2 - 34104*q*x^5*y^3 - 3528*x^6*y^3 + 
       29400*q*x^4*y^4 - 3024*x^5*y^4 + 11760*q*x^3*y^5 + 8568*x^4*y^5 - 
       1960*q*x^2*y^6 - 5600*x^3*y^6 + 280*q*x*y^7 + 1480*x^2*y^7 - 
       21*q*y^8 - 272*x*y^8 + 24*y^9 + 23520*q*x^5*y^3*Log[x] - 
       3360*x^6*y^3*Log[x] + 29400*q*x^4*y^4*Log[x] + 6720*x^5*y^4*Log[x] - 
       3360*x^4*y^5*Log[x] - 23520*q*x^5*y^3*Log[y] + 3360*x^6*y^3*Log[y] - 
       29400*q*x^4*y^4*Log[y] - 6720*x^5*y^4*Log[y] + 3360*x^4*y^5*Log[y]))/
     (672*x^4*(x - y)^10)
C22funcd12[q_, x_, z_, \[Epsilon]_] := 
   (3*q*x^4 - 8*x^5 + 44*q*x^3*z + 4*x^4*z - 36*q*x^2*z^2 + 40*x^3*z^2 - 
      12*q*x*z^3 - 64*x^2*z^3 + q*z^4 + 32*x*z^4 - 4*z^5 - 
      24*q*x^3*z*Log[x] + 24*x^4*z*Log[x] - 36*q*x^2*z^2*Log[x] - 
      48*x^3*z^2*Log[x] + 24*x^2*z^3*Log[x] + 24*q*x^3*z*Log[z] - 
      24*x^4*z*Log[z] + 36*q*x^2*z^2*Log[z] + 48*x^3*z^2*Log[z] - 
      24*x^2*z^3*Log[z])/(24*(x - z)^6) - 
    (\[Epsilon]*(q*x^4 - x^5 + 28*q*x^3*z - 7*x^4*z + 26*x^3*z^2 - 
       28*q*x*z^3 - 26*x^2*z^3 - q*z^4 + 7*x*z^4 + z^5 - 12*q*x^3*z*Log[x] + 
       6*x^4*z*Log[x] - 36*q*x^2*z^2*Log[x] - 6*x^3*z^2*Log[x] - 
       12*q*x*z^3*Log[x] - 6*x^2*z^3*Log[x] + 6*x*z^4*Log[x] + 
       12*q*x^3*z*Log[z] - 6*x^4*z*Log[z] + 36*q*x^2*z^2*Log[z] + 
       6*x^3*z^2*Log[z] + 12*q*x*z^3*Log[z] + 6*x^2*z^3*Log[z] - 
       6*x*z^4*Log[z]))/(6*(x - z)^7) - 
    (\[Epsilon]^2*(-27*q*x^4 + 16*x^5 - 1152*q*x^3*z + 256*x^4*z - 
       972*q*x^2*z^2 - 704*x^3*z^2 + 1728*q*x*z^3 + 416*x^2*z^3 + 423*q*z^4 + 
       176*x*z^4 - 160*z^5 + 432*q*x^3*z*Log[x] - 144*x^4*z*Log[x] + 
       1944*q*x^2*z^2*Log[x] + 1296*q*x*z^3*Log[x] + 384*x^2*z^3*Log[x] + 
       108*q*z^4*Log[x] - 192*x*z^4*Log[x] - 48*z^5*Log[x] - 
       432*q*x^3*z*Log[z] + 144*x^4*z*Log[z] - 1944*q*x^2*z^2*Log[z] - 
       1296*q*x*z^3*Log[z] - 384*x^2*z^3*Log[z] - 108*q*z^4*Log[z] + 
       192*x*z^4*Log[z] + 48*z^5*Log[z]))/(144*(x - z)^8) - 
    (\[Epsilon]^3*(12*q*x^5 - 5*x^6 + 700*q*x^4*z - 130*x^5*z + 
       1200*q*x^3*z^2 + 275*x^4*z^2 - 1200*q*x^2*z^3 - 700*q*x*z^4 - 
       275*x^2*z^4 - 12*q*z^5 + 130*x*z^5 + 5*z^6 - 240*q*x^4*z*Log[x] + 
       60*x^5*z*Log[x] - 1440*q*x^3*z^2*Log[x] + 60*x^4*z^2*Log[x] - 
       1440*q*x^2*z^3*Log[x] - 240*x^3*z^3*Log[x] - 240*q*x*z^4*Log[x] + 
       60*x^2*z^4*Log[x] + 60*x*z^5*Log[x] + 240*q*x^4*z*Log[z] - 
       60*x^5*z*Log[z] + 1440*q*x^3*z^2*Log[z] - 60*x^4*z^2*Log[z] + 
       1440*q*x^2*z^3*Log[z] + 240*x^3*z^3*Log[z] + 240*q*x*z^4*Log[z] - 
       60*x^2*z^4*Log[z] - 60*x*z^5*Log[z]))/(60*x*(x - z)^9) - 
    (\[Epsilon]^4*(-25*q*x^6 + 8*x^7 - 1870*q*x^5*z + 294*x^6*z - 
       4875*q*x^4*z^2 - 452*x^5*z^2 + 3000*q*x^3*z^3 - 450*x^4*z^3 + 
       3625*q*x^2*z^4 + 1000*x^3*z^4 + 150*q*x*z^5 - 358*x^2*z^5 - 5*q*z^6 - 
       44*x*z^6 + 2*z^7 + 600*q*x^5*z*Log[x] - 120*x^6*z*Log[x] + 
       4500*q*x^4*z^2*Log[x] - 240*x^5*z^2*Log[x] + 6000*q*x^3*z^3*Log[x] + 
       600*x^4*z^3*Log[x] + 1500*q*x^2*z^4*Log[x] - 240*x^2*z^5*Log[x] - 
       600*q*x^5*z*Log[z] + 120*x^6*z*Log[z] - 4500*q*x^4*z^2*Log[z] + 
       240*x^5*z^2*Log[z] - 6000*q*x^3*z^3*Log[z] - 600*x^4*z^3*Log[z] - 
       1500*q*x^2*z^4*Log[z] + 240*x^2*z^5*Log[z]))/(120*x^2*(x - z)^10)
C22funcd23[q_, x_, y_, \[Epsilon]_] := 
   -(-36*q*x^5 - 195*q*x^4*y - 440*x^5*y + 360*q*x^3*y^2 + 1600*x^4*y^2 - 
       180*q*x^2*y^3 - 2240*x^3*y^3 + 60*q*x*y^4 + 1520*x^2*y^4 - 9*q*y^5 - 
       520*x*y^5 + 80*y^6 + 180*q*x^4*y*Log[x] + 240*x^5*y*Log[x] - 
       480*x^4*y^2*Log[x] + 240*x^3*y^3*Log[x] - 180*q*x^4*y*Log[y] - 
       240*x^5*y*Log[y] + 480*x^4*y^2*Log[y] - 240*x^3*y^3*Log[y])/
     (720*(x - y)^6*y) + (\[Epsilon]*(-2*q*x^6 + 24*q*x^5*y + 15*x^6*y + 
       35*q*x^4*y^2 + 20*x^5*y^2 - 80*q*x^3*y^3 - 175*x^4*y^3 + 
       30*q*x^2*y^4 + 260*x^3*y^4 - 8*q*x*y^5 - 155*x^2*y^5 + q*y^6 + 
       40*x*y^6 - 5*y^7 - 60*q*x^4*y^2*Log[x] - 60*x^5*y^2*Log[x] + 
       120*x^4*y^3*Log[x] - 60*x^3*y^4*Log[x] + 60*q*x^4*y^2*Log[y] + 
       60*x^5*y^2*Log[y] - 120*x^4*y^3*Log[y] + 60*x^3*y^4*Log[y]))/
     (60*(x - y)^7*y^2) - (\[Epsilon]^2*(-20*q*x^7 + 210*q*x^6*y + 84*x^7*y - 
       1260*q*x^5*y^2 - 1008*x^6*y^2 - 525*q*x^4*y^3 + 1204*x^5*y^3 + 
       2100*q*x^3*y^4 + 1960*x^4*y^4 - 630*q*x^2*y^5 - 4340*x^3*y^5 + 
       140*q*x*y^6 + 2576*x^2*y^6 - 15*q*y^7 - 532*x*y^7 + 56*y^8 + 
       2100*q*x^4*y^3*Log[x] + 1680*x^5*y^3*Log[x] - 3360*x^4*y^4*Log[x] + 
       1680*x^3*y^5*Log[x] - 2100*q*x^4*y^3*Log[y] - 1680*x^5*y^3*Log[y] + 
       3360*x^4*y^4*Log[y] - 1680*x^3*y^5*Log[y]))/(840*(x - y)^8*y^3) - 
    (\[Epsilon]^3*(9*q*x^8 - 96*q*x^7*y - 28*x^8*y + 504*q*x^6*y^2 + 
       308*x^7*y^2 - 2016*q*x^5*y^3 - 1792*x^6*y^3 + 2772*x^5*y^4 + 
       2016*q*x^3*y^5 - 504*q*x^2*y^6 - 2772*x^3*y^6 + 96*q*x*y^7 + 
       1792*x^2*y^7 - 9*q*y^8 - 308*x*y^8 + 28*y^9 + 2520*q*x^4*y^4*Log[x] + 
       1680*x^5*y^4*Log[x] - 3360*x^4*y^5*Log[x] + 1680*x^3*y^6*Log[x] - 
       2520*q*x^4*y^4*Log[y] - 1680*x^5*y^4*Log[y] + 3360*x^4*y^5*Log[y] - 
       1680*x^3*y^6*Log[y]))/(504*(x - y)^9*y^4) - 
    (\[Epsilon]^4*(-28*q*x^9 + 315*q*x^8*y + 72*x^9*y - 1680*q*x^7*y^2 - 
       816*x^8*y^2 + 5880*q*x^6*y^3 + 4440*x^7*y^3 - 17640*q*x^5*y^4 - 
       16800*x^6*y^4 + 3528*q*x^4*y^5 + 25704*x^5*y^5 + 11760*q*x^3*y^6 - 
       9072*x^4*y^6 - 2520*q*x^2*y^7 - 10584*x^3*y^7 + 420*q*x*y^8 + 
       8160*x^2*y^8 - 35*q*y^9 - 1200*x*y^9 + 96*y^10 + 
       17640*q*x^4*y^5*Log[x] + 10080*x^5*y^5*Log[x] - 20160*x^4*y^6*Log[x] + 
       10080*x^3*y^7*Log[x] - 17640*q*x^4*y^5*Log[y] - 10080*x^5*y^5*Log[y] + 
       20160*x^4*y^6*Log[y] - 10080*x^3*y^7*Log[y]))/(2016*(x - y)^10*y^5)
C22func0Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[C22funcz1d[0, y, z - y]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[C22funcz2d[0, x, z - x]], z == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[C22funcz3d[0, x, y - x]], x == 0, 
      Evaluate[C22funcz1[0, x, y, z]], y == 0, 
      Evaluate[C22funcz2[0, x, y, z]], z == 0, 
      Evaluate[C22funcz3[0, x, y, z]], Abs[\[Epsilon]23/S23] + 
        Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < d3comp, 
      Evaluate[C22funcd123[0, x, y - x, z - x]], Abs[\[Epsilon]23/S23] < 
       d2comp, Evaluate[C22funcd23[0, x, y, z - y]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[C22funcd13[0, x, y, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[C22funcd12[0, x, z, y - x]], 
      True, Evaluate[C22funcbase[0, x, y, z]]]]]
C22func1Acc[x_, y_, z_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     dzcomp = 0.01, d3comp = 0.03, d2comp = 0.01}, 
    ReleaseHold[Which[S12*S23*S13 == 0, 0, x == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[Coefficient[C22funcz1d[qsq, y, z - y], qsq]], 
      y == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[Coefficient[C22funcz2d[qsq, x, z - x], qsq]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[Coefficient[C22funcz3d[qsq, x, y - x], qsq]], x == 0, 
      Evaluate[Coefficient[C22funcz1[qsq, x, y, z], qsq]], y == 0, 
      Evaluate[Coefficient[C22funcz2[qsq, x, y, z], qsq]], z == 0, 
      Evaluate[Coefficient[C22funcz3[qsq, x, y, z], qsq]], 
      Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]12/S12] < 
       d3comp, Evaluate[Coefficient[C22funcd123[0, x, y - x, z - x], qsq]], 
      Abs[\[Epsilon]23/S23] < d2comp, Evaluate[Coefficient[
        C22funcd23[qsq, x, y, z - y], qsq]], Abs[\[Epsilon]13/S13] < d2comp, 
      Evaluate[Coefficient[C22funcd13[qsq, x, y, z - x], qsq]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[Coefficient[
        C22funcd12[qsq, x, z, y - x], qsq]], True, 
      Evaluate[Coefficient[C22funcbase[qsq, x, y, z], qsq]]]]]
D0func0[x_, y_, z_, w_] := 
   16*Pi^2*((w*Log[w])/(16*Pi^2*(-w + x)*(w - y)*(w - z)) - 
     (x*Log[x])/(16*Pi^2*(-w + x)*(x - y)*(x - z)) + 
     (y*Log[y])/(16*Pi^2*(x - y)*(-w + y)*(y - z)) + 
     (z*Log[z])/(16*Pi^2*(x - z)*(-w + z)*(-y + z)))
D0funcz1d234[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (30*y^4 - 20*y^3*\[Delta]1 + 15*y^2*\[Delta]1^2 - 12*y*\[Delta]1^3 + 
      10*\[Delta]1^4)/(60*y^6) + 
    ((-140*y^4 + 105*y^3*\[Delta]1 - 84*y^2*\[Delta]1^2 + 70*y*\[Delta]1^3 - 
       60*\[Delta]1^4)*\[Delta]2)/(420*y^7) + 
    ((210*y^4 - 168*y^3*\[Delta]1 + 140*y^2*\[Delta]1^2 - 120*y*\[Delta]1^3 + 
       105*\[Delta]1^4)*\[Delta]2^2)/(840*y^8) + 
    ((-504*y^4 + 420*y^3*\[Delta]1 - 360*y^2*\[Delta]1^2 + 
       315*y*\[Delta]1^3 - 280*\[Delta]1^4)*\[Delta]2^3)/(2520*y^9) + 
    ((420*y^4 - 360*y^3*\[Delta]1 + 315*y^2*\[Delta]1^2 - 280*y*\[Delta]1^3 + 
       252*\[Delta]1^4)*\[Delta]2^4)/(2520*y^10)
D0funcz2d134[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (30*x^4 - 20*x^3*\[Delta]1 + 15*x^2*\[Delta]1^2 - 12*x*\[Delta]1^3 + 
      10*\[Delta]1^4)/(60*x^6) + 
    ((-140*x^4 + 105*x^3*\[Delta]1 - 84*x^2*\[Delta]1^2 + 70*x*\[Delta]1^3 - 
       60*\[Delta]1^4)*\[Delta]2)/(420*x^7) + 
    ((210*x^4 - 168*x^3*\[Delta]1 + 140*x^2*\[Delta]1^2 - 120*x*\[Delta]1^3 + 
       105*\[Delta]1^4)*\[Delta]2^2)/(840*x^8) + 
    ((-504*x^4 + 420*x^3*\[Delta]1 - 360*x^2*\[Delta]1^2 + 
       315*x*\[Delta]1^3 - 280*\[Delta]1^4)*\[Delta]2^3)/(2520*x^9) + 
    ((420*x^4 - 360*x^3*\[Delta]1 + 315*x^2*\[Delta]1^2 - 280*x*\[Delta]1^3 + 
       252*\[Delta]1^4)*\[Delta]2^4)/(2520*x^10)
D0funcz3d124[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (30*x^4 - 20*x^3*\[Delta]1 + 15*x^2*\[Delta]1^2 - 12*x*\[Delta]1^3 + 
      10*\[Delta]1^4)/(60*x^6) + 
    ((-140*x^4 + 105*x^3*\[Delta]1 - 84*x^2*\[Delta]1^2 + 70*x*\[Delta]1^3 - 
       60*\[Delta]1^4)*\[Delta]2)/(420*x^7) + 
    ((210*x^4 - 168*x^3*\[Delta]1 + 140*x^2*\[Delta]1^2 - 120*x*\[Delta]1^3 + 
       105*\[Delta]1^4)*\[Delta]2^2)/(840*x^8) + 
    ((-504*x^4 + 420*x^3*\[Delta]1 - 360*x^2*\[Delta]1^2 + 
       315*x*\[Delta]1^3 - 280*\[Delta]1^4)*\[Delta]2^3)/(2520*x^9) + 
    ((420*x^4 - 360*x^3*\[Delta]1 + 315*x^2*\[Delta]1^2 - 280*x*\[Delta]1^3 + 
       252*\[Delta]1^4)*\[Delta]2^4)/(2520*x^10)
D0funcz4d123[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (30*x^4 - 20*x^3*\[Delta]1 + 15*x^2*\[Delta]1^2 - 12*x*\[Delta]1^3 + 
      10*\[Delta]1^4)/(60*x^6) + 
    ((-140*x^4 + 105*x^3*\[Delta]1 - 84*x^2*\[Delta]1^2 + 70*x*\[Delta]1^3 - 
       60*\[Delta]1^4)*\[Delta]2)/(420*x^7) + 
    ((210*x^4 - 168*x^3*\[Delta]1 + 140*x^2*\[Delta]1^2 - 120*x*\[Delta]1^3 + 
       105*\[Delta]1^4)*\[Delta]2^2)/(840*x^8) + 
    ((-504*x^4 + 420*x^3*\[Delta]1 - 360*x^2*\[Delta]1^2 + 
       315*x*\[Delta]1^3 - 280*\[Delta]1^4)*\[Delta]2^3)/(2520*x^9) + 
    ((420*x^4 - 360*x^3*\[Delta]1 + 315*x^2*\[Delta]1^2 - 280*x*\[Delta]1^3 + 
       252*\[Delta]1^4)*\[Delta]2^4)/(2520*x^10)
D0funcz1d34[y_, z_, \[Epsilon]_] := (-1 + y/z - Log[y] + Log[z])/(y - z)^2 + 
    (\[Epsilon]*(-y^2 + 4*y*z - 3*z^2 - 2*z^2*Log[y] + 2*z^2*Log[z]))/
     (2*(y - z)^3*z^2) + (\[Epsilon]^2*(2*y^3 - 9*y^2*z + 18*y*z^2 - 11*z^3 - 
       6*z^3*Log[y] + 6*z^3*Log[z]))/(6*(y - z)^4*z^3) + 
    (\[Epsilon]^3*(-3*y^4 + 16*y^3*z - 36*y^2*z^2 + 48*y*z^3 - 25*z^4 - 
       12*z^4*Log[y] + 12*z^4*Log[z]))/(12*(y - z)^5*z^4) + 
    (\[Epsilon]^4*(12*y^5 - 75*y^4*z + 200*y^3*z^2 - 300*y^2*z^3 + 
       300*y*z^4 - 137*z^5 - 60*z^5*Log[y] + 60*z^5*Log[z]))/
     (60*(y - z)^6*z^5)
D0funcz1d24[y_, z_, \[Epsilon]_] := 
   (\[Epsilon]*(1/(2*y^2) - (-1 + z/y + Log[y] - Log[z])/(y - z)^2))/
     (y - z) + (-1 + z/y + Log[y] - Log[z])/(y - z)^2 + 
    (\[Epsilon]^2*(-11*y^3 + 18*y^2*z - 9*y*z^2 + 2*z^3 + 6*y^3*Log[y] - 
       6*y^3*Log[z]))/(6*y^3*(y - z)^4) + 
    (\[Epsilon]^3*(25*y^4 - 48*y^3*z + 36*y^2*z^2 - 16*y*z^3 + 3*z^4 - 
       12*y^4*Log[y] + 12*y^4*Log[z]))/(12*y^4*(y - z)^5) + 
    (\[Epsilon]^4*(-137*y^5 + 300*y^4*z - 300*y^3*z^2 + 200*y^2*z^3 - 
       75*y*z^4 + 12*z^5 + 60*y^5*Log[y] - 60*y^5*Log[z]))/(60*y^5*(y - z)^6)
D0funcz1d23[y_, w_, \[Epsilon]_] := (-1 + w/y - Log[w] + Log[y])/(w - y)^2 + 
    (\[Epsilon]*(-w^2 + 4*w*y - 3*y^2 - 2*y^2*Log[w] + 2*y^2*Log[y]))/
     (2*(w - y)^3*y^2) + (\[Epsilon]^2*(2*w^3 - 9*w^2*y + 18*w*y^2 - 11*y^3 - 
       6*y^3*Log[w] + 6*y^3*Log[y]))/(6*(w - y)^4*y^3) + 
    (\[Epsilon]^3*(-3*w^4 + 16*w^3*y - 36*w^2*y^2 + 48*w*y^3 - 25*y^4 - 
       12*y^4*Log[w] + 12*y^4*Log[y]))/(12*(w - y)^5*y^4) + 
    (\[Epsilon]^4*(12*w^5 - 75*w^4*y + 200*w^3*y^2 - 300*w^2*y^3 + 
       300*w*y^4 - 137*y^5 - 60*y^5*Log[w] + 60*y^5*Log[y]))/
     (60*(w - y)^6*y^5)
D0funcz2d34[x_, z_, \[Epsilon]_] := (-1 + x/z - Log[x] + Log[z])/(x - z)^2 + 
    (\[Epsilon]*(-x^2 + 4*x*z - 3*z^2 - 2*z^2*Log[x] + 2*z^2*Log[z]))/
     (2*(x - z)^3*z^2) + (\[Epsilon]^2*(2*x^3 - 9*x^2*z + 18*x*z^2 - 11*z^3 - 
       6*z^3*Log[x] + 6*z^3*Log[z]))/(6*(x - z)^4*z^3) + 
    (\[Epsilon]^3*(-3*x^4 + 16*x^3*z - 36*x^2*z^2 + 48*x*z^3 - 25*z^4 - 
       12*z^4*Log[x] + 12*z^4*Log[z]))/(12*(x - z)^5*z^4) + 
    (\[Epsilon]^4*(12*x^5 - 75*x^4*z + 200*x^3*z^2 - 300*x^2*z^3 + 
       300*x*z^4 - 137*z^5 - 60*z^5*Log[x] + 60*z^5*Log[z]))/
     (60*(x - z)^6*z^5)
D0funcz2d14[x_, z_, \[Epsilon]_] := 
   (\[Epsilon]*(1/(2*x^2) - (-1 + z/x + Log[x] - Log[z])/(x - z)^2))/
     (x - z) + (-1 + z/x + Log[x] - Log[z])/(x - z)^2 + 
    (\[Epsilon]^2*(-11*x^3 + 18*x^2*z - 9*x*z^2 + 2*z^3 + 6*x^3*Log[x] - 
       6*x^3*Log[z]))/(6*x^3*(x - z)^4) + 
    (\[Epsilon]^3*(25*x^4 - 48*x^3*z + 36*x^2*z^2 - 16*x*z^3 + 3*z^4 - 
       12*x^4*Log[x] + 12*x^4*Log[z]))/(12*x^4*(x - z)^5) + 
    (\[Epsilon]^4*(-137*x^5 + 300*x^4*z - 300*x^3*z^2 + 200*x^2*z^3 - 
       75*x*z^4 + 12*z^5 + 60*x^5*Log[x] - 60*x^5*Log[z]))/(60*x^5*(x - z)^6)
D0funcz2d13[x_, w_, \[Epsilon]_] := (-1 + w/x - Log[w] + Log[x])/(w - x)^2 + 
    (\[Epsilon]*(-w^2 + 4*w*x - 3*x^2 - 2*x^2*Log[w] + 2*x^2*Log[x]))/
     (2*(w - x)^3*x^2) + (\[Epsilon]^2*(2*w^3 - 9*w^2*x + 18*w*x^2 - 11*x^3 - 
       6*x^3*Log[w] + 6*x^3*Log[x]))/(6*(w - x)^4*x^3) + 
    (\[Epsilon]^3*(-3*w^4 + 16*w^3*x - 36*w^2*x^2 + 48*w*x^3 - 25*x^4 - 
       12*x^4*Log[w] + 12*x^4*Log[x]))/(12*(w - x)^5*x^4) + 
    (\[Epsilon]^4*(12*w^5 - 75*w^4*x + 200*w^3*x^2 - 300*w^2*x^3 + 
       300*w*x^4 - 137*x^5 - 60*x^5*Log[w] + 60*x^5*Log[x]))/
     (60*(w - x)^6*x^5)
D0funcz3d14[x_, y_, \[Epsilon]_] := 
   (\[Epsilon]*(1/(2*x^2) - (-1 + y/x + Log[x] - Log[y])/(x - y)^2))/
     (x - y) + (-1 + y/x + Log[x] - Log[y])/(x - y)^2 + 
    (\[Epsilon]^2*(-11*x^3 + 18*x^2*y - 9*x*y^2 + 2*y^3 + 6*x^3*Log[x] - 
       6*x^3*Log[y]))/(6*x^3*(x - y)^4) + 
    (\[Epsilon]^3*(25*x^4 - 48*x^3*y + 36*x^2*y^2 - 16*x*y^3 + 3*y^4 - 
       12*x^4*Log[x] + 12*x^4*Log[y]))/(12*x^4*(x - y)^5) + 
    (\[Epsilon]^4*(-137*x^5 + 300*x^4*y - 300*x^3*y^2 + 200*x^2*y^3 - 
       75*x*y^4 + 12*y^5 + 60*x^5*Log[x] - 60*x^5*Log[y]))/(60*x^5*(x - y)^6)
D0funcz3d24[x_, y_, \[Epsilon]_] := (-1 + x/y - Log[x] + Log[y])/(x - y)^2 + 
    (\[Epsilon]*(-x^2 + 4*x*y - 3*y^2 - 2*y^2*Log[x] + 2*y^2*Log[y]))/
     (2*(x - y)^3*y^2) + (\[Epsilon]^2*(2*x^3 - 9*x^2*y + 18*x*y^2 - 11*y^3 - 
       6*y^3*Log[x] + 6*y^3*Log[y]))/(6*(x - y)^4*y^3) + 
    (\[Epsilon]^3*(-3*x^4 + 16*x^3*y - 36*x^2*y^2 + 48*x*y^3 - 25*y^4 - 
       12*y^4*Log[x] + 12*y^4*Log[y]))/(12*(x - y)^5*y^4) + 
    (\[Epsilon]^4*(12*x^5 - 75*x^4*y + 200*x^3*y^2 - 300*x^2*y^3 + 
       300*x*y^4 - 137*y^5 - 60*y^5*Log[x] + 60*y^5*Log[y]))/
     (60*(x - y)^6*y^5)
D0funcz3d12[x_, w_, \[Epsilon]_] := (-1 + w/x - Log[w] + Log[x])/(w - x)^2 + 
    (\[Epsilon]*(-w^2 + 4*w*x - 3*x^2 - 2*x^2*Log[w] + 2*x^2*Log[x]))/
     (2*(w - x)^3*x^2) + (\[Epsilon]^2*(2*w^3 - 9*w^2*x + 18*w*x^2 - 11*x^3 - 
       6*x^3*Log[w] + 6*x^3*Log[x]))/(6*(w - x)^4*x^3) + 
    (\[Epsilon]^3*(-3*w^4 + 16*w^3*x - 36*w^2*x^2 + 48*w*x^3 - 25*x^4 - 
       12*x^4*Log[w] + 12*x^4*Log[x]))/(12*(w - x)^5*x^4) + 
    (\[Epsilon]^4*(12*w^5 - 75*w^4*x + 200*w^3*x^2 - 300*w^2*x^3 + 
       300*w*x^4 - 137*x^5 - 60*x^5*Log[w] + 60*x^5*Log[x]))/
     (60*(w - x)^6*x^5)
D0funcz4d23[x_, y_, \[Epsilon]_] := (-1 + x/y - Log[x] + Log[y])/(x - y)^2 + 
    (\[Epsilon]*(-x^2 + 4*x*y - 3*y^2 - 2*y^2*Log[x] + 2*y^2*Log[y]))/
     (2*(x - y)^3*y^2) + (\[Epsilon]^2*(2*x^3 - 9*x^2*y + 18*x*y^2 - 11*y^3 - 
       6*y^3*Log[x] + 6*y^3*Log[y]))/(6*(x - y)^4*y^3) + 
    (\[Epsilon]^3*(-3*x^4 + 16*x^3*y - 36*x^2*y^2 + 48*x*y^3 - 25*y^4 - 
       12*y^4*Log[x] + 12*y^4*Log[y]))/(12*(x - y)^5*y^4) + 
    (\[Epsilon]^4*(12*x^5 - 75*x^4*y + 200*x^3*y^2 - 300*x^2*y^3 + 
       300*x*y^4 - 137*y^5 - 60*y^5*Log[x] + 60*y^5*Log[y]))/
     (60*(x - y)^6*y^5)
D0funcz4d13[x_, y_, \[Epsilon]_] := 
   (\[Epsilon]*(1/(2*x^2) - (-1 + y/x + Log[x] - Log[y])/(x - y)^2))/
     (x - y) + (-1 + y/x + Log[x] - Log[y])/(x - y)^2 + 
    (\[Epsilon]^2*(-11*x^3 + 18*x^2*y - 9*x*y^2 + 2*y^3 + 6*x^3*Log[x] - 
       6*x^3*Log[y]))/(6*x^3*(x - y)^4) + 
    (\[Epsilon]^3*(25*x^4 - 48*x^3*y + 36*x^2*y^2 - 16*x*y^3 + 3*y^4 - 
       12*x^4*Log[x] + 12*x^4*Log[y]))/(12*x^4*(x - y)^5) + 
    (\[Epsilon]^4*(-137*x^5 + 300*x^4*y - 300*x^3*y^2 + 200*x^2*y^3 - 
       75*x*y^4 + 12*y^5 + 60*x^5*Log[x] - 60*x^5*Log[y]))/(60*x^5*(x - y)^6)
D0funcz4d12[x_, z_, \[Epsilon]_] := 
   (\[Epsilon]*(1/(2*x^2) - (-1 + z/x + Log[x] - Log[z])/(x - z)^2))/
     (x - z) + (-1 + z/x + Log[x] - Log[z])/(x - z)^2 + 
    (\[Epsilon]^2*(-11*x^3 + 18*x^2*z - 9*x*z^2 + 2*z^3 + 6*x^3*Log[x] - 
       6*x^3*Log[z]))/(6*x^3*(x - z)^4) + 
    (\[Epsilon]^3*(25*x^4 - 48*x^3*z + 36*x^2*z^2 - 16*x*z^3 + 3*z^4 - 
       12*x^4*Log[x] + 12*x^4*Log[z]))/(12*x^4*(x - z)^5) + 
    (\[Epsilon]^4*(-137*x^5 + 300*x^4*z - 300*x^3*z^2 + 200*x^2*z^3 - 
       75*x*z^4 + 12*z^5 + 60*x^5*Log[x] - 60*x^5*Log[z]))/(60*x^5*(x - z)^6)
D0funcz1[x_, y_, z_, w_] := ((-y + z)*Log[w] + (w - z)*Log[y] + 
     (-w + y)*Log[z])/((w - y)*(w - z)*(y - z))
D0funcz2[x_, y_, z_, w_] := ((-x + z)*Log[w] + (w - z)*Log[x] + 
     (-w + x)*Log[z])/((w - x)*(w - z)*(x - z))
D0funcz3[x_, y_, z_, w_] := ((-x + y)*Log[w] + (w - y)*Log[x] + 
     (-w + x)*Log[y])/((w - x)*(w - y)*(x - y))
D0funcz4[x_, y_, z_, w_] := ((-y + z)*Log[x] + (x - z)*Log[y] + 
     (-x + y)*Log[z])/((x - y)*(x - z)*(y - z))
D0funcd1234[x_, \[Delta]1_, \[Delta]2_, \[Delta]3_] := 
   1/(6*x^2) - \[Delta]1/(12*x^3) + \[Delta]1^2/(20*x^4) - 
    \[Delta]1^3/(30*x^5) + \[Delta]1^4/(42*x^6) - 
    ((70*x^4 - 42*x^3*\[Delta]1 + 28*x^2*\[Delta]1^2 - 20*x*\[Delta]1^3 + 
       15*\[Delta]1^4)*\[Delta]2)/(840*x^7) + 
    ((126*x^4 - 84*x^3*\[Delta]1 + 60*x^2*\[Delta]1^2 - 45*x*\[Delta]1^3 + 
       35*\[Delta]1^4)*\[Delta]2^2)/(2520*x^8) + 
    ((-84*x^4 + 60*x^3*\[Delta]1 - 45*x^2*\[Delta]1^2 + 35*x*\[Delta]1^3 - 
       28*\[Delta]1^4)*\[Delta]2^3)/(2520*x^9) + 
    ((660*x^4 - 495*x^3*\[Delta]1 + 385*x^2*\[Delta]1^2 - 308*x*\[Delta]1^3 + 
       252*\[Delta]1^4)*\[Delta]2^4)/(27720*x^10) + 
    (-1/(12*x^3) + \[Delta]1/(20*x^4) - \[Delta]1^2/(30*x^5) + 
      \[Delta]1^3/(42*x^6) - \[Delta]1^4/(56*x^7) + 
      ((126*x^4 - 84*x^3*\[Delta]1 + 60*x^2*\[Delta]1^2 - 45*x*\[Delta]1^3 + 
         35*\[Delta]1^4)*\[Delta]2)/(2520*x^8) + 
      ((-84*x^4 + 60*x^3*\[Delta]1 - 45*x^2*\[Delta]1^2 + 35*x*\[Delta]1^3 - 
         28*\[Delta]1^4)*\[Delta]2^2)/(2520*x^9) + 
      ((660*x^4 - 495*x^3*\[Delta]1 + 385*x^2*\[Delta]1^2 - 
         308*x*\[Delta]1^3 + 252*\[Delta]1^4)*\[Delta]2^3)/(27720*x^10) + 
      ((-495*x^4 + 385*x^3*\[Delta]1 - 308*x^2*\[Delta]1^2 + 
         252*x*\[Delta]1^3 - 210*\[Delta]1^4)*\[Delta]2^4)/(27720*x^11))*
     \[Delta]3 + (1/(20*x^4) - \[Delta]1/(30*x^5) + \[Delta]1^2/(42*x^6) - 
      \[Delta]1^3/(56*x^7) + \[Delta]1^4/(72*x^8) - 
      ((84*x^4 - 60*x^3*\[Delta]1 + 45*x^2*\[Delta]1^2 - 35*x*\[Delta]1^3 + 
         28*\[Delta]1^4)*\[Delta]2)/(2520*x^9) + 
      ((660*x^4 - 495*x^3*\[Delta]1 + 385*x^2*\[Delta]1^2 - 
         308*x*\[Delta]1^3 + 252*\[Delta]1^4)*\[Delta]2^2)/(27720*x^10) + 
      ((-495*x^4 + 385*x^3*\[Delta]1 - 308*x^2*\[Delta]1^2 + 
         252*x*\[Delta]1^3 - 210*\[Delta]1^4)*\[Delta]2^3)/(27720*x^11) + 
      ((715*x^4 - 572*x^3*\[Delta]1 + 468*x^2*\[Delta]1^2 - 
         390*x*\[Delta]1^3 + 330*\[Delta]1^4)*\[Delta]2^4)/(51480*x^12))*
     \[Delta]3^2 + (-1/(30*x^5) + \[Delta]1/(42*x^6) - \[Delta]1^2/(56*x^7) + 
      \[Delta]1^3/(72*x^8) - \[Delta]1^4/(90*x^9) + 
      ((660*x^4 - 495*x^3*\[Delta]1 + 385*x^2*\[Delta]1^2 - 
         308*x*\[Delta]1^3 + 252*\[Delta]1^4)*\[Delta]2)/(27720*x^10) + 
      ((-495*x^4 + 385*x^3*\[Delta]1 - 308*x^2*\[Delta]1^2 + 
         252*x*\[Delta]1^3 - 210*\[Delta]1^4)*\[Delta]2^2)/(27720*x^11) + 
      ((715*x^4 - 572*x^3*\[Delta]1 + 468*x^2*\[Delta]1^2 - 
         390*x*\[Delta]1^3 + 330*\[Delta]1^4)*\[Delta]2^3)/(51480*x^12) + 
      ((-2002*x^4 + 1638*x^3*\[Delta]1 - 1365*x^2*\[Delta]1^2 + 
         1155*x*\[Delta]1^3 - 990*\[Delta]1^4)*\[Delta]2^4)/(180180*x^13))*
     \[Delta]3^3 + (1/(42*x^6) - \[Delta]1/(56*x^7) + \[Delta]1^2/(72*x^8) - 
      \[Delta]1^3/(90*x^9) + \[Delta]1^4/(110*x^10) - 
      ((495*x^4 - 385*x^3*\[Delta]1 + 308*x^2*\[Delta]1^2 - 
         252*x*\[Delta]1^3 + 210*\[Delta]1^4)*\[Delta]2)/(27720*x^11) + 
      ((715*x^4 - 572*x^3*\[Delta]1 + 468*x^2*\[Delta]1^2 - 
         390*x*\[Delta]1^3 + 330*\[Delta]1^4)*\[Delta]2^2)/(51480*x^12) + 
      ((-2002*x^4 + 1638*x^3*\[Delta]1 - 1365*x^2*\[Delta]1^2 + 
         1155*x*\[Delta]1^3 - 990*\[Delta]1^4)*\[Delta]2^3)/(180180*x^13) + 
      ((546*x^4 - 455*x^3*\[Delta]1 + 385*x^2*\[Delta]1^2 - 
         330*x*\[Delta]1^3 + 286*\[Delta]1^4)*\[Delta]2^4)/(60060*x^14))*
     \[Delta]3^4
D0funcd234[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y])/(2*(x - y)^3*y) - 
    (\[Delta]1*(x^3 - 6*x^2*y + 3*x*y^2 + 2*y^3 + 6*x*y^2*Log[x] - 
       6*x*y^2*Log[y]))/(6*(x - y)^4*y^2) + 
    (\[Delta]1^2*(x^4 - 6*x^3*y + 18*x^2*y^2 - 10*x*y^3 - 3*y^4 - 
       12*x*y^3*Log[x] + 12*x*y^3*Log[y]))/(12*(x - y)^5*y^3) + 
    (\[Delta]1^3*(-3*x^5 + 20*x^4*y - 60*x^3*y^2 + 120*x^2*y^3 - 65*x*y^4 - 
       12*y^5 - 60*x*y^4*Log[x] + 60*x*y^4*Log[y]))/(60*(x - y)^6*y^4) + 
    (\[Delta]1^4*(2*x^6 - 15*x^5*y + 50*x^4*y^2 - 100*x^3*y^3 + 150*x^2*y^4 - 
       77*x*y^5 - 10*y^6 - 60*x*y^5*Log[x] + 60*x*y^5*Log[y]))/
     (60*(x - y)^7*y^5) + \[Delta]2*
     ((-x^3 + 6*x^2*y - 3*x*y^2 - 2*y^3 - 6*x*y^2*Log[x] + 6*x*y^2*Log[y])/
       (6*(x - y)^4*y^2) + (\[Delta]1*(x^4 - 6*x^3*y + 18*x^2*y^2 - 
         10*x*y^3 - 3*y^4 - 12*x*y^3*Log[x] + 12*x*y^3*Log[y]))/
       (12*(x - y)^5*y^3) + (\[Delta]1^2*(-3*x^5 + 20*x^4*y - 60*x^3*y^2 + 
         120*x^2*y^3 - 65*x*y^4 - 12*y^5 - 60*x*y^4*Log[x] + 
         60*x*y^4*Log[y]))/(60*(x - y)^6*y^4) + 
      (\[Delta]1^3*(2*x^6 - 15*x^5*y + 50*x^4*y^2 - 100*x^3*y^3 + 
         150*x^2*y^4 - 77*x*y^5 - 10*y^6 - 60*x*y^5*Log[x] + 
         60*x*y^5*Log[y]))/(60*(x - y)^7*y^5) + 
      (\[Delta]1^4*(-10*x^7 + 84*x^6*y - 315*x^5*y^2 + 700*x^4*y^3 - 
         1050*x^3*y^4 + 1260*x^2*y^5 - 609*x*y^6 - 60*y^7 - 
         420*x*y^6*Log[x] + 420*x*y^6*Log[y]))/(420*(x - y)^8*y^6)) + 
    \[Delta]2^2*((x^4 - 6*x^3*y + 18*x^2*y^2 - 10*x*y^3 - 3*y^4 - 
        12*x*y^3*Log[x] + 12*x*y^3*Log[y])/(12*(x - y)^5*y^3) + 
      (\[Delta]1*(-3*x^5 + 20*x^4*y - 60*x^3*y^2 + 120*x^2*y^3 - 65*x*y^4 - 
         12*y^5 - 60*x*y^4*Log[x] + 60*x*y^4*Log[y]))/(60*(x - y)^6*y^4) + 
      (\[Delta]1^2*(2*x^6 - 15*x^5*y + 50*x^4*y^2 - 100*x^3*y^3 + 
         150*x^2*y^4 - 77*x*y^5 - 10*y^6 - 60*x*y^5*Log[x] + 
         60*x*y^5*Log[y]))/(60*(x - y)^7*y^5) + 
      (\[Delta]1^3*(-10*x^7 + 84*x^6*y - 315*x^5*y^2 + 700*x^4*y^3 - 
         1050*x^3*y^4 + 1260*x^2*y^5 - 609*x*y^6 - 60*y^7 - 
         420*x*y^6*Log[x] + 420*x*y^6*Log[y]))/(420*(x - y)^8*y^6) + 
      (\[Delta]1^4*(15*x^8 - 140*x^7*y + 588*x^6*y^2 - 1470*x^5*y^3 + 
         2450*x^4*y^4 - 2940*x^3*y^5 + 2940*x^2*y^6 - 1338*x*y^7 - 105*y^8 - 
         840*x*y^7*Log[x] + 840*x*y^7*Log[y]))/(840*(x - y)^9*y^7)) + 
    \[Delta]2^3*((-3*x^5 + 20*x^4*y - 60*x^3*y^2 + 120*x^2*y^3 - 65*x*y^4 - 
        12*y^5 - 60*x*y^4*Log[x] + 60*x*y^4*Log[y])/(60*(x - y)^6*y^4) + 
      (\[Delta]1*(2*x^6 - 15*x^5*y + 50*x^4*y^2 - 100*x^3*y^3 + 150*x^2*y^4 - 
         77*x*y^5 - 10*y^6 - 60*x*y^5*Log[x] + 60*x*y^5*Log[y]))/
       (60*(x - y)^7*y^5) + (\[Delta]1^2*(-10*x^7 + 84*x^6*y - 315*x^5*y^2 + 
         700*x^4*y^3 - 1050*x^3*y^4 + 1260*x^2*y^5 - 609*x*y^6 - 60*y^7 - 
         420*x*y^6*Log[x] + 420*x*y^6*Log[y]))/(420*(x - y)^8*y^6) + 
      (\[Delta]1^3*(15*x^8 - 140*x^7*y + 588*x^6*y^2 - 1470*x^5*y^3 + 
         2450*x^4*y^4 - 2940*x^3*y^5 + 2940*x^2*y^6 - 1338*x*y^7 - 105*y^8 - 
         840*x*y^7*Log[x] + 840*x*y^7*Log[y]))/(840*(x - y)^9*y^7) + 
      (\[Delta]1^4*(-35*x^9 + 360*x^8*y - 1680*x^7*y^2 + 4704*x^6*y^3 - 
         8820*x^5*y^4 + 11760*x^4*y^5 - 11760*x^3*y^6 + 10080*x^2*y^7 - 
         4329*x*y^8 - 280*y^9 - 2520*x*y^8*Log[x] + 2520*x*y^8*Log[y]))/
       (2520*(x - y)^10*y^8)) + \[Delta]2^4*
     ((2*x^6 - 15*x^5*y + 50*x^4*y^2 - 100*x^3*y^3 + 150*x^2*y^4 - 77*x*y^5 - 
        10*y^6 - 60*x*y^5*Log[x] + 60*x*y^5*Log[y])/(60*(x - y)^7*y^5) + 
      (\[Delta]1*(-10*x^7 + 84*x^6*y - 315*x^5*y^2 + 700*x^4*y^3 - 
         1050*x^3*y^4 + 1260*x^2*y^5 - 609*x*y^6 - 60*y^7 - 
         420*x*y^6*Log[x] + 420*x*y^6*Log[y]))/(420*(x - y)^8*y^6) + 
      (\[Delta]1^2*(15*x^8 - 140*x^7*y + 588*x^6*y^2 - 1470*x^5*y^3 + 
         2450*x^4*y^4 - 2940*x^3*y^5 + 2940*x^2*y^6 - 1338*x*y^7 - 105*y^8 - 
         840*x*y^7*Log[x] + 840*x*y^7*Log[y]))/(840*(x - y)^9*y^7) + 
      (\[Delta]1^3*(-35*x^9 + 360*x^8*y - 1680*x^7*y^2 + 4704*x^6*y^3 - 
         8820*x^5*y^4 + 11760*x^4*y^5 - 11760*x^3*y^6 + 10080*x^2*y^7 - 
         4329*x*y^8 - 280*y^9 - 2520*x*y^8*Log[x] + 2520*x*y^8*Log[y]))/
       (2520*(x - y)^10*y^8) + (\[Delta]1^4*(28*x^10 - 315*x^9*y + 
         1620*x^8*y^2 - 5040*x^7*y^3 + 10584*x^6*y^4 - 15876*x^5*y^5 + 
         17640*x^4*y^6 - 15120*x^3*y^7 + 11340*x^2*y^8 - 4609*x*y^9 - 
         252*y^10 - 2520*x*y^9*Log[x] + 2520*x*y^9*Log[y]))/
       (2520*(x - y)^11*y^9))
D0funcd134[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y])/(2*x*(x - y)^3) - 
    (\[Delta]1*(2*x^3 + 3*x^2*y - 6*x*y^2 + y^3 - 6*x^2*y*Log[x] + 
       6*x^2*y*Log[y]))/(6*x^2*(x - y)^4) + 
    (\[Delta]1^2*(3*x^4 + 10*x^3*y - 18*x^2*y^2 + 6*x*y^3 - y^4 - 
       12*x^3*y*Log[x] + 12*x^3*y*Log[y]))/(12*x^3*(x - y)^5) + 
    (\[Delta]1^3*(-12*x^5 - 65*x^4*y + 120*x^3*y^2 - 60*x^2*y^3 + 20*x*y^4 - 
       3*y^5 + 60*x^4*y*Log[x] - 60*x^4*y*Log[y]))/(60*x^4*(x - y)^6) + 
    (\[Delta]1^4*(10*x^6 + 77*x^5*y - 150*x^4*y^2 + 100*x^3*y^3 - 
       50*x^2*y^4 + 15*x*y^5 - 2*y^6 - 60*x^5*y*Log[x] + 60*x^5*y*Log[y]))/
     (60*x^5*(x - y)^7) + \[Delta]2*
     ((-2*x^3 - 3*x^2*y + 6*x*y^2 - y^3 + 6*x^2*y*Log[x] - 6*x^2*y*Log[y])/
       (6*x^2*(x - y)^4) + (\[Delta]1*(3*x^4 + 10*x^3*y - 18*x^2*y^2 + 
         6*x*y^3 - y^4 - 12*x^3*y*Log[x] + 12*x^3*y*Log[y]))/
       (12*x^3*(x - y)^5) + (\[Delta]1^2*(-12*x^5 - 65*x^4*y + 120*x^3*y^2 - 
         60*x^2*y^3 + 20*x*y^4 - 3*y^5 + 60*x^4*y*Log[x] - 60*x^4*y*Log[y]))/
       (60*x^4*(x - y)^6) + (\[Delta]1^3*(10*x^6 + 77*x^5*y - 150*x^4*y^2 + 
         100*x^3*y^3 - 50*x^2*y^4 + 15*x*y^5 - 2*y^6 - 60*x^5*y*Log[x] + 
         60*x^5*y*Log[y]))/(60*x^5*(x - y)^7) + 
      (\[Delta]1^4*(-60*x^7 - 609*x^6*y + 1260*x^5*y^2 - 1050*x^4*y^3 + 
         700*x^3*y^4 - 315*x^2*y^5 + 84*x*y^6 - 10*y^7 + 420*x^6*y*Log[x] - 
         420*x^6*y*Log[y]))/(420*x^6*(x - y)^8)) + 
    \[Delta]2^2*((3*x^4 + 10*x^3*y - 18*x^2*y^2 + 6*x*y^3 - y^4 - 
        12*x^3*y*Log[x] + 12*x^3*y*Log[y])/(12*x^3*(x - y)^5) + 
      (\[Delta]1*(-12*x^5 - 65*x^4*y + 120*x^3*y^2 - 60*x^2*y^3 + 20*x*y^4 - 
         3*y^5 + 60*x^4*y*Log[x] - 60*x^4*y*Log[y]))/(60*x^4*(x - y)^6) + 
      (\[Delta]1^2*(10*x^6 + 77*x^5*y - 150*x^4*y^2 + 100*x^3*y^3 - 
         50*x^2*y^4 + 15*x*y^5 - 2*y^6 - 60*x^5*y*Log[x] + 60*x^5*y*Log[y]))/
       (60*x^5*(x - y)^7) + (\[Delta]1^3*(-60*x^7 - 609*x^6*y + 
         1260*x^5*y^2 - 1050*x^4*y^3 + 700*x^3*y^4 - 315*x^2*y^5 + 84*x*y^6 - 
         10*y^7 + 420*x^6*y*Log[x] - 420*x^6*y*Log[y]))/(420*x^6*(x - y)^8) + 
      (\[Delta]1^4*(105*x^8 + 1338*x^7*y - 2940*x^6*y^2 + 2940*x^5*y^3 - 
         2450*x^4*y^4 + 1470*x^3*y^5 - 588*x^2*y^6 + 140*x*y^7 - 15*y^8 - 
         840*x^7*y*Log[x] + 840*x^7*y*Log[y]))/(840*x^7*(x - y)^9)) + 
    \[Delta]2^3*((-12*x^5 - 65*x^4*y + 120*x^3*y^2 - 60*x^2*y^3 + 20*x*y^4 - 
        3*y^5 + 60*x^4*y*Log[x] - 60*x^4*y*Log[y])/(60*x^4*(x - y)^6) + 
      (\[Delta]1*(10*x^6 + 77*x^5*y - 150*x^4*y^2 + 100*x^3*y^3 - 
         50*x^2*y^4 + 15*x*y^5 - 2*y^6 - 60*x^5*y*Log[x] + 60*x^5*y*Log[y]))/
       (60*x^5*(x - y)^7) + (\[Delta]1^2*(-60*x^7 - 609*x^6*y + 
         1260*x^5*y^2 - 1050*x^4*y^3 + 700*x^3*y^4 - 315*x^2*y^5 + 84*x*y^6 - 
         10*y^7 + 420*x^6*y*Log[x] - 420*x^6*y*Log[y]))/(420*x^6*(x - y)^8) + 
      (\[Delta]1^3*(105*x^8 + 1338*x^7*y - 2940*x^6*y^2 + 2940*x^5*y^3 - 
         2450*x^4*y^4 + 1470*x^3*y^5 - 588*x^2*y^6 + 140*x*y^7 - 15*y^8 - 
         840*x^7*y*Log[x] + 840*x^7*y*Log[y]))/(840*x^7*(x - y)^9) + 
      (\[Delta]1^4*(-280*x^9 - 4329*x^8*y + 10080*x^7*y^2 - 11760*x^6*y^3 + 
         11760*x^5*y^4 - 8820*x^4*y^5 + 4704*x^3*y^6 - 1680*x^2*y^7 + 
         360*x*y^8 - 35*y^9 + 2520*x^8*y*Log[x] - 2520*x^8*y*Log[y]))/
       (2520*x^8*(x - y)^10)) + \[Delta]2^4*
     ((10*x^6 + 77*x^5*y - 150*x^4*y^2 + 100*x^3*y^3 - 50*x^2*y^4 + 
        15*x*y^5 - 2*y^6 - 60*x^5*y*Log[x] + 60*x^5*y*Log[y])/
       (60*x^5*(x - y)^7) + (\[Delta]1*(-60*x^7 - 609*x^6*y + 1260*x^5*y^2 - 
         1050*x^4*y^3 + 700*x^3*y^4 - 315*x^2*y^5 + 84*x*y^6 - 10*y^7 + 
         420*x^6*y*Log[x] - 420*x^6*y*Log[y]))/(420*x^6*(x - y)^8) + 
      (\[Delta]1^2*(105*x^8 + 1338*x^7*y - 2940*x^6*y^2 + 2940*x^5*y^3 - 
         2450*x^4*y^4 + 1470*x^3*y^5 - 588*x^2*y^6 + 140*x*y^7 - 15*y^8 - 
         840*x^7*y*Log[x] + 840*x^7*y*Log[y]))/(840*x^7*(x - y)^9) + 
      (\[Delta]1^3*(-280*x^9 - 4329*x^8*y + 10080*x^7*y^2 - 11760*x^6*y^3 + 
         11760*x^5*y^4 - 8820*x^4*y^5 + 4704*x^3*y^6 - 1680*x^2*y^7 + 
         360*x*y^8 - 35*y^9 + 2520*x^8*y*Log[x] - 2520*x^8*y*Log[y]))/
       (2520*x^8*(x - y)^10) + (\[Delta]1^4*(252*x^10 + 4609*x^9*y - 
         11340*x^8*y^2 + 15120*x^7*y^3 - 17640*x^6*y^4 + 15876*x^5*y^5 - 
         10584*x^4*y^6 + 5040*x^3*y^7 - 1620*x^2*y^8 + 315*x*y^9 - 28*y^10 - 
         2520*x^9*y*Log[x] + 2520*x^9*y*Log[y]))/(2520*x^9*(x - y)^11))
D0funcd124[x_, z_, \[Delta]1_, \[Delta]2_] := 
   (x^2 - z^2 - 2*x*z*Log[x] + 2*x*z*Log[z])/(2*x*(x - z)^3) - 
    (\[Delta]1*(2*x^3 + 3*x^2*z - 6*x*z^2 + z^3 - 6*x^2*z*Log[x] + 
       6*x^2*z*Log[z]))/(6*x^2*(x - z)^4) + 
    (\[Delta]1^2*(3*x^4 + 10*x^3*z - 18*x^2*z^2 + 6*x*z^3 - z^4 - 
       12*x^3*z*Log[x] + 12*x^3*z*Log[z]))/(12*x^3*(x - z)^5) + 
    (\[Delta]1^3*(-12*x^5 - 65*x^4*z + 120*x^3*z^2 - 60*x^2*z^3 + 20*x*z^4 - 
       3*z^5 + 60*x^4*z*Log[x] - 60*x^4*z*Log[z]))/(60*x^4*(x - z)^6) + 
    (\[Delta]1^4*(10*x^6 + 77*x^5*z - 150*x^4*z^2 + 100*x^3*z^3 - 
       50*x^2*z^4 + 15*x*z^5 - 2*z^6 - 60*x^5*z*Log[x] + 60*x^5*z*Log[z]))/
     (60*x^5*(x - z)^7) + \[Delta]2*
     ((-2*x^3 - 3*x^2*z + 6*x*z^2 - z^3 + 6*x^2*z*Log[x] - 6*x^2*z*Log[z])/
       (6*x^2*(x - z)^4) + (\[Delta]1*(3*x^4 + 10*x^3*z - 18*x^2*z^2 + 
         6*x*z^3 - z^4 - 12*x^3*z*Log[x] + 12*x^3*z*Log[z]))/
       (12*x^3*(x - z)^5) + (\[Delta]1^2*(-12*x^5 - 65*x^4*z + 120*x^3*z^2 - 
         60*x^2*z^3 + 20*x*z^4 - 3*z^5 + 60*x^4*z*Log[x] - 60*x^4*z*Log[z]))/
       (60*x^4*(x - z)^6) + (\[Delta]1^3*(10*x^6 + 77*x^5*z - 150*x^4*z^2 + 
         100*x^3*z^3 - 50*x^2*z^4 + 15*x*z^5 - 2*z^6 - 60*x^5*z*Log[x] + 
         60*x^5*z*Log[z]))/(60*x^5*(x - z)^7) + 
      (\[Delta]1^4*(-60*x^7 - 609*x^6*z + 1260*x^5*z^2 - 1050*x^4*z^3 + 
         700*x^3*z^4 - 315*x^2*z^5 + 84*x*z^6 - 10*z^7 + 420*x^6*z*Log[x] - 
         420*x^6*z*Log[z]))/(420*x^6*(x - z)^8)) + 
    \[Delta]2^2*((3*x^4 + 10*x^3*z - 18*x^2*z^2 + 6*x*z^3 - z^4 - 
        12*x^3*z*Log[x] + 12*x^3*z*Log[z])/(12*x^3*(x - z)^5) + 
      (\[Delta]1*(-12*x^5 - 65*x^4*z + 120*x^3*z^2 - 60*x^2*z^3 + 20*x*z^4 - 
         3*z^5 + 60*x^4*z*Log[x] - 60*x^4*z*Log[z]))/(60*x^4*(x - z)^6) + 
      (\[Delta]1^2*(10*x^6 + 77*x^5*z - 150*x^4*z^2 + 100*x^3*z^3 - 
         50*x^2*z^4 + 15*x*z^5 - 2*z^6 - 60*x^5*z*Log[x] + 60*x^5*z*Log[z]))/
       (60*x^5*(x - z)^7) + (\[Delta]1^3*(-60*x^7 - 609*x^6*z + 
         1260*x^5*z^2 - 1050*x^4*z^3 + 700*x^3*z^4 - 315*x^2*z^5 + 84*x*z^6 - 
         10*z^7 + 420*x^6*z*Log[x] - 420*x^6*z*Log[z]))/(420*x^6*(x - z)^8) + 
      (\[Delta]1^4*(105*x^8 + 1338*x^7*z - 2940*x^6*z^2 + 2940*x^5*z^3 - 
         2450*x^4*z^4 + 1470*x^3*z^5 - 588*x^2*z^6 + 140*x*z^7 - 15*z^8 - 
         840*x^7*z*Log[x] + 840*x^7*z*Log[z]))/(840*x^7*(x - z)^9)) + 
    \[Delta]2^3*((-12*x^5 - 65*x^4*z + 120*x^3*z^2 - 60*x^2*z^3 + 20*x*z^4 - 
        3*z^5 + 60*x^4*z*Log[x] - 60*x^4*z*Log[z])/(60*x^4*(x - z)^6) + 
      (\[Delta]1*(10*x^6 + 77*x^5*z - 150*x^4*z^2 + 100*x^3*z^3 - 
         50*x^2*z^4 + 15*x*z^5 - 2*z^6 - 60*x^5*z*Log[x] + 60*x^5*z*Log[z]))/
       (60*x^5*(x - z)^7) + (\[Delta]1^2*(-60*x^7 - 609*x^6*z + 
         1260*x^5*z^2 - 1050*x^4*z^3 + 700*x^3*z^4 - 315*x^2*z^5 + 84*x*z^6 - 
         10*z^7 + 420*x^6*z*Log[x] - 420*x^6*z*Log[z]))/(420*x^6*(x - z)^8) + 
      (\[Delta]1^3*(105*x^8 + 1338*x^7*z - 2940*x^6*z^2 + 2940*x^5*z^3 - 
         2450*x^4*z^4 + 1470*x^3*z^5 - 588*x^2*z^6 + 140*x*z^7 - 15*z^8 - 
         840*x^7*z*Log[x] + 840*x^7*z*Log[z]))/(840*x^7*(x - z)^9) + 
      (\[Delta]1^4*(-280*x^9 - 4329*x^8*z + 10080*x^7*z^2 - 11760*x^6*z^3 + 
         11760*x^5*z^4 - 8820*x^4*z^5 + 4704*x^3*z^6 - 1680*x^2*z^7 + 
         360*x*z^8 - 35*z^9 + 2520*x^8*z*Log[x] - 2520*x^8*z*Log[z]))/
       (2520*x^8*(x - z)^10)) + \[Delta]2^4*
     ((10*x^6 + 77*x^5*z - 150*x^4*z^2 + 100*x^3*z^3 - 50*x^2*z^4 + 
        15*x*z^5 - 2*z^6 - 60*x^5*z*Log[x] + 60*x^5*z*Log[z])/
       (60*x^5*(x - z)^7) + (\[Delta]1*(-60*x^7 - 609*x^6*z + 1260*x^5*z^2 - 
         1050*x^4*z^3 + 700*x^3*z^4 - 315*x^2*z^5 + 84*x*z^6 - 10*z^7 + 
         420*x^6*z*Log[x] - 420*x^6*z*Log[z]))/(420*x^6*(x - z)^8) + 
      (\[Delta]1^2*(105*x^8 + 1338*x^7*z - 2940*x^6*z^2 + 2940*x^5*z^3 - 
         2450*x^4*z^4 + 1470*x^3*z^5 - 588*x^2*z^6 + 140*x*z^7 - 15*z^8 - 
         840*x^7*z*Log[x] + 840*x^7*z*Log[z]))/(840*x^7*(x - z)^9) + 
      (\[Delta]1^3*(-280*x^9 - 4329*x^8*z + 10080*x^7*z^2 - 11760*x^6*z^3 + 
         11760*x^5*z^4 - 8820*x^4*z^5 + 4704*x^3*z^6 - 1680*x^2*z^7 + 
         360*x*z^8 - 35*z^9 + 2520*x^8*z*Log[x] - 2520*x^8*z*Log[z]))/
       (2520*x^8*(x - z)^10) + (\[Delta]1^4*(252*x^10 + 4609*x^9*z - 
         11340*x^8*z^2 + 15120*x^7*z^3 - 17640*x^6*z^4 + 15876*x^5*z^5 - 
         10584*x^4*z^6 + 5040*x^3*z^7 - 1620*x^2*z^8 + 315*x*z^9 - 28*z^10 - 
         2520*x^9*z*Log[x] + 2520*x^9*z*Log[z]))/(2520*x^9*(x - z)^11))
D0funcd123[x_, w_, \[Delta]1_, \[Delta]2_] := 
   (w^2 - x^2 - 2*w*x*Log[w] + 2*w*x*Log[x])/(2*(w - x)^3*x) - 
    (\[Delta]1*(w^3 - 6*w^2*x + 3*w*x^2 + 2*x^3 + 6*w*x^2*Log[w] - 
       6*w*x^2*Log[x]))/(6*(w - x)^4*x^2) + 
    (\[Delta]1^2*(w^4 - 6*w^3*x + 18*w^2*x^2 - 10*w*x^3 - 3*x^4 - 
       12*w*x^3*Log[w] + 12*w*x^3*Log[x]))/(12*(w - x)^5*x^3) + 
    (\[Delta]1^3*(-3*w^5 + 20*w^4*x - 60*w^3*x^2 + 120*w^2*x^3 - 65*w*x^4 - 
       12*x^5 - 60*w*x^4*Log[w] + 60*w*x^4*Log[x]))/(60*(w - x)^6*x^4) + 
    (\[Delta]1^4*(2*w^6 - 15*w^5*x + 50*w^4*x^2 - 100*w^3*x^3 + 150*w^2*x^4 - 
       77*w*x^5 - 10*x^6 - 60*w*x^5*Log[w] + 60*w*x^5*Log[x]))/
     (60*(w - x)^7*x^5) + \[Delta]2*
     ((-w^3 + 6*w^2*x - 3*w*x^2 - 2*x^3 - 6*w*x^2*Log[w] + 6*w*x^2*Log[x])/
       (6*(w - x)^4*x^2) + (\[Delta]1*(w^4 - 6*w^3*x + 18*w^2*x^2 - 
         10*w*x^3 - 3*x^4 - 12*w*x^3*Log[w] + 12*w*x^3*Log[x]))/
       (12*(w - x)^5*x^3) + (\[Delta]1^2*(-3*w^5 + 20*w^4*x - 60*w^3*x^2 + 
         120*w^2*x^3 - 65*w*x^4 - 12*x^5 - 60*w*x^4*Log[w] + 
         60*w*x^4*Log[x]))/(60*(w - x)^6*x^4) + 
      (\[Delta]1^3*(2*w^6 - 15*w^5*x + 50*w^4*x^2 - 100*w^3*x^3 + 
         150*w^2*x^4 - 77*w*x^5 - 10*x^6 - 60*w*x^5*Log[w] + 
         60*w*x^5*Log[x]))/(60*(w - x)^7*x^5) + 
      (\[Delta]1^4*(-10*w^7 + 84*w^6*x - 315*w^5*x^2 + 700*w^4*x^3 - 
         1050*w^3*x^4 + 1260*w^2*x^5 - 609*w*x^6 - 60*x^7 - 
         420*w*x^6*Log[w] + 420*w*x^6*Log[x]))/(420*(w - x)^8*x^6)) + 
    \[Delta]2^2*((w^4 - 6*w^3*x + 18*w^2*x^2 - 10*w*x^3 - 3*x^4 - 
        12*w*x^3*Log[w] + 12*w*x^3*Log[x])/(12*(w - x)^5*x^3) + 
      (\[Delta]1*(-3*w^5 + 20*w^4*x - 60*w^3*x^2 + 120*w^2*x^3 - 65*w*x^4 - 
         12*x^5 - 60*w*x^4*Log[w] + 60*w*x^4*Log[x]))/(60*(w - x)^6*x^4) + 
      (\[Delta]1^2*(2*w^6 - 15*w^5*x + 50*w^4*x^2 - 100*w^3*x^3 + 
         150*w^2*x^4 - 77*w*x^5 - 10*x^6 - 60*w*x^5*Log[w] + 
         60*w*x^5*Log[x]))/(60*(w - x)^7*x^5) + 
      (\[Delta]1^3*(-10*w^7 + 84*w^6*x - 315*w^5*x^2 + 700*w^4*x^3 - 
         1050*w^3*x^4 + 1260*w^2*x^5 - 609*w*x^6 - 60*x^7 - 
         420*w*x^6*Log[w] + 420*w*x^6*Log[x]))/(420*(w - x)^8*x^6) + 
      (\[Delta]1^4*(15*w^8 - 140*w^7*x + 588*w^6*x^2 - 1470*w^5*x^3 + 
         2450*w^4*x^4 - 2940*w^3*x^5 + 2940*w^2*x^6 - 1338*w*x^7 - 105*x^8 - 
         840*w*x^7*Log[w] + 840*w*x^7*Log[x]))/(840*(w - x)^9*x^7)) + 
    \[Delta]2^3*((-3*w^5 + 20*w^4*x - 60*w^3*x^2 + 120*w^2*x^3 - 65*w*x^4 - 
        12*x^5 - 60*w*x^4*Log[w] + 60*w*x^4*Log[x])/(60*(w - x)^6*x^4) + 
      (\[Delta]1*(2*w^6 - 15*w^5*x + 50*w^4*x^2 - 100*w^3*x^3 + 150*w^2*x^4 - 
         77*w*x^5 - 10*x^6 - 60*w*x^5*Log[w] + 60*w*x^5*Log[x]))/
       (60*(w - x)^7*x^5) + (\[Delta]1^2*(-10*w^7 + 84*w^6*x - 315*w^5*x^2 + 
         700*w^4*x^3 - 1050*w^3*x^4 + 1260*w^2*x^5 - 609*w*x^6 - 60*x^7 - 
         420*w*x^6*Log[w] + 420*w*x^6*Log[x]))/(420*(w - x)^8*x^6) + 
      (\[Delta]1^3*(15*w^8 - 140*w^7*x + 588*w^6*x^2 - 1470*w^5*x^3 + 
         2450*w^4*x^4 - 2940*w^3*x^5 + 2940*w^2*x^6 - 1338*w*x^7 - 105*x^8 - 
         840*w*x^7*Log[w] + 840*w*x^7*Log[x]))/(840*(w - x)^9*x^7) + 
      (\[Delta]1^4*(-35*w^9 + 360*w^8*x - 1680*w^7*x^2 + 4704*w^6*x^3 - 
         8820*w^5*x^4 + 11760*w^4*x^5 - 11760*w^3*x^6 + 10080*w^2*x^7 - 
         4329*w*x^8 - 280*x^9 - 2520*w*x^8*Log[w] + 2520*w*x^8*Log[x]))/
       (2520*(w - x)^10*x^8)) + \[Delta]2^4*
     ((2*w^6 - 15*w^5*x + 50*w^4*x^2 - 100*w^3*x^3 + 150*w^2*x^4 - 77*w*x^5 - 
        10*x^6 - 60*w*x^5*Log[w] + 60*w*x^5*Log[x])/(60*(w - x)^7*x^5) + 
      (\[Delta]1*(-10*w^7 + 84*w^6*x - 315*w^5*x^2 + 700*w^4*x^3 - 
         1050*w^3*x^4 + 1260*w^2*x^5 - 609*w*x^6 - 60*x^7 - 
         420*w*x^6*Log[w] + 420*w*x^6*Log[x]))/(420*(w - x)^8*x^6) + 
      (\[Delta]1^2*(15*w^8 - 140*w^7*x + 588*w^6*x^2 - 1470*w^5*x^3 + 
         2450*w^4*x^4 - 2940*w^3*x^5 + 2940*w^2*x^6 - 1338*w*x^7 - 105*x^8 - 
         840*w*x^7*Log[w] + 840*w*x^7*Log[x]))/(840*(w - x)^9*x^7) + 
      (\[Delta]1^3*(-35*w^9 + 360*w^8*x - 1680*w^7*x^2 + 4704*w^6*x^3 - 
         8820*w^5*x^4 + 11760*w^4*x^5 - 11760*w^3*x^6 + 10080*w^2*x^7 - 
         4329*w*x^8 - 280*x^9 - 2520*w*x^8*Log[w] + 2520*w*x^8*Log[x]))/
       (2520*(w - x)^10*x^8) + (\[Delta]1^4*(28*w^10 - 315*w^9*x + 
         1620*w^8*x^2 - 5040*w^7*x^3 + 10584*w^6*x^4 - 15876*w^5*x^5 + 
         17640*w^4*x^6 - 15120*w^3*x^7 + 11340*w^2*x^8 - 4609*w*x^9 - 
         252*x^10 - 2520*w*x^9*Log[w] + 2520*w*x^9*Log[x]))/
       (2520*(w - x)^11*x^9))
D0funcd12d34[x_, z_, \[Delta]1_, \[Delta]2_] := 
   (-2*x + 2*z + x*Log[x] + z*Log[x] - x*Log[z] - z*Log[z])/(x - z)^3 - 
    (\[Delta]1*(-5*x^2 + 4*x*z + z^2 + 2*x^2*Log[x] + 4*x*z*Log[x] - 
       2*x^2*Log[z] - 4*x*z*Log[z]))/(2*x*(x - z)^4) + 
    (\[Delta]1^2*(-17*x^3 + 9*x^2*z + 9*x*z^2 - z^3 + 6*x^3*Log[x] + 
       18*x^2*z*Log[x] - 6*x^3*Log[z] - 18*x^2*z*Log[z]))/(6*x^2*(x - z)^5) - 
    (\[Delta]1^3*(-37*x^4 + 8*x^3*z + 36*x^2*z^2 - 8*x*z^3 + z^4 + 
       12*x^4*Log[x] + 48*x^3*z*Log[x] - 12*x^4*Log[z] - 48*x^3*z*Log[z]))/
     (12*x^3*(x - z)^6) + (\[Delta]1^4*(-197*x^5 - 25*x^4*z + 300*x^3*z^2 - 
       100*x^2*z^3 + 25*x*z^4 - 3*z^5 + 60*x^5*Log[x] + 300*x^4*z*Log[x] - 
       60*x^5*Log[z] - 300*x^4*z*Log[z]))/(60*x^4*(x - z)^7) + 
    \[Delta]2*((-x^2 - 4*x*z + 5*z^2 + 4*x*z*Log[x] + 2*z^2*Log[x] - 
        4*x*z*Log[z] - 2*z^2*Log[z])/(2*(x - z)^4*z) + 
      (\[Delta]1*(x^3 + 9*x^2*z - 9*x*z^2 - z^3 - 6*x^2*z*Log[x] - 
         6*x*z^2*Log[x] + 6*x^2*z*Log[z] + 6*x*z^2*Log[z]))/
       (2*x*(x - z)^5*z) - (\[Delta]1^2*(3*x^4 + 44*x^3*z - 36*x^2*z^2 - 
         12*x*z^3 + z^4 - 24*x^3*z*Log[x] - 36*x^2*z^2*Log[x] + 
         24*x^3*z*Log[z] + 36*x^2*z^2*Log[z]))/(6*x^2*(x - z)^6*z) + 
      (\[Delta]1^3*(6*x^5 + 125*x^4*z - 80*x^3*z^2 - 60*x^2*z^3 + 10*x*z^4 - 
         z^5 - 60*x^4*z*Log[x] - 120*x^3*z^2*Log[x] + 60*x^4*z*Log[z] + 
         120*x^3*z^2*Log[z]))/(12*x^3*(x - z)^7*z) - 
      (\[Delta]1^4*(10*x^6 + 274*x^5*z - 125*x^4*z^2 - 200*x^3*z^3 + 
         50*x^2*z^4 - 10*x*z^5 + z^6 - 120*x^5*z*Log[x] - 
         300*x^4*z^2*Log[x] + 120*x^5*z*Log[z] + 300*x^4*z^2*Log[z]))/
       (20*x^4*(x - z)^8*z)) + \[Delta]2^2*
     ((x^3 - 9*x^2*z - 9*x*z^2 + 17*z^3 + 18*x*z^2*Log[x] + 6*z^3*Log[x] - 
        18*x*z^2*Log[z] - 6*z^3*Log[z])/(6*(x - z)^5*z^2) - 
      (\[Delta]1*(x^4 - 12*x^3*z - 36*x^2*z^2 + 44*x*z^3 + 3*z^4 + 
         36*x^2*z^2*Log[x] + 24*x*z^3*Log[x] - 36*x^2*z^2*Log[z] - 
         24*x*z^3*Log[z]))/(6*x*(x - z)^6*z^2) + 
      (\[Delta]1^2*(x^5 - 15*x^4*z - 80*x^3*z^2 + 80*x^2*z^3 + 15*x*z^4 - 
         z^5 + 60*x^3*z^2*Log[x] + 60*x^2*z^3*Log[x] - 60*x^3*z^2*Log[z] - 
         60*x^2*z^3*Log[z]))/(6*x^2*(x - z)^7*z^2) - 
      (\[Delta]1^3*(2*x^6 - 36*x^5*z - 285*x^4*z^2 + 240*x^3*z^3 + 
         90*x^2*z^4 - 12*x*z^5 + z^6 + 180*x^4*z^2*Log[x] + 
         240*x^3*z^3*Log[x] - 180*x^4*z^2*Log[z] - 240*x^3*z^3*Log[z]))/
       (12*x^3*(x - z)^8*z^2) + (\[Delta]1^4*(10*x^7 - 210*x^6*z - 
         2247*x^5*z^2 + 1575*x^4*z^3 + 1050*x^3*z^4 - 210*x^2*z^5 + 
         35*x*z^6 - 3*z^7 + 1260*x^5*z^2*Log[x] + 2100*x^4*z^3*Log[x] - 
         1260*x^5*z^2*Log[z] - 2100*x^4*z^3*Log[z]))/(60*x^4*(x - z)^9*
        z^2)) + \[Delta]2^3*((-x^4 + 8*x^3*z - 36*x^2*z^2 - 8*x*z^3 + 
        37*z^4 + 48*x*z^3*Log[x] + 12*z^4*Log[x] - 48*x*z^3*Log[z] - 
        12*z^4*Log[z])/(12*(x - z)^6*z^3) + 
      (\[Delta]1*(x^5 - 10*x^4*z + 60*x^3*z^2 + 80*x^2*z^3 - 125*x*z^4 - 
         6*z^5 - 120*x^2*z^3*Log[x] - 60*x*z^4*Log[x] + 120*x^2*z^3*Log[z] + 
         60*x*z^4*Log[z]))/(12*x*(x - z)^7*z^3) - 
      (\[Delta]1^2*(x^6 - 12*x^5*z + 90*x^4*z^2 + 240*x^3*z^3 - 285*x^2*z^4 - 
         36*x*z^5 + 2*z^6 - 240*x^3*z^3*Log[x] - 180*x^2*z^4*Log[x] + 
         240*x^3*z^3*Log[z] + 180*x^2*z^4*Log[z]))/(12*x^2*(x - z)^8*z^3) + 
      (\[Delta]1^3*(x^7 - 14*x^6*z + 126*x^5*z^2 + 525*x^4*z^3 - 
         525*x^3*z^4 - 126*x^2*z^5 + 14*x*z^6 - z^7 - 420*x^4*z^3*Log[x] - 
         420*x^3*z^4*Log[x] + 420*x^4*z^3*Log[z] + 420*x^3*z^4*Log[z]))/
       (12*x^3*(x - z)^9*z^3) + (\[Delta]1^4*(-5*x^8 + 80*x^7*z - 
         840*x^6*z^2 - 4872*x^5*z^3 + 4200*x^4*z^4 + 1680*x^3*z^5 - 
         280*x^2*z^6 + 40*x*z^7 - 3*z^8 + 3360*x^5*z^3*Log[x] + 
         4200*x^4*z^4*Log[x] - 3360*x^5*z^3*Log[z] - 4200*x^4*z^4*Log[z]))/
       (60*x^4*(x - z)^10*z^3)) + \[Delta]2^4*
     ((3*x^5 - 25*x^4*z + 100*x^3*z^2 - 300*x^2*z^3 + 25*x*z^4 + 197*z^5 + 
        300*x*z^4*Log[x] + 60*z^5*Log[x] - 300*x*z^4*Log[z] - 60*z^5*Log[z])/
       (60*(x - z)^7*z^4) - (\[Delta]1*(x^6 - 10*x^5*z + 50*x^4*z^2 - 
         200*x^3*z^3 - 125*x^2*z^4 + 274*x*z^5 + 10*z^6 + 
         300*x^2*z^4*Log[x] + 120*x*z^5*Log[x] - 300*x^2*z^4*Log[z] - 
         120*x*z^5*Log[z]))/(20*x*(x - z)^8*z^4) + 
      (\[Delta]1^2*(3*x^7 - 35*x^6*z + 210*x^5*z^2 - 1050*x^4*z^3 - 
         1575*x^3*z^4 + 2247*x^2*z^5 + 210*x*z^6 - 10*z^7 + 
         2100*x^3*z^4*Log[x] + 1260*x^2*z^5*Log[x] - 2100*x^3*z^4*Log[z] - 
         1260*x^2*z^5*Log[z]))/(60*x^2*(x - z)^9*z^4) + 
      (\[Delta]1^3*(-3*x^8 + 40*x^7*z - 280*x^6*z^2 + 1680*x^5*z^3 + 
         4200*x^4*z^4 - 4872*x^3*z^5 - 840*x^2*z^6 + 80*x*z^7 - 5*z^8 - 
         4200*x^4*z^4*Log[x] - 3360*x^3*z^5*Log[x] + 4200*x^4*z^4*Log[z] + 
         3360*x^3*z^5*Log[z]))/(60*x^3*(x - z)^10*z^4) + 
      (\[Delta]1^4*(x^9 - 15*x^8*z + 120*x^7*z^2 - 840*x^6*z^3 - 
         3024*x^5*z^4 + 3024*x^4*z^5 + 840*x^3*z^6 - 120*x^2*z^7 + 15*x*z^8 - 
         z^9 + 2520*x^5*z^4*Log[x] + 2520*x^4*z^5*Log[x] - 
         2520*x^5*z^4*Log[z] - 2520*x^4*z^5*Log[z]))/(20*x^4*(x - z)^11*z^4))
D0funcd13d24[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (-2*x + 2*y + x*Log[x] + y*Log[x] - x*Log[y] - y*Log[y])/(x - y)^3 - 
    (\[Delta]1*(-5*x^2 + 4*x*y + y^2 + 2*x^2*Log[x] + 4*x*y*Log[x] - 
       2*x^2*Log[y] - 4*x*y*Log[y]))/(2*x*(x - y)^4) + 
    (\[Delta]1^2*(-17*x^3 + 9*x^2*y + 9*x*y^2 - y^3 + 6*x^3*Log[x] + 
       18*x^2*y*Log[x] - 6*x^3*Log[y] - 18*x^2*y*Log[y]))/(6*x^2*(x - y)^5) - 
    (\[Delta]1^3*(-37*x^4 + 8*x^3*y + 36*x^2*y^2 - 8*x*y^3 + y^4 + 
       12*x^4*Log[x] + 48*x^3*y*Log[x] - 12*x^4*Log[y] - 48*x^3*y*Log[y]))/
     (12*x^3*(x - y)^6) + (\[Delta]1^4*(-197*x^5 - 25*x^4*y + 300*x^3*y^2 - 
       100*x^2*y^3 + 25*x*y^4 - 3*y^5 + 60*x^5*Log[x] + 300*x^4*y*Log[x] - 
       60*x^5*Log[y] - 300*x^4*y*Log[y]))/(60*x^4*(x - y)^7) + 
    \[Delta]2*((-x^2 - 4*x*y + 5*y^2 + 4*x*y*Log[x] + 2*y^2*Log[x] - 
        4*x*y*Log[y] - 2*y^2*Log[y])/(2*(x - y)^4*y) + 
      (\[Delta]1*(x^3 + 9*x^2*y - 9*x*y^2 - y^3 - 6*x^2*y*Log[x] - 
         6*x*y^2*Log[x] + 6*x^2*y*Log[y] + 6*x*y^2*Log[y]))/
       (2*x*(x - y)^5*y) - (\[Delta]1^2*(3*x^4 + 44*x^3*y - 36*x^2*y^2 - 
         12*x*y^3 + y^4 - 24*x^3*y*Log[x] - 36*x^2*y^2*Log[x] + 
         24*x^3*y*Log[y] + 36*x^2*y^2*Log[y]))/(6*x^2*(x - y)^6*y) + 
      (\[Delta]1^3*(6*x^5 + 125*x^4*y - 80*x^3*y^2 - 60*x^2*y^3 + 10*x*y^4 - 
         y^5 - 60*x^4*y*Log[x] - 120*x^3*y^2*Log[x] + 60*x^4*y*Log[y] + 
         120*x^3*y^2*Log[y]))/(12*x^3*(x - y)^7*y) - 
      (\[Delta]1^4*(10*x^6 + 274*x^5*y - 125*x^4*y^2 - 200*x^3*y^3 + 
         50*x^2*y^4 - 10*x*y^5 + y^6 - 120*x^5*y*Log[x] - 
         300*x^4*y^2*Log[x] + 120*x^5*y*Log[y] + 300*x^4*y^2*Log[y]))/
       (20*x^4*(x - y)^8*y)) + \[Delta]2^2*
     ((x^3 - 9*x^2*y - 9*x*y^2 + 17*y^3 + 18*x*y^2*Log[x] + 6*y^3*Log[x] - 
        18*x*y^2*Log[y] - 6*y^3*Log[y])/(6*(x - y)^5*y^2) - 
      (\[Delta]1*(x^4 - 12*x^3*y - 36*x^2*y^2 + 44*x*y^3 + 3*y^4 + 
         36*x^2*y^2*Log[x] + 24*x*y^3*Log[x] - 36*x^2*y^2*Log[y] - 
         24*x*y^3*Log[y]))/(6*x*(x - y)^6*y^2) + 
      (\[Delta]1^2*(x^5 - 15*x^4*y - 80*x^3*y^2 + 80*x^2*y^3 + 15*x*y^4 - 
         y^5 + 60*x^3*y^2*Log[x] + 60*x^2*y^3*Log[x] - 60*x^3*y^2*Log[y] - 
         60*x^2*y^3*Log[y]))/(6*x^2*(x - y)^7*y^2) - 
      (\[Delta]1^3*(2*x^6 - 36*x^5*y - 285*x^4*y^2 + 240*x^3*y^3 + 
         90*x^2*y^4 - 12*x*y^5 + y^6 + 180*x^4*y^2*Log[x] + 
         240*x^3*y^3*Log[x] - 180*x^4*y^2*Log[y] - 240*x^3*y^3*Log[y]))/
       (12*x^3*(x - y)^8*y^2) + (\[Delta]1^4*(10*x^7 - 210*x^6*y - 
         2247*x^5*y^2 + 1575*x^4*y^3 + 1050*x^3*y^4 - 210*x^2*y^5 + 
         35*x*y^6 - 3*y^7 + 1260*x^5*y^2*Log[x] + 2100*x^4*y^3*Log[x] - 
         1260*x^5*y^2*Log[y] - 2100*x^4*y^3*Log[y]))/(60*x^4*(x - y)^9*
        y^2)) + \[Delta]2^3*((-x^4 + 8*x^3*y - 36*x^2*y^2 - 8*x*y^3 + 
        37*y^4 + 48*x*y^3*Log[x] + 12*y^4*Log[x] - 48*x*y^3*Log[y] - 
        12*y^4*Log[y])/(12*(x - y)^6*y^3) + 
      (\[Delta]1*(x^5 - 10*x^4*y + 60*x^3*y^2 + 80*x^2*y^3 - 125*x*y^4 - 
         6*y^5 - 120*x^2*y^3*Log[x] - 60*x*y^4*Log[x] + 120*x^2*y^3*Log[y] + 
         60*x*y^4*Log[y]))/(12*x*(x - y)^7*y^3) - 
      (\[Delta]1^2*(x^6 - 12*x^5*y + 90*x^4*y^2 + 240*x^3*y^3 - 285*x^2*y^4 - 
         36*x*y^5 + 2*y^6 - 240*x^3*y^3*Log[x] - 180*x^2*y^4*Log[x] + 
         240*x^3*y^3*Log[y] + 180*x^2*y^4*Log[y]))/(12*x^2*(x - y)^8*y^3) + 
      (\[Delta]1^3*(x^7 - 14*x^6*y + 126*x^5*y^2 + 525*x^4*y^3 - 
         525*x^3*y^4 - 126*x^2*y^5 + 14*x*y^6 - y^7 - 420*x^4*y^3*Log[x] - 
         420*x^3*y^4*Log[x] + 420*x^4*y^3*Log[y] + 420*x^3*y^4*Log[y]))/
       (12*x^3*(x - y)^9*y^3) + (\[Delta]1^4*(-5*x^8 + 80*x^7*y - 
         840*x^6*y^2 - 4872*x^5*y^3 + 4200*x^4*y^4 + 1680*x^3*y^5 - 
         280*x^2*y^6 + 40*x*y^7 - 3*y^8 + 3360*x^5*y^3*Log[x] + 
         4200*x^4*y^4*Log[x] - 3360*x^5*y^3*Log[y] - 4200*x^4*y^4*Log[y]))/
       (60*x^4*(x - y)^10*y^3)) + \[Delta]2^4*
     ((3*x^5 - 25*x^4*y + 100*x^3*y^2 - 300*x^2*y^3 + 25*x*y^4 + 197*y^5 + 
        300*x*y^4*Log[x] + 60*y^5*Log[x] - 300*x*y^4*Log[y] - 60*y^5*Log[y])/
       (60*(x - y)^7*y^4) - (\[Delta]1*(x^6 - 10*x^5*y + 50*x^4*y^2 - 
         200*x^3*y^3 - 125*x^2*y^4 + 274*x*y^5 + 10*y^6 + 
         300*x^2*y^4*Log[x] + 120*x*y^5*Log[x] - 300*x^2*y^4*Log[y] - 
         120*x*y^5*Log[y]))/(20*x*(x - y)^8*y^4) + 
      (\[Delta]1^2*(3*x^7 - 35*x^6*y + 210*x^5*y^2 - 1050*x^4*y^3 - 
         1575*x^3*y^4 + 2247*x^2*y^5 + 210*x*y^6 - 10*y^7 + 
         2100*x^3*y^4*Log[x] + 1260*x^2*y^5*Log[x] - 2100*x^3*y^4*Log[y] - 
         1260*x^2*y^5*Log[y]))/(60*x^2*(x - y)^9*y^4) + 
      (\[Delta]1^3*(-3*x^8 + 40*x^7*y - 280*x^6*y^2 + 1680*x^5*y^3 + 
         4200*x^4*y^4 - 4872*x^3*y^5 - 840*x^2*y^6 + 80*x*y^7 - 5*y^8 - 
         4200*x^4*y^4*Log[x] - 3360*x^3*y^5*Log[x] + 4200*x^4*y^4*Log[y] + 
         3360*x^3*y^5*Log[y]))/(60*x^3*(x - y)^10*y^4) + 
      (\[Delta]1^4*(x^9 - 15*x^8*y + 120*x^7*y^2 - 840*x^6*y^3 - 
         3024*x^5*y^4 + 3024*x^4*y^5 + 840*x^3*y^6 - 120*x^2*y^7 + 15*x*y^8 - 
         y^9 + 2520*x^5*y^4*Log[x] + 2520*x^4*y^5*Log[x] - 
         2520*x^5*y^4*Log[y] - 2520*x^4*y^5*Log[y]))/(20*x^4*(x - y)^11*y^4))
D0funcd14d23[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (-2*x + 2*y + x*Log[x] + y*Log[x] - x*Log[y] - y*Log[y])/(x - y)^3 - 
    (\[Delta]1*(-5*x^2 + 4*x*y + y^2 + 2*x^2*Log[x] + 4*x*y*Log[x] - 
       2*x^2*Log[y] - 4*x*y*Log[y]))/(2*x*(x - y)^4) + 
    (\[Delta]1^2*(-17*x^3 + 9*x^2*y + 9*x*y^2 - y^3 + 6*x^3*Log[x] + 
       18*x^2*y*Log[x] - 6*x^3*Log[y] - 18*x^2*y*Log[y]))/(6*x^2*(x - y)^5) - 
    (\[Delta]1^3*(-37*x^4 + 8*x^3*y + 36*x^2*y^2 - 8*x*y^3 + y^4 + 
       12*x^4*Log[x] + 48*x^3*y*Log[x] - 12*x^4*Log[y] - 48*x^3*y*Log[y]))/
     (12*x^3*(x - y)^6) + (\[Delta]1^4*(-197*x^5 - 25*x^4*y + 300*x^3*y^2 - 
       100*x^2*y^3 + 25*x*y^4 - 3*y^5 + 60*x^5*Log[x] + 300*x^4*y*Log[x] - 
       60*x^5*Log[y] - 300*x^4*y*Log[y]))/(60*x^4*(x - y)^7) + 
    \[Delta]2*((-x^2 - 4*x*y + 5*y^2 + 4*x*y*Log[x] + 2*y^2*Log[x] - 
        4*x*y*Log[y] - 2*y^2*Log[y])/(2*(x - y)^4*y) + 
      (\[Delta]1*(x^3 + 9*x^2*y - 9*x*y^2 - y^3 - 6*x^2*y*Log[x] - 
         6*x*y^2*Log[x] + 6*x^2*y*Log[y] + 6*x*y^2*Log[y]))/
       (2*x*(x - y)^5*y) - (\[Delta]1^2*(3*x^4 + 44*x^3*y - 36*x^2*y^2 - 
         12*x*y^3 + y^4 - 24*x^3*y*Log[x] - 36*x^2*y^2*Log[x] + 
         24*x^3*y*Log[y] + 36*x^2*y^2*Log[y]))/(6*x^2*(x - y)^6*y) + 
      (\[Delta]1^3*(6*x^5 + 125*x^4*y - 80*x^3*y^2 - 60*x^2*y^3 + 10*x*y^4 - 
         y^5 - 60*x^4*y*Log[x] - 120*x^3*y^2*Log[x] + 60*x^4*y*Log[y] + 
         120*x^3*y^2*Log[y]))/(12*x^3*(x - y)^7*y) - 
      (\[Delta]1^4*(10*x^6 + 274*x^5*y - 125*x^4*y^2 - 200*x^3*y^3 + 
         50*x^2*y^4 - 10*x*y^5 + y^6 - 120*x^5*y*Log[x] - 
         300*x^4*y^2*Log[x] + 120*x^5*y*Log[y] + 300*x^4*y^2*Log[y]))/
       (20*x^4*(x - y)^8*y)) + \[Delta]2^2*
     ((x^3 - 9*x^2*y - 9*x*y^2 + 17*y^3 + 18*x*y^2*Log[x] + 6*y^3*Log[x] - 
        18*x*y^2*Log[y] - 6*y^3*Log[y])/(6*(x - y)^5*y^2) - 
      (\[Delta]1*(x^4 - 12*x^3*y - 36*x^2*y^2 + 44*x*y^3 + 3*y^4 + 
         36*x^2*y^2*Log[x] + 24*x*y^3*Log[x] - 36*x^2*y^2*Log[y] - 
         24*x*y^3*Log[y]))/(6*x*(x - y)^6*y^2) + 
      (\[Delta]1^2*(x^5 - 15*x^4*y - 80*x^3*y^2 + 80*x^2*y^3 + 15*x*y^4 - 
         y^5 + 60*x^3*y^2*Log[x] + 60*x^2*y^3*Log[x] - 60*x^3*y^2*Log[y] - 
         60*x^2*y^3*Log[y]))/(6*x^2*(x - y)^7*y^2) - 
      (\[Delta]1^3*(2*x^6 - 36*x^5*y - 285*x^4*y^2 + 240*x^3*y^3 + 
         90*x^2*y^4 - 12*x*y^5 + y^6 + 180*x^4*y^2*Log[x] + 
         240*x^3*y^3*Log[x] - 180*x^4*y^2*Log[y] - 240*x^3*y^3*Log[y]))/
       (12*x^3*(x - y)^8*y^2) + (\[Delta]1^4*(10*x^7 - 210*x^6*y - 
         2247*x^5*y^2 + 1575*x^4*y^3 + 1050*x^3*y^4 - 210*x^2*y^5 + 
         35*x*y^6 - 3*y^7 + 1260*x^5*y^2*Log[x] + 2100*x^4*y^3*Log[x] - 
         1260*x^5*y^2*Log[y] - 2100*x^4*y^3*Log[y]))/(60*x^4*(x - y)^9*
        y^2)) + \[Delta]2^3*((-x^4 + 8*x^3*y - 36*x^2*y^2 - 8*x*y^3 + 
        37*y^4 + 48*x*y^3*Log[x] + 12*y^4*Log[x] - 48*x*y^3*Log[y] - 
        12*y^4*Log[y])/(12*(x - y)^6*y^3) + 
      (\[Delta]1*(x^5 - 10*x^4*y + 60*x^3*y^2 + 80*x^2*y^3 - 125*x*y^4 - 
         6*y^5 - 120*x^2*y^3*Log[x] - 60*x*y^4*Log[x] + 120*x^2*y^3*Log[y] + 
         60*x*y^4*Log[y]))/(12*x*(x - y)^7*y^3) - 
      (\[Delta]1^2*(x^6 - 12*x^5*y + 90*x^4*y^2 + 240*x^3*y^3 - 285*x^2*y^4 - 
         36*x*y^5 + 2*y^6 - 240*x^3*y^3*Log[x] - 180*x^2*y^4*Log[x] + 
         240*x^3*y^3*Log[y] + 180*x^2*y^4*Log[y]))/(12*x^2*(x - y)^8*y^3) + 
      (\[Delta]1^3*(x^7 - 14*x^6*y + 126*x^5*y^2 + 525*x^4*y^3 - 
         525*x^3*y^4 - 126*x^2*y^5 + 14*x*y^6 - y^7 - 420*x^4*y^3*Log[x] - 
         420*x^3*y^4*Log[x] + 420*x^4*y^3*Log[y] + 420*x^3*y^4*Log[y]))/
       (12*x^3*(x - y)^9*y^3) + (\[Delta]1^4*(-5*x^8 + 80*x^7*y - 
         840*x^6*y^2 - 4872*x^5*y^3 + 4200*x^4*y^4 + 1680*x^3*y^5 - 
         280*x^2*y^6 + 40*x*y^7 - 3*y^8 + 3360*x^5*y^3*Log[x] + 
         4200*x^4*y^4*Log[x] - 3360*x^5*y^3*Log[y] - 4200*x^4*y^4*Log[y]))/
       (60*x^4*(x - y)^10*y^3)) + \[Delta]2^4*
     ((3*x^5 - 25*x^4*y + 100*x^3*y^2 - 300*x^2*y^3 + 25*x*y^4 + 197*y^5 + 
        300*x*y^4*Log[x] + 60*y^5*Log[x] - 300*x*y^4*Log[y] - 60*y^5*Log[y])/
       (60*(x - y)^7*y^4) - (\[Delta]1*(x^6 - 10*x^5*y + 50*x^4*y^2 - 
         200*x^3*y^3 - 125*x^2*y^4 + 274*x*y^5 + 10*y^6 + 
         300*x^2*y^4*Log[x] + 120*x*y^5*Log[x] - 300*x^2*y^4*Log[y] - 
         120*x*y^5*Log[y]))/(20*x*(x - y)^8*y^4) + 
      (\[Delta]1^2*(3*x^7 - 35*x^6*y + 210*x^5*y^2 - 1050*x^4*y^3 - 
         1575*x^3*y^4 + 2247*x^2*y^5 + 210*x*y^6 - 10*y^7 + 
         2100*x^3*y^4*Log[x] + 1260*x^2*y^5*Log[x] - 2100*x^3*y^4*Log[y] - 
         1260*x^2*y^5*Log[y]))/(60*x^2*(x - y)^9*y^4) + 
      (\[Delta]1^3*(-3*x^8 + 40*x^7*y - 280*x^6*y^2 + 1680*x^5*y^3 + 
         4200*x^4*y^4 - 4872*x^3*y^5 - 840*x^2*y^6 + 80*x*y^7 - 5*y^8 - 
         4200*x^4*y^4*Log[x] - 3360*x^3*y^5*Log[x] + 4200*x^4*y^4*Log[y] + 
         3360*x^3*y^5*Log[y]))/(60*x^3*(x - y)^10*y^4) + 
      (\[Delta]1^4*(x^9 - 15*x^8*y + 120*x^7*y^2 - 840*x^6*y^3 - 
         3024*x^5*y^4 + 3024*x^4*y^5 + 840*x^3*y^6 - 120*x^2*y^7 + 15*x*y^8 - 
         y^9 + 2520*x^5*y^4*Log[x] + 2520*x^4*y^5*Log[x] - 
         2520*x^5*y^4*Log[y] - 2520*x^4*y^5*Log[y]))/(20*x^4*(x - y)^11*y^4))
D0funcd14[x_, y_, z_, \[Epsilon]_] := 
   16*Pi^2*\[Epsilon]^4*((-137*x^10 + 300*x^9*y - 300*x^8*y^2 + 200*x^7*y^3 - 
        75*x^6*y^4 + 12*x^5*y^5 + 300*x^9*z - 45*x^8*y*z - 740*x^7*y^2*z + 
        780*x^6*y^3*z - 360*x^5*y^4*z + 65*x^4*y^5*z - 300*x^8*z^2 - 
        740*x^7*y*z^2 + 2280*x^6*y^2*z^2 - 1860*x^5*y^3*z^2 + 
        740*x^4*y^4*z^2 - 120*x^3*y^5*z^2 + 200*x^7*z^3 + 780*x^6*y*z^3 - 
        1860*x^5*y^2*z^3 + 1240*x^4*y^3*z^3 - 420*x^3*y^4*z^3 + 
        60*x^2*y^5*z^3 - 75*x^6*z^4 - 360*x^5*y*z^4 + 740*x^4*y^2*z^4 - 
        420*x^3*y^3*z^4 + 135*x^2*y^4*z^4 - 20*x*y^5*z^4 + 12*x^5*z^5 + 
        65*x^4*y*z^5 - 120*x^3*y^2*z^5 + 60*x^2*y^3*z^5 - 20*x*y^4*z^5 + 
        3*y^5*z^5 + 60*x^10*Log[x] - 900*x^8*y*z*Log[x] + 
        1200*x^7*y^2*z*Log[x] - 900*x^6*y^3*z*Log[x] + 360*x^5*y^4*z*Log[x] - 
        60*x^4*y^5*z*Log[x] + 1200*x^7*y*z^2*Log[x] - 
        900*x^6*y^2*z^2*Log[x] + 360*x^5*y^3*z^2*Log[x] - 
        60*x^4*y^4*z^2*Log[x] - 900*x^6*y*z^3*Log[x] + 
        360*x^5*y^2*z^3*Log[x] - 60*x^4*y^3*z^3*Log[x] + 
        360*x^5*y*z^4*Log[x] - 60*x^4*y^2*z^4*Log[x] - 60*x^4*y*z^5*Log[x])/
       (960*Pi^2*x^4*(x - y)^6*(x - z)^6) - (y*Log[y])/
       (16*Pi^2*(x - y)^6*(y - z)) - (z*Log[z])/(16*Pi^2*(x - z)^6*
        (-y + z))) + 16*Pi^2*\[Epsilon]^3*
     ((25*x^8 - 48*x^7*y + 36*x^6*y^2 - 16*x^5*y^3 + 3*x^4*y^4 - 48*x^7*z + 
        26*x^6*y*z + 54*x^5*y^2*z - 42*x^4*y^3*z + 10*x^3*y^4*z + 
        36*x^6*z^2 + 54*x^5*y*z^2 - 162*x^4*y^2*z^2 + 90*x^3*y^3*z^2 - 
        18*x^2*y^4*z^2 - 16*x^5*z^3 - 42*x^4*y*z^3 + 90*x^3*y^2*z^3 - 
        38*x^2*y^3*z^3 + 6*x*y^4*z^3 + 3*x^4*z^4 + 10*x^3*y*z^4 - 
        18*x^2*y^2*z^4 + 6*x*y^3*z^4 - y^4*z^4 - 12*x^8*Log[x] + 
        120*x^6*y*z*Log[x] - 120*x^5*y^2*z*Log[x] + 60*x^4*y^3*z*Log[x] - 
        12*x^3*y^4*z*Log[x] - 120*x^5*y*z^2*Log[x] + 60*x^4*y^2*z^2*Log[x] - 
        12*x^3*y^3*z^2*Log[x] + 60*x^4*y*z^3*Log[x] - 12*x^3*y^2*z^3*Log[x] - 
        12*x^3*y*z^4*Log[x])/(192*Pi^2*x^3*(x - y)^5*(x - z)^5) + 
      (y*Log[y])/(16*Pi^2*(x - y)^5*(y - z)) + 
      (z*Log[z])/(16*Pi^2*(x - z)^5*(-y + z))) + 16*Pi^2*\[Epsilon]^2*
     ((-11*x^6 + 18*x^5*y - 9*x^4*y^2 + 2*x^3*y^3 + 18*x^5*z - 15*x^4*y*z - 
        6*x^3*y^2*z + 3*x^2*y^3*z - 9*x^4*z^2 - 6*x^3*y*z^2 + 
        21*x^2*y^2*z^2 - 6*x*y^3*z^2 + 2*x^3*z^3 + 3*x^2*y*z^3 - 
        6*x*y^2*z^3 + y^3*z^3 + 6*x^6*Log[x] - 36*x^4*y*z*Log[x] + 
        24*x^3*y^2*z*Log[x] - 6*x^2*y^3*z*Log[x] + 24*x^3*y*z^2*Log[x] - 
        6*x^2*y^2*z^2*Log[x] - 6*x^2*y*z^3*Log[x])/(96*Pi^2*x^2*(x - y)^4*
        (x - z)^4) - (y*Log[y])/(16*Pi^2*(x - y)^4*(y - z)) - 
      (z*Log[z])/(16*Pi^2*(x - z)^4*(-y + z))) + 
    16*Pi^2*\[Epsilon]*((3*x^4 - 4*x^3*y + x^2*y^2 - 4*x^3*z + 4*x^2*y*z + 
        x^2*z^2 - y^2*z^2 - 2*x^4*Log[x] + 6*x^2*y*z*Log[x] - 
        2*x*y^2*z*Log[x] - 2*x*y*z^2*Log[x])/(32*Pi^2*x*(x - y)^3*
        (x - z)^3) + (y*Log[y])/(16*Pi^2*(x - y)^3*(y - z)) + 
      (z*Log[z])/(16*Pi^2*(x - z)^3*(-y + z))) + 
    16*Pi^2*((-x^2 + x*y + x*z - y*z + x^2*Log[x] - y*z*Log[x])/
       (16*Pi^2*(x - y)^2*(x - z)^2) - (y*Log[y])/(16*Pi^2*(x - y)^2*
        (y - z)) - (z*Log[z])/(16*Pi^2*(x - z)^2*(-y + z)))
D0funcd13[x_, y_, w_, \[Epsilon]_] := 
   16*Pi^2*\[Epsilon]^4*(-(w*Log[w])/(16*Pi^2*(w - x)^6*(w - y)) + 
      (12*w^5*x^5 - 75*w^4*x^6 + 200*w^3*x^7 - 300*w^2*x^8 + 300*w*x^9 - 
        137*x^10 + 65*w^5*x^4*y - 360*w^4*x^5*y + 780*w^3*x^6*y - 
        740*w^2*x^7*y - 45*w*x^8*y + 300*x^9*y - 120*w^5*x^3*y^2 + 
        740*w^4*x^4*y^2 - 1860*w^3*x^5*y^2 + 2280*w^2*x^6*y^2 - 
        740*w*x^7*y^2 - 300*x^8*y^2 + 60*w^5*x^2*y^3 - 420*w^4*x^3*y^3 + 
        1240*w^3*x^4*y^3 - 1860*w^2*x^5*y^3 + 780*w*x^6*y^3 + 200*x^7*y^3 - 
        20*w^5*x*y^4 + 135*w^4*x^2*y^4 - 420*w^3*x^3*y^4 + 740*w^2*x^4*y^4 - 
        360*w*x^5*y^4 - 75*x^6*y^4 + 3*w^5*y^5 - 20*w^4*x*y^5 + 
        60*w^3*x^2*y^5 - 120*w^2*x^3*y^5 + 65*w*x^4*y^5 + 12*x^5*y^5 + 
        60*x^10*Log[x] - 60*w^5*x^4*y*Log[x] + 360*w^4*x^5*y*Log[x] - 
        900*w^3*x^6*y*Log[x] + 1200*w^2*x^7*y*Log[x] - 900*w*x^8*y*Log[x] - 
        60*w^4*x^4*y^2*Log[x] + 360*w^3*x^5*y^2*Log[x] - 
        900*w^2*x^6*y^2*Log[x] + 1200*w*x^7*y^2*Log[x] - 
        60*w^3*x^4*y^3*Log[x] + 360*w^2*x^5*y^3*Log[x] - 
        900*w*x^6*y^3*Log[x] - 60*w^2*x^4*y^4*Log[x] + 360*w*x^5*y^4*Log[x] - 
        60*w*x^4*y^5*Log[x])/(960*Pi^2*x^4*(-w + x)^6*(x - y)^6) - 
      (y*Log[y])/(16*Pi^2*(x - y)^6*(-w + y))) + 16*Pi^2*\[Epsilon]^3*
     (-(w*Log[w])/(16*Pi^2*(w - x)^5*(w - y)) + 
      (3*w^4*x^4 - 16*w^3*x^5 + 36*w^2*x^6 - 48*w*x^7 + 25*x^8 + 
        10*w^4*x^3*y - 42*w^3*x^4*y + 54*w^2*x^5*y + 26*w*x^6*y - 48*x^7*y - 
        18*w^4*x^2*y^2 + 90*w^3*x^3*y^2 - 162*w^2*x^4*y^2 + 54*w*x^5*y^2 + 
        36*x^6*y^2 + 6*w^4*x*y^3 - 38*w^3*x^2*y^3 + 90*w^2*x^3*y^3 - 
        42*w*x^4*y^3 - 16*x^5*y^3 - w^4*y^4 + 6*w^3*x*y^4 - 18*w^2*x^2*y^4 + 
        10*w*x^3*y^4 + 3*x^4*y^4 - 12*x^8*Log[x] - 12*w^4*x^3*y*Log[x] + 
        60*w^3*x^4*y*Log[x] - 120*w^2*x^5*y*Log[x] + 120*w*x^6*y*Log[x] - 
        12*w^3*x^3*y^2*Log[x] + 60*w^2*x^4*y^2*Log[x] - 
        120*w*x^5*y^2*Log[x] - 12*w^2*x^3*y^3*Log[x] + 60*w*x^4*y^3*Log[x] - 
        12*w*x^3*y^4*Log[x])/(192*Pi^2*x^3*(-w + x)^5*(x - y)^5) + 
      (y*Log[y])/(16*Pi^2*(x - y)^5*(-w + y))) + 16*Pi^2*\[Epsilon]^2*
     (-(w*Log[w])/(16*Pi^2*(w - x)^4*(w - y)) + 
      (2*w^3*x^3 - 9*w^2*x^4 + 18*w*x^5 - 11*x^6 + 3*w^3*x^2*y - 
        6*w^2*x^3*y - 15*w*x^4*y + 18*x^5*y - 6*w^3*x*y^2 + 21*w^2*x^2*y^2 - 
        6*w*x^3*y^2 - 9*x^4*y^2 + w^3*y^3 - 6*w^2*x*y^3 + 3*w*x^2*y^3 + 
        2*x^3*y^3 + 6*x^6*Log[x] - 6*w^3*x^2*y*Log[x] + 24*w^2*x^3*y*Log[x] - 
        36*w*x^4*y*Log[x] - 6*w^2*x^2*y^2*Log[x] + 24*w*x^3*y^2*Log[x] - 
        6*w*x^2*y^3*Log[x])/(96*Pi^2*x^2*(-w + x)^4*(x - y)^4) - 
      (y*Log[y])/(16*Pi^2*(x - y)^4*(-w + y))) + 
    16*Pi^2*\[Epsilon]*(-(w*Log[w])/(16*Pi^2*(w - x)^3*(w - y)) + 
      (w^2*x^2 - 4*w*x^3 + 3*x^4 + 4*w*x^2*y - 4*x^3*y - w^2*y^2 + x^2*y^2 - 
        2*x^4*Log[x] - 2*w^2*x*y*Log[x] + 6*w*x^2*y*Log[x] - 
        2*w*x*y^2*Log[x])/(32*Pi^2*x*(-w + x)^3*(x - y)^3) + 
      (y*Log[y])/(16*Pi^2*(x - y)^3*(-w + y))) + 
    16*Pi^2*(-(w*Log[w])/(16*Pi^2*(w - x)^2*(w - y)) + 
      (w*x - x^2 - w*y + x*y + x^2*Log[x] - w*y*Log[x])/
       (16*Pi^2*(w - x)^2*(x - y)^2) - (y*Log[y])/(16*Pi^2*(x - y)^2*
        (-w + y)))
D0funcd12[x_, z_, w_, \[Epsilon]_] := 
   16*Pi^2*\[Epsilon]^4*(-(w*Log[w])/(16*Pi^2*(w - x)^6*(w - z)) + 
      (12*w^5*x^5 - 75*w^4*x^6 + 200*w^3*x^7 - 300*w^2*x^8 + 300*w*x^9 - 
        137*x^10 + 65*w^5*x^4*z - 360*w^4*x^5*z + 780*w^3*x^6*z - 
        740*w^2*x^7*z - 45*w*x^8*z + 300*x^9*z - 120*w^5*x^3*z^2 + 
        740*w^4*x^4*z^2 - 1860*w^3*x^5*z^2 + 2280*w^2*x^6*z^2 - 
        740*w*x^7*z^2 - 300*x^8*z^2 + 60*w^5*x^2*z^3 - 420*w^4*x^3*z^3 + 
        1240*w^3*x^4*z^3 - 1860*w^2*x^5*z^3 + 780*w*x^6*z^3 + 200*x^7*z^3 - 
        20*w^5*x*z^4 + 135*w^4*x^2*z^4 - 420*w^3*x^3*z^4 + 740*w^2*x^4*z^4 - 
        360*w*x^5*z^4 - 75*x^6*z^4 + 3*w^5*z^5 - 20*w^4*x*z^5 + 
        60*w^3*x^2*z^5 - 120*w^2*x^3*z^5 + 65*w*x^4*z^5 + 12*x^5*z^5 + 
        60*x^10*Log[x] - 60*w^5*x^4*z*Log[x] + 360*w^4*x^5*z*Log[x] - 
        900*w^3*x^6*z*Log[x] + 1200*w^2*x^7*z*Log[x] - 900*w*x^8*z*Log[x] - 
        60*w^4*x^4*z^2*Log[x] + 360*w^3*x^5*z^2*Log[x] - 
        900*w^2*x^6*z^2*Log[x] + 1200*w*x^7*z^2*Log[x] - 
        60*w^3*x^4*z^3*Log[x] + 360*w^2*x^5*z^3*Log[x] - 
        900*w*x^6*z^3*Log[x] - 60*w^2*x^4*z^4*Log[x] + 360*w*x^5*z^4*Log[x] - 
        60*w*x^4*z^5*Log[x])/(960*Pi^2*x^4*(-w + x)^6*(x - z)^6) - 
      (z*Log[z])/(16*Pi^2*(x - z)^6*(-w + z))) + 16*Pi^2*\[Epsilon]^3*
     (-(w*Log[w])/(16*Pi^2*(w - x)^5*(w - z)) + 
      (3*w^4*x^4 - 16*w^3*x^5 + 36*w^2*x^6 - 48*w*x^7 + 25*x^8 + 
        10*w^4*x^3*z - 42*w^3*x^4*z + 54*w^2*x^5*z + 26*w*x^6*z - 48*x^7*z - 
        18*w^4*x^2*z^2 + 90*w^3*x^3*z^2 - 162*w^2*x^4*z^2 + 54*w*x^5*z^2 + 
        36*x^6*z^2 + 6*w^4*x*z^3 - 38*w^3*x^2*z^3 + 90*w^2*x^3*z^3 - 
        42*w*x^4*z^3 - 16*x^5*z^3 - w^4*z^4 + 6*w^3*x*z^4 - 18*w^2*x^2*z^4 + 
        10*w*x^3*z^4 + 3*x^4*z^4 - 12*x^8*Log[x] - 12*w^4*x^3*z*Log[x] + 
        60*w^3*x^4*z*Log[x] - 120*w^2*x^5*z*Log[x] + 120*w*x^6*z*Log[x] - 
        12*w^3*x^3*z^2*Log[x] + 60*w^2*x^4*z^2*Log[x] - 
        120*w*x^5*z^2*Log[x] - 12*w^2*x^3*z^3*Log[x] + 60*w*x^4*z^3*Log[x] - 
        12*w*x^3*z^4*Log[x])/(192*Pi^2*x^3*(-w + x)^5*(x - z)^5) + 
      (z*Log[z])/(16*Pi^2*(x - z)^5*(-w + z))) + 16*Pi^2*\[Epsilon]^2*
     (-(w*Log[w])/(16*Pi^2*(w - x)^4*(w - z)) + 
      (2*w^3*x^3 - 9*w^2*x^4 + 18*w*x^5 - 11*x^6 + 3*w^3*x^2*z - 
        6*w^2*x^3*z - 15*w*x^4*z + 18*x^5*z - 6*w^3*x*z^2 + 21*w^2*x^2*z^2 - 
        6*w*x^3*z^2 - 9*x^4*z^2 + w^3*z^3 - 6*w^2*x*z^3 + 3*w*x^2*z^3 + 
        2*x^3*z^3 + 6*x^6*Log[x] - 6*w^3*x^2*z*Log[x] + 24*w^2*x^3*z*Log[x] - 
        36*w*x^4*z*Log[x] - 6*w^2*x^2*z^2*Log[x] + 24*w*x^3*z^2*Log[x] - 
        6*w*x^2*z^3*Log[x])/(96*Pi^2*x^2*(-w + x)^4*(x - z)^4) - 
      (z*Log[z])/(16*Pi^2*(x - z)^4*(-w + z))) + 
    16*Pi^2*\[Epsilon]*(-(w*Log[w])/(16*Pi^2*(w - x)^3*(w - z)) + 
      (w^2*x^2 - 4*w*x^3 + 3*x^4 + 4*w*x^2*z - 4*x^3*z - w^2*z^2 + x^2*z^2 - 
        2*x^4*Log[x] - 2*w^2*x*z*Log[x] + 6*w*x^2*z*Log[x] - 
        2*w*x*z^2*Log[x])/(32*Pi^2*x*(-w + x)^3*(x - z)^3) + 
      (z*Log[z])/(16*Pi^2*(x - z)^3*(-w + z))) + 
    16*Pi^2*(-(w*Log[w])/(16*Pi^2*(w - x)^2*(w - z)) + 
      (w*x - x^2 - w*z + x*z + x^2*Log[x] - w*z*Log[x])/
       (16*Pi^2*(w - x)^2*(x - z)^2) - (z*Log[z])/(16*Pi^2*(x - z)^2*
        (-w + z)))
D0funcd24[x_, y_, z_, \[Epsilon]_] := 
   16*Pi^2*\[Epsilon]^4*(-(x*Log[x])/(16*Pi^2*(x - y)^6*(x - z)) + 
      ((y/((x - y)*(y - z)^5) - ((x - y)^(-1) + y/(x - y)^2)/(y - z)^4 + 
          ((x - y)^(-2) + y/(x - y)^3)/(y - z)^3 - 
          ((x - y)^(-3) + y/(x - y)^4)/(y - z)^2 + 
          ((x - y)^(-4) + y/(x - y)^5)/(y - z))/y - 
        (-(y/((x - y)*(y - z)^4)) + ((x - y)^(-1) + y/(x - y)^2)/(y - z)^3 - 
          ((x - y)^(-2) + y/(x - y)^3)/(y - z)^2 + 
          ((x - y)^(-3) + y/(x - y)^4)/(y - z))/(2*y^2) + 
        (y/((x - y)*(y - z)^3) - ((x - y)^(-1) + y/(x - y)^2)/(y - z)^2 + 
          ((x - y)^(-2) + y/(x - y)^3)/(y - z))/(3*y^3) - 
        (-(y/((x - y)*(y - z)^2)) + ((x - y)^(-1) + y/(x - y)^2)/(y - z))/
         (4*y^4) + 1/(5*(x - y)*y^4*(y - z)) + 
        (-(y/((x - y)*(y - z)^6)) + ((x - y)^(-1) + y/(x - y)^2)/(y - z)^5 - 
          ((x - y)^(-2) + y/(x - y)^3)/(y - z)^4 + 
          ((x - y)^(-3) + y/(x - y)^4)/(y - z)^3 - 
          ((x - y)^(-4) + y/(x - y)^5)/(y - z)^2 + 
          ((x - y)^(-5) + y/(x - y)^6)/(y - z))*Log[y])/(16*Pi^2) + 
      (z*Log[z])/(16*Pi^2*(x - z)*(-y + z)^6)) + 16*Pi^2*\[Epsilon]^3*
     (-(x*Log[x])/(16*Pi^2*(x - y)^5*(x - z)) + 
      (3*x^4*y^4 - 16*x^3*y^5 + 36*x^2*y^6 - 48*x*y^7 + 25*y^8 + 
        10*x^4*y^3*z - 42*x^3*y^4*z + 54*x^2*y^5*z + 26*x*y^6*z - 48*y^7*z - 
        18*x^4*y^2*z^2 + 90*x^3*y^3*z^2 - 162*x^2*y^4*z^2 + 54*x*y^5*z^2 + 
        36*y^6*z^2 + 6*x^4*y*z^3 - 38*x^3*y^2*z^3 + 90*x^2*y^3*z^3 - 
        42*x*y^4*z^3 - 16*y^5*z^3 - x^4*z^4 + 6*x^3*y*z^4 - 18*x^2*y^2*z^4 + 
        10*x*y^3*z^4 + 3*y^4*z^4 - 12*y^8*Log[y] - 12*x^4*y^3*z*Log[y] + 
        60*x^3*y^4*z*Log[y] - 120*x^2*y^5*z*Log[y] + 120*x*y^6*z*Log[y] - 
        12*x^3*y^3*z^2*Log[y] + 60*x^2*y^4*z^2*Log[y] - 
        120*x*y^5*z^2*Log[y] - 12*x^2*y^3*z^3*Log[y] + 60*x*y^4*z^3*Log[y] - 
        12*x*y^3*z^4*Log[y])/(192*Pi^2*y^3*(-x + y)^5*(y - z)^5) + 
      (z*Log[z])/(16*Pi^2*(x - z)*(-y + z)^5)) + 16*Pi^2*\[Epsilon]^2*
     (-(x*Log[x])/(16*Pi^2*(x - y)^4*(x - z)) + 
      (2*x^3*y^3 - 9*x^2*y^4 + 18*x*y^5 - 11*y^6 + 3*x^3*y^2*z - 
        6*x^2*y^3*z - 15*x*y^4*z + 18*y^5*z - 6*x^3*y*z^2 + 21*x^2*y^2*z^2 - 
        6*x*y^3*z^2 - 9*y^4*z^2 + x^3*z^3 - 6*x^2*y*z^3 + 3*x*y^2*z^3 + 
        2*y^3*z^3 + 6*y^6*Log[y] - 6*x^3*y^2*z*Log[y] + 24*x^2*y^3*z*Log[y] - 
        36*x*y^4*z*Log[y] - 6*x^2*y^2*z^2*Log[y] + 24*x*y^3*z^2*Log[y] - 
        6*x*y^2*z^3*Log[y])/(96*Pi^2*y^2*(-x + y)^4*(y - z)^4) + 
      (z*Log[z])/(16*Pi^2*(x - z)*(-y + z)^4)) + 
    16*Pi^2*\[Epsilon]*(-(x*Log[x])/(16*Pi^2*(x - y)^3*(x - z)) + 
      (x^2*y^2 - 4*x*y^3 + 3*y^4 + 4*x*y^2*z - 4*y^3*z - x^2*z^2 + y^2*z^2 - 
        2*y^4*Log[y] - 2*x^2*y*z*Log[y] + 6*x*y^2*z*Log[y] - 
        2*x*y*z^2*Log[y])/(32*Pi^2*y*(-x + y)^3*(y - z)^3) + 
      (z*Log[z])/(16*Pi^2*(x - z)*(-y + z)^3)) + 
    16*Pi^2*(-(x*Log[x])/(16*Pi^2*(x - y)^2*(x - z)) + 
      (x*y - y^2 - x*z + y*z + y^2*Log[y] - x*z*Log[y])/
       (16*Pi^2*(x - y)^2*(y - z)^2) + (z*Log[z])/(16*Pi^2*(x - z)*
        (-y + z)^2))
D0funcd23[x_, y_, w_, \[Epsilon]_] := 
   16*Pi^2*((w*Log[w])/(16*Pi^2*(-w + x)*(w - y)^2) - 
      (x*Log[x])/(16*Pi^2*(-w + x)*(x - y)^2) + 
      (-(w*x) + w*y + x*y - y^2 - w*x*Log[y] + y^2*Log[y])/
       (16*Pi^2*(x - y)^2*(-w + y)^2)) + 16*Pi^2*\[Epsilon]*
     ((w*Log[w])/(16*Pi^2*(-w + x)*(w - y)^3) - 
      (x*Log[x])/(16*Pi^2*(-w + x)*(x - y)^3) + 
      (-(w^2*x^2) + w^2*y^2 + 4*w*x*y^2 + x^2*y^2 - 4*w*y^3 - 4*x*y^3 + 
        3*y^4 - 2*w^2*x*y*Log[y] - 2*w*x^2*y*Log[y] + 6*w*x*y^2*Log[y] - 
        2*y^4*Log[y])/(32*Pi^2*y*(-w + y)^3*(-x + y)^3)) + 
    16*Pi^2*\[Epsilon]^2*((w*Log[w])/(16*Pi^2*(-w + x)*(w - y)^4) - 
      (x*Log[x])/(16*Pi^2*(-w + x)*(x - y)^4) + 
      (w^3*x^3 - 6*w^3*x^2*y - 6*w^2*x^3*y + 3*w^3*x*y^2 + 21*w^2*x^2*y^2 + 
        3*w*x^3*y^2 + 2*w^3*y^3 - 6*w^2*x*y^3 - 6*w*x^2*y^3 + 2*x^3*y^3 - 
        9*w^2*y^4 - 15*w*x*y^4 - 9*x^2*y^4 + 18*w*y^5 + 18*x*y^5 - 11*y^6 - 
        6*w^3*x*y^2*Log[y] - 6*w^2*x^2*y^2*Log[y] - 6*w*x^3*y^2*Log[y] + 
        24*w^2*x*y^3*Log[y] + 24*w*x^2*y^3*Log[y] - 36*w*x*y^4*Log[y] + 
        6*y^6*Log[y])/(96*Pi^2*y^2*(-w + y)^4*(-x + y)^4)) + 
    16*Pi^2*\[Epsilon]^3*((w*Log[w])/(16*Pi^2*(-w + x)*(w - y)^5) - 
      (x*Log[x])/(16*Pi^2*(-w + x)*(x - y)^5) + 
      (-(w^4*x^4) + 6*w^4*x^3*y + 6*w^3*x^4*y - 18*w^4*x^2*y^2 - 
        38*w^3*x^3*y^2 - 18*w^2*x^4*y^2 + 10*w^4*x*y^3 + 90*w^3*x^2*y^3 + 
        90*w^2*x^3*y^3 + 10*w*x^4*y^3 + 3*w^4*y^4 - 42*w^3*x*y^4 - 
        162*w^2*x^2*y^4 - 42*w*x^3*y^4 + 3*x^4*y^4 - 16*w^3*y^5 + 
        54*w^2*x*y^5 + 54*w*x^2*y^5 - 16*x^3*y^5 + 36*w^2*y^6 + 26*w*x*y^6 + 
        36*x^2*y^6 - 48*w*y^7 - 48*x*y^7 + 25*y^8 - 12*w^4*x*y^3*Log[y] - 
        12*w^3*x^2*y^3*Log[y] - 12*w^2*x^3*y^3*Log[y] - 12*w*x^4*y^3*Log[y] + 
        60*w^3*x*y^4*Log[y] + 60*w^2*x^2*y^4*Log[y] + 60*w*x^3*y^4*Log[y] - 
        120*w^2*x*y^5*Log[y] - 120*w*x^2*y^5*Log[y] + 120*w*x*y^6*Log[y] - 
        12*y^8*Log[y])/(192*Pi^2*y^3*(-w + y)^5*(-x + y)^5)) + 
    16*Pi^2*\[Epsilon]^4*((w*Log[w])/(16*Pi^2*(-w + x)*(w - y)^6) - 
      (x*Log[x])/(16*Pi^2*(-w + x)*(x - y)^6) + 
      (1/(5*(x - y)*y^4*(-w + y)) + (y/((x - y)*(-w + y)^5) + 
          ((x - y)^(-4) + y/(x - y)^5)/(-w + y) - 
          ((x - y)^(-3) + y/(x - y)^4)/(-w + y)^2 + 
          ((x - y)^(-2) + y/(x - y)^3)/(-w + y)^3 - 
          ((x - y)^(-1) + y/(x - y)^2)/(-w + y)^4)/y - 
        (-(y/((x - y)*(-w + y)^4)) + ((x - y)^(-3) + y/(x - y)^4)/(-w + y) - 
          ((x - y)^(-2) + y/(x - y)^3)/(-w + y)^2 + 
          ((x - y)^(-1) + y/(x - y)^2)/(-w + y)^3)/(2*y^2) + 
        (y/((x - y)*(-w + y)^3) + ((x - y)^(-2) + y/(x - y)^3)/(-w + y) - 
          ((x - y)^(-1) + y/(x - y)^2)/(-w + y)^2)/(3*y^3) - 
        (-(y/((x - y)*(-w + y)^2)) + ((x - y)^(-1) + y/(x - y)^2)/(-w + y))/
         (4*y^4) + (-(y/((x - y)*(-w + y)^6)) + ((x - y)^(-5) + y/(x - y)^6)/
           (-w + y) - ((x - y)^(-4) + y/(x - y)^5)/(-w + y)^2 + 
          ((x - y)^(-3) + y/(x - y)^4)/(-w + y)^3 - 
          ((x - y)^(-2) + y/(x - y)^3)/(-w + y)^4 + 
          ((x - y)^(-1) + y/(x - y)^2)/(-w + y)^5)*Log[y])/(16*Pi^2))
D0funcd34[x_, y_, z_, \[Epsilon]_] := 
   16*Pi^2*(-(x*Log[x])/(16*Pi^2*(x - y)*(x - z)^2) + 
      (y*Log[y])/(16*Pi^2*(x - y)*(y - z)^2) + 
      (-(x*y) + x*z + y*z - z^2 - x*y*Log[z] + z^2*Log[z])/
       (16*Pi^2*(x - z)^2*(-y + z)^2)) + 16*Pi^2*\[Epsilon]*
     (-(x*Log[x])/(16*Pi^2*(x - y)*(x - z)^3) + 
      (y*Log[y])/(16*Pi^2*(x - y)*(y - z)^3) + 
      (-(x^2*y^2) + x^2*z^2 + 4*x*y*z^2 + y^2*z^2 - 4*x*z^3 - 4*y*z^3 + 
        3*z^4 - 2*x^2*y*z*Log[z] - 2*x*y^2*z*Log[z] + 6*x*y*z^2*Log[z] - 
        2*z^4*Log[z])/(32*Pi^2*z*(-x + z)^3*(-y + z)^3)) + 
    16*Pi^2*\[Epsilon]^2*(-(x*Log[x])/(16*Pi^2*(x - y)*(x - z)^4) + 
      (y*Log[y])/(16*Pi^2*(x - y)*(y - z)^4) + 
      (x^3*y^3 - 6*x^3*y^2*z - 6*x^2*y^3*z + 3*x^3*y*z^2 + 21*x^2*y^2*z^2 + 
        3*x*y^3*z^2 + 2*x^3*z^3 - 6*x^2*y*z^3 - 6*x*y^2*z^3 + 2*y^3*z^3 - 
        9*x^2*z^4 - 15*x*y*z^4 - 9*y^2*z^4 + 18*x*z^5 + 18*y*z^5 - 11*z^6 - 
        6*x^3*y*z^2*Log[z] - 6*x^2*y^2*z^2*Log[z] - 6*x*y^3*z^2*Log[z] + 
        24*x^2*y*z^3*Log[z] + 24*x*y^2*z^3*Log[z] - 36*x*y*z^4*Log[z] + 
        6*z^6*Log[z])/(96*Pi^2*z^2*(-x + z)^4*(-y + z)^4)) + 
    16*Pi^2*\[Epsilon]^3*(-(x*Log[x])/(16*Pi^2*(x - y)*(x - z)^5) + 
      (y*Log[y])/(16*Pi^2*(x - y)*(y - z)^5) + 
      (-(x^4*y^4) + 6*x^4*y^3*z + 6*x^3*y^4*z - 18*x^4*y^2*z^2 - 
        38*x^3*y^3*z^2 - 18*x^2*y^4*z^2 + 10*x^4*y*z^3 + 90*x^3*y^2*z^3 + 
        90*x^2*y^3*z^3 + 10*x*y^4*z^3 + 3*x^4*z^4 - 42*x^3*y*z^4 - 
        162*x^2*y^2*z^4 - 42*x*y^3*z^4 + 3*y^4*z^4 - 16*x^3*z^5 + 
        54*x^2*y*z^5 + 54*x*y^2*z^5 - 16*y^3*z^5 + 36*x^2*z^6 + 26*x*y*z^6 + 
        36*y^2*z^6 - 48*x*z^7 - 48*y*z^7 + 25*z^8 - 12*x^4*y*z^3*Log[z] - 
        12*x^3*y^2*z^3*Log[z] - 12*x^2*y^3*z^3*Log[z] - 12*x*y^4*z^3*Log[z] + 
        60*x^3*y*z^4*Log[z] + 60*x^2*y^2*z^4*Log[z] + 60*x*y^3*z^4*Log[z] - 
        120*x^2*y*z^5*Log[z] - 120*x*y^2*z^5*Log[z] + 120*x*y*z^6*Log[z] - 
        12*z^8*Log[z])/(192*Pi^2*z^3*(-x + z)^5*(-y + z)^5)) + 
    16*Pi^2*\[Epsilon]^4*(-(x*Log[x])/(16*Pi^2*(x - y)*(x - z)^6) + 
      (y*Log[y])/(16*Pi^2*(x - y)*(y - z)^6) + 
      (1/(5*(x - z)*z^4*(-y + z)) + (z/((x - z)*(-y + z)^5) + 
          ((x - z)^(-4) + z/(x - z)^5)/(-y + z) - 
          ((x - z)^(-3) + z/(x - z)^4)/(-y + z)^2 + 
          ((x - z)^(-2) + z/(x - z)^3)/(-y + z)^3 - 
          ((x - z)^(-1) + z/(x - z)^2)/(-y + z)^4)/z - 
        (-(z/((x - z)*(-y + z)^4)) + ((x - z)^(-3) + z/(x - z)^4)/(-y + z) - 
          ((x - z)^(-2) + z/(x - z)^3)/(-y + z)^2 + 
          ((x - z)^(-1) + z/(x - z)^2)/(-y + z)^3)/(2*z^2) + 
        (z/((x - z)*(-y + z)^3) + ((x - z)^(-2) + z/(x - z)^3)/(-y + z) - 
          ((x - z)^(-1) + z/(x - z)^2)/(-y + z)^2)/(3*z^3) - 
        (-(z/((x - z)*(-y + z)^2)) + ((x - z)^(-1) + z/(x - z)^2)/(-y + z))/
         (4*z^4) + (-(z/((x - z)*(-y + z)^6)) + ((x - z)^(-5) + z/(x - z)^6)/
           (-y + z) - ((x - z)^(-4) + z/(x - z)^5)/(-y + z)^2 + 
          ((x - z)^(-3) + z/(x - z)^4)/(-y + z)^3 - 
          ((x - z)^(-2) + z/(x - z)^3)/(-y + z)^4 + 
          ((x - z)^(-1) + z/(x - z)^2)/(-y + z)^5)*Log[z])/(16*Pi^2))
D0funcAcc[x_, y_, z_, w_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     \[Epsilon]14 = w - x, S14 = x + w, \[Epsilon]34 = w - z, S34 = w + z, 
     \[Epsilon]24 = w - y, S24 = y + w, dzcomp = 0.01, d4comp = 0.06, 
     d3comp = 0.03, d2comp = 0.01}, ReleaseHold[
     Which[S12*S13*S14*S24*S23*S34 == 0, 0, 
      x == 0 && Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
         Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D0funcz1d234[x, y, z - y, 
        w - y]], y == 0 && Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]14/S14] + 
         Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D0funcz2d134[x, y, z - x, 
        w - x]], z == 0 && Abs[\[Epsilon]12/S12] + Abs[\[Epsilon]24/S24] + 
         Abs[\[Epsilon]14/S14] < d3comp, Evaluate[D0funcz3d124[x, z, y - x, 
        w - x]], w == 0 && Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
         Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D0funcz4d123[x, w, y - x, 
        z - x]], x == 0 && Abs[\[Epsilon]34/S34] < dzcomp, 
      Evaluate[D0funcz1d34[y, z, w - z]], x == 0 && Abs[\[Epsilon]24/S24] < 
        dzcomp, Evaluate[D0funcz1d24[y, z, w - y]], 
      x == 0 && Abs[\[Epsilon]23/S23] < dzcomp, 
      Evaluate[D0funcz1d23[y, w, z - y]], y == 0 && Abs[\[Epsilon]34/S34] < 
        dzcomp, Evaluate[D0funcz2d34[x, z, w - z]], 
      y == 0 && Abs[\[Epsilon]14/S14] < dzcomp, 
      Evaluate[D0funcz2d14[x, z, w - x]], y == 0 && Abs[\[Epsilon]13/S13] < 
        dzcomp, Evaluate[D0funcz2d13[x, w, z - x]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[D0funcz3d12[x, w, y - x]], z == 0 && Abs[\[Epsilon]14/S14] < 
        dzcomp, Evaluate[D0funcz3d14[x, y, w - x]], 
      z == 0 && Abs[\[Epsilon]24/S24] < dzcomp, 
      Evaluate[D0funcz3d24[x, y, w - y]], w == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[D0funcz4d12[x, z, y - z]], 
      w == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[D0funcz4d13[x, y, z - x]], w == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[D0funcz4d23[x, y, z - y]], x == 0, 
      Evaluate[D0funcz1[x, y, z, w]], y == 0, Evaluate[D0funcz2[x, y, z, w]], 
      z == 0, Evaluate[D0funcz3[x, y, z, w]], w == 0, 
      Evaluate[D0funcz4[x, y, z, w]], Abs[\[Epsilon]23/S23] + 
        Abs[\[Epsilon]24/S24] + Abs[\[Epsilon]34/S34] + 
        Abs[\[Epsilon]14/S14] + Abs[\[Epsilon]13/S13] + 
        Abs[\[Epsilon]12/S12] < d4comp, Evaluate[D0funcd1234[x, y, y - x, 
        z - x]], Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
        Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D0funcd234[x, y, z - y, 
        w - y]], Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]14/S14] + 
        Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D0funcd134[x, y, z - x, 
        w - x]], Abs[\[Epsilon]12/S12] + Abs[\[Epsilon]24/S24] + 
        Abs[\[Epsilon]14/S14] < d3comp, Evaluate[D0funcd124[x, z, y - x, 
        w - x]], Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
        Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D0funcd123[x, w, y - x, 
        z - x]], Abs[\[Epsilon]12/S12] < d2comp && Abs[\[Epsilon]34/S34] < 
        d2comp, Evaluate[D0funcd12d34[x, z, y - x, w - z]], 
      Abs[\[Epsilon]13/S13] < d2comp && Abs[\[Epsilon]24/S24] < d2comp, 
      Evaluate[D0funcd12d34[x, y, z - x, w - y]], 
      Abs[\[Epsilon]14/S14] < d2comp && Abs[\[Epsilon]23/S23] < d2comp, 
      Evaluate[D0funcd12d34[x, y, w - x, z - y]], Abs[\[Epsilon]23/S23] < 
       d2comp, Evaluate[D0funcd23[x, y, w, z - y]], Abs[\[Epsilon]24/S24] < 
       d2comp, Evaluate[D0funcd24[x, y, z, w - y]], Abs[\[Epsilon]34/S34] < 
       d2comp, Evaluate[D0funcd34[x, y, z, w - z]], Abs[\[Epsilon]14/S14] < 
       d2comp, Evaluate[D0funcd14[x, y, z, w - x]], Abs[\[Epsilon]13/S13] < 
       d2comp, Evaluate[D0funcd13[x, y, w, z - x]], Abs[\[Epsilon]12/S12] < 
       d2comp, Evaluate[D0funcd12[x, z, w, y - x]], True, 
      Evaluate[D0func0[x, y, z, w]]]]]
D00func0[x_, y_, z_, w_] := 
   -16*Pi^2*(-((w^2*Log[w])/(64*Pi^2*(-w + x)*(w - y)*(w - z))) + 
     (x^2*Log[x])/(64*Pi^2*(-w + x)*(x - y)*(x - z)) - 
     (y^2*Log[y])/(64*Pi^2*(x - y)*(-w + y)*(y - z)) - 
     (z^2*Log[z])/(64*Pi^2*(x - z)*(-w + z)*(-y + z)))
D00funcz1d234[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (-30*y^4 + 10*y^3*\[Delta]1 - 5*y^2*\[Delta]1^2 + 3*y*\[Delta]1^3 - 
      2*\[Delta]1^4)/(240*y^5) + 
    ((70*y^4 - 35*y^3*\[Delta]1 + 21*y^2*\[Delta]1^2 - 14*y*\[Delta]1^3 + 
       10*\[Delta]1^4)*\[Delta]2)/(1680*y^6) + 
    ((-70*y^4 + 42*y^3*\[Delta]1 - 28*y^2*\[Delta]1^2 + 20*y*\[Delta]1^3 - 
       15*\[Delta]1^4)*\[Delta]2^2)/(3360*y^7) + 
    ((126*y^4 - 84*y^3*\[Delta]1 + 60*y^2*\[Delta]1^2 - 45*y*\[Delta]1^3 + 
       35*\[Delta]1^4)*\[Delta]2^3)/(10080*y^8) + 
    ((-84*y^4 + 60*y^3*\[Delta]1 - 45*y^2*\[Delta]1^2 + 35*y*\[Delta]1^3 - 
       28*\[Delta]1^4)*\[Delta]2^4)/(10080*y^9)
D00funcz2d134[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (-30*x^4 + 10*x^3*\[Delta]1 - 5*x^2*\[Delta]1^2 + 3*x*\[Delta]1^3 - 
      2*\[Delta]1^4)/(240*x^5) + 
    ((70*x^4 - 35*x^3*\[Delta]1 + 21*x^2*\[Delta]1^2 - 14*x*\[Delta]1^3 + 
       10*\[Delta]1^4)*\[Delta]2)/(1680*x^6) + 
    ((-70*x^4 + 42*x^3*\[Delta]1 - 28*x^2*\[Delta]1^2 + 20*x*\[Delta]1^3 - 
       15*\[Delta]1^4)*\[Delta]2^2)/(3360*x^7) + 
    ((126*x^4 - 84*x^3*\[Delta]1 + 60*x^2*\[Delta]1^2 - 45*x*\[Delta]1^3 + 
       35*\[Delta]1^4)*\[Delta]2^3)/(10080*x^8) + 
    ((-84*x^4 + 60*x^3*\[Delta]1 - 45*x^2*\[Delta]1^2 + 35*x*\[Delta]1^3 - 
       28*\[Delta]1^4)*\[Delta]2^4)/(10080*x^9)
D00funcz3d124[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (-30*x^4 + 10*x^3*\[Delta]1 - 5*x^2*\[Delta]1^2 + 3*x*\[Delta]1^3 - 
      2*\[Delta]1^4)/(240*x^5) + 
    ((70*x^4 - 35*x^3*\[Delta]1 + 21*x^2*\[Delta]1^2 - 14*x*\[Delta]1^3 + 
       10*\[Delta]1^4)*\[Delta]2)/(1680*x^6) + 
    ((-70*x^4 + 42*x^3*\[Delta]1 - 28*x^2*\[Delta]1^2 + 20*x*\[Delta]1^3 - 
       15*\[Delta]1^4)*\[Delta]2^2)/(3360*x^7) + 
    ((126*x^4 - 84*x^3*\[Delta]1 + 60*x^2*\[Delta]1^2 - 45*x*\[Delta]1^3 + 
       35*\[Delta]1^4)*\[Delta]2^3)/(10080*x^8) + 
    ((-84*x^4 + 60*x^3*\[Delta]1 - 45*x^2*\[Delta]1^2 + 35*x*\[Delta]1^3 - 
       28*\[Delta]1^4)*\[Delta]2^4)/(10080*x^9)
D00funcz4d123[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (-30*x^4 + 10*x^3*\[Delta]1 - 5*x^2*\[Delta]1^2 + 3*x*\[Delta]1^3 - 
      2*\[Delta]1^4)/(240*x^5) + 
    ((70*x^4 - 35*x^3*\[Delta]1 + 21*x^2*\[Delta]1^2 - 14*x*\[Delta]1^3 + 
       10*\[Delta]1^4)*\[Delta]2)/(1680*x^6) + 
    ((-70*x^4 + 42*x^3*\[Delta]1 - 28*x^2*\[Delta]1^2 + 20*x*\[Delta]1^3 - 
       15*\[Delta]1^4)*\[Delta]2^2)/(3360*x^7) + 
    ((126*x^4 - 84*x^3*\[Delta]1 + 60*x^2*\[Delta]1^2 - 45*x*\[Delta]1^3 + 
       35*\[Delta]1^4)*\[Delta]2^3)/(10080*x^8) + 
    ((-84*x^4 + 60*x^3*\[Delta]1 - 45*x^2*\[Delta]1^2 + 35*x*\[Delta]1^3 - 
       28*\[Delta]1^4)*\[Delta]2^4)/(10080*x^9)
D00funcz1d34[y_, z_, \[Epsilon]_] := 
   (y - z - y*Log[y] + y*Log[z])/(4*(y - z)^2) + 
    (\[Epsilon]*(y^2 - z^2 - 2*y*z*Log[y] + 2*y*z*Log[z]))/(8*(y - z)^3*z) + 
    (\[Epsilon]^2*(-y^3 + 6*y^2*z - 3*y*z^2 - 2*z^3 - 6*y*z^2*Log[y] + 
       6*y*z^2*Log[z]))/(24*(y - z)^4*z^2) + 
    (\[Epsilon]^3*(y^4 - 6*y^3*z + 18*y^2*z^2 - 10*y*z^3 - 3*z^4 - 
       12*y*z^3*Log[y] + 12*y*z^3*Log[z]))/(48*(y - z)^5*z^3) + 
    (\[Epsilon]^4*(-3*y^5 + 20*y^4*z - 60*y^3*z^2 + 120*y^2*z^3 - 65*y*z^4 - 
       12*z^5 - 60*y*z^4*Log[y] + 60*y*z^4*Log[z]))/(240*(y - z)^6*z^4)
D00funcz1d24[y_, z_, \[Epsilon]_] := 
   -(y - z - z*Log[y] + z*Log[z])/(4*(y - z)^2) + 
    (\[Epsilon]*(y^2 - z^2 - 2*y*z*Log[y] + 2*y*z*Log[z]))/(8*y*(y - z)^3) + 
    (\[Epsilon]^2*(-2*y^3 - 3*y^2*z + 6*y*z^2 - z^3 + 6*y^2*z*Log[y] - 
       6*y^2*z*Log[z]))/(24*y^2*(y - z)^4) + 
    (\[Epsilon]^3*(3*y^4 + 10*y^3*z - 18*y^2*z^2 + 6*y*z^3 - z^4 - 
       12*y^3*z*Log[y] + 12*y^3*z*Log[z]))/(48*y^3*(y - z)^5) + 
    (\[Epsilon]^4*(-12*y^5 - 65*y^4*z + 120*y^3*z^2 - 60*y^2*z^3 + 20*y*z^4 - 
       3*z^5 + 60*y^4*z*Log[y] - 60*y^4*z*Log[z]))/(240*y^4*(y - z)^6)
D00funcz1d23[y_, w_, \[Epsilon]_] := 
   (w - y - w*Log[w] + w*Log[y])/(4*(w - y)^2) + 
    (\[Epsilon]*(w^2 - y^2 - 2*w*y*Log[w] + 2*w*y*Log[y]))/(8*(w - y)^3*y) + 
    (\[Epsilon]^2*(-w^3 + 6*w^2*y - 3*w*y^2 - 2*y^3 - 6*w*y^2*Log[w] + 
       6*w*y^2*Log[y]))/(24*(w - y)^4*y^2) + 
    (\[Epsilon]^3*(w^4 - 6*w^3*y + 18*w^2*y^2 - 10*w*y^3 - 3*y^4 - 
       12*w*y^3*Log[w] + 12*w*y^3*Log[y]))/(48*(w - y)^5*y^3) + 
    (\[Epsilon]^4*(-3*w^5 + 20*w^4*y - 60*w^3*y^2 + 120*w^2*y^3 - 65*w*y^4 - 
       12*y^5 - 60*w*y^4*Log[w] + 60*w*y^4*Log[y]))/(240*(w - y)^6*y^4)
D00funcz2d34[x_, z_, \[Epsilon]_] := 
   (x - z - x*Log[x] + x*Log[z])/(4*(x - z)^2) + 
    (\[Epsilon]*(x^2 - z^2 - 2*x*z*Log[x] + 2*x*z*Log[z]))/(8*(x - z)^3*z) + 
    (\[Epsilon]^2*(-x^3 + 6*x^2*z - 3*x*z^2 - 2*z^3 - 6*x*z^2*Log[x] + 
       6*x*z^2*Log[z]))/(24*(x - z)^4*z^2) + 
    (\[Epsilon]^3*(x^4 - 6*x^3*z + 18*x^2*z^2 - 10*x*z^3 - 3*z^4 - 
       12*x*z^3*Log[x] + 12*x*z^3*Log[z]))/(48*(x - z)^5*z^3) + 
    (\[Epsilon]^4*(-3*x^5 + 20*x^4*z - 60*x^3*z^2 + 120*x^2*z^3 - 65*x*z^4 - 
       12*z^5 - 60*x*z^4*Log[x] + 60*x*z^4*Log[z]))/(240*(x - z)^6*z^4)
D00funcz2d14[x_, z_, \[Epsilon]_] := 
   -(x - z - z*Log[x] + z*Log[z])/(4*(x - z)^2) + 
    (\[Epsilon]*(x^2 - z^2 - 2*x*z*Log[x] + 2*x*z*Log[z]))/(8*x*(x - z)^3) + 
    (\[Epsilon]^2*(-2*x^3 - 3*x^2*z + 6*x*z^2 - z^3 + 6*x^2*z*Log[x] - 
       6*x^2*z*Log[z]))/(24*x^2*(x - z)^4) + 
    (\[Epsilon]^3*(3*x^4 + 10*x^3*z - 18*x^2*z^2 + 6*x*z^3 - z^4 - 
       12*x^3*z*Log[x] + 12*x^3*z*Log[z]))/(48*x^3*(x - z)^5) + 
    (\[Epsilon]^4*(-12*x^5 - 65*x^4*z + 120*x^3*z^2 - 60*x^2*z^3 + 20*x*z^4 - 
       3*z^5 + 60*x^4*z*Log[x] - 60*x^4*z*Log[z]))/(240*x^4*(x - z)^6)
D00funcz2d13[x_, w_, \[Epsilon]_] := 
   (w - x - w*Log[w] + w*Log[x])/(4*(w - x)^2) + 
    (\[Epsilon]*(w^2 - x^2 - 2*w*x*Log[w] + 2*w*x*Log[x]))/(8*(w - x)^3*x) + 
    (\[Epsilon]^2*(-w^3 + 6*w^2*x - 3*w*x^2 - 2*x^3 - 6*w*x^2*Log[w] + 
       6*w*x^2*Log[x]))/(24*(w - x)^4*x^2) + 
    (\[Epsilon]^3*(w^4 - 6*w^3*x + 18*w^2*x^2 - 10*w*x^3 - 3*x^4 - 
       12*w*x^3*Log[w] + 12*w*x^3*Log[x]))/(48*(w - x)^5*x^3) + 
    (\[Epsilon]^4*(-3*w^5 + 20*w^4*x - 60*w^3*x^2 + 120*w^2*x^3 - 65*w*x^4 - 
       12*x^5 - 60*w*x^4*Log[w] + 60*w*x^4*Log[x]))/(240*(w - x)^6*x^4)
D00funcz3d14[x_, y_, \[Epsilon]_] := 
   -(x - y - y*Log[x] + y*Log[y])/(4*(x - y)^2) + 
    (\[Epsilon]*(x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y]))/(8*x*(x - y)^3) + 
    (\[Epsilon]^2*(-2*x^3 - 3*x^2*y + 6*x*y^2 - y^3 + 6*x^2*y*Log[x] - 
       6*x^2*y*Log[y]))/(24*x^2*(x - y)^4) + 
    (\[Epsilon]^3*(3*x^4 + 10*x^3*y - 18*x^2*y^2 + 6*x*y^3 - y^4 - 
       12*x^3*y*Log[x] + 12*x^3*y*Log[y]))/(48*x^3*(x - y)^5) + 
    (\[Epsilon]^4*(-12*x^5 - 65*x^4*y + 120*x^3*y^2 - 60*x^2*y^3 + 20*x*y^4 - 
       3*y^5 + 60*x^4*y*Log[x] - 60*x^4*y*Log[y]))/(240*x^4*(x - y)^6)
D00funcz3d24[x_, y_, \[Epsilon]_] := 
   (x - y - x*Log[x] + x*Log[y])/(4*(x - y)^2) + 
    (\[Epsilon]*(x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y]))/(8*(x - y)^3*y) + 
    (\[Epsilon]^2*(-x^3 + 6*x^2*y - 3*x*y^2 - 2*y^3 - 6*x*y^2*Log[x] + 
       6*x*y^2*Log[y]))/(24*(x - y)^4*y^2) + 
    (\[Epsilon]^3*(x^4 - 6*x^3*y + 18*x^2*y^2 - 10*x*y^3 - 3*y^4 - 
       12*x*y^3*Log[x] + 12*x*y^3*Log[y]))/(48*(x - y)^5*y^3) + 
    (\[Epsilon]^4*(-3*x^5 + 20*x^4*y - 60*x^3*y^2 + 120*x^2*y^3 - 65*x*y^4 - 
       12*y^5 - 60*x*y^4*Log[x] + 60*x*y^4*Log[y]))/(240*(x - y)^6*y^4)
D00funcz3d12[x_, w_, \[Epsilon]_] := 
   (w - x - w*Log[w] + w*Log[x])/(4*(w - x)^2) + 
    (\[Epsilon]*(w^2 - x^2 - 2*w*x*Log[w] + 2*w*x*Log[x]))/(8*(w - x)^3*x) + 
    (\[Epsilon]^2*(-w^3 + 6*w^2*x - 3*w*x^2 - 2*x^3 - 6*w*x^2*Log[w] + 
       6*w*x^2*Log[x]))/(24*(w - x)^4*x^2) + 
    (\[Epsilon]^3*(w^4 - 6*w^3*x + 18*w^2*x^2 - 10*w*x^3 - 3*x^4 - 
       12*w*x^3*Log[w] + 12*w*x^3*Log[x]))/(48*(w - x)^5*x^3) + 
    (\[Epsilon]^4*(-3*w^5 + 20*w^4*x - 60*w^3*x^2 + 120*w^2*x^3 - 65*w*x^4 - 
       12*x^5 - 60*w*x^4*Log[w] + 60*w*x^4*Log[x]))/(240*(w - x)^6*x^4)
D00funcz4d23[x_, y_, \[Epsilon]_] := 
   (x - y - x*Log[x] + x*Log[y])/(4*(x - y)^2) + 
    (\[Epsilon]*(x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y]))/(8*(x - y)^3*y) + 
    (\[Epsilon]^2*(-x^3 + 6*x^2*y - 3*x*y^2 - 2*y^3 - 6*x*y^2*Log[x] + 
       6*x*y^2*Log[y]))/(24*(x - y)^4*y^2) + 
    (\[Epsilon]^3*(x^4 - 6*x^3*y + 18*x^2*y^2 - 10*x*y^3 - 3*y^4 - 
       12*x*y^3*Log[x] + 12*x*y^3*Log[y]))/(48*(x - y)^5*y^3) + 
    (\[Epsilon]^4*(-3*x^5 + 20*x^4*y - 60*x^3*y^2 + 120*x^2*y^3 - 65*x*y^4 - 
       12*y^5 - 60*x*y^4*Log[x] + 60*x*y^4*Log[y]))/(240*(x - y)^6*y^4)
D00funcz4d13[x_, y_, \[Epsilon]_] := 
   -(x - y - y*Log[x] + y*Log[y])/(4*(x - y)^2) + 
    (\[Epsilon]*(x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y]))/(8*x*(x - y)^3) + 
    (\[Epsilon]^2*(-2*x^3 - 3*x^2*y + 6*x*y^2 - y^3 + 6*x^2*y*Log[x] - 
       6*x^2*y*Log[y]))/(24*x^2*(x - y)^4) + 
    (\[Epsilon]^3*(3*x^4 + 10*x^3*y - 18*x^2*y^2 + 6*x*y^3 - y^4 - 
       12*x^3*y*Log[x] + 12*x^3*y*Log[y]))/(48*x^3*(x - y)^5) + 
    (\[Epsilon]^4*(-12*x^5 - 65*x^4*y + 120*x^3*y^2 - 60*x^2*y^3 + 20*x*y^4 - 
       3*y^5 + 60*x^4*y*Log[x] - 60*x^4*y*Log[y]))/(240*x^4*(x - y)^6)
D00funcz4d12[x_, z_, \[Epsilon]_] := 
   -(x - z - z*Log[x] + z*Log[z])/(4*(x - z)^2) + 
    (\[Epsilon]*(x^2 - z^2 - 2*x*z*Log[x] + 2*x*z*Log[z]))/(8*x*(x - z)^3) + 
    (\[Epsilon]^2*(-2*x^3 - 3*x^2*z + 6*x*z^2 - z^3 + 6*x^2*z*Log[x] - 
       6*x^2*z*Log[z]))/(24*x^2*(x - z)^4) + 
    (\[Epsilon]^3*(3*x^4 + 10*x^3*z - 18*x^2*z^2 + 6*x*z^3 - z^4 - 
       12*x^3*z*Log[x] + 12*x^3*z*Log[z]))/(48*x^3*(x - z)^5) + 
    (\[Epsilon]^4*(-12*x^5 - 65*x^4*z + 120*x^3*z^2 - 60*x^2*z^3 + 20*x*z^4 - 
       3*z^5 + 60*x^4*z*Log[x] - 60*x^4*z*Log[z]))/(240*x^4*(x - z)^6)
D00funcz1[x_, y_, z_, w_] := (w*(-y + z)*Log[w] + y*(w - z)*Log[y] + 
     (-w + y)*z*Log[z])/(4*(w - y)*(w - z)*(y - z))
D00funcz2[x_, y_, z_, w_] := (w*(-x + z)*Log[w] + x*(w - z)*Log[x] + 
     (-w + x)*z*Log[z])/(4*(w - x)*(w - z)*(x - z))
D00funcz3[x_, y_, z_, w_] := (w*(-x + y)*Log[w] + x*(w - y)*Log[x] + 
     (-w + x)*y*Log[y])/(4*(w - x)*(w - y)*(x - y))
D00funcz4[x_, y_, z_, w_] := (x*(-y + z)*Log[x] + y*(x - z)*Log[y] + 
     (-x + y)*z*Log[z])/(4*(x - y)*(x - z)*(y - z))
D00funcd1234[x_, \[Delta]1_, \[Delta]2_, \[Delta]3_] := 
   -1/(12*x) + \[Delta]1/(48*x^2) - \[Delta]1^2/(120*x^3) + 
    \[Delta]1^3/(240*x^4) - \[Delta]1^4/(420*x^5) + 
    ((70*x^4 - 28*x^3*\[Delta]1 + 14*x^2*\[Delta]1^2 - 8*x*\[Delta]1^3 + 
       5*\[Delta]1^4)*\[Delta]2)/(3360*x^6) + 
    ((-84*x^4 + 42*x^3*\[Delta]1 - 24*x^2*\[Delta]1^2 + 15*x*\[Delta]1^3 - 
       10*\[Delta]1^4)*\[Delta]2^2)/(10080*x^7) + 
    ((42*x^4 - 24*x^3*\[Delta]1 + 15*x^2*\[Delta]1^2 - 10*x*\[Delta]1^3 + 
       7*\[Delta]1^4)*\[Delta]2^3)/(10080*x^8) + 
    ((-264*x^4 + 165*x^3*\[Delta]1 - 110*x^2*\[Delta]1^2 + 77*x*\[Delta]1^3 - 
       56*\[Delta]1^4)*\[Delta]2^4)/(110880*x^9) + 
    (1/(48*x^2) - \[Delta]1/(120*x^3) + \[Delta]1^2/(240*x^4) - 
      \[Delta]1^3/(420*x^5) + \[Delta]1^4/(672*x^6) - 
      ((84*x^4 - 42*x^3*\[Delta]1 + 24*x^2*\[Delta]1^2 - 15*x*\[Delta]1^3 + 
         10*\[Delta]1^4)*\[Delta]2)/(10080*x^7) + 
      ((42*x^4 - 24*x^3*\[Delta]1 + 15*x^2*\[Delta]1^2 - 10*x*\[Delta]1^3 + 
         7*\[Delta]1^4)*\[Delta]2^2)/(10080*x^8) + 
      ((-264*x^4 + 165*x^3*\[Delta]1 - 110*x^2*\[Delta]1^2 + 
         77*x*\[Delta]1^3 - 56*\[Delta]1^4)*\[Delta]2^3)/(110880*x^9) + 
      ((165*x^4 - 110*x^3*\[Delta]1 + 77*x^2*\[Delta]1^2 - 56*x*\[Delta]1^3 + 
         42*\[Delta]1^4)*\[Delta]2^4)/(110880*x^10))*\[Delta]3 + 
    (-1/(120*x^3) + \[Delta]1/(240*x^4) - \[Delta]1^2/(420*x^5) + 
      \[Delta]1^3/(672*x^6) - \[Delta]1^4/(1008*x^7) + 
      ((42*x^4 - 24*x^3*\[Delta]1 + 15*x^2*\[Delta]1^2 - 10*x*\[Delta]1^3 + 
         7*\[Delta]1^4)*\[Delta]2)/(10080*x^8) + 
      ((-264*x^4 + 165*x^3*\[Delta]1 - 110*x^2*\[Delta]1^2 + 
         77*x*\[Delta]1^3 - 56*\[Delta]1^4)*\[Delta]2^2)/(110880*x^9) + 
      ((165*x^4 - 110*x^3*\[Delta]1 + 77*x^2*\[Delta]1^2 - 56*x*\[Delta]1^3 + 
         42*\[Delta]1^4)*\[Delta]2^3)/(110880*x^10) + 
      ((-1430*x^4 + 1001*x^3*\[Delta]1 - 728*x^2*\[Delta]1^2 + 
         546*x*\[Delta]1^3 - 420*\[Delta]1^4)*\[Delta]2^4)/(1441440*x^11))*
     \[Delta]3^2 + (1/(240*x^4) - \[Delta]1/(420*x^5) + 
      \[Delta]1^2/(672*x^6) - \[Delta]1^3/(1008*x^7) + 
      \[Delta]1^4/(1440*x^8) - ((264*x^4 - 165*x^3*\[Delta]1 + 
         110*x^2*\[Delta]1^2 - 77*x*\[Delta]1^3 + 56*\[Delta]1^4)*\[Delta]2)/
       (110880*x^9) + ((165*x^4 - 110*x^3*\[Delta]1 + 77*x^2*\[Delta]1^2 - 
         56*x*\[Delta]1^3 + 42*\[Delta]1^4)*\[Delta]2^2)/(110880*x^10) + 
      ((-1430*x^4 + 1001*x^3*\[Delta]1 - 728*x^2*\[Delta]1^2 + 
         546*x*\[Delta]1^3 - 420*\[Delta]1^4)*\[Delta]2^3)/(1441440*x^11) + 
      ((1001*x^4 - 728*x^3*\[Delta]1 + 546*x^2*\[Delta]1^2 - 
         420*x*\[Delta]1^3 + 330*\[Delta]1^4)*\[Delta]2^4)/(1441440*x^12))*
     \[Delta]3^3 + (-1/(420*x^5) + \[Delta]1/(672*x^6) - 
      \[Delta]1^2/(1008*x^7) + \[Delta]1^3/(1440*x^8) - 
      \[Delta]1^4/(1980*x^9) + ((165*x^4 - 110*x^3*\[Delta]1 + 
         77*x^2*\[Delta]1^2 - 56*x*\[Delta]1^3 + 42*\[Delta]1^4)*\[Delta]2)/
       (110880*x^10) + ((-1430*x^4 + 1001*x^3*\[Delta]1 - 
         728*x^2*\[Delta]1^2 + 546*x*\[Delta]1^3 - 420*\[Delta]1^4)*
        \[Delta]2^2)/(1441440*x^11) + 
      ((1001*x^4 - 728*x^3*\[Delta]1 + 546*x^2*\[Delta]1^2 - 
         420*x*\[Delta]1^3 + 330*\[Delta]1^4)*\[Delta]2^3)/(1441440*x^12) + 
      ((-364*x^4 + 273*x^3*\[Delta]1 - 210*x^2*\[Delta]1^2 + 
         165*x*\[Delta]1^3 - 132*\[Delta]1^4)*\[Delta]2^4)/(720720*x^13))*
     \[Delta]3^4
D00funcd234[x_, y_, \[Delta]1_, \[Delta]2_] := 
   (3*x^2 - 4*x*y + y^2 - 2*x^2*Log[x] + 2*x^2*Log[y])/(8*(x - y)^3) + 
    (\[Delta]1*(2*x^3 + 3*x^2*y - 6*x*y^2 + y^3 - 6*x^2*y*Log[x] + 
       6*x^2*y*Log[y]))/(24*(x - y)^4*y) - 
    (\[Delta]1^2*(x^4 - 8*x^3*y + 8*x*y^3 - y^4 + 12*x^2*y^2*Log[x] - 
       12*x^2*y^2*Log[y]))/(48*(x - y)^5*y^2) - 
    (\[Delta]1^3*(-2*x^5 + 15*x^4*y - 60*x^3*y^2 + 20*x^2*y^3 + 30*x*y^4 - 
       3*y^5 + 60*x^2*y^3*Log[x] - 60*x^2*y^3*Log[y]))/(240*(x - y)^6*y^3) - 
    (\[Delta]1^4*(x^6 - 8*x^5*y + 30*x^4*y^2 - 80*x^3*y^3 + 35*x^2*y^4 + 
       24*x*y^5 - 2*y^6 + 60*x^2*y^4*Log[x] - 60*x^2*y^4*Log[y]))/
     (240*(x - y)^7*y^4) + \[Delta]2*
     ((2*x^3 + 3*x^2*y - 6*x*y^2 + y^3 - 6*x^2*y*Log[x] + 6*x^2*y*Log[y])/
       (24*(x - y)^4*y) - (\[Delta]1*(x^4 - 8*x^3*y + 8*x*y^3 - y^4 + 
         12*x^2*y^2*Log[x] - 12*x^2*y^2*Log[y]))/(48*(x - y)^5*y^2) - 
      (\[Delta]1^2*(-2*x^5 + 15*x^4*y - 60*x^3*y^2 + 20*x^2*y^3 + 30*x*y^4 - 
         3*y^5 + 60*x^2*y^3*Log[x] - 60*x^2*y^3*Log[y]))/
       (240*(x - y)^6*y^3) - (\[Delta]1^3*(x^6 - 8*x^5*y + 30*x^4*y^2 - 
         80*x^3*y^3 + 35*x^2*y^4 + 24*x*y^5 - 2*y^6 + 60*x^2*y^4*Log[x] - 
         60*x^2*y^4*Log[y]))/(240*(x - y)^7*y^4) - 
      (\[Delta]1^4*(-4*x^7 + 35*x^6*y - 140*x^5*y^2 + 350*x^4*y^3 - 
         700*x^3*y^4 + 329*x^2*y^5 + 140*x*y^6 - 10*y^7 + 
         420*x^2*y^5*Log[x] - 420*x^2*y^5*Log[y]))/(1680*(x - y)^8*y^5)) + 
    \[Delta]2^2*(-(x^4 - 8*x^3*y + 8*x*y^3 - y^4 + 12*x^2*y^2*Log[x] - 
         12*x^2*y^2*Log[y])/(48*(x - y)^5*y^2) - 
      (\[Delta]1*(-2*x^5 + 15*x^4*y - 60*x^3*y^2 + 20*x^2*y^3 + 30*x*y^4 - 
         3*y^5 + 60*x^2*y^3*Log[x] - 60*x^2*y^3*Log[y]))/
       (240*(x - y)^6*y^3) - (\[Delta]1^2*(x^6 - 8*x^5*y + 30*x^4*y^2 - 
         80*x^3*y^3 + 35*x^2*y^4 + 24*x*y^5 - 2*y^6 + 60*x^2*y^4*Log[x] - 
         60*x^2*y^4*Log[y]))/(240*(x - y)^7*y^4) - 
      (\[Delta]1^3*(-4*x^7 + 35*x^6*y - 140*x^5*y^2 + 350*x^4*y^3 - 
         700*x^3*y^4 + 329*x^2*y^5 + 140*x*y^6 - 10*y^7 + 
         420*x^2*y^5*Log[x] - 420*x^2*y^5*Log[y]))/(1680*(x - y)^8*y^5) - 
      (\[Delta]1^4*(5*x^8 - 48*x^7*y + 210*x^6*y^2 - 560*x^5*y^3 + 
         1050*x^4*y^4 - 1680*x^3*y^5 + 798*x^2*y^6 + 240*x*y^7 - 15*y^8 + 
         840*x^2*y^6*Log[x] - 840*x^2*y^6*Log[y]))/(3360*(x - y)^9*y^6)) + 
    \[Delta]2^3*(-(-2*x^5 + 15*x^4*y - 60*x^3*y^2 + 20*x^2*y^3 + 30*x*y^4 - 
         3*y^5 + 60*x^2*y^3*Log[x] - 60*x^2*y^3*Log[y])/(240*(x - y)^6*y^3) - 
      (\[Delta]1*(x^6 - 8*x^5*y + 30*x^4*y^2 - 80*x^3*y^3 + 35*x^2*y^4 + 
         24*x*y^5 - 2*y^6 + 60*x^2*y^4*Log[x] - 60*x^2*y^4*Log[y]))/
       (240*(x - y)^7*y^4) - (\[Delta]1^2*(-4*x^7 + 35*x^6*y - 140*x^5*y^2 + 
         350*x^4*y^3 - 700*x^3*y^4 + 329*x^2*y^5 + 140*x*y^6 - 10*y^7 + 
         420*x^2*y^5*Log[x] - 420*x^2*y^5*Log[y]))/(1680*(x - y)^8*y^5) - 
      (\[Delta]1^3*(5*x^8 - 48*x^7*y + 210*x^6*y^2 - 560*x^5*y^3 + 
         1050*x^4*y^4 - 1680*x^3*y^5 + 798*x^2*y^6 + 240*x*y^7 - 15*y^8 + 
         840*x^2*y^6*Log[x] - 840*x^2*y^6*Log[y]))/(3360*(x - y)^9*y^6) - 
      (\[Delta]1^4*(-10*x^9 + 105*x^8*y - 504*x^7*y^2 + 1470*x^6*y^3 - 
         2940*x^5*y^4 + 4410*x^4*y^5 - 5880*x^3*y^6 + 2754*x^2*y^7 + 
         630*x*y^8 - 35*y^9 + 2520*x^2*y^7*Log[x] - 2520*x^2*y^7*Log[y]))/
       (10080*(x - y)^10*y^7)) + \[Delta]2^4*
     (-(x^6 - 8*x^5*y + 30*x^4*y^2 - 80*x^3*y^3 + 35*x^2*y^4 + 24*x*y^5 - 
         2*y^6 + 60*x^2*y^4*Log[x] - 60*x^2*y^4*Log[y])/(240*(x - y)^7*y^4) - 
      (\[Delta]1*(-4*x^7 + 35*x^6*y - 140*x^5*y^2 + 350*x^4*y^3 - 
         700*x^3*y^4 + 329*x^2*y^5 + 140*x*y^6 - 10*y^7 + 
         420*x^2*y^5*Log[x] - 420*x^2*y^5*Log[y]))/(1680*(x - y)^8*y^5) - 
      (\[Delta]1^2*(5*x^8 - 48*x^7*y + 210*x^6*y^2 - 560*x^5*y^3 + 
         1050*x^4*y^4 - 1680*x^3*y^5 + 798*x^2*y^6 + 240*x*y^7 - 15*y^8 + 
         840*x^2*y^6*Log[x] - 840*x^2*y^6*Log[y]))/(3360*(x - y)^9*y^6) - 
      (\[Delta]1^3*(-10*x^9 + 105*x^8*y - 504*x^7*y^2 + 1470*x^6*y^3 - 
         2940*x^5*y^4 + 4410*x^4*y^5 - 5880*x^3*y^6 + 2754*x^2*y^7 + 
         630*x*y^8 - 35*y^9 + 2520*x^2*y^7*Log[x] - 2520*x^2*y^7*Log[y]))/
       (10080*(x - y)^10*y^7) - (\[Delta]1^4*(7*x^10 - 80*x^9*y + 
         420*x^8*y^2 - 1344*x^7*y^3 + 2940*x^6*y^4 - 4704*x^5*y^5 + 
         5880*x^4*y^6 - 6720*x^3*y^7 + 3069*x^2*y^8 + 560*x*y^9 - 28*y^10 + 
         2520*x^2*y^8*Log[x] - 2520*x^2*y^8*Log[y]))/(10080*(x - y)^11*y^8))
D00funcd134[x_, y_, \[Delta]1_, \[Delta]2_] := 
   -(x^2 - 4*x*y + 3*y^2 + 2*y^2*Log[x] - 2*y^2*Log[y])/(8*(x - y)^3) + 
    (\[Delta]1*(x^3 - 6*x^2*y + 3*x*y^2 + 2*y^3 + 6*x*y^2*Log[x] - 
       6*x*y^2*Log[y]))/(24*x*(x - y)^4) - 
    (\[Delta]1^2*(x^4 - 8*x^3*y + 8*x*y^3 - y^4 + 12*x^2*y^2*Log[x] - 
       12*x^2*y^2*Log[y]))/(48*x^2*(x - y)^5) - 
    (\[Delta]1^3*(-3*x^5 + 30*x^4*y + 20*x^3*y^2 - 60*x^2*y^3 + 15*x*y^4 - 
       2*y^5 - 60*x^3*y^2*Log[x] + 60*x^3*y^2*Log[y]))/(240*x^3*(x - y)^6) - 
    (\[Delta]1^4*(2*x^6 - 24*x^5*y - 35*x^4*y^2 + 80*x^3*y^3 - 30*x^2*y^4 + 
       8*x*y^5 - y^6 + 60*x^4*y^2*Log[x] - 60*x^4*y^2*Log[y]))/
     (240*x^4*(x - y)^7) + \[Delta]2*
     ((x^3 - 6*x^2*y + 3*x*y^2 + 2*y^3 + 6*x*y^2*Log[x] - 6*x*y^2*Log[y])/
       (24*x*(x - y)^4) - (\[Delta]1*(x^4 - 8*x^3*y + 8*x*y^3 - y^4 + 
         12*x^2*y^2*Log[x] - 12*x^2*y^2*Log[y]))/(48*x^2*(x - y)^5) - 
      (\[Delta]1^2*(-3*x^5 + 30*x^4*y + 20*x^3*y^2 - 60*x^2*y^3 + 15*x*y^4 - 
         2*y^5 - 60*x^3*y^2*Log[x] + 60*x^3*y^2*Log[y]))/
       (240*x^3*(x - y)^6) - (\[Delta]1^3*(2*x^6 - 24*x^5*y - 35*x^4*y^2 + 
         80*x^3*y^3 - 30*x^2*y^4 + 8*x*y^5 - y^6 + 60*x^4*y^2*Log[x] - 
         60*x^4*y^2*Log[y]))/(240*x^4*(x - y)^7) - 
      (\[Delta]1^4*(-10*x^7 + 140*x^6*y + 329*x^5*y^2 - 700*x^4*y^3 + 
         350*x^3*y^4 - 140*x^2*y^5 + 35*x*y^6 - 4*y^7 - 420*x^5*y^2*Log[x] + 
         420*x^5*y^2*Log[y]))/(1680*x^5*(x - y)^8)) + 
    \[Delta]2^2*(-(x^4 - 8*x^3*y + 8*x*y^3 - y^4 + 12*x^2*y^2*Log[x] - 
         12*x^2*y^2*Log[y])/(48*x^2*(x - y)^5) - 
      (\[Delta]1*(-3*x^5 + 30*x^4*y + 20*x^3*y^2 - 60*x^2*y^3 + 15*x*y^4 - 
         2*y^5 - 60*x^3*y^2*Log[x] + 60*x^3*y^2*Log[y]))/
       (240*x^3*(x - y)^6) - (\[Delta]1^2*(2*x^6 - 24*x^5*y - 35*x^4*y^2 + 
         80*x^3*y^3 - 30*x^2*y^4 + 8*x*y^5 - y^6 + 60*x^4*y^2*Log[x] - 
         60*x^4*y^2*Log[y]))/(240*x^4*(x - y)^7) - 
      (\[Delta]1^3*(-10*x^7 + 140*x^6*y + 329*x^5*y^2 - 700*x^4*y^3 + 
         350*x^3*y^4 - 140*x^2*y^5 + 35*x*y^6 - 4*y^7 - 420*x^5*y^2*Log[x] + 
         420*x^5*y^2*Log[y]))/(1680*x^5*(x - y)^8) - 
      (\[Delta]1^4*(15*x^8 - 240*x^7*y - 798*x^6*y^2 + 1680*x^5*y^3 - 
         1050*x^4*y^4 + 560*x^3*y^5 - 210*x^2*y^6 + 48*x*y^7 - 5*y^8 + 
         840*x^6*y^2*Log[x] - 840*x^6*y^2*Log[y]))/(3360*x^6*(x - y)^9)) + 
    \[Delta]2^3*(-(-3*x^5 + 30*x^4*y + 20*x^3*y^2 - 60*x^2*y^3 + 15*x*y^4 - 
         2*y^5 - 60*x^3*y^2*Log[x] + 60*x^3*y^2*Log[y])/(240*x^3*(x - y)^6) - 
      (\[Delta]1*(2*x^6 - 24*x^5*y - 35*x^4*y^2 + 80*x^3*y^3 - 30*x^2*y^4 + 
         8*x*y^5 - y^6 + 60*x^4*y^2*Log[x] - 60*x^4*y^2*Log[y]))/
       (240*x^4*(x - y)^7) - (\[Delta]1^2*(-10*x^7 + 140*x^6*y + 
         329*x^5*y^2 - 700*x^4*y^3 + 350*x^3*y^4 - 140*x^2*y^5 + 35*x*y^6 - 
         4*y^7 - 420*x^5*y^2*Log[x] + 420*x^5*y^2*Log[y]))/
       (1680*x^5*(x - y)^8) - (\[Delta]1^3*(15*x^8 - 240*x^7*y - 
         798*x^6*y^2 + 1680*x^5*y^3 - 1050*x^4*y^4 + 560*x^3*y^5 - 
         210*x^2*y^6 + 48*x*y^7 - 5*y^8 + 840*x^6*y^2*Log[x] - 
         840*x^6*y^2*Log[y]))/(3360*x^6*(x - y)^9) - 
      (\[Delta]1^4*(-35*x^9 + 630*x^8*y + 2754*x^7*y^2 - 5880*x^6*y^3 + 
         4410*x^5*y^4 - 2940*x^4*y^5 + 1470*x^3*y^6 - 504*x^2*y^7 + 
         105*x*y^8 - 10*y^9 - 2520*x^7*y^2*Log[x] + 2520*x^7*y^2*Log[y]))/
       (10080*x^7*(x - y)^10)) + \[Delta]2^4*
     ((-2*x^6 + 24*x^5*y + 35*x^4*y^2 - 80*x^3*y^3 + 30*x^2*y^4 - 8*x*y^5 + 
        y^6 - 60*x^4*y^2*Log[x] + 60*x^4*y^2*Log[y])/(240*x^4*(x - y)^7) - 
      (\[Delta]1*(-10*x^7 + 140*x^6*y + 329*x^5*y^2 - 700*x^4*y^3 + 
         350*x^3*y^4 - 140*x^2*y^5 + 35*x*y^6 - 4*y^7 - 420*x^5*y^2*Log[x] + 
         420*x^5*y^2*Log[y]))/(1680*x^5*(x - y)^8) - 
      (\[Delta]1^2*(15*x^8 - 240*x^7*y - 798*x^6*y^2 + 1680*x^5*y^3 - 
         1050*x^4*y^4 + 560*x^3*y^5 - 210*x^2*y^6 + 48*x*y^7 - 5*y^8 + 
         840*x^6*y^2*Log[x] - 840*x^6*y^2*Log[y]))/(3360*x^6*(x - y)^9) - 
      (\[Delta]1^3*(-35*x^9 + 630*x^8*y + 2754*x^7*y^2 - 5880*x^6*y^3 + 
         4410*x^5*y^4 - 2940*x^4*y^5 + 1470*x^3*y^6 - 504*x^2*y^7 + 
         105*x*y^8 - 10*y^9 - 2520*x^7*y^2*Log[x] + 2520*x^7*y^2*Log[y]))/
       (10080*x^7*(x - y)^10) - (\[Delta]1^4*(28*x^10 - 560*x^9*y - 
         3069*x^8*y^2 + 6720*x^7*y^3 - 5880*x^6*y^4 + 4704*x^5*y^5 - 
         2940*x^4*y^6 + 1344*x^3*y^7 - 420*x^2*y^8 + 80*x*y^9 - 7*y^10 + 
         2520*x^8*y^2*Log[x] - 2520*x^8*y^2*Log[y]))/(10080*x^8*(x - y)^11))
D00funcd124[x_, z_, \[Delta]1_, \[Delta]2_] := 
   -(x^2 - 4*x*z + 3*z^2 + 2*z^2*Log[x] - 2*z^2*Log[z])/(8*(x - z)^3) + 
    (\[Delta]1*(x^3 - 6*x^2*z + 3*x*z^2 + 2*z^3 + 6*x*z^2*Log[x] - 
       6*x*z^2*Log[z]))/(24*x*(x - z)^4) - 
    (\[Delta]1^2*(x^4 - 8*x^3*z + 8*x*z^3 - z^4 + 12*x^2*z^2*Log[x] - 
       12*x^2*z^2*Log[z]))/(48*x^2*(x - z)^5) - 
    (\[Delta]1^3*(-3*x^5 + 30*x^4*z + 20*x^3*z^2 - 60*x^2*z^3 + 15*x*z^4 - 
       2*z^5 - 60*x^3*z^2*Log[x] + 60*x^3*z^2*Log[z]))/(240*x^3*(x - z)^6) - 
    (\[Delta]1^4*(2*x^6 - 24*x^5*z - 35*x^4*z^2 + 80*x^3*z^3 - 30*x^2*z^4 + 
       8*x*z^5 - z^6 + 60*x^4*z^2*Log[x] - 60*x^4*z^2*Log[z]))/
     (240*x^4*(x - z)^7) + \[Delta]2*
     ((x^3 - 6*x^2*z + 3*x*z^2 + 2*z^3 + 6*x*z^2*Log[x] - 6*x*z^2*Log[z])/
       (24*x*(x - z)^4) - (\[Delta]1*(x^4 - 8*x^3*z + 8*x*z^3 - z^4 + 
         12*x^2*z^2*Log[x] - 12*x^2*z^2*Log[z]))/(48*x^2*(x - z)^5) - 
      (\[Delta]1^2*(-3*x^5 + 30*x^4*z + 20*x^3*z^2 - 60*x^2*z^3 + 15*x*z^4 - 
         2*z^5 - 60*x^3*z^2*Log[x] + 60*x^3*z^2*Log[z]))/
       (240*x^3*(x - z)^6) - (\[Delta]1^3*(2*x^6 - 24*x^5*z - 35*x^4*z^2 + 
         80*x^3*z^3 - 30*x^2*z^4 + 8*x*z^5 - z^6 + 60*x^4*z^2*Log[x] - 
         60*x^4*z^2*Log[z]))/(240*x^4*(x - z)^7) - 
      (\[Delta]1^4*(-10*x^7 + 140*x^6*z + 329*x^5*z^2 - 700*x^4*z^3 + 
         350*x^3*z^4 - 140*x^2*z^5 + 35*x*z^6 - 4*z^7 - 420*x^5*z^2*Log[x] + 
         420*x^5*z^2*Log[z]))/(1680*x^5*(x - z)^8)) + 
    \[Delta]2^2*(-(x^4 - 8*x^3*z + 8*x*z^3 - z^4 + 12*x^2*z^2*Log[x] - 
         12*x^2*z^2*Log[z])/(48*x^2*(x - z)^5) - 
      (\[Delta]1*(-3*x^5 + 30*x^4*z + 20*x^3*z^2 - 60*x^2*z^3 + 15*x*z^4 - 
         2*z^5 - 60*x^3*z^2*Log[x] + 60*x^3*z^2*Log[z]))/
       (240*x^3*(x - z)^6) - (\[Delta]1^2*(2*x^6 - 24*x^5*z - 35*x^4*z^2 + 
         80*x^3*z^3 - 30*x^2*z^4 + 8*x*z^5 - z^6 + 60*x^4*z^2*Log[x] - 
         60*x^4*z^2*Log[z]))/(240*x^4*(x - z)^7) - 
      (\[Delta]1^3*(-10*x^7 + 140*x^6*z + 329*x^5*z^2 - 700*x^4*z^3 + 
         350*x^3*z^4 - 140*x^2*z^5 + 35*x*z^6 - 4*z^7 - 420*x^5*z^2*Log[x] + 
         420*x^5*z^2*Log[z]))/(1680*x^5*(x - z)^8) - 
      (\[Delta]1^4*(15*x^8 - 240*x^7*z - 798*x^6*z^2 + 1680*x^5*z^3 - 
         1050*x^4*z^4 + 560*x^3*z^5 - 210*x^2*z^6 + 48*x*z^7 - 5*z^8 + 
         840*x^6*z^2*Log[x] - 840*x^6*z^2*Log[z]))/(3360*x^6*(x - z)^9)) + 
    \[Delta]2^3*(-(-3*x^5 + 30*x^4*z + 20*x^3*z^2 - 60*x^2*z^3 + 15*x*z^4 - 
         2*z^5 - 60*x^3*z^2*Log[x] + 60*x^3*z^2*Log[z])/(240*x^3*(x - z)^6) - 
      (\[Delta]1*(2*x^6 - 24*x^5*z - 35*x^4*z^2 + 80*x^3*z^3 - 30*x^2*z^4 + 
         8*x*z^5 - z^6 + 60*x^4*z^2*Log[x] - 60*x^4*z^2*Log[z]))/
       (240*x^4*(x - z)^7) - (\[Delta]1^2*(-10*x^7 + 140*x^6*z + 
         329*x^5*z^2 - 700*x^4*z^3 + 350*x^3*z^4 - 140*x^2*z^5 + 35*x*z^6 - 
         4*z^7 - 420*x^5*z^2*Log[x] + 420*x^5*z^2*Log[z]))/
       (1680*x^5*(x - z)^8) - (\[Delta]1^3*(15*x^8 - 240*x^7*z - 
         798*x^6*z^2 + 1680*x^5*z^3 - 1050*x^4*z^4 + 560*x^3*z^5 - 
         210*x^2*z^6 + 48*x*z^7 - 5*z^8 + 840*x^6*z^2*Log[x] - 
         840*x^6*z^2*Log[z]))/(3360*x^6*(x - z)^9) - 
      (\[Delta]1^4*(-35*x^9 + 630*x^8*z + 2754*x^7*z^2 - 5880*x^6*z^3 + 
         4410*x^5*z^4 - 2940*x^4*z^5 + 1470*x^3*z^6 - 504*x^2*z^7 + 
         105*x*z^8 - 10*z^9 - 2520*x^7*z^2*Log[x] + 2520*x^7*z^2*Log[z]))/
       (10080*x^7*(x - z)^10)) + \[Delta]2^4*
     ((-2*x^6 + 24*x^5*z + 35*x^4*z^2 - 80*x^3*z^3 + 30*x^2*z^4 - 8*x*z^5 + 
        z^6 - 60*x^4*z^2*Log[x] + 60*x^4*z^2*Log[z])/(240*x^4*(x - z)^7) - 
      (\[Delta]1*(-10*x^7 + 140*x^6*z + 329*x^5*z^2 - 700*x^4*z^3 + 
         350*x^3*z^4 - 140*x^2*z^5 + 35*x*z^6 - 4*z^7 - 420*x^5*z^2*Log[x] + 
         420*x^5*z^2*Log[z]))/(1680*x^5*(x - z)^8) - 
      (\[Delta]1^2*(15*x^8 - 240*x^7*z - 798*x^6*z^2 + 1680*x^5*z^3 - 
         1050*x^4*z^4 + 560*x^3*z^5 - 210*x^2*z^6 + 48*x*z^7 - 5*z^8 + 
         840*x^6*z^2*Log[x] - 840*x^6*z^2*Log[z]))/(3360*x^6*(x - z)^9) - 
      (\[Delta]1^3*(-35*x^9 + 630*x^8*z + 2754*x^7*z^2 - 5880*x^6*z^3 + 
         4410*x^5*z^4 - 2940*x^4*z^5 + 1470*x^3*z^6 - 504*x^2*z^7 + 
         105*x*z^8 - 10*z^9 - 2520*x^7*z^2*Log[x] + 2520*x^7*z^2*Log[z]))/
       (10080*x^7*(x - z)^10) - (\[Delta]1^4*(28*x^10 - 560*x^9*z - 
         3069*x^8*z^2 + 6720*x^7*z^3 - 5880*x^6*z^4 + 4704*x^5*z^5 - 
         2940*x^4*z^6 + 1344*x^3*z^7 - 420*x^2*z^8 + 80*x*z^9 - 7*z^10 + 
         2520*x^8*z^2*Log[x] - 2520*x^8*z^2*Log[z]))/(10080*x^8*(x - z)^11))
D00funcd123[x_, w_, \[Delta]1_, \[Delta]2_] := 
   (3*w^2 - 4*w*x + x^2 - 2*w^2*Log[w] + 2*w^2*Log[x])/(8*(w - x)^3) + 
    (\[Delta]1*(2*w^3 + 3*w^2*x - 6*w*x^2 + x^3 - 6*w^2*x*Log[w] + 
       6*w^2*x*Log[x]))/(24*(w - x)^4*x) - 
    (\[Delta]1^2*(w^4 - 8*w^3*x + 8*w*x^3 - x^4 + 12*w^2*x^2*Log[w] - 
       12*w^2*x^2*Log[x]))/(48*(w - x)^5*x^2) - 
    (\[Delta]1^3*(-2*w^5 + 15*w^4*x - 60*w^3*x^2 + 20*w^2*x^3 + 30*w*x^4 - 
       3*x^5 + 60*w^2*x^3*Log[w] - 60*w^2*x^3*Log[x]))/(240*(w - x)^6*x^3) - 
    (\[Delta]1^4*(w^6 - 8*w^5*x + 30*w^4*x^2 - 80*w^3*x^3 + 35*w^2*x^4 + 
       24*w*x^5 - 2*x^6 + 60*w^2*x^4*Log[w] - 60*w^2*x^4*Log[x]))/
     (240*(w - x)^7*x^4) + \[Delta]2*
     ((2*w^3 + 3*w^2*x - 6*w*x^2 + x^3 - 6*w^2*x*Log[w] + 6*w^2*x*Log[x])/
       (24*(w - x)^4*x) - (\[Delta]1*(w^4 - 8*w^3*x + 8*w*x^3 - x^4 + 
         12*w^2*x^2*Log[w] - 12*w^2*x^2*Log[x]))/(48*(w - x)^5*x^2) - 
      (\[Delta]1^2*(-2*w^5 + 15*w^4*x - 60*w^3*x^2 + 20*w^2*x^3 + 30*w*x^4 - 
         3*x^5 + 60*w^2*x^3*Log[w] - 60*w^2*x^3*Log[x]))/
       (240*(w - x)^6*x^3) - (\[Delta]1^3*(w^6 - 8*w^5*x + 30*w^4*x^2 - 
         80*w^3*x^3 + 35*w^2*x^4 + 24*w*x^5 - 2*x^6 + 60*w^2*x^4*Log[w] - 
         60*w^2*x^4*Log[x]))/(240*(w - x)^7*x^4) - 
      (\[Delta]1^4*(-4*w^7 + 35*w^6*x - 140*w^5*x^2 + 350*w^4*x^3 - 
         700*w^3*x^4 + 329*w^2*x^5 + 140*w*x^6 - 10*x^7 + 
         420*w^2*x^5*Log[w] - 420*w^2*x^5*Log[x]))/(1680*(w - x)^8*x^5)) + 
    \[Delta]2^2*(-(w^4 - 8*w^3*x + 8*w*x^3 - x^4 + 12*w^2*x^2*Log[w] - 
         12*w^2*x^2*Log[x])/(48*(w - x)^5*x^2) - 
      (\[Delta]1*(-2*w^5 + 15*w^4*x - 60*w^3*x^2 + 20*w^2*x^3 + 30*w*x^4 - 
         3*x^5 + 60*w^2*x^3*Log[w] - 60*w^2*x^3*Log[x]))/
       (240*(w - x)^6*x^3) - (\[Delta]1^2*(w^6 - 8*w^5*x + 30*w^4*x^2 - 
         80*w^3*x^3 + 35*w^2*x^4 + 24*w*x^5 - 2*x^6 + 60*w^2*x^4*Log[w] - 
         60*w^2*x^4*Log[x]))/(240*(w - x)^7*x^4) - 
      (\[Delta]1^3*(-4*w^7 + 35*w^6*x - 140*w^5*x^2 + 350*w^4*x^3 - 
         700*w^3*x^4 + 329*w^2*x^5 + 140*w*x^6 - 10*x^7 + 
         420*w^2*x^5*Log[w] - 420*w^2*x^5*Log[x]))/(1680*(w - x)^8*x^5) - 
      (\[Delta]1^4*(5*w^8 - 48*w^7*x + 210*w^6*x^2 - 560*w^5*x^3 + 
         1050*w^4*x^4 - 1680*w^3*x^5 + 798*w^2*x^6 + 240*w*x^7 - 15*x^8 + 
         840*w^2*x^6*Log[w] - 840*w^2*x^6*Log[x]))/(3360*(w - x)^9*x^6)) + 
    \[Delta]2^3*(-(-2*w^5 + 15*w^4*x - 60*w^3*x^2 + 20*w^2*x^3 + 30*w*x^4 - 
         3*x^5 + 60*w^2*x^3*Log[w] - 60*w^2*x^3*Log[x])/(240*(w - x)^6*x^3) - 
      (\[Delta]1*(w^6 - 8*w^5*x + 30*w^4*x^2 - 80*w^3*x^3 + 35*w^2*x^4 + 
         24*w*x^5 - 2*x^6 + 60*w^2*x^4*Log[w] - 60*w^2*x^4*Log[x]))/
       (240*(w - x)^7*x^4) - (\[Delta]1^2*(-4*w^7 + 35*w^6*x - 140*w^5*x^2 + 
         350*w^4*x^3 - 700*w^3*x^4 + 329*w^2*x^5 + 140*w*x^6 - 10*x^7 + 
         420*w^2*x^5*Log[w] - 420*w^2*x^5*Log[x]))/(1680*(w - x)^8*x^5) - 
      (\[Delta]1^3*(5*w^8 - 48*w^7*x + 210*w^6*x^2 - 560*w^5*x^3 + 
         1050*w^4*x^4 - 1680*w^3*x^5 + 798*w^2*x^6 + 240*w*x^7 - 15*x^8 + 
         840*w^2*x^6*Log[w] - 840*w^2*x^6*Log[x]))/(3360*(w - x)^9*x^6) - 
      (\[Delta]1^4*(-10*w^9 + 105*w^8*x - 504*w^7*x^2 + 1470*w^6*x^3 - 
         2940*w^5*x^4 + 4410*w^4*x^5 - 5880*w^3*x^6 + 2754*w^2*x^7 + 
         630*w*x^8 - 35*x^9 + 2520*w^2*x^7*Log[w] - 2520*w^2*x^7*Log[x]))/
       (10080*(w - x)^10*x^7)) + \[Delta]2^4*
     (-(w^6 - 8*w^5*x + 30*w^4*x^2 - 80*w^3*x^3 + 35*w^2*x^4 + 24*w*x^5 - 
         2*x^6 + 60*w^2*x^4*Log[w] - 60*w^2*x^4*Log[x])/(240*(w - x)^7*x^4) - 
      (\[Delta]1*(-4*w^7 + 35*w^6*x - 140*w^5*x^2 + 350*w^4*x^3 - 
         700*w^3*x^4 + 329*w^2*x^5 + 140*w*x^6 - 10*x^7 + 
         420*w^2*x^5*Log[w] - 420*w^2*x^5*Log[x]))/(1680*(w - x)^8*x^5) - 
      (\[Delta]1^2*(5*w^8 - 48*w^7*x + 210*w^6*x^2 - 560*w^5*x^3 + 
         1050*w^4*x^4 - 1680*w^3*x^5 + 798*w^2*x^6 + 240*w*x^7 - 15*x^8 + 
         840*w^2*x^6*Log[w] - 840*w^2*x^6*Log[x]))/(3360*(w - x)^9*x^6) - 
      (\[Delta]1^3*(-10*w^9 + 105*w^8*x - 504*w^7*x^2 + 1470*w^6*x^3 - 
         2940*w^5*x^4 + 4410*w^4*x^5 - 5880*w^3*x^6 + 2754*w^2*x^7 + 
         630*w*x^8 - 35*x^9 + 2520*w^2*x^7*Log[w] - 2520*w^2*x^7*Log[x]))/
       (10080*(w - x)^10*x^7) - (\[Delta]1^4*(7*w^10 - 80*w^9*x + 
         420*w^8*x^2 - 1344*w^7*x^3 + 2940*w^6*x^4 - 4704*w^5*x^5 + 
         5880*w^4*x^6 - 6720*w^3*x^7 + 3069*w^2*x^8 + 560*w*x^9 - 28*x^10 + 
         2520*w^2*x^8*Log[w] - 2520*w^2*x^8*Log[x]))/(10080*(w - x)^11*x^8))
D00funcd12d34[x_, z_, \[Delta]1_, \[Delta]2_] := 
   -(x^2 - z^2 - 2*x*z*Log[x] + 2*x*z*Log[z])/(4*(x - z)^3) + 
    (\[Delta]1*(x^2 + 4*x*z - 5*z^2 - 4*x*z*Log[x] - 2*z^2*Log[x] + 
       4*x*z*Log[z] + 2*z^2*Log[z]))/(8*(x - z)^4) - 
    (\[Delta]1^2*(x^3 + 9*x^2*z - 9*x*z^2 - z^3 - 6*x^2*z*Log[x] - 
       6*x*z^2*Log[x] + 6*x^2*z*Log[z] + 6*x*z^2*Log[z]))/(12*x*(x - z)^5) + 
    (\[Delta]1^3*(3*x^4 + 44*x^3*z - 36*x^2*z^2 - 12*x*z^3 + z^4 - 
       24*x^3*z*Log[x] - 36*x^2*z^2*Log[x] + 24*x^3*z*Log[z] + 
       36*x^2*z^2*Log[z]))/(48*x^2*(x - z)^6) - 
    (\[Delta]1^4*(6*x^5 + 125*x^4*z - 80*x^3*z^2 - 60*x^2*z^3 + 10*x*z^4 - 
       z^5 - 60*x^4*z*Log[x] - 120*x^3*z^2*Log[x] + 60*x^4*z*Log[z] + 
       120*x^3*z^2*Log[z]))/(120*x^3*(x - z)^7) + 
    \[Delta]2*((-5*x^2 + 4*x*z + z^2 + 2*x^2*Log[x] + 4*x*z*Log[x] - 
        2*x^2*Log[z] - 4*x*z*Log[z])/(8*(x - z)^4) - 
      (\[Delta]1*(-3*x^2 + 3*z^2 + x^2*Log[x] + 4*x*z*Log[x] + z^2*Log[x] - 
         x^2*Log[z] - 4*x*z*Log[z] - z^2*Log[z]))/(4*(x - z)^5) + 
      (\[Delta]1^2*(-10*x^3 - 9*x^2*z + 18*x*z^2 + z^3 + 3*x^3*Log[x] + 
         18*x^2*z*Log[x] + 9*x*z^2*Log[x] - 3*x^3*Log[z] - 18*x^2*z*Log[z] - 
         9*x*z^2*Log[z]))/(12*x*(x - z)^6) - 
      (\[Delta]1^3*(-43*x^4 - 80*x^3*z + 108*x^2*z^2 + 16*x*z^3 - z^4 + 
         12*x^4*Log[x] + 96*x^3*z*Log[x] + 72*x^2*z^2*Log[x] - 
         12*x^4*Log[z] - 96*x^3*z*Log[z] - 72*x^2*z^2*Log[z]))/
       (48*x^2*(x - z)^7) - (\[Delta]1^4*(227*x^5 + 650*x^4*z - 700*x^3*z^2 - 
         200*x^2*z^3 + 25*x*z^4 - 2*z^5 - 60*x^5*Log[x] - 600*x^4*z*Log[x] - 
         600*x^3*z^2*Log[x] + 60*x^5*Log[z] + 600*x^4*z*Log[z] + 
         600*x^3*z^2*Log[z]))/(240*x^3*(x - z)^8)) + 
    \[Delta]2^2*(-(x^3 + 9*x^2*z - 9*x*z^2 - z^3 - 6*x^2*z*Log[x] - 
         6*x*z^2*Log[x] + 6*x^2*z*Log[z] + 6*x*z^2*Log[z])/(12*(x - z)^5*z) + 
      (\[Delta]1*(x^3 + 18*x^2*z - 9*x*z^2 - 10*z^3 - 9*x^2*z*Log[x] - 
         18*x*z^2*Log[x] - 3*z^3*Log[x] + 9*x^2*z*Log[z] + 18*x*z^2*Log[z] + 
         3*z^3*Log[z]))/(12*(x - z)^6*z) - 
      (\[Delta]1^2*(x^4 + 28*x^3*z - 28*x*z^3 - z^4 - 12*x^3*z*Log[x] - 
         36*x^2*z^2*Log[x] - 12*x*z^3*Log[x] + 12*x^3*z*Log[z] + 
         36*x^2*z^2*Log[z] + 12*x*z^3*Log[z]))/(12*x*(x - z)^7*z) + 
      (\[Delta]1^3*(4*x^5 + 155*x^4*z + 80*x^3*z^2 - 220*x^2*z^3 - 20*x*z^4 + 
         z^5 - 60*x^4*z*Log[x] - 240*x^3*z^2*Log[x] - 120*x^2*z^3*Log[x] + 
         60*x^4*z*Log[z] + 240*x^3*z^2*Log[z] + 120*x^2*z^3*Log[z]))/
       (48*x^2*(x - z)^8*z) - (\[Delta]1^4*(10*x^6 + 501*x^5*z + 
         525*x^4*z^2 - 900*x^3*z^3 - 150*x^2*z^4 + 15*x*z^5 - z^6 - 
         180*x^5*z*Log[x] - 900*x^4*z^2*Log[x] - 600*x^3*z^3*Log[x] + 
         180*x^5*z*Log[z] + 900*x^4*z^2*Log[z] + 600*x^3*z^3*Log[z]))/
       (120*x^3*(x - z)^9*z)) + \[Delta]2^3*
     ((x^4 - 12*x^3*z - 36*x^2*z^2 + 44*x*z^3 + 3*z^4 + 36*x^2*z^2*Log[x] + 
        24*x*z^3*Log[x] - 36*x^2*z^2*Log[z] - 24*x*z^3*Log[z])/
       (48*(x - z)^6*z^2) - (\[Delta]1*(x^4 - 16*x^3*z - 108*x^2*z^2 + 
         80*x*z^3 + 43*z^4 + 72*x^2*z^2*Log[x] + 96*x*z^3*Log[x] + 
         12*z^4*Log[x] - 72*x^2*z^2*Log[z] - 96*x*z^3*Log[z] - 
         12*z^4*Log[z]))/(48*(x - z)^7*z^2) + 
      (\[Delta]1^2*(x^5 - 20*x^4*z - 220*x^3*z^2 + 80*x^2*z^3 + 155*x*z^4 + 
         4*z^5 + 120*x^3*z^2*Log[x] + 240*x^2*z^3*Log[x] + 60*x*z^4*Log[x] - 
         120*x^3*z^2*Log[z] - 240*x^2*z^3*Log[z] - 60*x*z^4*Log[z]))/
       (48*x*(x - z)^8*z^2) - (\[Delta]1^3*(x^6 - 24*x^5*z - 375*x^4*z^2 + 
         375*x^2*z^4 + 24*x*z^5 - z^6 + 180*x^4*z^2*Log[x] + 
         480*x^3*z^3*Log[x] + 180*x^2*z^4*Log[x] - 180*x^4*z^2*Log[z] - 
         480*x^3*z^3*Log[z] - 180*x^2*z^4*Log[z]))/(48*x^2*(x - z)^9*z^2) - 
      (\[Delta]1^4*(-5*x^7 + 140*x^6*z + 2877*x^5*z^2 + 1050*x^4*z^3 - 
         3675*x^3*z^4 - 420*x^2*z^5 + 35*x*z^6 - 2*z^7 - 
         1260*x^5*z^2*Log[x] - 4200*x^4*z^3*Log[x] - 2100*x^3*z^4*Log[x] + 
         1260*x^5*z^2*Log[z] + 4200*x^4*z^3*Log[z] + 2100*x^3*z^4*Log[z]))/
       (240*x^3*(x - z)^10*z^2)) + \[Delta]2^4*
     (-(x^5 - 10*x^4*z + 60*x^3*z^2 + 80*x^2*z^3 - 125*x*z^4 - 6*z^5 - 
         120*x^2*z^3*Log[x] - 60*x*z^4*Log[x] + 120*x^2*z^3*Log[z] + 
         60*x*z^4*Log[z])/(120*(x - z)^7*z^3) - 
      (\[Delta]1*(-2*x^5 + 25*x^4*z - 200*x^3*z^2 - 700*x^2*z^3 + 650*x*z^4 + 
         227*z^5 + 600*x^2*z^3*Log[x] + 600*x*z^4*Log[x] + 60*z^5*Log[x] - 
         600*x^2*z^3*Log[z] - 600*x*z^4*Log[z] - 60*z^5*Log[z]))/
       (240*(x - z)^8*z^3) - (\[Delta]1^2*(x^6 - 15*x^5*z + 150*x^4*z^2 + 
         900*x^3*z^3 - 525*x^2*z^4 - 501*x*z^5 - 10*z^6 - 
         600*x^3*z^3*Log[x] - 900*x^2*z^4*Log[x] - 180*x*z^5*Log[x] + 
         600*x^3*z^3*Log[z] + 900*x^2*z^4*Log[z] + 180*x*z^5*Log[z]))/
       (120*x*(x - z)^9*z^3) - (\[Delta]1^3*(-2*x^7 + 35*x^6*z - 
         420*x^5*z^2 - 3675*x^4*z^3 + 1050*x^3*z^4 + 2877*x^2*z^5 + 
         140*x*z^6 - 5*z^7 + 2100*x^4*z^3*Log[x] + 4200*x^3*z^4*Log[x] + 
         1260*x^2*z^5*Log[x] - 2100*x^4*z^3*Log[z] - 4200*x^3*z^4*Log[z] - 
         1260*x^2*z^5*Log[z]))/(240*x^2*(x - z)^10*z^3) - 
      (\[Delta]1^4*(x^8 - 20*x^7*z + 280*x^6*z^2 + 3276*x^5*z^3 - 
         3276*x^3*z^5 - 280*x^2*z^6 + 20*x*z^7 - z^8 - 1680*x^5*z^3*Log[x] - 
         4200*x^4*z^4*Log[x] - 1680*x^3*z^5*Log[x] + 1680*x^5*z^3*Log[z] + 
         4200*x^4*z^4*Log[z] + 1680*x^3*z^5*Log[z]))/(120*x^3*(x - z)^11*z^3))
D00funcd13d24[x_, y_, \[Delta]1_, \[Delta]2_] := 
   -(x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y])/(4*(x - y)^3) + 
    (\[Delta]1*(x^2 + 4*x*y - 5*y^2 - 4*x*y*Log[x] - 2*y^2*Log[x] + 
       4*x*y*Log[y] + 2*y^2*Log[y]))/(8*(x - y)^4) - 
    (\[Delta]1^2*(x^3 + 9*x^2*y - 9*x*y^2 - y^3 - 6*x^2*y*Log[x] - 
       6*x*y^2*Log[x] + 6*x^2*y*Log[y] + 6*x*y^2*Log[y]))/(12*x*(x - y)^5) + 
    (\[Delta]1^3*(3*x^4 + 44*x^3*y - 36*x^2*y^2 - 12*x*y^3 + y^4 - 
       24*x^3*y*Log[x] - 36*x^2*y^2*Log[x] + 24*x^3*y*Log[y] + 
       36*x^2*y^2*Log[y]))/(48*x^2*(x - y)^6) - 
    (\[Delta]1^4*(6*x^5 + 125*x^4*y - 80*x^3*y^2 - 60*x^2*y^3 + 10*x*y^4 - 
       y^5 - 60*x^4*y*Log[x] - 120*x^3*y^2*Log[x] + 60*x^4*y*Log[y] + 
       120*x^3*y^2*Log[y]))/(120*x^3*(x - y)^7) + 
    \[Delta]2*((-5*x^2 + 4*x*y + y^2 + 2*x^2*Log[x] + 4*x*y*Log[x] - 
        2*x^2*Log[y] - 4*x*y*Log[y])/(8*(x - y)^4) - 
      (\[Delta]1*(-3*x^2 + 3*y^2 + x^2*Log[x] + 4*x*y*Log[x] + y^2*Log[x] - 
         x^2*Log[y] - 4*x*y*Log[y] - y^2*Log[y]))/(4*(x - y)^5) + 
      (\[Delta]1^2*(-10*x^3 - 9*x^2*y + 18*x*y^2 + y^3 + 3*x^3*Log[x] + 
         18*x^2*y*Log[x] + 9*x*y^2*Log[x] - 3*x^3*Log[y] - 18*x^2*y*Log[y] - 
         9*x*y^2*Log[y]))/(12*x*(x - y)^6) - 
      (\[Delta]1^3*(-43*x^4 - 80*x^3*y + 108*x^2*y^2 + 16*x*y^3 - y^4 + 
         12*x^4*Log[x] + 96*x^3*y*Log[x] + 72*x^2*y^2*Log[x] - 
         12*x^4*Log[y] - 96*x^3*y*Log[y] - 72*x^2*y^2*Log[y]))/
       (48*x^2*(x - y)^7) - (\[Delta]1^4*(227*x^5 + 650*x^4*y - 700*x^3*y^2 - 
         200*x^2*y^3 + 25*x*y^4 - 2*y^5 - 60*x^5*Log[x] - 600*x^4*y*Log[x] - 
         600*x^3*y^2*Log[x] + 60*x^5*Log[y] + 600*x^4*y*Log[y] + 
         600*x^3*y^2*Log[y]))/(240*x^3*(x - y)^8)) + 
    \[Delta]2^2*(-(x^3 + 9*x^2*y - 9*x*y^2 - y^3 - 6*x^2*y*Log[x] - 
         6*x*y^2*Log[x] + 6*x^2*y*Log[y] + 6*x*y^2*Log[y])/(12*(x - y)^5*y) + 
      (\[Delta]1*(x^3 + 18*x^2*y - 9*x*y^2 - 10*y^3 - 9*x^2*y*Log[x] - 
         18*x*y^2*Log[x] - 3*y^3*Log[x] + 9*x^2*y*Log[y] + 18*x*y^2*Log[y] + 
         3*y^3*Log[y]))/(12*(x - y)^6*y) - 
      (\[Delta]1^2*(x^4 + 28*x^3*y - 28*x*y^3 - y^4 - 12*x^3*y*Log[x] - 
         36*x^2*y^2*Log[x] - 12*x*y^3*Log[x] + 12*x^3*y*Log[y] + 
         36*x^2*y^2*Log[y] + 12*x*y^3*Log[y]))/(12*x*(x - y)^7*y) + 
      (\[Delta]1^3*(4*x^5 + 155*x^4*y + 80*x^3*y^2 - 220*x^2*y^3 - 20*x*y^4 + 
         y^5 - 60*x^4*y*Log[x] - 240*x^3*y^2*Log[x] - 120*x^2*y^3*Log[x] + 
         60*x^4*y*Log[y] + 240*x^3*y^2*Log[y] + 120*x^2*y^3*Log[y]))/
       (48*x^2*(x - y)^8*y) - (\[Delta]1^4*(10*x^6 + 501*x^5*y + 
         525*x^4*y^2 - 900*x^3*y^3 - 150*x^2*y^4 + 15*x*y^5 - y^6 - 
         180*x^5*y*Log[x] - 900*x^4*y^2*Log[x] - 600*x^3*y^3*Log[x] + 
         180*x^5*y*Log[y] + 900*x^4*y^2*Log[y] + 600*x^3*y^3*Log[y]))/
       (120*x^3*(x - y)^9*y)) + \[Delta]2^3*
     ((x^4 - 12*x^3*y - 36*x^2*y^2 + 44*x*y^3 + 3*y^4 + 36*x^2*y^2*Log[x] + 
        24*x*y^3*Log[x] - 36*x^2*y^2*Log[y] - 24*x*y^3*Log[y])/
       (48*(x - y)^6*y^2) - (\[Delta]1*(x^4 - 16*x^3*y - 108*x^2*y^2 + 
         80*x*y^3 + 43*y^4 + 72*x^2*y^2*Log[x] + 96*x*y^3*Log[x] + 
         12*y^4*Log[x] - 72*x^2*y^2*Log[y] - 96*x*y^3*Log[y] - 
         12*y^4*Log[y]))/(48*(x - y)^7*y^2) + 
      (\[Delta]1^2*(x^5 - 20*x^4*y - 220*x^3*y^2 + 80*x^2*y^3 + 155*x*y^4 + 
         4*y^5 + 120*x^3*y^2*Log[x] + 240*x^2*y^3*Log[x] + 60*x*y^4*Log[x] - 
         120*x^3*y^2*Log[y] - 240*x^2*y^3*Log[y] - 60*x*y^4*Log[y]))/
       (48*x*(x - y)^8*y^2) - (\[Delta]1^3*(x^6 - 24*x^5*y - 375*x^4*y^2 + 
         375*x^2*y^4 + 24*x*y^5 - y^6 + 180*x^4*y^2*Log[x] + 
         480*x^3*y^3*Log[x] + 180*x^2*y^4*Log[x] - 180*x^4*y^2*Log[y] - 
         480*x^3*y^3*Log[y] - 180*x^2*y^4*Log[y]))/(48*x^2*(x - y)^9*y^2) - 
      (\[Delta]1^4*(-5*x^7 + 140*x^6*y + 2877*x^5*y^2 + 1050*x^4*y^3 - 
         3675*x^3*y^4 - 420*x^2*y^5 + 35*x*y^6 - 2*y^7 - 
         1260*x^5*y^2*Log[x] - 4200*x^4*y^3*Log[x] - 2100*x^3*y^4*Log[x] + 
         1260*x^5*y^2*Log[y] + 4200*x^4*y^3*Log[y] + 2100*x^3*y^4*Log[y]))/
       (240*x^3*(x - y)^10*y^2)) + \[Delta]2^4*
     (-(x^5 - 10*x^4*y + 60*x^3*y^2 + 80*x^2*y^3 - 125*x*y^4 - 6*y^5 - 
         120*x^2*y^3*Log[x] - 60*x*y^4*Log[x] + 120*x^2*y^3*Log[y] + 
         60*x*y^4*Log[y])/(120*(x - y)^7*y^3) - 
      (\[Delta]1*(-2*x^5 + 25*x^4*y - 200*x^3*y^2 - 700*x^2*y^3 + 650*x*y^4 + 
         227*y^5 + 600*x^2*y^3*Log[x] + 600*x*y^4*Log[x] + 60*y^5*Log[x] - 
         600*x^2*y^3*Log[y] - 600*x*y^4*Log[y] - 60*y^5*Log[y]))/
       (240*(x - y)^8*y^3) - (\[Delta]1^2*(x^6 - 15*x^5*y + 150*x^4*y^2 + 
         900*x^3*y^3 - 525*x^2*y^4 - 501*x*y^5 - 10*y^6 - 
         600*x^3*y^3*Log[x] - 900*x^2*y^4*Log[x] - 180*x*y^5*Log[x] + 
         600*x^3*y^3*Log[y] + 900*x^2*y^4*Log[y] + 180*x*y^5*Log[y]))/
       (120*x*(x - y)^9*y^3) - (\[Delta]1^3*(-2*x^7 + 35*x^6*y - 
         420*x^5*y^2 - 3675*x^4*y^3 + 1050*x^3*y^4 + 2877*x^2*y^5 + 
         140*x*y^6 - 5*y^7 + 2100*x^4*y^3*Log[x] + 4200*x^3*y^4*Log[x] + 
         1260*x^2*y^5*Log[x] - 2100*x^4*y^3*Log[y] - 4200*x^3*y^4*Log[y] - 
         1260*x^2*y^5*Log[y]))/(240*x^2*(x - y)^10*y^3) - 
      (\[Delta]1^4*(x^8 - 20*x^7*y + 280*x^6*y^2 + 3276*x^5*y^3 - 
         3276*x^3*y^5 - 280*x^2*y^6 + 20*x*y^7 - y^8 - 1680*x^5*y^3*Log[x] - 
         4200*x^4*y^4*Log[x] - 1680*x^3*y^5*Log[x] + 1680*x^5*y^3*Log[y] + 
         4200*x^4*y^4*Log[y] + 1680*x^3*y^5*Log[y]))/(120*x^3*(x - y)^11*y^3))
D00funcd14d23[x_, y_, \[Delta]1_, \[Delta]2_] := 
   -(x^2 - y^2 - 2*x*y*Log[x] + 2*x*y*Log[y])/(4*(x - y)^3) + 
    (\[Delta]1*(x^2 + 4*x*y - 5*y^2 - 4*x*y*Log[x] - 2*y^2*Log[x] + 
       4*x*y*Log[y] + 2*y^2*Log[y]))/(8*(x - y)^4) - 
    (\[Delta]1^2*(x^3 + 9*x^2*y - 9*x*y^2 - y^3 - 6*x^2*y*Log[x] - 
       6*x*y^2*Log[x] + 6*x^2*y*Log[y] + 6*x*y^2*Log[y]))/(12*x*(x - y)^5) + 
    (\[Delta]1^3*(3*x^4 + 44*x^3*y - 36*x^2*y^2 - 12*x*y^3 + y^4 - 
       24*x^3*y*Log[x] - 36*x^2*y^2*Log[x] + 24*x^3*y*Log[y] + 
       36*x^2*y^2*Log[y]))/(48*x^2*(x - y)^6) - 
    (\[Delta]1^4*(6*x^5 + 125*x^4*y - 80*x^3*y^2 - 60*x^2*y^3 + 10*x*y^4 - 
       y^5 - 60*x^4*y*Log[x] - 120*x^3*y^2*Log[x] + 60*x^4*y*Log[y] + 
       120*x^3*y^2*Log[y]))/(120*x^3*(x - y)^7) + 
    \[Delta]2*((-5*x^2 + 4*x*y + y^2 + 2*x^2*Log[x] + 4*x*y*Log[x] - 
        2*x^2*Log[y] - 4*x*y*Log[y])/(8*(x - y)^4) - 
      (\[Delta]1*(-3*x^2 + 3*y^2 + x^2*Log[x] + 4*x*y*Log[x] + y^2*Log[x] - 
         x^2*Log[y] - 4*x*y*Log[y] - y^2*Log[y]))/(4*(x - y)^5) + 
      (\[Delta]1^2*(-10*x^3 - 9*x^2*y + 18*x*y^2 + y^3 + 3*x^3*Log[x] + 
         18*x^2*y*Log[x] + 9*x*y^2*Log[x] - 3*x^3*Log[y] - 18*x^2*y*Log[y] - 
         9*x*y^2*Log[y]))/(12*x*(x - y)^6) - 
      (\[Delta]1^3*(-43*x^4 - 80*x^3*y + 108*x^2*y^2 + 16*x*y^3 - y^4 + 
         12*x^4*Log[x] + 96*x^3*y*Log[x] + 72*x^2*y^2*Log[x] - 
         12*x^4*Log[y] - 96*x^3*y*Log[y] - 72*x^2*y^2*Log[y]))/
       (48*x^2*(x - y)^7) - (\[Delta]1^4*(227*x^5 + 650*x^4*y - 700*x^3*y^2 - 
         200*x^2*y^3 + 25*x*y^4 - 2*y^5 - 60*x^5*Log[x] - 600*x^4*y*Log[x] - 
         600*x^3*y^2*Log[x] + 60*x^5*Log[y] + 600*x^4*y*Log[y] + 
         600*x^3*y^2*Log[y]))/(240*x^3*(x - y)^8)) + 
    \[Delta]2^2*(-(x^3 + 9*x^2*y - 9*x*y^2 - y^3 - 6*x^2*y*Log[x] - 
         6*x*y^2*Log[x] + 6*x^2*y*Log[y] + 6*x*y^2*Log[y])/(12*(x - y)^5*y) + 
      (\[Delta]1*(x^3 + 18*x^2*y - 9*x*y^2 - 10*y^3 - 9*x^2*y*Log[x] - 
         18*x*y^2*Log[x] - 3*y^3*Log[x] + 9*x^2*y*Log[y] + 18*x*y^2*Log[y] + 
         3*y^3*Log[y]))/(12*(x - y)^6*y) - 
      (\[Delta]1^2*(x^4 + 28*x^3*y - 28*x*y^3 - y^4 - 12*x^3*y*Log[x] - 
         36*x^2*y^2*Log[x] - 12*x*y^3*Log[x] + 12*x^3*y*Log[y] + 
         36*x^2*y^2*Log[y] + 12*x*y^3*Log[y]))/(12*x*(x - y)^7*y) + 
      (\[Delta]1^3*(4*x^5 + 155*x^4*y + 80*x^3*y^2 - 220*x^2*y^3 - 20*x*y^4 + 
         y^5 - 60*x^4*y*Log[x] - 240*x^3*y^2*Log[x] - 120*x^2*y^3*Log[x] + 
         60*x^4*y*Log[y] + 240*x^3*y^2*Log[y] + 120*x^2*y^3*Log[y]))/
       (48*x^2*(x - y)^8*y) - (\[Delta]1^4*(10*x^6 + 501*x^5*y + 
         525*x^4*y^2 - 900*x^3*y^3 - 150*x^2*y^4 + 15*x*y^5 - y^6 - 
         180*x^5*y*Log[x] - 900*x^4*y^2*Log[x] - 600*x^3*y^3*Log[x] + 
         180*x^5*y*Log[y] + 900*x^4*y^2*Log[y] + 600*x^3*y^3*Log[y]))/
       (120*x^3*(x - y)^9*y)) + \[Delta]2^3*
     ((x^4 - 12*x^3*y - 36*x^2*y^2 + 44*x*y^3 + 3*y^4 + 36*x^2*y^2*Log[x] + 
        24*x*y^3*Log[x] - 36*x^2*y^2*Log[y] - 24*x*y^3*Log[y])/
       (48*(x - y)^6*y^2) - (\[Delta]1*(x^4 - 16*x^3*y - 108*x^2*y^2 + 
         80*x*y^3 + 43*y^4 + 72*x^2*y^2*Log[x] + 96*x*y^3*Log[x] + 
         12*y^4*Log[x] - 72*x^2*y^2*Log[y] - 96*x*y^3*Log[y] - 
         12*y^4*Log[y]))/(48*(x - y)^7*y^2) + 
      (\[Delta]1^2*(x^5 - 20*x^4*y - 220*x^3*y^2 + 80*x^2*y^3 + 155*x*y^4 + 
         4*y^5 + 120*x^3*y^2*Log[x] + 240*x^2*y^3*Log[x] + 60*x*y^4*Log[x] - 
         120*x^3*y^2*Log[y] - 240*x^2*y^3*Log[y] - 60*x*y^4*Log[y]))/
       (48*x*(x - y)^8*y^2) - (\[Delta]1^3*(x^6 - 24*x^5*y - 375*x^4*y^2 + 
         375*x^2*y^4 + 24*x*y^5 - y^6 + 180*x^4*y^2*Log[x] + 
         480*x^3*y^3*Log[x] + 180*x^2*y^4*Log[x] - 180*x^4*y^2*Log[y] - 
         480*x^3*y^3*Log[y] - 180*x^2*y^4*Log[y]))/(48*x^2*(x - y)^9*y^2) - 
      (\[Delta]1^4*(-5*x^7 + 140*x^6*y + 2877*x^5*y^2 + 1050*x^4*y^3 - 
         3675*x^3*y^4 - 420*x^2*y^5 + 35*x*y^6 - 2*y^7 - 
         1260*x^5*y^2*Log[x] - 4200*x^4*y^3*Log[x] - 2100*x^3*y^4*Log[x] + 
         1260*x^5*y^2*Log[y] + 4200*x^4*y^3*Log[y] + 2100*x^3*y^4*Log[y]))/
       (240*x^3*(x - y)^10*y^2)) + \[Delta]2^4*
     (-(x^5 - 10*x^4*y + 60*x^3*y^2 + 80*x^2*y^3 - 125*x*y^4 - 6*y^5 - 
         120*x^2*y^3*Log[x] - 60*x*y^4*Log[x] + 120*x^2*y^3*Log[y] + 
         60*x*y^4*Log[y])/(120*(x - y)^7*y^3) - 
      (\[Delta]1*(-2*x^5 + 25*x^4*y - 200*x^3*y^2 - 700*x^2*y^3 + 650*x*y^4 + 
         227*y^5 + 600*x^2*y^3*Log[x] + 600*x*y^4*Log[x] + 60*y^5*Log[x] - 
         600*x^2*y^3*Log[y] - 600*x*y^4*Log[y] - 60*y^5*Log[y]))/
       (240*(x - y)^8*y^3) - (\[Delta]1^2*(x^6 - 15*x^5*y + 150*x^4*y^2 + 
         900*x^3*y^3 - 525*x^2*y^4 - 501*x*y^5 - 10*y^6 - 
         600*x^3*y^3*Log[x] - 900*x^2*y^4*Log[x] - 180*x*y^5*Log[x] + 
         600*x^3*y^3*Log[y] + 900*x^2*y^4*Log[y] + 180*x*y^5*Log[y]))/
       (120*x*(x - y)^9*y^3) - (\[Delta]1^3*(-2*x^7 + 35*x^6*y - 
         420*x^5*y^2 - 3675*x^4*y^3 + 1050*x^3*y^4 + 2877*x^2*y^5 + 
         140*x*y^6 - 5*y^7 + 2100*x^4*y^3*Log[x] + 4200*x^3*y^4*Log[x] + 
         1260*x^2*y^5*Log[x] - 2100*x^4*y^3*Log[y] - 4200*x^3*y^4*Log[y] - 
         1260*x^2*y^5*Log[y]))/(240*x^2*(x - y)^10*y^3) - 
      (\[Delta]1^4*(x^8 - 20*x^7*y + 280*x^6*y^2 + 3276*x^5*y^3 - 
         3276*x^3*y^5 - 280*x^2*y^6 + 20*x*y^7 - y^8 - 1680*x^5*y^3*Log[x] - 
         4200*x^4*y^4*Log[x] - 1680*x^3*y^5*Log[x] + 1680*x^5*y^3*Log[y] + 
         4200*x^4*y^4*Log[y] + 1680*x^3*y^5*Log[y]))/(120*x^3*(x - y)^11*y^3))
D00funcd14[x_, y_, z_, \[Epsilon]_] := 
   -16*Pi^2*\[Epsilon]^4*((12*x^10 + 65*x^9*y - 120*x^8*y^2 + 60*x^7*y^3 - 
        20*x^6*y^4 + 3*x^5*y^5 + 65*x^9*z - 690*x^8*y*z + 1020*x^7*y^2*z - 
        560*x^6*y^3*z + 195*x^5*y^4*z - 30*x^4*y^5*z - 120*x^8*z^2 + 
        1020*x^7*y*z^2 - 1060*x^6*y^2*z^2 + 120*x^5*y^3*z^2 + 
        60*x^4*y^4*z^2 - 20*x^3*y^5*z^2 + 60*x^7*z^3 - 560*x^6*y*z^3 + 
        120*x^5*y^2*z^3 + 660*x^4*y^3*z^3 - 340*x^3*y^4*z^3 + 
        60*x^2*y^5*z^3 - 20*x^6*z^4 + 195*x^5*y*z^4 + 60*x^4*y^2*z^4 - 
        340*x^3*y^3*z^4 + 120*x^2*y^4*z^4 - 15*x*y^5*z^4 + 3*x^5*z^5 - 
        30*x^4*y*z^5 - 20*x^3*y^2*z^5 + 60*x^2*y^3*z^5 - 15*x*y^4*z^5 + 
        2*y^5*z^5 - 60*x^9*y*Log[x] - 60*x^9*z*Log[x] + 360*x^8*y*z*Log[x] - 
        1200*x^6*y^2*z^2*Log[x] + 900*x^5*y^3*z^2*Log[x] - 
        360*x^4*y^4*z^2*Log[x] + 60*x^3*y^5*z^2*Log[x] + 
        900*x^5*y^2*z^3*Log[x] - 360*x^4*y^3*z^3*Log[x] + 
        60*x^3*y^4*z^3*Log[x] - 360*x^4*y^2*z^4*Log[x] + 
        60*x^3*y^3*z^4*Log[x] + 60*x^3*y^2*z^5*Log[x])/
       (3840*Pi^2*x^3*(x - y)^6*(x - z)^6) + (y^2*Log[y])/
       (64*Pi^2*(x - y)^6*(y - z)) + (z^2*Log[z])/(64*Pi^2*(x - z)^6*
        (-y + z))) - 16*Pi^2*\[Epsilon]^3*
     ((-3*x^8 - 10*x^7*y + 18*x^6*y^2 - 6*x^5*y^3 + x^4*y^4 - 10*x^7*z + 
        98*x^6*y*z - 126*x^5*y^2*z + 46*x^4*y^3*z - 8*x^3*y^4*z + 
        18*x^6*z^2 - 126*x^5*y*z^2 + 126*x^4*y^2*z^2 - 18*x^3*y^3*z^2 - 
        6*x^5*z^3 + 46*x^4*y*z^3 - 18*x^3*y^2*z^3 - 30*x^2*y^3*z^3 + 
        8*x*y^4*z^3 + x^4*z^4 - 8*x^3*y*z^4 + 8*x*y^3*z^4 - y^4*z^4 + 
        12*x^7*y*Log[x] + 12*x^7*z*Log[x] - 60*x^6*y*z*Log[x] + 
        120*x^4*y^2*z^2*Log[x] - 60*x^3*y^3*z^2*Log[x] + 
        12*x^2*y^4*z^2*Log[x] - 60*x^3*y^2*z^3*Log[x] + 
        12*x^2*y^3*z^3*Log[x] + 12*x^2*y^2*z^4*Log[x])/
       (768*Pi^2*x^2*(x - y)^5*(x - z)^5) - (y^2*Log[y])/
       (64*Pi^2*(x - y)^5*(y - z)) - (z^2*Log[z])/(64*Pi^2*(x - z)^5*
        (-y + z))) - 16*Pi^2*\[Epsilon]^2*
     ((2*x^6 + 3*x^5*y - 6*x^4*y^2 + x^3*y^3 + 3*x^5*z - 30*x^4*y*z + 
        33*x^3*y^2*z - 6*x^2*y^3*z - 6*x^4*z^2 + 33*x^3*y*z^2 - 
        30*x^2*y^2*z^2 + 3*x*y^3*z^2 + x^3*z^3 - 6*x^2*y*z^3 + 3*x*y^2*z^3 + 
        2*y^3*z^3 - 6*x^5*y*Log[x] - 6*x^5*z*Log[x] + 24*x^4*y*z*Log[x] - 
        24*x^2*y^2*z^2*Log[x] + 6*x*y^3*z^2*Log[x] + 6*x*y^2*z^3*Log[x])/
       (384*Pi^2*x*(x - y)^4*(x - z)^4) + (y^2*Log[y])/
       (64*Pi^2*(x - y)^4*(y - z)) + (z^2*Log[z])/(64*Pi^2*(x - z)^4*
        (-y + z))) - 16*Pi^2*\[Epsilon]*
     ((-x^4 + x^2*y^2 + 4*x^2*y*z - 4*x*y^2*z + x^2*z^2 - 4*x*y*z^2 + 
        3*y^2*z^2 + 2*x^3*y*Log[x] + 2*x^3*z*Log[x] - 6*x^2*y*z*Log[x] + 
        2*y^2*z^2*Log[x])/(128*Pi^2*(x - y)^3*(x - z)^3) - 
      (y^2*Log[y])/(64*Pi^2*(x - y)^3*(y - z)) - 
      (z^2*Log[z])/(64*Pi^2*(x - z)^3*(-y + z))) - 
    16*Pi^2*((x^3 - x^2*y - x^2*z + x*y*z - x^2*y*Log[x] - x^2*z*Log[x] + 
        2*x*y*z*Log[x])/(64*Pi^2*(x - y)^2*(x - z)^2) + 
      (y^2*Log[y])/(64*Pi^2*(x - y)^2*(y - z)) + 
      (z^2*Log[z])/(64*Pi^2*(x - z)^2*(-y + z)))
D00funcd13[x_, y_, w_, \[Epsilon]_] := 
   -16*Pi^2*\[Epsilon]^4*((w^2*Log[w])/(64*Pi^2*(w - x)^6*(w - y)) + 
      (3*w^5*x^5 - 20*w^4*x^6 + 60*w^3*x^7 - 120*w^2*x^8 + 65*w*x^9 + 
        12*x^10 - 30*w^5*x^4*y + 195*w^4*x^5*y - 560*w^3*x^6*y + 
        1020*w^2*x^7*y - 690*w*x^8*y + 65*x^9*y - 20*w^5*x^3*y^2 + 
        60*w^4*x^4*y^2 + 120*w^3*x^5*y^2 - 1060*w^2*x^6*y^2 + 
        1020*w*x^7*y^2 - 120*x^8*y^2 + 60*w^5*x^2*y^3 - 340*w^4*x^3*y^3 + 
        660*w^3*x^4*y^3 + 120*w^2*x^5*y^3 - 560*w*x^6*y^3 + 60*x^7*y^3 - 
        15*w^5*x*y^4 + 120*w^4*x^2*y^4 - 340*w^3*x^3*y^4 + 60*w^2*x^4*y^4 + 
        195*w*x^5*y^4 - 20*x^6*y^4 + 2*w^5*y^5 - 15*w^4*x*y^5 + 
        60*w^3*x^2*y^5 - 20*w^2*x^3*y^5 - 30*w*x^4*y^5 + 3*x^5*y^5 - 
        60*w*x^9*Log[x] + 360*w*x^8*y*Log[x] - 60*x^9*y*Log[x] + 
        60*w^5*x^3*y^2*Log[x] - 360*w^4*x^4*y^2*Log[x] + 
        900*w^3*x^5*y^2*Log[x] - 1200*w^2*x^6*y^2*Log[x] + 
        60*w^4*x^3*y^3*Log[x] - 360*w^3*x^4*y^3*Log[x] + 
        900*w^2*x^5*y^3*Log[x] + 60*w^3*x^3*y^4*Log[x] - 
        360*w^2*x^4*y^4*Log[x] + 60*w^2*x^3*y^5*Log[x])/
       (3840*Pi^2*x^3*(-w + x)^6*(x - y)^6) + (y^2*Log[y])/
       (64*Pi^2*(x - y)^6*(-w + y))) - 16*Pi^2*\[Epsilon]^3*
     ((w^2*Log[w])/(64*Pi^2*(w - x)^5*(w - y)) + 
      (w^4*x^4 - 6*w^3*x^5 + 18*w^2*x^6 - 10*w*x^7 - 3*x^8 - 8*w^4*x^3*y + 
        46*w^3*x^4*y - 126*w^2*x^5*y + 98*w*x^6*y - 10*x^7*y - 
        18*w^3*x^3*y^2 + 126*w^2*x^4*y^2 - 126*w*x^5*y^2 + 18*x^6*y^2 + 
        8*w^4*x*y^3 - 30*w^3*x^2*y^3 - 18*w^2*x^3*y^3 + 46*w*x^4*y^3 - 
        6*x^5*y^3 - w^4*y^4 + 8*w^3*x*y^4 - 8*w*x^3*y^4 + x^4*y^4 + 
        12*w*x^7*Log[x] - 60*w*x^6*y*Log[x] + 12*x^7*y*Log[x] + 
        12*w^4*x^2*y^2*Log[x] - 60*w^3*x^3*y^2*Log[x] + 
        120*w^2*x^4*y^2*Log[x] + 12*w^3*x^2*y^3*Log[x] - 
        60*w^2*x^3*y^3*Log[x] + 12*w^2*x^2*y^4*Log[x])/
       (768*Pi^2*x^2*(-w + x)^5*(x - y)^5) - (y^2*Log[y])/
       (64*Pi^2*(x - y)^5*(-w + y))) - 16*Pi^2*\[Epsilon]^2*
     ((w^2*Log[w])/(64*Pi^2*(w - x)^4*(w - y)) + 
      (w^3*x^3 - 6*w^2*x^4 + 3*w*x^5 + 2*x^6 - 6*w^3*x^2*y + 33*w^2*x^3*y - 
        30*w*x^4*y + 3*x^5*y + 3*w^3*x*y^2 - 30*w^2*x^2*y^2 + 33*w*x^3*y^2 - 
        6*x^4*y^2 + 2*w^3*y^3 + 3*w^2*x*y^3 - 6*w*x^2*y^3 + x^3*y^3 - 
        6*w*x^5*Log[x] + 24*w*x^4*y*Log[x] - 6*x^5*y*Log[x] + 
        6*w^3*x*y^2*Log[x] - 24*w^2*x^2*y^2*Log[x] + 6*w^2*x*y^3*Log[x])/
       (384*Pi^2*x*(-w + x)^4*(x - y)^4) + (y^2*Log[y])/
       (64*Pi^2*(x - y)^4*(-w + y))) - 16*Pi^2*\[Epsilon]*
     ((w^2*Log[w])/(64*Pi^2*(w - x)^3*(w - y)) + 
      (w^2*x^2 - x^4 - 4*w^2*x*y + 4*w*x^2*y + 3*w^2*y^2 - 4*w*x*y^2 + 
        x^2*y^2 + 2*w*x^3*Log[x] - 6*w*x^2*y*Log[x] + 2*x^3*y*Log[x] + 
        2*w^2*y^2*Log[x])/(128*Pi^2*(-w + x)^3*(x - y)^3) - 
      (y^2*Log[y])/(64*Pi^2*(x - y)^3*(-w + y))) - 
    16*Pi^2*((w^2*Log[w])/(64*Pi^2*(w - x)^2*(w - y)) + 
      (-(w*x^2) + x^3 + w*x*y - x^2*y - w*x^2*Log[x] + 2*w*x*y*Log[x] - 
        x^2*y*Log[x])/(64*Pi^2*(-w + x)^2*(x - y)^2) + 
      (y^2*Log[y])/(64*Pi^2*(x - y)^2*(-w + y)))
D00funcd12[x_, z_, w_, \[Epsilon]_] := 
   -16*Pi^2*\[Epsilon]^4*((w^2*Log[w])/(64*Pi^2*(w - x)^6*(w - z)) + 
      (3*w^5*x^5 - 20*w^4*x^6 + 60*w^3*x^7 - 120*w^2*x^8 + 65*w*x^9 + 
        12*x^10 - 30*w^5*x^4*z + 195*w^4*x^5*z - 560*w^3*x^6*z + 
        1020*w^2*x^7*z - 690*w*x^8*z + 65*x^9*z - 20*w^5*x^3*z^2 + 
        60*w^4*x^4*z^2 + 120*w^3*x^5*z^2 - 1060*w^2*x^6*z^2 + 
        1020*w*x^7*z^2 - 120*x^8*z^2 + 60*w^5*x^2*z^3 - 340*w^4*x^3*z^3 + 
        660*w^3*x^4*z^3 + 120*w^2*x^5*z^3 - 560*w*x^6*z^3 + 60*x^7*z^3 - 
        15*w^5*x*z^4 + 120*w^4*x^2*z^4 - 340*w^3*x^3*z^4 + 60*w^2*x^4*z^4 + 
        195*w*x^5*z^4 - 20*x^6*z^4 + 2*w^5*z^5 - 15*w^4*x*z^5 + 
        60*w^3*x^2*z^5 - 20*w^2*x^3*z^5 - 30*w*x^4*z^5 + 3*x^5*z^5 - 
        60*w*x^9*Log[x] + 360*w*x^8*z*Log[x] - 60*x^9*z*Log[x] + 
        60*w^5*x^3*z^2*Log[x] - 360*w^4*x^4*z^2*Log[x] + 
        900*w^3*x^5*z^2*Log[x] - 1200*w^2*x^6*z^2*Log[x] + 
        60*w^4*x^3*z^3*Log[x] - 360*w^3*x^4*z^3*Log[x] + 
        900*w^2*x^5*z^3*Log[x] + 60*w^3*x^3*z^4*Log[x] - 
        360*w^2*x^4*z^4*Log[x] + 60*w^2*x^3*z^5*Log[x])/
       (3840*Pi^2*x^3*(-w + x)^6*(x - z)^6) + (z^2*Log[z])/
       (64*Pi^2*(x - z)^6*(-w + z))) - 16*Pi^2*\[Epsilon]^3*
     ((w^2*Log[w])/(64*Pi^2*(w - x)^5*(w - z)) + 
      (w^4*x^4 - 6*w^3*x^5 + 18*w^2*x^6 - 10*w*x^7 - 3*x^8 - 8*w^4*x^3*z + 
        46*w^3*x^4*z - 126*w^2*x^5*z + 98*w*x^6*z - 10*x^7*z - 
        18*w^3*x^3*z^2 + 126*w^2*x^4*z^2 - 126*w*x^5*z^2 + 18*x^6*z^2 + 
        8*w^4*x*z^3 - 30*w^3*x^2*z^3 - 18*w^2*x^3*z^3 + 46*w*x^4*z^3 - 
        6*x^5*z^3 - w^4*z^4 + 8*w^3*x*z^4 - 8*w*x^3*z^4 + x^4*z^4 + 
        12*w*x^7*Log[x] - 60*w*x^6*z*Log[x] + 12*x^7*z*Log[x] + 
        12*w^4*x^2*z^2*Log[x] - 60*w^3*x^3*z^2*Log[x] + 
        120*w^2*x^4*z^2*Log[x] + 12*w^3*x^2*z^3*Log[x] - 
        60*w^2*x^3*z^3*Log[x] + 12*w^2*x^2*z^4*Log[x])/
       (768*Pi^2*x^2*(-w + x)^5*(x - z)^5) - (z^2*Log[z])/
       (64*Pi^2*(x - z)^5*(-w + z))) - 16*Pi^2*\[Epsilon]^2*
     ((w^2*Log[w])/(64*Pi^2*(w - x)^4*(w - z)) + 
      (w^3*x^3 - 6*w^2*x^4 + 3*w*x^5 + 2*x^6 - 6*w^3*x^2*z + 33*w^2*x^3*z - 
        30*w*x^4*z + 3*x^5*z + 3*w^3*x*z^2 - 30*w^2*x^2*z^2 + 33*w*x^3*z^2 - 
        6*x^4*z^2 + 2*w^3*z^3 + 3*w^2*x*z^3 - 6*w*x^2*z^3 + x^3*z^3 - 
        6*w*x^5*Log[x] + 24*w*x^4*z*Log[x] - 6*x^5*z*Log[x] + 
        6*w^3*x*z^2*Log[x] - 24*w^2*x^2*z^2*Log[x] + 6*w^2*x*z^3*Log[x])/
       (384*Pi^2*x*(-w + x)^4*(x - z)^4) + (z^2*Log[z])/
       (64*Pi^2*(x - z)^4*(-w + z))) - 16*Pi^2*\[Epsilon]*
     ((w^2*Log[w])/(64*Pi^2*(w - x)^3*(w - z)) + 
      (w^2*x^2 - x^4 - 4*w^2*x*z + 4*w*x^2*z + 3*w^2*z^2 - 4*w*x*z^2 + 
        x^2*z^2 + 2*w*x^3*Log[x] - 6*w*x^2*z*Log[x] + 2*x^3*z*Log[x] + 
        2*w^2*z^2*Log[x])/(128*Pi^2*(-w + x)^3*(x - z)^3) - 
      (z^2*Log[z])/(64*Pi^2*(x - z)^3*(-w + z))) - 
    16*Pi^2*((w^2*Log[w])/(64*Pi^2*(w - x)^2*(w - z)) + 
      (-(w*x^2) + x^3 + w*x*z - x^2*z - w*x^2*Log[x] + 2*w*x*z*Log[x] - 
        x^2*z*Log[x])/(64*Pi^2*(-w + x)^2*(x - z)^2) + 
      (z^2*Log[z])/(64*Pi^2*(x - z)^2*(-w + z)))
D00funcd24[x_, y_, z_, \[Epsilon]_] := 
   -16*Pi^2*\[Epsilon]^4*((x^2*Log[x])/(64*Pi^2*(x - y)^6*(x - z)) + 
      (3*x^5*y^5 - 20*x^4*y^6 + 60*x^3*y^7 - 120*x^2*y^8 + 65*x*y^9 + 
        12*y^10 - 30*x^5*y^4*z + 195*x^4*y^5*z - 560*x^3*y^6*z + 
        1020*x^2*y^7*z - 690*x*y^8*z + 65*y^9*z - 20*x^5*y^3*z^2 + 
        60*x^4*y^4*z^2 + 120*x^3*y^5*z^2 - 1060*x^2*y^6*z^2 + 
        1020*x*y^7*z^2 - 120*y^8*z^2 + 60*x^5*y^2*z^3 - 340*x^4*y^3*z^3 + 
        660*x^3*y^4*z^3 + 120*x^2*y^5*z^3 - 560*x*y^6*z^3 + 60*y^7*z^3 - 
        15*x^5*y*z^4 + 120*x^4*y^2*z^4 - 340*x^3*y^3*z^4 + 60*x^2*y^4*z^4 + 
        195*x*y^5*z^4 - 20*y^6*z^4 + 2*x^5*z^5 - 15*x^4*y*z^5 + 
        60*x^3*y^2*z^5 - 20*x^2*y^3*z^5 - 30*x*y^4*z^5 + 3*y^5*z^5 - 
        60*x*y^9*Log[y] + 360*x*y^8*z*Log[y] - 60*y^9*z*Log[y] + 
        60*x^5*y^3*z^2*Log[y] - 360*x^4*y^4*z^2*Log[y] + 
        900*x^3*y^5*z^2*Log[y] - 1200*x^2*y^6*z^2*Log[y] + 
        60*x^4*y^3*z^3*Log[y] - 360*x^3*y^4*z^3*Log[y] + 
        900*x^2*y^5*z^3*Log[y] + 60*x^3*y^3*z^4*Log[y] - 
        360*x^2*y^4*z^4*Log[y] + 60*x^2*y^3*z^5*Log[y])/
       (3840*Pi^2*y^3*(-x + y)^6*(y - z)^6) - (z^2*Log[z])/
       (64*Pi^2*(x - z)*(-y + z)^6)) - 16*Pi^2*\[Epsilon]^3*
     ((x^2*Log[x])/(64*Pi^2*(x - y)^5*(x - z)) + 
      (x^4*y^4 - 6*x^3*y^5 + 18*x^2*y^6 - 10*x*y^7 - 3*y^8 - 8*x^4*y^3*z + 
        46*x^3*y^4*z - 126*x^2*y^5*z + 98*x*y^6*z - 10*y^7*z - 
        18*x^3*y^3*z^2 + 126*x^2*y^4*z^2 - 126*x*y^5*z^2 + 18*y^6*z^2 + 
        8*x^4*y*z^3 - 30*x^3*y^2*z^3 - 18*x^2*y^3*z^3 + 46*x*y^4*z^3 - 
        6*y^5*z^3 - x^4*z^4 + 8*x^3*y*z^4 - 8*x*y^3*z^4 + y^4*z^4 + 
        12*x*y^7*Log[y] - 60*x*y^6*z*Log[y] + 12*y^7*z*Log[y] + 
        12*x^4*y^2*z^2*Log[y] - 60*x^3*y^3*z^2*Log[y] + 
        120*x^2*y^4*z^2*Log[y] + 12*x^3*y^2*z^3*Log[y] - 
        60*x^2*y^3*z^3*Log[y] + 12*x^2*y^2*z^4*Log[y])/
       (768*Pi^2*y^2*(-x + y)^5*(y - z)^5) - (z^2*Log[z])/
       (64*Pi^2*(x - z)*(-y + z)^5)) - 16*Pi^2*\[Epsilon]^2*
     ((x^2*Log[x])/(64*Pi^2*(x - y)^4*(x - z)) + 
      (x^3*y^3 - 6*x^2*y^4 + 3*x*y^5 + 2*y^6 - 6*x^3*y^2*z + 33*x^2*y^3*z - 
        30*x*y^4*z + 3*y^5*z + 3*x^3*y*z^2 - 30*x^2*y^2*z^2 + 33*x*y^3*z^2 - 
        6*y^4*z^2 + 2*x^3*z^3 + 3*x^2*y*z^3 - 6*x*y^2*z^3 + y^3*z^3 - 
        6*x*y^5*Log[y] + 24*x*y^4*z*Log[y] - 6*y^5*z*Log[y] + 
        6*x^3*y*z^2*Log[y] - 24*x^2*y^2*z^2*Log[y] + 6*x^2*y*z^3*Log[y])/
       (384*Pi^2*y*(-x + y)^4*(y - z)^4) - (z^2*Log[z])/
       (64*Pi^2*(x - z)*(-y + z)^4)) - 16*Pi^2*\[Epsilon]*
     ((x^2*Log[x])/(64*Pi^2*(x - y)^3*(x - z)) + 
      (x^2*y^2 - y^4 - 4*x^2*y*z + 4*x*y^2*z + 3*x^2*z^2 - 4*x*y*z^2 + 
        y^2*z^2 + 2*x*y^3*Log[y] - 6*x*y^2*z*Log[y] + 2*y^3*z*Log[y] + 
        2*x^2*z^2*Log[y])/(128*Pi^2*(-x + y)^3*(y - z)^3) - 
      (z^2*Log[z])/(64*Pi^2*(x - z)*(-y + z)^3)) - 
    16*Pi^2*((x^2*Log[x])/(64*Pi^2*(x - y)^2*(x - z)) + 
      (-(x*y^2) + y^3 + x*y*z - y^2*z - x*y^2*Log[y] + 2*x*y*z*Log[y] - 
        y^2*z*Log[y])/(64*Pi^2*(x - y)^2*(y - z)^2) - 
      (z^2*Log[z])/(64*Pi^2*(x - z)*(-y + z)^2))
D00funcd23[x_, y_, w_, \[Epsilon]_] := 
   -16*Pi^2*(-(w^2*Log[w])/(64*Pi^2*(-w + x)*(w - y)^2) + 
      (x^2*Log[x])/(64*Pi^2*(-w + x)*(x - y)^2) + 
      (w*x*y - w*y^2 - x*y^2 + y^3 + 2*w*x*y*Log[y] - w*y^2*Log[y] - 
        x*y^2*Log[y])/(64*Pi^2*(x - y)^2*(-w + y)^2)) - 
    16*Pi^2*\[Epsilon]*(-(w^2*Log[w])/(64*Pi^2*(-w + x)*(w - y)^3) + 
      (x^2*Log[x])/(64*Pi^2*(-w + x)*(x - y)^3) - 
      (3*w^2*x^2 - 4*w^2*x*y - 4*w*x^2*y + w^2*y^2 + 4*w*x*y^2 + x^2*y^2 - 
        y^4 + 2*w^2*x^2*Log[y] - 6*w*x*y^2*Log[y] + 2*w*y^3*Log[y] + 
        2*x*y^3*Log[y])/(128*Pi^2*(x - y)^3*(-w + y)^3)) - 
    16*Pi^2*\[Epsilon]^2*(-(w^2*Log[w])/(64*Pi^2*(-w + x)*(w - y)^4) + 
      (x^2*Log[x])/(64*Pi^2*(-w + x)*(x - y)^4) + 
      (2*w^3*x^3 + 3*w^3*x^2*y + 3*w^2*x^3*y - 6*w^3*x*y^2 - 30*w^2*x^2*y^2 - 
        6*w*x^3*y^2 + w^3*y^3 + 33*w^2*x*y^3 + 33*w*x^2*y^3 + x^3*y^3 - 
        6*w^2*y^4 - 30*w*x*y^4 - 6*x^2*y^4 + 3*w*y^5 + 3*x*y^5 + 2*y^6 + 
        6*w^3*x^2*y*Log[y] + 6*w^2*x^3*y*Log[y] - 24*w^2*x^2*y^2*Log[y] + 
        24*w*x*y^4*Log[y] - 6*w*y^5*Log[y] - 6*x*y^5*Log[y])/
       (384*Pi^2*y*(-w + y)^4*(-x + y)^4)) - 16*Pi^2*\[Epsilon]^3*
     (-(w^2*Log[w])/(64*Pi^2*(-w + x)*(w - y)^5) + 
      (x^2*Log[x])/(64*Pi^2*(-w + x)*(x - y)^5) + 
      (-(w^4*x^4) + 8*w^4*x^3*y + 8*w^3*x^4*y - 30*w^3*x^3*y^2 - 
        8*w^4*x*y^3 - 18*w^3*x^2*y^3 - 18*w^2*x^3*y^3 - 8*w*x^4*y^3 + 
        w^4*y^4 + 46*w^3*x*y^4 + 126*w^2*x^2*y^4 + 46*w*x^3*y^4 + x^4*y^4 - 
        6*w^3*y^5 - 126*w^2*x*y^5 - 126*w*x^2*y^5 - 6*x^3*y^5 + 18*w^2*y^6 + 
        98*w*x*y^6 + 18*x^2*y^6 - 10*w*y^7 - 10*x*y^7 - 3*y^8 + 
        12*w^4*x^2*y^2*Log[y] + 12*w^3*x^3*y^2*Log[y] + 
        12*w^2*x^4*y^2*Log[y] - 60*w^3*x^2*y^3*Log[y] - 
        60*w^2*x^3*y^3*Log[y] + 120*w^2*x^2*y^4*Log[y] - 60*w*x*y^6*Log[y] + 
        12*w*y^7*Log[y] + 12*x*y^7*Log[y])/(768*Pi^2*y^2*(-w + y)^5*
        (-x + y)^5)) - 16*Pi^2*\[Epsilon]^4*
     (-(w^2*Log[w])/(64*Pi^2*(-w + x)*(w - y)^6) + 
      (x^2*Log[x])/(64*Pi^2*(-w + x)*(x - y)^6) + 
      (2*w^5*x^5 - 15*w^5*x^4*y - 15*w^4*x^5*y + 60*w^5*x^3*y^2 + 
        120*w^4*x^4*y^2 + 60*w^3*x^5*y^2 - 20*w^5*x^2*y^3 - 340*w^4*x^3*y^3 - 
        340*w^3*x^4*y^3 - 20*w^2*x^5*y^3 - 30*w^5*x*y^4 + 60*w^4*x^2*y^4 + 
        660*w^3*x^3*y^4 + 60*w^2*x^4*y^4 - 30*w*x^5*y^4 + 3*w^5*y^5 + 
        195*w^4*x*y^5 + 120*w^3*x^2*y^5 + 120*w^2*x^3*y^5 + 195*w*x^4*y^5 + 
        3*x^5*y^5 - 20*w^4*y^6 - 560*w^3*x*y^6 - 1060*w^2*x^2*y^6 - 
        560*w*x^3*y^6 - 20*x^4*y^6 + 60*w^3*y^7 + 1020*w^2*x*y^7 + 
        1020*w*x^2*y^7 + 60*x^3*y^7 - 120*w^2*y^8 - 690*w*x*y^8 - 
        120*x^2*y^8 + 65*w*y^9 + 65*x*y^9 + 12*y^10 + 60*w^5*x^2*y^3*Log[y] + 
        60*w^4*x^3*y^3*Log[y] + 60*w^3*x^4*y^3*Log[y] + 
        60*w^2*x^5*y^3*Log[y] - 360*w^4*x^2*y^4*Log[y] - 
        360*w^3*x^3*y^4*Log[y] - 360*w^2*x^4*y^4*Log[y] + 
        900*w^3*x^2*y^5*Log[y] + 900*w^2*x^3*y^5*Log[y] - 
        1200*w^2*x^2*y^6*Log[y] + 360*w*x*y^8*Log[y] - 60*w*y^9*Log[y] - 
        60*x*y^9*Log[y])/(3840*Pi^2*y^3*(-w + y)^6*(-x + y)^6))
D00funcd34[x_, y_, z_, \[Epsilon]_] := 
   -16*Pi^2*((x^2*Log[x])/(64*Pi^2*(x - y)*(x - z)^2) - 
      (y^2*Log[y])/(64*Pi^2*(x - y)*(y - z)^2) + 
      (x*y*z - x*z^2 - y*z^2 + z^3 + 2*x*y*z*Log[z] - x*z^2*Log[z] - 
        y*z^2*Log[z])/(64*Pi^2*(x - z)^2*(-y + z)^2)) - 
    16*Pi^2*\[Epsilon]*((x^2*Log[x])/(64*Pi^2*(x - y)*(x - z)^3) - 
      (y^2*Log[y])/(64*Pi^2*(x - y)*(y - z)^3) - 
      (3*x^2*y^2 - 4*x^2*y*z - 4*x*y^2*z + x^2*z^2 + 4*x*y*z^2 + y^2*z^2 - 
        z^4 + 2*x^2*y^2*Log[z] - 6*x*y*z^2*Log[z] + 2*x*z^3*Log[z] + 
        2*y*z^3*Log[z])/(128*Pi^2*(x - z)^3*(-y + z)^3)) - 
    16*Pi^2*\[Epsilon]^2*((x^2*Log[x])/(64*Pi^2*(x - y)*(x - z)^4) - 
      (y^2*Log[y])/(64*Pi^2*(x - y)*(y - z)^4) + 
      (2*x^3*y^3 + 3*x^3*y^2*z + 3*x^2*y^3*z - 6*x^3*y*z^2 - 30*x^2*y^2*z^2 - 
        6*x*y^3*z^2 + x^3*z^3 + 33*x^2*y*z^3 + 33*x*y^2*z^3 + y^3*z^3 - 
        6*x^2*z^4 - 30*x*y*z^4 - 6*y^2*z^4 + 3*x*z^5 + 3*y*z^5 + 2*z^6 + 
        6*x^3*y^2*z*Log[z] + 6*x^2*y^3*z*Log[z] - 24*x^2*y^2*z^2*Log[z] + 
        24*x*y*z^4*Log[z] - 6*x*z^5*Log[z] - 6*y*z^5*Log[z])/
       (384*Pi^2*z*(-x + z)^4*(-y + z)^4)) - 16*Pi^2*\[Epsilon]^3*
     ((x^2*Log[x])/(64*Pi^2*(x - y)*(x - z)^5) - 
      (y^2*Log[y])/(64*Pi^2*(x - y)*(y - z)^5) + 
      (-(x^4*y^4) + 8*x^4*y^3*z + 8*x^3*y^4*z - 30*x^3*y^3*z^2 - 
        8*x^4*y*z^3 - 18*x^3*y^2*z^3 - 18*x^2*y^3*z^3 - 8*x*y^4*z^3 + 
        x^4*z^4 + 46*x^3*y*z^4 + 126*x^2*y^2*z^4 + 46*x*y^3*z^4 + y^4*z^4 - 
        6*x^3*z^5 - 126*x^2*y*z^5 - 126*x*y^2*z^5 - 6*y^3*z^5 + 18*x^2*z^6 + 
        98*x*y*z^6 + 18*y^2*z^6 - 10*x*z^7 - 10*y*z^7 - 3*z^8 + 
        12*x^4*y^2*z^2*Log[z] + 12*x^3*y^3*z^2*Log[z] + 
        12*x^2*y^4*z^2*Log[z] - 60*x^3*y^2*z^3*Log[z] - 
        60*x^2*y^3*z^3*Log[z] + 120*x^2*y^2*z^4*Log[z] - 60*x*y*z^6*Log[z] + 
        12*x*z^7*Log[z] + 12*y*z^7*Log[z])/(768*Pi^2*z^2*(-x + z)^5*
        (-y + z)^5)) - 16*Pi^2*\[Epsilon]^4*
     ((x^2*Log[x])/(64*Pi^2*(x - y)*(x - z)^6) - 
      (y^2*Log[y])/(64*Pi^2*(x - y)*(y - z)^6) + 
      (2*x^5*y^5 - 15*x^5*y^4*z - 15*x^4*y^5*z + 60*x^5*y^3*z^2 + 
        120*x^4*y^4*z^2 + 60*x^3*y^5*z^2 - 20*x^5*y^2*z^3 - 340*x^4*y^3*z^3 - 
        340*x^3*y^4*z^3 - 20*x^2*y^5*z^3 - 30*x^5*y*z^4 + 60*x^4*y^2*z^4 + 
        660*x^3*y^3*z^4 + 60*x^2*y^4*z^4 - 30*x*y^5*z^4 + 3*x^5*z^5 + 
        195*x^4*y*z^5 + 120*x^3*y^2*z^5 + 120*x^2*y^3*z^5 + 195*x*y^4*z^5 + 
        3*y^5*z^5 - 20*x^4*z^6 - 560*x^3*y*z^6 - 1060*x^2*y^2*z^6 - 
        560*x*y^3*z^6 - 20*y^4*z^6 + 60*x^3*z^7 + 1020*x^2*y*z^7 + 
        1020*x*y^2*z^7 + 60*y^3*z^7 - 120*x^2*z^8 - 690*x*y*z^8 - 
        120*y^2*z^8 + 65*x*z^9 + 65*y*z^9 + 12*z^10 + 60*x^5*y^2*z^3*Log[z] + 
        60*x^4*y^3*z^3*Log[z] + 60*x^3*y^4*z^3*Log[z] + 
        60*x^2*y^5*z^3*Log[z] - 360*x^4*y^2*z^4*Log[z] - 
        360*x^3*y^3*z^4*Log[z] - 360*x^2*y^4*z^4*Log[z] + 
        900*x^3*y^2*z^5*Log[z] + 900*x^2*y^3*z^5*Log[z] - 
        1200*x^2*y^2*z^6*Log[z] + 360*x*y*z^8*Log[z] - 60*x*z^9*Log[z] - 
        60*y*z^9*Log[z])/(3840*Pi^2*z^3*(-x + z)^6*(-y + z)^6))
D00funcAcc[x_, y_, z_, w_] := With[{\[Epsilon]12 = y - x, S12 = x + y, 
     \[Epsilon]13 = z - x, S13 = x + z, \[Epsilon]23 = z - y, S23 = y + z, 
     \[Epsilon]14 = w - x, S14 = x + w, \[Epsilon]34 = w - z, S34 = w + z, 
     \[Epsilon]24 = w - y, S24 = y + w, dzcomp = 0.01, d4comp = 0.06, 
     d3comp = 0.03, d2comp = 0.01}, ReleaseHold[
     Which[S12*S13*S14*S24*S23*S34 == 0, 0, 
      x == 0 && Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
         Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D00funcz1d234[x, y, z - y, 
        w - y]], y == 0 && Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]14/S14] + 
         Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D00funcz2d134[x, y, z - x, 
        w - x]], z == 0 && Abs[\[Epsilon]12/S12] + Abs[\[Epsilon]24/S24] + 
         Abs[\[Epsilon]14/S14] < d3comp, Evaluate[D00funcz3d124[x, z, y - x, 
        w - x]], w == 0 && Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
         Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D00funcz4d123[x, w, y - x, 
        z - x]], x == 0 && Abs[\[Epsilon]34/S34] < dzcomp, 
      Evaluate[D00funcz1d34[y, z, w - z]], x == 0 && Abs[\[Epsilon]24/S24] < 
        dzcomp, Evaluate[D00funcz1d24[y, z, w - y]], 
      x == 0 && Abs[\[Epsilon]23/S23] < dzcomp, 
      Evaluate[D00funcz1d23[y, w, z - y]], y == 0 && Abs[\[Epsilon]34/S34] < 
        dzcomp, Evaluate[D00funcz2d34[x, z, w - z]], 
      y == 0 && Abs[\[Epsilon]14/S14] < dzcomp, 
      Evaluate[D00funcz2d14[x, z, w - x]], y == 0 && Abs[\[Epsilon]13/S13] < 
        dzcomp, Evaluate[D00funcz2d13[x, w, z - x]], 
      z == 0 && Abs[\[Epsilon]12/S12] < dzcomp, 
      Evaluate[D00funcz3d12[x, w, y - x]], z == 0 && Abs[\[Epsilon]14/S14] < 
        dzcomp, Evaluate[D00funcz3d14[x, y, w - x]], 
      z == 0 && Abs[\[Epsilon]24/S24] < dzcomp, 
      Evaluate[D00funcz3d24[x, y, w - y]], w == 0 && Abs[\[Epsilon]12/S12] < 
        dzcomp, Evaluate[D00funcz4d12[x, z, y - z]], 
      w == 0 && Abs[\[Epsilon]13/S13] < dzcomp, 
      Evaluate[D00funcz4d13[x, y, z - x]], w == 0 && Abs[\[Epsilon]23/S23] < 
        dzcomp, Evaluate[D00funcz4d23[x, y, z - y]], x == 0, 
      Evaluate[D00funcz1[x, y, z, w]], y == 0, 
      Evaluate[D00funcz2[x, y, z, w]], z == 0, 
      Evaluate[D00funcz3[x, y, z, w]], w == 0, 
      Evaluate[D00funcz4[x, y, z, w]], Abs[\[Epsilon]23/S23] + 
        Abs[\[Epsilon]24/S24] + Abs[\[Epsilon]34/S34] + 
        Abs[\[Epsilon]14/S14] + Abs[\[Epsilon]13/S13] + 
        Abs[\[Epsilon]12/S12] < d4comp, Evaluate[D00funcd1234[x, y, y - x, 
        z - x]], Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
        Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D00funcd234[x, y, z - y, 
        w - y]], Abs[\[Epsilon]13/S13] + Abs[\[Epsilon]14/S14] + 
        Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D00funcd134[x, y, z - x, 
        w - x]], Abs[\[Epsilon]12/S12] + Abs[\[Epsilon]24/S24] + 
        Abs[\[Epsilon]14/S14] < d3comp, Evaluate[D00funcd124[x, z, y - x, 
        w - x]], Abs[\[Epsilon]23/S23] + Abs[\[Epsilon]24/S24] + 
        Abs[\[Epsilon]34/S34] < d3comp, Evaluate[D00funcd123[x, w, y - x, 
        z - x]], Abs[\[Epsilon]12/S12] < d2comp && Abs[\[Epsilon]34/S34] < 
        d2comp, Evaluate[D00funcd12d34[x, z, y - x, w - z]], 
      Abs[\[Epsilon]13/S13] < d2comp && Abs[\[Epsilon]24/S24] < d2comp, 
      Evaluate[D00funcd12d34[x, y, z - x, w - y]], 
      Abs[\[Epsilon]14/S14] < d2comp && Abs[\[Epsilon]23/S23] < d2comp, 
      Evaluate[D00funcd12d34[x, y, w - x, z - y]], Abs[\[Epsilon]23/S23] < 
       d2comp, Evaluate[D00funcd23[x, y, w, z - y]], 
      Abs[\[Epsilon]24/S24] < d2comp, Evaluate[D00funcd24[x, y, z, w - y]], 
      Abs[\[Epsilon]34/S34] < d2comp, Evaluate[D00funcd34[x, y, z, w - z]], 
      Abs[\[Epsilon]14/S14] < d2comp, Evaluate[D00funcd14[x, y, z, w - x]], 
      Abs[\[Epsilon]13/S13] < d2comp, Evaluate[D00funcd13[x, y, w, z - x]], 
      Abs[\[Epsilon]12/S12] < d2comp, Evaluate[D00funcd12[x, z, w, y - x]], 
      True, Evaluate[D00func0[x, y, z, w]]]]]
