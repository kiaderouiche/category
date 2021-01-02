B0func[psqsub_, 0, 0] := 1 - EulerGamma + psqsub/(2*m2) + 2/\[Delta] + 
    Log[4] - Log[m2] + Log[Pi]
 
B0func[psqsub_, 0, m2temp_] := 1 - EulerGamma + psqsub/(2*m2temp) + 
    2/\[Delta] + Log[4] - Log[m2temp] + Log[Pi]
 
B0func[psqsub_, m1temp_, 0] := 1 - EulerGamma + psqsub/(2*m1temp) + 
    2/\[Delta] + Log[4] - Log[m1temp] + Log[Pi]
 
B0func[psqsub_, m1temp_, m1temp_] := -EulerGamma + psqsub/(6*m1temp) + 
    2/\[Delta] + Log[4] - Log[m1temp] + Log[Pi]
 
B0func[psqsub_, m1temp_, m2temp_] := 1 - EulerGamma + 2/\[Delta] + 
    (m1temp*Log[m1temp])/(-m1temp + m2temp) + (m2temp*Log[m2temp])/
     (m1temp - m2temp) + psqsub*((m1temp + m2temp)/(2*(m1temp - m2temp)^2) - 
      (m1temp*m2temp*Log[m1temp])/(m1temp - m2temp)^3 + 
      (m1temp*m2temp*Log[m2temp])/(m1temp - m2temp)^3) + Log[4*Pi]
B1func[psqsub_, 0, 0] := -psqsub/(6*m2) - 
    (4 + \[Delta] - 2*EulerGamma*\[Delta])/(4*\[Delta]) - Log[16]/4 + 
    Log[m2]/2 - Log[Pi]/2
 
B1func[psqsub_, 0, m2temp_] := -psqsub/(6*m2temp) - 
    (4 + \[Delta] - 2*EulerGamma*\[Delta])/(4*\[Delta]) - Log[2] + 
    Log[m2temp]/2 - Log[Pi]/2
 
B1func[psqsub_, m1temp_, 0] := -3/4 + EulerGamma/2 - psqsub/(3*m1temp) - 
    \[Delta]^(-1) - Log[2] + Log[m1temp]/2 - Log[Pi]/2
 
B1func[psqsub_, m1temp_, m1temp_] := EulerGamma/2 - psqsub/(12*m1temp) - 
    \[Delta]^(-1) - Log[2] + Log[m1temp]/2 - Log[Pi]/2
 
B1func[psqsub_, m1temp_, m2temp_] := 
   (-1 + 2*EulerGamma + (2*m1temp)/(-m1temp + m2temp) - 4/\[Delta])/4 - 
    (m1temp*(m1temp^2 + 3*m2temp^2)*Log[2])/(m1temp - m2temp)^3 + 
    (m2temp^3*Log[16])/(4*(m1temp - m2temp)^3) + (m1temp^2*m2temp*Log[4096])/
     (4*(m1temp - m2temp)^3) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^2) + (m2temp*(-2*m1temp + m2temp)*Log[m2temp])/
     (2*(m1temp - m2temp)^2) + 
    psqsub*((-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
       (6*(m1temp - m2temp)^3) + (m1temp^2*m2temp*Log[m1temp])/
       (m1temp - m2temp)^4 - (m1temp^2*m2temp*Log[m2temp])/
       (m1temp - m2temp)^4) - Log[Pi]/2
B0func0[x_, x_] := -EulerGamma + 2/\[Delta] + Log[4] + Log[Pi] - Log[x]
 
B0func0[x_, y_] := 1 - EulerGamma + 2/\[Delta] + Log[4*Pi] + 
    (x*Log[x])/(-x + y) + (y*Log[y])/(x - y)
B1func0[x_, x_] := EulerGamma/2 - 1/\[Delta] - Log[2] - Log[Pi]/2 + Log[x]/2
 
B1func0[x_, y_] := (1/4)*(-1 + 2*EulerGamma + (2*x)/(-x + y) - 4/\[Delta]) - 
    (x*(x^2 + 3*y^2)*Log[2])/(x - y)^3 + (y^3*Log[16])/(4*(x - y)^3) + 
    (x^2*y*Log[4096])/(4*(x - y)^3) - Log[Pi]/2 + 
    (x^2*Log[x])/(2*(x - y)^2) + (y*(-2*x + y)*Log[y])/(2*(x - y)^2)
B0func1[x_, x_] := 1/(6*x)
 
B0func1[x_, y_] := (x + y)/(2*(x - y)^2) - (x*y*Log[x])/(x - y)^3 + 
    (x*y*Log[y])/(x - y)^3
B1func1[x_, x_] := -(1/(12*x))
 
B1func1[x_, y_] := (-2*x^2 - 5*x*y + y^2)/(6*(x - y)^3) + 
    (x^2*y*Log[x])/(x - y)^4 - (x^2*y*Log[y])/(x - y)^4
C0func[qsqsub_, 0, 0, 0] := Log[m2]/m3 - Log[m3]/m3 + 
    qsqsub*(-m3^(-2) - Log[m2]/(2*m3^2) + Log[m3]/(2*m3^2))
 
C0func[qsqsub_, 0, 0, m3temp_] := Log[m2]/m3temp - Log[m3temp]/m3temp + 
    qsqsub*(-m3temp^(-2) - Log[m2]/(2*m3temp^2) + Log[m3temp]/(2*m3temp^2))
 
C0func[qsqsub_, 0, m2temp_, 0] := -(Log[m2temp]/m2temp) + Log[m3]/m2temp + 
    qsqsub*(-m2temp^(-2) + Log[m2temp]/(2*m2temp^2) - Log[m3]/(2*m2temp^2))
 
C0func[qsqsub_, 0, m2temp_, m2temp_] := -m2temp^(-1) + qsqsub/(12*m2temp^2)
 
C0func[qsqsub_, 0, m2temp_, m3temp_] := Log[m2temp]/(-m2temp + m3temp) + 
    Log[m3temp]/(m2temp - m3temp) + qsqsub*(-(m2temp - m3temp)^(-2) + 
      ((m2temp + m3temp)*Log[m2temp])/(2*(m2temp - m3temp)^3) - 
      ((m2temp + m3temp)*Log[m3temp])/(2*(m2temp - m3temp)^3))
 
C0func[qsqsub_, m1temp_, 0, 0] := -(Log[m1temp]/m1temp) + Log[m3]/m1temp + 
    qsqsub*((m1temp + m3)/(2*m1temp^2*m3) - Log[m1temp]/(2*m1temp^2) + 
      Log[m3]/(2*m1temp^2))
 
C0func[qsqsub_, m1temp_, 0, m1temp_] := -m1temp^(-1) + qsqsub/(4*m1temp^2)
 
C0func[qsqsub_, m1temp_, 0, m3temp_] := Log[m1temp]/(-m1temp + m3temp) + 
    Log[m3temp]/(m1temp - m3temp) + 
    qsqsub*((2*m1temp*m3temp - 2*m3temp^2)^(-1) - 
      Log[m1temp]/(2*(m1temp - m3temp)^2) + Log[m3temp]/
       (2*(m1temp - m3temp)^2))
 
C0func[qsqsub_, m1temp_, m1temp_, 0] := -m1temp^(-1) + qsqsub/(4*m1temp^2)
 
C0func[qsqsub_, m1temp_, m1temp_, m1temp_] := 
   -1/(2*m1temp) + qsqsub/(24*m1temp^2)
 
C0func[qsqsub_, m1temp_, m1temp_, m3temp_] := (-m1temp + m3temp)^(-1) + 
    (m3temp*Log[m1temp])/(m1temp - m3temp)^2 - (m3temp*Log[m3temp])/
     (m1temp - m3temp)^2 + qsqsub*((m1temp + 5*m3temp)/
       (4*(m1temp - m3temp)^3) - (m3temp*(2*m1temp + m3temp)*Log[m1temp])/
       (2*(m1temp - m3temp)^4) + (m3temp*(2*m1temp + m3temp)*Log[m3temp])/
       (2*(m1temp - m3temp)^4))
 
C0func[qsqsub_, m1temp_, m2temp_, 0] := Log[m1temp]/(-m1temp + m2temp) + 
    Log[m2temp]/(m1temp - m2temp) + 
    qsqsub*((2*m1temp*m2temp - 2*m2temp^2)^(-1) - 
      Log[m1temp]/(2*(m1temp - m2temp)^2) + Log[m2temp]/
       (2*(m1temp - m2temp)^2))
 
C0func[qsqsub_, m1temp_, m2temp_, m1temp_] := (-m1temp + m2temp)^(-1) + 
    (m2temp*Log[m1temp])/(m1temp - m2temp)^2 - (m2temp*Log[m2temp])/
     (m1temp - m2temp)^2 + qsqsub*((m1temp + 5*m2temp)/
       (4*(m1temp - m2temp)^3) - (m2temp*(2*m1temp + m2temp)*Log[m1temp])/
       (2*(m1temp - m2temp)^4) + (m2temp*(2*m1temp + m2temp)*Log[m2temp])/
       (2*(m1temp - m2temp)^4))
 
C0func[qsqsub_, m1temp_, m2temp_, m2temp_] := (m1temp - m2temp)^(-1) - 
    (m1temp*Log[m1temp])/(m1temp - m2temp)^2 + (m1temp*Log[m2temp])/
     (m1temp - m2temp)^2 + qsqsub*((-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
       (12*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
       (2*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/
       (2*(m1temp - m2temp)^4))
 
C0func[qsqsub_, m1temp_, m2temp_, m3temp_] := 
   (m1temp*Log[m1temp])/((m1temp - m2temp)*(-m1temp + m3temp)) + 
    (m2temp*Log[m2temp])/((m1temp - m2temp)*(m2temp - m3temp)) + 
    (m3temp*Log[m3temp])/((m1temp - m3temp)*(-m2temp + m3temp)) + 
    qsqsub*((-2*m2temp*m3temp + m1temp*(m2temp + m3temp))/
       (2*(m1temp - m2temp)*(m1temp - m3temp)*(m2temp - m3temp)^2) - 
      (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
      (m2temp*(-2*m1temp*m3temp + m2temp*(m2temp + m3temp))*Log[m2temp])/
       (2*(m1temp - m2temp)^2*(m2temp - m3temp)^3) + 
      (m3temp*(-2*m1temp*m2temp + m3temp*(m2temp + m3temp))*Log[m3temp])/
       (2*(m1temp - m3temp)^2*(-m2temp + m3temp)^3))
C1func[qsqsub_, 0, 0, 0] := -1/(2*m3) - Log[m2]/(2*m3) + Log[m3]/(2*m3) + 
    qsqsub*(5/(6*m3^2) + Log[m2]/(3*m3^2) - Log[m3]/(3*m3^2))
 
C1func[qsqsub_, 0, 0, m3temp_] := -1/(2*m3temp) - Log[m2]/(2*m3temp) + 
    Log[m3temp]/(2*m3temp) + qsqsub*(5/(6*m3temp^2) + Log[m2]/(3*m3temp^2) - 
      Log[m3temp]/(3*m3temp^2))
 
C1func[qsqsub_, 0, m2temp_, 0] := 1/(2*m2temp) - qsqsub/(6*m2temp^2)
 
C1func[qsqsub_, 0, m2temp_, m2temp_] := 1/(4*m2temp) - qsqsub/(36*m2temp^2)
 
C1func[qsqsub_, 0, m2temp_, m3temp_] := (2*m2temp - 2*m3temp)^(-1) - 
    (m3temp*Log[m2temp])/(2*(m2temp - m3temp)^2) + 
    (m3temp*Log[m3temp])/(2*(m2temp - m3temp)^2) + 
    qsqsub*(-(m2temp + 5*m3temp)/(6*(m2temp - m3temp)^3) + 
      (m3temp*(2*m2temp + m3temp)*Log[m2temp])/(3*(m2temp - m3temp)^4) - 
      (m3temp*(2*m2temp + m3temp)*Log[m3temp])/(3*(m2temp - m3temp)^4))
 
C1func[qsqsub_, m1temp_, 0, 0] := Log[m1temp]/(2*m1temp) - 
    Log[m3]/(2*m1temp) + qsqsub*(-(m1temp + m3)/(3*m1temp^2*m3) + 
      Log[m1temp]/(3*m1temp^2) - Log[m3]/(3*m1temp^2))
 
C1func[qsqsub_, m1temp_, 0, m1temp_] := 1/(2*m1temp) - qsqsub/(6*m1temp^2)
 
C1func[qsqsub_, m1temp_, 0, m3temp_] := Log[m1temp]/(2*m1temp - 2*m3temp) + 
    Log[m3temp]/(2*(-m1temp + m3temp)) + 
    qsqsub*(-(3*m1temp*m3temp - 3*m3temp^2)^(-1) + 
      Log[m1temp]/(3*(m1temp - m3temp)^2) - Log[m3temp]/
       (3*(m1temp - m3temp)^2))
 
C1func[qsqsub_, m1temp_, m1temp_, 0] := 1/(4*m1temp) - qsqsub/(18*m1temp^2)
 
C1func[qsqsub_, m1temp_, m1temp_, m1temp_] := 
   1/(6*m1temp) - qsqsub/(60*m1temp^2)
 
C1func[qsqsub_, m1temp_, m1temp_, m3temp_] := 
   (m1temp - 3*m3temp)/(4*(m1temp - m3temp)^2) + (m3temp^2*Log[m1temp])/
     (2*(m1temp - m3temp)^3) + (m3temp^2*Log[m3temp])/
     (2*(-m1temp + m3temp)^3) + 
    qsqsub*((-m1temp^2 + 8*m1temp*m3temp + 17*m3temp^2)/
       (18*(m1temp - m3temp)^4) + (m3temp^2*(3*m1temp + m3temp)*Log[m1temp])/
       (3*(-m1temp + m3temp)^5) + (m3temp^2*(3*m1temp + m3temp)*Log[m3temp])/
       (3*(m1temp - m3temp)^5))
 
C1func[qsqsub_, m1temp_, m2temp_, 0] := 1/(2*(-m1temp + m2temp)) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m2temp)^2) - 
    (m1temp*Log[m2temp])/(2*(m1temp - m2temp)^2) + 
    qsqsub*(-(m1temp + m2temp)/(6*(m1temp - m2temp)^2*m2temp) + 
      (m1temp*Log[m1temp])/(3*(m1temp - m2temp)^3) + 
      (m1temp*Log[m2temp])/(3*(-m1temp + m2temp)^3))
 
C1func[qsqsub_, m1temp_, m2temp_, m1temp_] := 
   (m1temp + m2temp)/(2*(m1temp - m2temp)^2) - (m1temp*m2temp*Log[m1temp])/
     (m1temp - m2temp)^3 + (m1temp*m2temp*Log[m2temp])/(m1temp - m2temp)^3 + 
    qsqsub*(-(m1temp^2 + 10*m1temp*m2temp + m2temp^2)/
       (6*(m1temp - m2temp)^4) + (m1temp*m2temp*(m1temp + m2temp)*
        Log[m1temp])/(m1temp - m2temp)^5 - (m1temp*m2temp*(m1temp + m2temp)*
        Log[m2temp])/(m1temp - m2temp)^5)
 
C1func[qsqsub_, m1temp_, m2temp_, m2temp_] := 
   (-3*m1temp + m2temp)/(4*(m1temp - m2temp)^2) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^3) + (m1temp^2*Log[m2temp])/
     (2*(-m1temp + m2temp)^3) + 
    qsqsub*(-(3*m1temp^3 + 13*m1temp^2*m2temp - 5*m1temp*m2temp^2 + m2temp^3)/
       (36*(m1temp - m2temp)^4*m2temp) + (m1temp^3*Log[m1temp])/
       (3*(m1temp - m2temp)^5) + (m1temp^3*Log[m2temp])/
       (3*(-m1temp + m2temp)^5))
 
C1func[qsqsub_, m1temp_, m2temp_, m3temp_] := 
   m2temp/(2*(-m1temp + m2temp)*(m2temp - m3temp)) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^2*(m1temp - m3temp)) - 
    (m2temp*(m1temp*(m2temp - 2*m3temp) + m2temp*m3temp)*Log[m2temp])/
     (2*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m3temp^2*Log[m3temp])/(2*(m2temp - m3temp)^2*(-m1temp + m3temp)) + 
    qsqsub*((-(m1temp*m2temp^2*(m1temp + m2temp)) + 
        m2temp*(5*m1temp^2 - 2*m1temp*m2temp + m2temp^2)*m3temp + 
        (2*m1temp^2 - 9*m1temp*m2temp + 5*m2temp^2)*m3temp^2)/
       (6*(m1temp - m2temp)^2*(m1temp - m3temp)*(m2temp - m3temp)^3) + 
      (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^3*(m1temp - m3temp)^2) - 
      (m2temp*(m1temp*m2temp^3 + 2*m2temp^2*(-2*m1temp + m2temp)*m3temp + 
         (3*m1temp^2 - 3*m1temp*m2temp + m2temp^2)*m3temp^2)*Log[m2temp])/
       (3*(m1temp - m2temp)^3*(m2temp - m3temp)^4) - 
      (m3temp^2*(-3*m1temp*m2temp + m3temp*(2*m2temp + m3temp))*Log[m3temp])/
       (3*(m1temp - m3temp)^2*(m2temp - m3temp)^4))
C2func[qsqsub_, 0, 0, 0] := 1/(2*m3) - qsqsub/(6*m3^2)
 
C2func[qsqsub_, 0, 0, m3temp_] := 1/(2*m3temp) - qsqsub/(6*m3temp^2)
 
C2func[qsqsub_, 0, m2temp_, 0] := -1/(2*m2temp) + Log[m2temp]/(2*m2temp) - 
    Log[m3]/(2*m2temp) + qsqsub*(5/(6*m2temp^2) - Log[m2temp]/(3*m2temp^2) + 
      Log[m3]/(3*m2temp^2))
 
C2func[qsqsub_, 0, m2temp_, m2temp_] := 1/(4*m2temp) - qsqsub/(36*m2temp^2)
 
C2func[qsqsub_, 0, m2temp_, m3temp_] := 1/(2*(-m2temp + m3temp)) + 
    (m2temp*Log[m2temp])/(2*(m2temp - m3temp)^2) - 
    (m2temp*Log[m3temp])/(2*(m2temp - m3temp)^2) + 
    qsqsub*((5*m2temp + m3temp)/(6*(m2temp - m3temp)^3) - 
      (m2temp*(m2temp + 2*m3temp)*Log[m2temp])/(3*(m2temp - m3temp)^4) + 
      (m2temp*(m2temp + 2*m3temp)*Log[m3temp])/(3*(m2temp - m3temp)^4))
 
C2func[qsqsub_, m1temp_, 0, 0] := -1/(2*m1temp) + Log[m1temp]/(2*m1temp) - 
    Log[m3]/(2*m1temp) + qsqsub*(-(m1temp + 3*m3)/(6*m1temp^2*m3) + 
      Log[m1temp]/(3*m1temp^2) - Log[m3]/(3*m1temp^2))
 
C2func[qsqsub_, m1temp_, 0, m1temp_] := 1/(4*m1temp) - qsqsub/(18*m1temp^2)
 
C2func[qsqsub_, m1temp_, 0, m3temp_] := 1/(2*(-m1temp + m3temp)) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m3temp)^2) - 
    (m1temp*Log[m3temp])/(2*(m1temp - m3temp)^2) + 
    qsqsub*(-(m1temp + m3temp)/(6*(m1temp - m3temp)^2*m3temp) + 
      (m1temp*Log[m1temp])/(3*(m1temp - m3temp)^3) + 
      (m1temp*Log[m3temp])/(3*(-m1temp + m3temp)^3))
 
C2func[qsqsub_, m1temp_, m1temp_, 0] := 1/(2*m1temp) - qsqsub/(6*m1temp^2)
 
C2func[qsqsub_, m1temp_, m1temp_, m1temp_] := 
   1/(6*m1temp) - qsqsub/(60*m1temp^2)
 
C2func[qsqsub_, m1temp_, m1temp_, m3temp_] := 
   (m1temp + m3temp)/(2*(m1temp - m3temp)^2) - (m1temp*m3temp*Log[m1temp])/
     (m1temp - m3temp)^3 + (m1temp*m3temp*Log[m3temp])/(m1temp - m3temp)^3 + 
    qsqsub*(-(m1temp^2 + 10*m1temp*m3temp + m3temp^2)/
       (6*(m1temp - m3temp)^4) + (m1temp*m3temp*(m1temp + m3temp)*
        Log[m1temp])/(m1temp - m3temp)^5 - (m1temp*m3temp*(m1temp + m3temp)*
        Log[m3temp])/(m1temp - m3temp)^5)
 
C2func[qsqsub_, m1temp_, m2temp_, 0] := Log[m1temp]/(2*m1temp - 2*m2temp) + 
    Log[m2temp]/(2*(-m1temp + m2temp)) + 
    qsqsub*(-(3*m1temp*m2temp - 3*m2temp^2)^(-1) + 
      Log[m1temp]/(3*(m1temp - m2temp)^2) - Log[m2temp]/
       (3*(m1temp - m2temp)^2))
 
C2func[qsqsub_, m1temp_, m2temp_, m1temp_] := 
   (m1temp - 3*m2temp)/(4*(m1temp - m2temp)^2) + (m2temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^3) + (m2temp^2*Log[m2temp])/
     (2*(-m1temp + m2temp)^3) + 
    qsqsub*((-m1temp^2 + 8*m1temp*m2temp + 17*m2temp^2)/
       (18*(m1temp - m2temp)^4) + (m2temp^2*(3*m1temp + m2temp)*Log[m1temp])/
       (3*(-m1temp + m2temp)^5) + (m2temp^2*(3*m1temp + m2temp)*Log[m2temp])/
       (3*(m1temp - m2temp)^5))
 
C2func[qsqsub_, m1temp_, m2temp_, m2temp_] := 
   (-3*m1temp + m2temp)/(4*(m1temp - m2temp)^2) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^3) + (m1temp^2*Log[m2temp])/
     (2*(-m1temp + m2temp)^3) + 
    qsqsub*(-(3*m1temp^3 + 13*m1temp^2*m2temp - 5*m1temp*m2temp^2 + m2temp^3)/
       (36*(m1temp - m2temp)^4*m2temp) + (m1temp^3*Log[m1temp])/
       (3*(m1temp - m2temp)^5) + (m1temp^3*Log[m2temp])/
       (3*(-m1temp + m2temp)^5))
 
C2func[qsqsub_, m1temp_, m2temp_, m3temp_] := 
   m3temp/(2*(-m1temp + m3temp)*(-m2temp + m3temp)) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)*(m1temp - m3temp)^2) + 
    (m2temp^2*Log[m2temp])/(2*(-m1temp + m2temp)*(m2temp - m3temp)^2) + 
    (m3temp*(2*m1temp*m2temp - (m1temp + m2temp)*m3temp)*Log[m3temp])/
     (2*(m1temp - m3temp)^2*(m2temp - m3temp)^2) + 
    qsqsub*((-(m2temp*m3temp^2*(5*m2temp + m3temp)) + 
        m1temp^2*(-2*m2temp^2 - 5*m2temp*m3temp + m3temp^2) + 
        m1temp*m3temp*(9*m2temp^2 + 2*m2temp*m3temp + m3temp^2))/
       (6*(m1temp - m2temp)*(m1temp - m3temp)^2*(m2temp - m3temp)^3) + 
      (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^2*(m1temp - m3temp)^3) - 
      (m2temp^2*(m2temp^2 - 3*m1temp*m3temp + 2*m2temp*m3temp)*Log[m2temp])/
       (3*(m1temp - m2temp)^2*(m2temp - m3temp)^4) - 
      (m3temp*(3*m1temp^2*m2temp^2 + m2temp*m3temp^2*(m2temp + 2*m3temp) + 
         m1temp*m3temp*(-3*m2temp^2 - 4*m2temp*m3temp + m3temp^2))*
        Log[m3temp])/(3*(m1temp - m3temp)^3*(m2temp - m3temp)^4))
C00func[qsqsub_, 0, 0, 0] := -qsqsub/(12*m3) + 
    (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[16]/8 - Log[m3]/4 + Log[Pi]/4
 
C00func[qsqsub_, 0, 0, m3temp_] := -qsqsub/(12*m3temp) + 
    (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[4096]/24 - Log[m3temp]/4 + 
    Log[Pi]/4
 
C00func[qsqsub_, 0, m2temp_, 0] := -qsqsub/(12*m2temp) + 
    (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[4096]/24 - Log[m2temp]/4 + 
    Log[Pi]/4
 
C00func[qsqsub_, 0, m2temp_, m2temp_] := -qsqsub/(36*m2temp) + 
    (4 + \[Delta] - 2*EulerGamma*\[Delta])/(8*\[Delta]) + Log[16]/8 - 
    Log[m2temp]/4 + Log[Pi]/4
 
C00func[qsqsub_, 0, m2temp_, m3temp_] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    ((m2temp^2 + m3temp^2)*Log[2])/(2*(m2temp - m3temp)^2) - 
    (m2temp*m3temp*Log[4096])/(12*(m2temp - m3temp)^2) + 
    (m2temp*Log[m2temp])/(4*(-m2temp + m3temp)) + 
    (m3temp*Log[m3temp])/(4*m2temp - 4*m3temp) + 
    qsqsub*(-(m2temp + m3temp)/(12*(m2temp - m3temp)^2) + 
      (m2temp*m3temp*Log[m2temp])/(6*(m2temp - m3temp)^3) - 
      (m2temp*m3temp*Log[m3temp])/(6*(m2temp - m3temp)^3)) + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, 0, 0] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    Log[2]/2 - Log[m1temp]/4 + qsqsub*(1/(12*m1temp) - 
      Log[m1temp]/(12*m1temp) + Log[m3]/(12*m1temp)) + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, 0, m1temp_] := -qsqsub/(24*m1temp) + 
    (4 + \[Delta] - 2*EulerGamma*\[Delta])/(8*\[Delta]) + Log[16]/8 - 
    Log[m1temp]/4 + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, 0, m3temp_] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    (m1temp*Log[2])/(2*m1temp - 2*m3temp) - (m3temp*Log[4096])/
     (24*(m1temp - m3temp)) + (m1temp*Log[m1temp])/(4*(-m1temp + m3temp)) + 
    (m3temp*Log[m3temp])/(4*m1temp - 4*m3temp) + 
    qsqsub*((12*m1temp - 12*m3temp)^(-1) - (m1temp*Log[m1temp])/
       (12*(m1temp - m3temp)^2) + (m1temp*Log[m3temp])/
       (12*(m1temp - m3temp)^2)) + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, m1temp_, 0] := -qsqsub/(24*m1temp) + 
    (4 + \[Delta] - 2*EulerGamma*\[Delta])/(8*\[Delta]) + Log[16]/8 - 
    Log[m1temp]/4 + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, m1temp_, m1temp_] := -qsqsub/(48*m1temp) + 
    (2 - EulerGamma*\[Delta])/(4*\[Delta]) + Log[2]/2 - Log[m1temp]/4 + 
    Log[Pi]/4
 
C00func[qsqsub_, m1temp_, m1temp_, m3temp_] := 
   (3 - 2*EulerGamma + (2*m1temp)/(-m1temp + m3temp) + 4/\[Delta])/8 + 
    ((m1temp^3 + 3*m1temp*m3temp^2)*Log[2])/(2*(m1temp - m3temp)^3) + 
    (m3temp*(3*m1temp^2 + m3temp^2)*Log[4096])/(24*(-m1temp + m3temp)^3) - 
    (m1temp*(m1temp - 2*m3temp)*Log[m1temp])/(4*(m1temp - m3temp)^2) - 
    (m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)^2) + 
    qsqsub*((-m1temp^2 + 5*m1temp*m3temp + 2*m3temp^2)/
       (24*(m1temp - m3temp)^3) - (m1temp*m3temp^2*Log[m1temp])/
       (4*(m1temp - m3temp)^4) + (m1temp*m3temp^2*Log[m3temp])/
       (4*(m1temp - m3temp)^4)) + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, m2temp_, 0] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    (m1temp*Log[2])/(2*m1temp - 2*m2temp) - (m2temp*Log[4096])/
     (24*(m1temp - m2temp)) + (m1temp*Log[m1temp])/(4*(-m1temp + m2temp)) + 
    (m2temp*Log[m2temp])/(4*m1temp - 4*m2temp) + 
    qsqsub*((12*m1temp - 12*m2temp)^(-1) - (m1temp*Log[m1temp])/
       (12*(m1temp - m2temp)^2) + (m1temp*Log[m2temp])/
       (12*(m1temp - m2temp)^2)) + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, m2temp_, m1temp_] := 
   (3 - 2*EulerGamma + (2*m1temp)/(-m1temp + m2temp) + 4/\[Delta])/8 + 
    ((m1temp^3 + 3*m1temp*m2temp^2)*Log[2])/(2*(m1temp - m2temp)^3) + 
    (m2temp*(3*m1temp^2 + m2temp^2)*Log[4096])/(24*(-m1temp + m2temp)^3) - 
    (m1temp*(m1temp - 2*m2temp)*Log[m1temp])/(4*(m1temp - m2temp)^2) - 
    (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)^2) + 
    qsqsub*((-m1temp^2 + 5*m1temp*m2temp + 2*m2temp^2)/
       (24*(m1temp - m2temp)^3) - (m1temp*m2temp^2*Log[m1temp])/
       (4*(m1temp - m2temp)^4) + (m1temp*m2temp^2*Log[m2temp])/
       (4*(m1temp - m2temp)^4)) + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, m2temp_, m2temp_] := 
   (1 - 2*EulerGamma + (2*m1temp)/(m1temp - m2temp) + 4/\[Delta])/8 + 
    (m1temp*(m1temp^2 - 3*m1temp*m2temp + 3*m2temp^2)*Log[2])/
     (2*(m1temp - m2temp)^3) + (m2temp^3*Log[16])/(8*(-m1temp + m2temp)^3) - 
    (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)^2) + 
    ((-1 + m1temp^2/(m1temp - m2temp)^2)*Log[m2temp])/4 + 
    qsqsub*((11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/
       (72*(m1temp - m2temp)^3) - (m1temp^3*Log[m1temp])/
       (12*(m1temp - m2temp)^4) + (m1temp^3*Log[m2temp])/
       (12*(m1temp - m2temp)^4)) + Log[Pi]/4
 
C00func[qsqsub_, m1temp_, m2temp_, m3temp_] := 
   (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[4096]/24 + 
    (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)*(-m1temp + m3temp)) + 
    (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)*(m2temp - m3temp)) + 
    (m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)*(-m2temp + m3temp)) + 
    qsqsub*((-(m2temp*m3temp*(m2temp + m3temp)) + 
        m1temp*(m2temp^2 + m3temp^2))/(12*(m1temp - m2temp)*(m1temp - m3temp)*
        (m2temp - m3temp)^2) - (m1temp^3*Log[m1temp])/(12*(m1temp - m2temp)^2*
        (m1temp - m3temp)^2) + (m2temp^2*(m1temp*(m2temp - 3*m3temp) + 
         2*m2temp*m3temp)*Log[m2temp])/(12*(m1temp - m2temp)^2*
        (m2temp - m3temp)^3) + (m3temp^2*(2*m2temp*m3temp + 
         m1temp*(-3*m2temp + m3temp))*Log[m3temp])/(12*(m1temp - m3temp)^2*
        (-m2temp + m3temp)^3)) + Log[Pi]/4
C11func[qsqsub_, 0, 0, 0] := 1/(2*m3) + Log[m2]/(3*m3) - Log[m3]/(3*m3) + 
    qsqsub*(-17/(24*m3^2) - Log[m2]/(4*m3^2) + Log[m3]/(4*m3^2))
 
C11func[qsqsub_, 0, 0, m3temp_] := 1/(2*m3temp) + Log[m2]/(3*m3temp) - 
    Log[m3temp]/(3*m3temp) + qsqsub*(-17/(24*m3temp^2) - 
      Log[m2]/(4*m3temp^2) + Log[m3temp]/(4*m3temp^2))
 
C11func[qsqsub_, 0, m2temp_, 0] := -1/(6*m2temp) + qsqsub/(24*m2temp^2)
 
C11func[qsqsub_, 0, m2temp_, m2temp_] := -1/(9*m2temp) + qsqsub/(80*m2temp^2)
 
C11func[qsqsub_, 0, m2temp_, m3temp_] := 
   -(m2temp - 3*m3temp)/(6*(m2temp - m3temp)^2) + (m3temp^2*Log[m2temp])/
     (3*(-m2temp + m3temp)^3) + (m3temp^2*Log[m3temp])/
     (3*(m2temp - m3temp)^3) + 
    qsqsub*((m2temp^2 - 8*m2temp*m3temp - 17*m3temp^2)/
       (24*(m2temp - m3temp)^4) + (m3temp^2*(3*m2temp + m3temp)*Log[m2temp])/
       (4*(m2temp - m3temp)^5) + (m3temp^2*(3*m2temp + m3temp)*Log[m3temp])/
       (4*(-m2temp + m3temp)^5))
 
C11func[qsqsub_, m1temp_, 0, 0] := -Log[m1temp]/(3*m1temp) + 
    Log[m3]/(3*m1temp) + qsqsub*((m1temp + m3)/(4*m1temp^2*m3) - 
      Log[m1temp]/(4*m1temp^2) + Log[m3]/(4*m1temp^2))
 
C11func[qsqsub_, m1temp_, 0, m1temp_] := -1/(3*m1temp) + qsqsub/(8*m1temp^2)
 
C11func[qsqsub_, m1temp_, 0, m3temp_] := Log[m1temp]/(3*(-m1temp + m3temp)) + 
    Log[m3temp]/(3*m1temp - 3*m3temp) + 
    qsqsub*((4*m1temp*m3temp - 4*m3temp^2)^(-1) - 
      Log[m1temp]/(4*(m1temp - m3temp)^2) + Log[m3temp]/
       (4*(m1temp - m3temp)^2))
 
C11func[qsqsub_, m1temp_, m1temp_, 0] := -1/(9*m1temp) + qsqsub/(48*m1temp^2)
 
C11func[qsqsub_, m1temp_, m1temp_, m1temp_] := 
   -1/(12*m1temp) + qsqsub/(120*m1temp^2)
 
C11func[qsqsub_, m1temp_, m1temp_, m3temp_] := 
   (-2*m1temp^2 + 7*m1temp*m3temp - 11*m3temp^2)/(18*(m1temp - m3temp)^3) + 
    (m3temp^3*Log[m1temp])/(3*(m1temp - m3temp)^4) - 
    (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)^4) + 
    qsqsub*(((m1temp + m3temp)*(m1temp^2 - 8*m1temp*m3temp + 37*m3temp^2))/
       (48*(m1temp - m3temp)^5) - (m3temp^3*(4*m1temp + m3temp)*Log[m1temp])/
       (4*(m1temp - m3temp)^6) + (m3temp^3*(4*m1temp + m3temp)*Log[m3temp])/
       (4*(m1temp - m3temp)^6))
 
C11func[qsqsub_, m1temp_, m2temp_, 0] := 
   -(-3*m1temp + m2temp)/(6*(m1temp - m2temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(-m1temp + m2temp)^3) + 
    (m1temp^2*Log[m2temp])/(3*(m1temp - m2temp)^3) + 
    qsqsub*((-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
       (24*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
       (4*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/
       (4*(m1temp - m2temp)^4))
 
C11func[qsqsub_, m1temp_, m2temp_, m1temp_] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/(6*(m1temp - m2temp)^3) + 
    (m1temp^2*m2temp*Log[m1temp])/(m1temp - m2temp)^4 - 
    (m1temp^2*m2temp*Log[m2temp])/(m1temp - m2temp)^4 + 
    qsqsub*((3*m1temp^3 + 47*m1temp^2*m2temp + 11*m1temp*m2temp^2 - m2temp^3)/
       (24*(m1temp - m2temp)^5) - (m1temp^2*m2temp*(2*m1temp + 3*m2temp)*
        Log[m1temp])/(2*(m1temp - m2temp)^6) + 
      (m1temp^2*m2temp*(2*m1temp + 3*m2temp)*Log[m2temp])/
       (2*(m1temp - m2temp)^6))
 
C11func[qsqsub_, m1temp_, m2temp_, m2temp_] := 
   (11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/(18*(m1temp - m2temp)^3) - 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4) + 
    (m1temp^3*Log[m2temp])/(3*(m1temp - m2temp)^4) + 
    qsqsub*((12*m1temp^4 + 77*m1temp^3*m2temp - 43*m1temp^2*m2temp^2 + 
        17*m1temp*m2temp^3 - 3*m2temp^4)/(240*(m1temp - m2temp)^5*m2temp) - 
      (m1temp^4*Log[m1temp])/(4*(m1temp - m2temp)^6) + 
      (m1temp^4*Log[m2temp])/(4*(m1temp - m2temp)^6))
 
C11func[qsqsub_, m1temp_, m2temp_, m3temp_] := 
   -(m2temp*(-3*m1temp*m2temp + m2temp^2 + 5*m1temp*m3temp - 
        3*m2temp*m3temp))/(6*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^3*(-m1temp + m3temp)) + 
    (m2temp*(m1temp*m2temp*(m2temp - 3*m3temp)*m3temp + m2temp^2*m3temp^2 + 
       m1temp^2*(m2temp^2 - 3*m2temp*m3temp + 3*m3temp^2))*Log[m2temp])/
     (3*(m1temp - m2temp)^3*(m2temp - m3temp)^3) + 
    (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)*(-m2temp + m3temp)^3) + 
    qsqsub*((m2temp^3*m3temp*(m2temp^2 - 8*m2temp*m3temp - 17*m3temp^2) - 
        m1temp*m2temp^2*(m2temp - 7*m3temp)*(m2temp^2 + 4*m2temp*m3temp + 
          7*m3temp^2) + m1temp^2*m2temp*(m2temp - 4*m3temp)*
         (5*m2temp^2 + 8*m2temp*m3temp + 11*m3temp^2) + 
        2*m1temp^3*(m2temp^3 - 5*m2temp^2*m3temp + 13*m2temp*m3temp^2 + 
          3*m3temp^3))/(24*(m1temp - m2temp)^3*(m1temp - m3temp)*
        (m2temp - m3temp)^4) - (m1temp^4*Log[m1temp])/(4*(m1temp - m2temp)^4*
        (m1temp - m3temp)^2) + (m2temp*(-4*m1temp^3*m3temp^3 + 
         m2temp^3*m3temp^2*(3*m2temp + m3temp) + 2*m1temp*m2temp^2*m3temp*
          (m2temp^2 - 5*m2temp*m3temp - 2*m3temp^2) + m1temp^2*m2temp*
          (m2temp^3 - 5*m2temp^2*m3temp + 10*m2temp*m3temp^2 + 6*m3temp^3))*
        Log[m2temp])/(4*(m1temp - m2temp)^4*(m2temp - m3temp)^5) + 
      (m3temp^3*(-4*m1temp*m2temp + m3temp*(3*m2temp + m3temp))*Log[m3temp])/
       (4*(m1temp - m3temp)^2*(-m2temp + m3temp)^5))
C12func[qsqsub_, 0, 0, 0] := -1/(6*m3) + 
    qsqsub*((-25*m2^2 - 3*m2*m3 + m3^2)/(12*m2^2*m3^5) - Log[m2]/m3^5 + 
      Log[m3]/m3^5)
 
C12func[qsqsub_, 0, 0, m3temp_] := -1/(6*m3temp) + 
    qsqsub*((-25*m2^2 - 3*m2*m3temp + m3temp^2)/(12*m2^2*m3temp^5) - 
      Log[m2]/m3temp^5 + Log[m3temp]/m3temp^5)
 
C12func[qsqsub_, 0, m2temp_, 0] := -1/(6*m2temp) + 
    qsqsub*((m2temp^2 - 3*m2temp*m3 - 25*m3^2)/(12*m2temp^5*m3^2) + 
      Log[m2temp]/m2temp^5 - Log[m3]/m2temp^5)
 
C12func[qsqsub_, 0, m2temp_, m2temp_] := -1/(18*m2temp) + qsqsub/(30*m2temp^5)
 
C12func[qsqsub_, 0, m2temp_, m3temp_] := 
   -(m2temp + m3temp)/(6*(m2temp - m3temp)^2) + (m2temp*m3temp*Log[m2temp])/
     (3*(m2temp - m3temp)^3) - (m2temp*m3temp*Log[m3temp])/
     (3*(m2temp - m3temp)^3) + 
    qsqsub*(((m2temp + m3temp)*(m2temp^2 - 8*m2temp*m3temp + m3temp^2))/
       (12*m2temp^2*(m2temp - m3temp)^4*m3temp^2) + 
      Log[m2temp]/(m2temp - m3temp)^5 + Log[m3temp]/(-m2temp + m3temp)^5)
 
C12func[qsqsub_, m1temp_, 0, 0] := 1/(6*m1temp) - Log[m1temp]/(6*m1temp) + 
    Log[m3]/(6*m1temp) + qsqsub*((6*m1temp^3*m2*m3 + m1temp^2*m2*m3^2 - 
        m1temp*m2*m3^3 - 3*m2*m3^4 + m1temp^4*(14*m2 + m3))/
       (12*m1temp^5*m2*m3^4) + Log[m1temp]/(6*m1temp^5) + 
      ((3*m1temp + m3)*Log[m2])/(6*m1temp^2*m3^4) - 
      ((3*m1temp^4 + m1temp^3*m3 + m3^4)*Log[m3])/(6*m1temp^5*m3^4))
 
C12func[qsqsub_, m1temp_, 0, m1temp_] := -1/(12*m1temp) + 
    qsqsub*((3*m1temp + 62*m2)/(36*m1temp^5*m2) - (2*Log[m1temp])/
       (3*m1temp^5) + (2*Log[m2])/(3*m1temp^5))
 
C12func[qsqsub_, m1temp_, 0, m3temp_] := (6*m1temp - 6*m3temp)^(-1) - 
    (m1temp*Log[m1temp])/(6*(m1temp - m3temp)^2) + 
    (m1temp*Log[m3temp])/(6*(m1temp - m3temp)^2) + 
    qsqsub*((3*m2*m3temp^3 + m1temp*m3temp^2*(3*m2 + m3temp) - 
        2*m1temp^2*m3temp*(11*m2 + m3temp) + m1temp^3*(14*m2 + m3temp))/
       (12*m1temp^2*m2*(m1temp - m3temp)^2*m3temp^4) + 
      Log[m1temp]/(6*m1temp^2*(m1temp - m3temp)^3) + 
      ((3*m1temp + m3temp)*Log[m2])/(6*m1temp^2*m3temp^4) + 
      ((3*m1temp^2 - 8*m1temp*m3temp + 6*m3temp^2)*Log[m3temp])/
       (6*m3temp^4*(-m1temp + m3temp)^3))
 
C12func[qsqsub_, m1temp_, m1temp_, 0] := -1/(12*m1temp) + 
    qsqsub*((3*m1temp + 62*m3)/(36*m1temp^5*m3) - (2*Log[m1temp])/
       (3*m1temp^5) + (2*Log[m3])/(3*m1temp^5))
 
C12func[qsqsub_, m1temp_, m1temp_, m1temp_] := 
   -1/(24*m1temp) + qsqsub/(180*m1temp^5)
 
C12func[qsqsub_, m1temp_, m1temp_, m3temp_] := 
   (-m1temp^2 + 5*m1temp*m3temp + 2*m3temp^2)/(12*(m1temp - m3temp)^3) - 
    (m1temp*m3temp^2*Log[m1temp])/(2*(m1temp - m3temp)^4) + 
    (m1temp*m3temp^2*Log[m3temp])/(2*(m1temp - m3temp)^4) + 
    qsqsub*((3*m1temp^3 + 47*m1temp^2*m3temp + 11*m1temp*m3temp^2 - m3temp^3)/
       (36*m1temp^2*(m1temp - m3temp)^5*m3temp) - 
      ((2*m1temp + 3*m3temp)*Log[m1temp])/(3*(m1temp - m3temp)^6) + 
      ((2*m1temp + 3*m3temp)*Log[m3temp])/(3*(m1temp - m3temp)^6))
 
C12func[qsqsub_, m1temp_, m2temp_, 0] := (6*m1temp - 6*m2temp)^(-1) - 
    (m1temp*Log[m1temp])/(6*(m1temp - m2temp)^2) + 
    (m1temp*Log[m2temp])/(6*(m1temp - m2temp)^2) + 
    qsqsub*((3*m2temp^3*m3 + m1temp*m2temp^2*(m2temp + 3*m3) - 
        2*m1temp^2*m2temp*(m2temp + 11*m3) + m1temp^3*(m2temp + 14*m3))/
       (12*m1temp^2*(m1temp - m2temp)^2*m2temp^4*m3) + 
      Log[m1temp]/(6*m1temp^2*(m1temp - m2temp)^3) + 
      ((3*m1temp^2 - 8*m1temp*m2temp + 6*m2temp^2)*Log[m2temp])/
       (6*m2temp^4*(-m1temp + m2temp)^3) + ((3*m1temp + m2temp)*Log[m3])/
       (6*m1temp^2*m2temp^4))
 
C12func[qsqsub_, m1temp_, m2temp_, m1temp_] := 
   (-m1temp^2 + 5*m1temp*m2temp + 2*m2temp^2)/(12*(m1temp - m2temp)^3) - 
    (m1temp*m2temp^2*Log[m1temp])/(2*(m1temp - m2temp)^4) + 
    (m1temp*m2temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4) + 
    qsqsub*((3*m1temp^3 + 47*m1temp^2*m2temp + 11*m1temp*m2temp^2 - m2temp^3)/
       (36*m1temp^2*(m1temp - m2temp)^5*m2temp) - 
      ((2*m1temp + 3*m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^6) + 
      ((2*m1temp + 3*m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^6))
 
C12func[qsqsub_, m1temp_, m2temp_, m2temp_] := 
   (11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/(36*(m1temp - m2temp)^3) - 
    (m1temp^3*Log[m1temp])/(6*(m1temp - m2temp)^4) + 
    (m1temp^3*Log[m2temp])/(6*(m1temp - m2temp)^4) + 
    qsqsub*((-3*m1temp^4 + 17*m1temp^3*m2temp - 43*m1temp^2*m2temp^2 + 
        77*m1temp*m2temp^3 + 12*m2temp^4)/(360*m2temp^4*
        (-m1temp + m2temp)^5) + (m1temp*Log[m1temp])/
       (6*(m1temp - m2temp)^6) - (m1temp*Log[m2temp])/(6*(m1temp - m2temp)^6))
 
C12func[qsqsub_, m1temp_, m2temp_, m3temp_] := 
   (-(m2temp*m3temp*(m2temp + m3temp)) + m1temp*(m2temp^2 + m3temp^2))/
     (6*(m1temp - m2temp)*(m1temp - m3temp)*(m2temp - m3temp)^2) - 
    (m1temp^3*Log[m1temp])/(6*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
    (m2temp^2*(m1temp*(m2temp - 3*m3temp) + 2*m2temp*m3temp)*Log[m2temp])/
     (6*(m1temp - m2temp)^2*(m2temp - m3temp)^3) + 
    (m3temp^2*(2*m2temp*m3temp + m1temp*(-3*m2temp + m3temp))*Log[m3temp])/
     (6*(m1temp - m3temp)^2*(-m2temp + m3temp)^3) + 
    qsqsub*((m2temp*m3temp*(m2temp + m3temp)*(m2temp^2 - 8*m2temp*m3temp + 
          m3temp^2) - 2*m1temp^2*(m2temp + m3temp)*(m2temp^2 + 
          7*m2temp*m3temp + m3temp^2) + m1temp^3*(m2temp^2 + 
          10*m2temp*m3temp + m3temp^2) + m1temp*(m2temp^4 + 
          3*m2temp^3*m3temp + 28*m2temp^2*m3temp^2 + 3*m2temp*m3temp^3 + 
          m3temp^4))/(12*(m1temp - m2temp)^2*m2temp*(m1temp - m3temp)^2*
        (m2temp - m3temp)^4*m3temp) + (m1temp*Log[m1temp])/
       (6*(m1temp - m2temp)^3*(m1temp - m3temp)^3) - 
      ((6*m2temp^3 + 3*m1temp^2*(m2temp + m3temp) + 
         m1temp*(-8*m2temp^2 - 5*m2temp*m3temp + m3temp^2))*Log[m2temp])/
       (6*(m1temp - m2temp)^3*(m2temp - m3temp)^5) - 
      ((6*m3temp^3 + 3*m1temp^2*(m2temp + m3temp) + 
         m1temp*(m2temp^2 - 5*m2temp*m3temp - 8*m3temp^2))*Log[m3temp])/
       (6*(m1temp - m3temp)^3*(-m2temp + m3temp)^5))
C22func[qsqsub_, 0, 0, 0] := -1/(6*m3) + qsqsub/(24*m3^2)
 
C22func[qsqsub_, 0, 0, m3temp_] := -1/(6*m3temp) + qsqsub/(24*m3temp^2)
 
C22func[qsqsub_, 0, m2temp_, 0] := 1/(2*m2temp) - Log[m2temp]/(3*m2temp) + 
    Log[m3]/(3*m2temp) + qsqsub*(-17/(24*m2temp^2) + 
      Log[m2temp]/(4*m2temp^2) - Log[m3]/(4*m2temp^2))
 
C22func[qsqsub_, 0, m2temp_, m2temp_] := -1/(9*m2temp) + qsqsub/(80*m2temp^2)
 
C22func[qsqsub_, 0, m2temp_, m3temp_] := 
   -(-3*m2temp + m3temp)/(6*(m2temp - m3temp)^2) + 
    (m2temp^2*Log[m2temp])/(3*(-m2temp + m3temp)^3) + 
    (m2temp^2*Log[m3temp])/(3*(m2temp - m3temp)^3) + 
    qsqsub*((-17*m2temp^2 - 8*m2temp*m3temp + m3temp^2)/
       (24*(m2temp - m3temp)^4) + (m2temp^2*(m2temp + 3*m3temp)*Log[m2temp])/
       (4*(m2temp - m3temp)^5) - (m2temp^2*(m2temp + 3*m3temp)*Log[m3temp])/
       (4*(m2temp - m3temp)^5))
 
C22func[qsqsub_, m1temp_, 0, 0] := 1/(2*m1temp) - Log[m1temp]/(3*m1temp) + 
    Log[m3]/(3*m1temp) + qsqsub*((2*m1temp + 11*m3)/(24*m1temp^2*m3) - 
      Log[m1temp]/(4*m1temp^2) + Log[m3]/(4*m1temp^2))
 
C22func[qsqsub_, m1temp_, 0, m1temp_] := -1/(9*m1temp) + qsqsub/(48*m1temp^2)
 
C22func[qsqsub_, m1temp_, 0, m3temp_] := 
   -(-3*m1temp + m3temp)/(6*(m1temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(-m1temp + m3temp)^3) + 
    (m1temp^2*Log[m3temp])/(3*(m1temp - m3temp)^3) + 
    qsqsub*((-2*m1temp^2 - 5*m1temp*m3temp + m3temp^2)/
       (24*m3temp*(-m1temp + m3temp)^3) - (m1temp^2*Log[m1temp])/
       (4*(m1temp - m3temp)^4) + (m1temp^2*Log[m3temp])/
       (4*(m1temp - m3temp)^4))
 
C22func[qsqsub_, m1temp_, m1temp_, 0] := -1/(3*m1temp) + qsqsub/(8*m1temp^2)
 
C22func[qsqsub_, m1temp_, m1temp_, m1temp_] := 
   -1/(12*m1temp) + qsqsub/(120*m1temp^2)
 
C22func[qsqsub_, m1temp_, m1temp_, m3temp_] := 
   (-2*m1temp^2 - 5*m1temp*m3temp + m3temp^2)/(6*(m1temp - m3temp)^3) + 
    (m1temp^2*m3temp*Log[m1temp])/(m1temp - m3temp)^4 - 
    (m1temp^2*m3temp*Log[m3temp])/(m1temp - m3temp)^4 + 
    qsqsub*((3*m1temp^3 + 47*m1temp^2*m3temp + 11*m1temp*m3temp^2 - m3temp^3)/
       (24*(m1temp - m3temp)^5) - (m1temp^2*m3temp*(2*m1temp + 3*m3temp)*
        Log[m1temp])/(2*(m1temp - m3temp)^6) + 
      (m1temp^2*m3temp*(2*m1temp + 3*m3temp)*Log[m3temp])/
       (2*(m1temp - m3temp)^6))
 
C22func[qsqsub_, m1temp_, m2temp_, 0] := Log[m1temp]/(3*(-m1temp + m2temp)) + 
    Log[m2temp]/(3*m1temp - 3*m2temp) + 
    qsqsub*((4*m1temp*m2temp - 4*m2temp^2)^(-1) - 
      Log[m1temp]/(4*(m1temp - m2temp)^2) + Log[m2temp]/
       (4*(m1temp - m2temp)^2))
 
C22func[qsqsub_, m1temp_, m2temp_, m1temp_] := 
   (-2*m1temp^2 + 7*m1temp*m2temp - 11*m2temp^2)/(18*(m1temp - m2temp)^3) + 
    (m2temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4) - 
    (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)^4) + 
    qsqsub*(((m1temp + m2temp)*(m1temp^2 - 8*m1temp*m2temp + 37*m2temp^2))/
       (48*(m1temp - m2temp)^5) - (m2temp^3*(4*m1temp + m2temp)*Log[m1temp])/
       (4*(m1temp - m2temp)^6) + (m2temp^3*(4*m1temp + m2temp)*Log[m2temp])/
       (4*(m1temp - m2temp)^6))
 
C22func[qsqsub_, m1temp_, m2temp_, m2temp_] := 
   (11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/(18*(m1temp - m2temp)^3) - 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4) + 
    (m1temp^3*Log[m2temp])/(3*(m1temp - m2temp)^4) + 
    qsqsub*((12*m1temp^4 + 77*m1temp^3*m2temp - 43*m1temp^2*m2temp^2 + 
        17*m1temp*m2temp^3 - 3*m2temp^4)/(240*(m1temp - m2temp)^5*m2temp) - 
      (m1temp^4*Log[m1temp])/(4*(m1temp - m2temp)^6) + 
      (m1temp^4*Log[m2temp])/(4*(m1temp - m2temp)^6))
 
C22func[qsqsub_, m1temp_, m2temp_, m3temp_] := 
   (m3temp*(-5*m1temp*m2temp + 3*(m1temp + m2temp)*m3temp - m3temp^2))/
     (6*(m1temp - m3temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)*(-m1temp + m3temp)^3) + 
    (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)*(m2temp - m3temp)^3) + 
    ((m1temp^3/(m1temp - m3temp)^3 + m2temp^3/(-m2temp + m3temp)^3)*
      Log[m3temp])/(3*(m1temp - m2temp)) + 
    qsqsub*((m2temp*m3temp^3*(-17*m2temp^2 - 8*m2temp*m3temp + m3temp^2) + 
        m1temp*(7*m2temp - m3temp)*m3temp^2*(7*m2temp^2 + 4*m2temp*m3temp + 
          m3temp^2) - m1temp^2*(4*m2temp - m3temp)*m3temp*
         (11*m2temp^2 + 8*m2temp*m3temp + 5*m3temp^2) + 
        2*m1temp^3*(3*m2temp^3 + 13*m2temp^2*m3temp - 5*m2temp*m3temp^2 + 
          m3temp^3))/(24*(m1temp - m2temp)*(m1temp - m3temp)^3*
        (m2temp - m3temp)^4) - (m1temp^4*Log[m1temp])/(4*(m1temp - m2temp)^2*
        (m1temp - m3temp)^4) + (m2temp^3*(m2temp^2 - 4*m1temp*m3temp + 
         3*m2temp*m3temp)*Log[m2temp])/(4*(m1temp - m2temp)^2*
        (m2temp - m3temp)^5) + ((m1temp^4/(m1temp - m3temp)^4 + 
         (4*m1temp*m2temp^3*m3temp)/(m2temp - m3temp)^5 - 
         (m2temp^4*(m2temp + 3*m3temp))/(m2temp - m3temp)^5)*Log[m3temp])/
       (4*(m1temp - m2temp)^2))
C0func0[0, 0, 0] := Log[m2]/m3 - Log[m3]/m3
 
C0func0[0, 0, m3temp_] := Log[m2]/m3temp - Log[m3temp]/m3temp
 
C0func0[0, m2temp_, 0] := -(Log[m2temp]/m2temp) + Log[m3]/m2temp
 
C0func0[0, m2temp_, m2temp_] := -m2temp^(-1)
 
C0func0[0, m2temp_, m3temp_] := Log[m2temp]/(-m2temp + m3temp) + 
    Log[m3temp]/(m2temp - m3temp)
 
C0func0[m1temp_, 0, 0] := -(Log[m1temp]/m1temp) + Log[m3]/m1temp
 
C0func0[m1temp_, 0, m1temp_] := -m1temp^(-1)
 
C0func0[m1temp_, 0, m3temp_] := Log[m1temp]/(-m1temp + m3temp) + 
    Log[m3temp]/(m1temp - m3temp)
 
C0func0[m1temp_, m1temp_, 0] := -m1temp^(-1)
 
C0func0[m1temp_, m1temp_, m1temp_] := -1/(2*m1temp)
 
C0func0[m1temp_, m1temp_, m3temp_] := (-m1temp + m3temp)^(-1) + 
    (m3temp*Log[m1temp])/(m1temp - m3temp)^2 - (m3temp*Log[m3temp])/
     (m1temp - m3temp)^2
 
C0func0[m1temp_, m2temp_, 0] := Log[m1temp]/(-m1temp + m2temp) + 
    Log[m2temp]/(m1temp - m2temp)
 
C0func0[m1temp_, m2temp_, m1temp_] := (-m1temp + m2temp)^(-1) + 
    (m2temp*Log[m1temp])/(m1temp - m2temp)^2 - (m2temp*Log[m2temp])/
     (m1temp - m2temp)^2
 
C0func0[m1temp_, m2temp_, m2temp_] := (m1temp - m2temp)^(-1) - 
    (m1temp*Log[m1temp])/(m1temp - m2temp)^2 + (m1temp*Log[m2temp])/
     (m1temp - m2temp)^2
 
C0func0[m1temp_, m2temp_, m3temp_] := 
   (m1temp*Log[m1temp])/((m1temp - m2temp)*(-m1temp + m3temp)) + 
    (m2temp*Log[m2temp])/((m1temp - m2temp)*(m2temp - m3temp)) + 
    (m3temp*Log[m3temp])/((m1temp - m3temp)*(-m2temp + m3temp))
C1func0[0, 0, 0] := -1/(2*m3) - Log[m2]/(2*m3) + Log[m3]/(2*m3)
 
C1func0[0, 0, m3temp_] := -1/(2*m3temp) - Log[m2]/(2*m3temp) + 
    Log[m3temp]/(2*m3temp)
 
C1func0[0, m2temp_, 0] := 1/(2*m2temp)
 
C1func0[0, m2temp_, m2temp_] := 1/(4*m2temp)
 
C1func0[0, m2temp_, m3temp_] := (2*m2temp - 2*m3temp)^(-1) - 
    (m3temp*Log[m2temp])/(2*(m2temp - m3temp)^2) + 
    (m3temp*Log[m3temp])/(2*(m2temp - m3temp)^2)
 
C1func0[m1temp_, 0, 0] := Log[m1temp]/(2*m1temp) - Log[m3]/(2*m1temp)
 
C1func0[m1temp_, 0, m1temp_] := 1/(2*m1temp)
 
C1func0[m1temp_, 0, m3temp_] := Log[m1temp]/(2*m1temp - 2*m3temp) + 
    Log[m3temp]/(2*(-m1temp + m3temp))
 
C1func0[m1temp_, m1temp_, 0] := 1/(4*m1temp)
 
C1func0[m1temp_, m1temp_, m1temp_] := 1/(6*m1temp)
 
C1func0[m1temp_, m1temp_, m3temp_] := 
   (m1temp - 3*m3temp)/(4*(m1temp - m3temp)^2) + (m3temp^2*Log[m1temp])/
     (2*(m1temp - m3temp)^3) + (m3temp^2*Log[m3temp])/(2*(-m1temp + m3temp)^3)
 
C1func0[m1temp_, m2temp_, 0] := 1/(2*(-m1temp + m2temp)) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m2temp)^2) - 
    (m1temp*Log[m2temp])/(2*(m1temp - m2temp)^2)
 
C1func0[m1temp_, m2temp_, m1temp_] := 
   (m1temp + m2temp)/(2*(m1temp - m2temp)^2) - (m1temp*m2temp*Log[m1temp])/
     (m1temp - m2temp)^3 + (m1temp*m2temp*Log[m2temp])/(m1temp - m2temp)^3
 
C1func0[m1temp_, m2temp_, m2temp_] := 
   (-3*m1temp + m2temp)/(4*(m1temp - m2temp)^2) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^3) + (m1temp^2*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
C1func0[m1temp_, m2temp_, m3temp_] := 
   m2temp/(2*(-m1temp + m2temp)*(m2temp - m3temp)) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^2*(m1temp - m3temp)) - 
    (m2temp*(m1temp*(m2temp - 2*m3temp) + m2temp*m3temp)*Log[m2temp])/
     (2*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m3temp^2*Log[m3temp])/(2*(m2temp - m3temp)^2*(-m1temp + m3temp))
C2func0[0, 0, 0] := 1/(2*m3)
 
C2func0[0, 0, m3temp_] := 1/(2*m3temp)
 
C2func0[0, m2temp_, 0] := -1/(2*m2temp) + Log[m2temp]/(2*m2temp) - 
    Log[m3]/(2*m2temp)
 
C2func0[0, m2temp_, m2temp_] := 1/(4*m2temp)
 
C2func0[0, m2temp_, m3temp_] := 1/(2*(-m2temp + m3temp)) + 
    (m2temp*Log[m2temp])/(2*(m2temp - m3temp)^2) - 
    (m2temp*Log[m3temp])/(2*(m2temp - m3temp)^2)
 
C2func0[m1temp_, 0, 0] := -1/(2*m1temp) + Log[m1temp]/(2*m1temp) - 
    Log[m3]/(2*m1temp)
 
C2func0[m1temp_, 0, m1temp_] := 1/(4*m1temp)
 
C2func0[m1temp_, 0, m3temp_] := 1/(2*(-m1temp + m3temp)) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m3temp)^2) - 
    (m1temp*Log[m3temp])/(2*(m1temp - m3temp)^2)
 
C2func0[m1temp_, m1temp_, 0] := 1/(2*m1temp)
 
C2func0[m1temp_, m1temp_, m1temp_] := 1/(6*m1temp)
 
C2func0[m1temp_, m1temp_, m3temp_] := 
   (m1temp + m3temp)/(2*(m1temp - m3temp)^2) - (m1temp*m3temp*Log[m1temp])/
     (m1temp - m3temp)^3 + (m1temp*m3temp*Log[m3temp])/(m1temp - m3temp)^3
 
C2func0[m1temp_, m2temp_, 0] := Log[m1temp]/(2*m1temp - 2*m2temp) + 
    Log[m2temp]/(2*(-m1temp + m2temp))
 
C2func0[m1temp_, m2temp_, m1temp_] := 
   (m1temp - 3*m2temp)/(4*(m1temp - m2temp)^2) + (m2temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^3) + (m2temp^2*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
C2func0[m1temp_, m2temp_, m2temp_] := 
   (-3*m1temp + m2temp)/(4*(m1temp - m2temp)^2) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^3) + (m1temp^2*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
C2func0[m1temp_, m2temp_, m3temp_] := 
   m3temp/(2*(m1temp - m3temp)*(m2temp - m3temp)) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)*(m1temp - m3temp)^2) + 
    (m2temp^2*Log[m2temp])/(2*(-m1temp + m2temp)*(m2temp - m3temp)^2) + 
    (m3temp*(2*m1temp*m2temp - (m1temp + m2temp)*m3temp)*Log[m3temp])/
     (2*(m1temp - m3temp)^2*(m2temp - m3temp)^2)
C00func0[0, 0, 0] := (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[16]/8 - 
    Log[m3]/4 + Log[Pi]/4
 
C00func0[0, 0, m3temp_] := (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[16]/8 - 
    Log[m3temp]/4 + Log[Pi]/4
 
C00func0[0, m2temp_, 0] := (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[16]/8 - 
    Log[m2temp]/4 + Log[Pi]/4
 
C00func0[0, m2temp_, m2temp_] := (4 + \[Delta] - 2*EulerGamma*\[Delta])/
     (8*\[Delta]) + Log[16]/8 - Log[m2temp]/4 + Log[Pi]/4
 
C00func0[0, m2temp_, m3temp_] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    Log[2]/2 + (m2temp*Log[m2temp])/(4*(-m2temp + m3temp)) + 
    (m3temp*Log[m3temp])/(4*m2temp - 4*m3temp) + Log[Pi]/4
 
C00func0[m1temp_, 0, 0] := (3 - 2*EulerGamma + 4/\[Delta])/8 + Log[16]/8 - 
    Log[m1temp]/4 + Log[Pi]/4
 
C00func0[m1temp_, 0, m1temp_] := (4 + \[Delta] - 2*EulerGamma*\[Delta])/
     (8*\[Delta]) + Log[16]/8 - Log[m1temp]/4 + Log[Pi]/4
 
C00func0[m1temp_, 0, m3temp_] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    Log[2]/2 + (m1temp*Log[m1temp])/(4*(-m1temp + m3temp)) + 
    (m3temp*Log[m3temp])/(4*m1temp - 4*m3temp) + Log[Pi]/4
 
C00func0[m1temp_, m1temp_, 0] := (4 + \[Delta] - 2*EulerGamma*\[Delta])/
     (8*\[Delta]) + Log[16]/8 - Log[m1temp]/4 + Log[Pi]/4
 
C00func0[m1temp_, m1temp_, m1temp_] := 
   (2 - EulerGamma*\[Delta])/(4*\[Delta]) + Log[4]/4 - Log[m1temp]/4 + 
    Log[Pi]/4
 
C00func0[m1temp_, m1temp_, m3temp_] := 
   (3 - 2*EulerGamma + (2*m1temp)/(-m1temp + m3temp) + 4/\[Delta])/8 + 
    (m1temp*Log[2])/(2*m1temp - 2*m3temp) - (m3temp*Log[16])/
     (8*(m1temp - m3temp)) - (m1temp*(m1temp - 2*m3temp)*Log[m1temp])/
     (4*(m1temp - m3temp)^2) - (m3temp^2*Log[m3temp])/
     (4*(m1temp - m3temp)^2) + Log[Pi]/4
 
C00func0[m1temp_, m2temp_, 0] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    Log[2]/2 + (m1temp*Log[m1temp])/(4*(-m1temp + m2temp)) + 
    (m2temp*Log[m2temp])/(4*m1temp - 4*m2temp) + Log[Pi]/4
 
C00func0[m1temp_, m2temp_, m1temp_] := 
   (3 - 2*EulerGamma + (2*m1temp)/(-m1temp + m2temp) + 4/\[Delta])/8 + 
    Log[16]/8 - (m1temp*(m1temp - 2*m2temp)*Log[m1temp])/
     (4*(m1temp - m2temp)^2) - (m2temp^2*Log[m2temp])/
     (4*(m1temp - m2temp)^2) + Log[Pi]/4
 
C00func0[m1temp_, m2temp_, m2temp_] := 
   (1 - 2*EulerGamma + (2*m1temp)/(m1temp - m2temp) + 4/\[Delta])/8 + 
    Log[16]/8 - (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)^2) - 
    (m2temp*(-2*m1temp + m2temp)*Log[m2temp])/(4*(m1temp - m2temp)^2) + 
    Log[Pi]/4
 
C00func0[m1temp_, m2temp_, m3temp_] := (3 - 2*EulerGamma + 4/\[Delta])/8 + 
    Log[16]/8 + (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)*
      (-m1temp + m3temp)) + (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)*
      (m2temp - m3temp)) + (m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)*
      (-m2temp + m3temp)) + Log[Pi]/4
C11func0[0, 0, 0] := 1/(2*m3) + Log[m2]/(3*m3) - Log[m3]/(3*m3)
 
C11func0[0, 0, m3temp_] := 1/(2*m3temp) + Log[m2]/(3*m3temp) - 
    Log[m3temp]/(3*m3temp)
 
C11func0[0, m2temp_, 0] := -1/(6*m2temp)
 
C11func0[0, m2temp_, m2temp_] := -1/(9*m2temp)
 
C11func0[0, m2temp_, m3temp_] := 
   -(m2temp - 3*m3temp)/(6*(m2temp - m3temp)^2) + (m3temp^2*Log[m2temp])/
     (3*(-m2temp + m3temp)^3) + (m3temp^2*Log[m3temp])/(3*(m2temp - m3temp)^3)
 
C11func0[m1temp_, 0, 0] := -Log[m1temp]/(3*m1temp) + Log[m3]/(3*m1temp)
 
C11func0[m1temp_, 0, m1temp_] := -1/(3*m1temp)
 
C11func0[m1temp_, 0, m3temp_] := Log[m1temp]/(3*(-m1temp + m3temp)) + 
    Log[m3temp]/(3*m1temp - 3*m3temp)
 
C11func0[m1temp_, m1temp_, 0] := -1/(9*m1temp)
 
C11func0[m1temp_, m1temp_, m1temp_] := -1/(12*m1temp)
 
C11func0[m1temp_, m1temp_, m3temp_] := 
   (-2*m1temp^2 + 7*m1temp*m3temp - 11*m3temp^2)/(18*(m1temp - m3temp)^3) + 
    (m3temp^3*Log[m1temp])/(3*(m1temp - m3temp)^4) - 
    (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)^4)
 
C11func0[m1temp_, m2temp_, 0] := 
   -(-3*m1temp + m2temp)/(6*(m1temp - m2temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(-m1temp + m2temp)^3) + 
    (m1temp^2*Log[m2temp])/(3*(m1temp - m2temp)^3)
 
C11func0[m1temp_, m2temp_, m1temp_] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/(6*(m1temp - m2temp)^3) + 
    (m1temp^2*m2temp*Log[m1temp])/(m1temp - m2temp)^4 - 
    (m1temp^2*m2temp*Log[m2temp])/(m1temp - m2temp)^4
 
C11func0[m1temp_, m2temp_, m2temp_] := 
   (11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/(18*(m1temp - m2temp)^3) - 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4) + 
    (m1temp^3*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
C11func0[m1temp_, m2temp_, m3temp_] := 
   -(m2temp*(-3*m1temp*m2temp + m2temp^2 + 5*m1temp*m3temp - 
        3*m2temp*m3temp))/(6*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^3*(-m1temp + m3temp)) + 
    (m2temp*(m1temp*m2temp*(m2temp - 3*m3temp)*m3temp + m2temp^2*m3temp^2 + 
       m1temp^2*(m2temp^2 - 3*m2temp*m3temp + 3*m3temp^2))*Log[m2temp])/
     (3*(m1temp - m2temp)^3*(m2temp - m3temp)^3) + 
    (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)*(-m2temp + m3temp)^3)
C12func0[0, 0, 0] := -1/(6*m3)
 
C12func0[0, 0, m3temp_] := -1/(6*m3temp)
 
C12func0[0, m2temp_, 0] := -1/(6*m2temp)
 
C12func0[0, m2temp_, m2temp_] := -1/(18*m2temp)
 
C12func0[0, m2temp_, m3temp_] := -(m2temp + m3temp)/(6*(m2temp - m3temp)^2) + 
    (m2temp*m3temp*Log[m2temp])/(3*(m2temp - m3temp)^3) - 
    (m2temp*m3temp*Log[m3temp])/(3*(m2temp - m3temp)^3)
 
C12func0[m1temp_, 0, 0] := 1/(6*m1temp) - Log[m1temp]/(6*m1temp) + 
    Log[m3]/(6*m1temp)
 
C12func0[m1temp_, 0, m1temp_] := -1/(12*m1temp)
 
C12func0[m1temp_, 0, m3temp_] := (6*m1temp - 6*m3temp)^(-1) - 
    (m1temp*Log[m1temp])/(6*(m1temp - m3temp)^2) + 
    (m1temp*Log[m3temp])/(6*(m1temp - m3temp)^2)
 
C12func0[m1temp_, m1temp_, 0] := -1/(12*m1temp)
 
C12func0[m1temp_, m1temp_, m1temp_] := -1/(24*m1temp)
 
C12func0[m1temp_, m1temp_, m3temp_] := 
   (-m1temp^2 + 5*m1temp*m3temp + 2*m3temp^2)/(12*(m1temp - m3temp)^3) - 
    (m1temp*m3temp^2*Log[m1temp])/(2*(m1temp - m3temp)^4) + 
    (m1temp*m3temp^2*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
C12func0[m1temp_, m2temp_, 0] := (6*m1temp - 6*m2temp)^(-1) - 
    (m1temp*Log[m1temp])/(6*(m1temp - m2temp)^2) + 
    (m1temp*Log[m2temp])/(6*(m1temp - m2temp)^2)
 
C12func0[m1temp_, m2temp_, m1temp_] := 
   (-m1temp^2 + 5*m1temp*m2temp + 2*m2temp^2)/(12*(m1temp - m2temp)^3) - 
    (m1temp*m2temp^2*Log[m1temp])/(2*(m1temp - m2temp)^4) + 
    (m1temp*m2temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
C12func0[m1temp_, m2temp_, m2temp_] := 
   (11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/(36*(m1temp - m2temp)^3) - 
    (m1temp^3*Log[m1temp])/(6*(m1temp - m2temp)^4) + 
    (m1temp^3*Log[m2temp])/(6*(m1temp - m2temp)^4)
 
C12func0[m1temp_, m2temp_, m3temp_] := 
   (-(m2temp*m3temp*(m2temp + m3temp)) + m1temp*(m2temp^2 + m3temp^2))/
     (6*(m1temp - m2temp)*(m1temp - m3temp)*(m2temp - m3temp)^2) - 
    (m1temp^3*Log[m1temp])/(6*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
    (m2temp^2*(m1temp*(m2temp - 3*m3temp) + 2*m2temp*m3temp)*Log[m2temp])/
     (6*(m1temp - m2temp)^2*(m2temp - m3temp)^3) + 
    (m3temp^2*(2*m2temp*m3temp + m1temp*(-3*m2temp + m3temp))*Log[m3temp])/
     (6*(m1temp - m3temp)^2*(-m2temp + m3temp)^3)
C22func0[0, 0, 0] := -1/(6*m3)
 
C22func0[0, 0, m3temp_] := -1/(6*m3temp)
 
C22func0[0, m2temp_, 0] := 1/(2*m2temp) - Log[m2temp]/(3*m2temp) + 
    Log[m3]/(3*m2temp)
 
C22func0[0, m2temp_, m2temp_] := -1/(9*m2temp)
 
C22func0[0, m2temp_, m3temp_] := 
   -(-3*m2temp + m3temp)/(6*(m2temp - m3temp)^2) + 
    (m2temp^2*Log[m2temp])/(3*(-m2temp + m3temp)^3) + 
    (m2temp^2*Log[m3temp])/(3*(m2temp - m3temp)^3)
 
C22func0[m1temp_, 0, 0] := 1/(2*m1temp) - Log[m1temp]/(3*m1temp) + 
    Log[m3]/(3*m1temp)
 
C22func0[m1temp_, 0, m1temp_] := -1/(9*m1temp)
 
C22func0[m1temp_, 0, m3temp_] := 
   -(-3*m1temp + m3temp)/(6*(m1temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(-m1temp + m3temp)^3) + 
    (m1temp^2*Log[m3temp])/(3*(m1temp - m3temp)^3)
 
C22func0[m1temp_, m1temp_, 0] := -1/(3*m1temp)
 
C22func0[m1temp_, m1temp_, m1temp_] := -1/(12*m1temp)
 
C22func0[m1temp_, m1temp_, m3temp_] := 
   (-2*m1temp^2 - 5*m1temp*m3temp + m3temp^2)/(6*(m1temp - m3temp)^3) + 
    (m1temp^2*m3temp*Log[m1temp])/(m1temp - m3temp)^4 - 
    (m1temp^2*m3temp*Log[m3temp])/(m1temp - m3temp)^4
 
C22func0[m1temp_, m2temp_, 0] := Log[m1temp]/(3*(-m1temp + m2temp)) + 
    Log[m2temp]/(3*m1temp - 3*m2temp)
 
C22func0[m1temp_, m2temp_, m1temp_] := 
   (-2*m1temp^2 + 7*m1temp*m2temp - 11*m2temp^2)/(18*(m1temp - m2temp)^3) + 
    (m2temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4) - 
    (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
C22func0[m1temp_, m2temp_, m2temp_] := 
   (11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/(18*(m1temp - m2temp)^3) - 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4) + 
    (m1temp^3*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
C22func0[m1temp_, m2temp_, m3temp_] := 
   (m3temp*(-5*m1temp*m2temp + 3*(m1temp + m2temp)*m3temp - m3temp^2))/
     (6*(m1temp - m3temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)*(-m1temp + m3temp)^3) + 
    (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)*(m2temp - m3temp)^3) + 
    ((m1temp^3/(m1temp - m3temp)^3 + m2temp^3/(-m2temp + m3temp)^3)*
      Log[m3temp])/(3*(m1temp - m2temp))
C0func1[0, 0, 0] := -m3^(-2) - Log[m2]/(2*m3^2) + Log[m3]/(2*m3^2)
 
C0func1[0, 0, m3temp_] := -m3temp^(-2) - Log[m2]/(2*m3temp^2) + 
    Log[m3temp]/(2*m3temp^2)
 
C0func1[0, m2temp_, 0] := -m2temp^(-2) + Log[m2temp]/(2*m2temp^2) - 
    Log[m3]/(2*m2temp^2)
 
C0func1[0, m2temp_, m2temp_] := 1/(12*m2temp^2)
 
C0func1[0, m2temp_, m3temp_] := -(m2temp - m3temp)^(-2) + 
    ((m2temp + m3temp)*Log[m2temp])/(2*(m2temp - m3temp)^3) - 
    ((m2temp + m3temp)*Log[m3temp])/(2*(m2temp - m3temp)^3)
 
C0func1[m1temp_, 0, 0] := (m1temp + m3)/(2*m1temp^2*m3) - 
    Log[m1temp]/(2*m1temp^2) + Log[m3]/(2*m1temp^2)
 
C0func1[m1temp_, 0, m1temp_] := 1/(4*m1temp^2)
 
C0func1[m1temp_, 0, m3temp_] := (2*m1temp*m3temp - 2*m3temp^2)^(-1) - 
    Log[m1temp]/(2*(m1temp - m3temp)^2) + Log[m3temp]/(2*(m1temp - m3temp)^2)
 
C0func1[m1temp_, m1temp_, 0] := 1/(4*m1temp^2)
 
C0func1[m1temp_, m1temp_, m1temp_] := 1/(24*m1temp^2)
 
C0func1[m1temp_, m1temp_, m3temp_] := 
   (m1temp + 5*m3temp)/(4*(m1temp - m3temp)^3) - 
    (m3temp*(2*m1temp + m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^4) + 
    (m3temp*(2*m1temp + m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
C0func1[m1temp_, m2temp_, 0] := (2*m1temp*m2temp - 2*m2temp^2)^(-1) - 
    Log[m1temp]/(2*(m1temp - m2temp)^2) + Log[m2temp]/(2*(m1temp - m2temp)^2)
 
C0func1[m1temp_, m2temp_, m1temp_] := 
   (m1temp + 5*m2temp)/(4*(m1temp - m2temp)^3) - 
    (m2temp*(2*m1temp + m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) + 
    (m2temp*(2*m1temp + m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
C0func1[m1temp_, m2temp_, m2temp_] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
     (12*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
C0func1[m1temp_, m2temp_, m3temp_] := 
   (-2*m2temp*m3temp + m1temp*(m2temp + m3temp))/(2*(m1temp - m2temp)*
      (m1temp - m3temp)*(m2temp - m3temp)^2) - (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
    (m2temp*(-2*m1temp*m3temp + m2temp*(m2temp + m3temp))*Log[m2temp])/
     (2*(m1temp - m2temp)^2*(m2temp - m3temp)^3) + 
    (m3temp*(-2*m1temp*m2temp + m3temp*(m2temp + m3temp))*Log[m3temp])/
     (2*(m1temp - m3temp)^2*(-m2temp + m3temp)^3)
C1func1[0, 0, 0] := 5/(6*m3^2) + Log[m2]/(3*m3^2) - Log[m3]/(3*m3^2)
 
C1func1[0, 0, m3temp_] := 5/(6*m3temp^2) + Log[m2]/(3*m3temp^2) - 
    Log[m3temp]/(3*m3temp^2)
 
C1func1[0, m2temp_, 0] := -1/(6*m2temp^2)
 
C1func1[0, m2temp_, m2temp_] := -1/(36*m2temp^2)
 
C1func1[0, m2temp_, m3temp_] := 
   -(m2temp + 5*m3temp)/(6*(m2temp - m3temp)^3) + 
    (m3temp*(2*m2temp + m3temp)*Log[m2temp])/(3*(m2temp - m3temp)^4) - 
    (m3temp*(2*m2temp + m3temp)*Log[m3temp])/(3*(m2temp - m3temp)^4)
 
C1func1[m1temp_, 0, 0] := -(m1temp + m3)/(3*m1temp^2*m3) + 
    Log[m1temp]/(3*m1temp^2) - Log[m3]/(3*m1temp^2)
 
C1func1[m1temp_, 0, m1temp_] := -1/(6*m1temp^2)
 
C1func1[m1temp_, 0, m3temp_] := -(3*m1temp*m3temp - 3*m3temp^2)^(-1) + 
    Log[m1temp]/(3*(m1temp - m3temp)^2) - Log[m3temp]/(3*(m1temp - m3temp)^2)
 
C1func1[m1temp_, m1temp_, 0] := -1/(18*m1temp^2)
 
C1func1[m1temp_, m1temp_, m1temp_] := -1/(60*m1temp^2)
 
C1func1[m1temp_, m1temp_, m3temp_] := 
   (-m1temp^2 + 8*m1temp*m3temp + 17*m3temp^2)/(18*(m1temp - m3temp)^4) + 
    (m3temp^2*(3*m1temp + m3temp)*Log[m1temp])/(3*(-m1temp + m3temp)^5) + 
    (m3temp^2*(3*m1temp + m3temp)*Log[m3temp])/(3*(m1temp - m3temp)^5)
 
C1func1[m1temp_, m2temp_, 0] := 
   -(m1temp + m2temp)/(6*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(3*(m1temp - m2temp)^3) + 
    (m1temp*Log[m2temp])/(3*(-m1temp + m2temp)^3)
 
C1func1[m1temp_, m2temp_, m1temp_] := 
   -(m1temp^2 + 10*m1temp*m2temp + m2temp^2)/(6*(m1temp - m2temp)^4) + 
    (m1temp*m2temp*(m1temp + m2temp)*Log[m1temp])/(m1temp - m2temp)^5 - 
    (m1temp*m2temp*(m1temp + m2temp)*Log[m2temp])/(m1temp - m2temp)^5
 
C1func1[m1temp_, m2temp_, m2temp_] := 
   -(3*m1temp^3 + 13*m1temp^2*m2temp - 5*m1temp*m2temp^2 + m2temp^3)/
     (36*(m1temp - m2temp)^4*m2temp) + (m1temp^3*Log[m1temp])/
     (3*(m1temp - m2temp)^5) + (m1temp^3*Log[m2temp])/(3*(-m1temp + m2temp)^5)
 
C1func1[m1temp_, m2temp_, m3temp_] := 
   (-(m1temp*m2temp^2*(m1temp + m2temp)) + 
      m2temp*(5*m1temp^2 - 2*m1temp*m2temp + m2temp^2)*m3temp + 
      (2*m1temp^2 - 9*m1temp*m2temp + 5*m2temp^2)*m3temp^2)/
     (6*(m1temp - m2temp)^2*(m1temp - m3temp)*(m2temp - m3temp)^3) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^3*(m1temp - m3temp)^2) - 
    (m2temp*(m1temp*m2temp^3 + 2*m2temp^2*(-2*m1temp + m2temp)*m3temp + 
       (3*m1temp^2 - 3*m1temp*m2temp + m2temp^2)*m3temp^2)*Log[m2temp])/
     (3*(m1temp - m2temp)^3*(m2temp - m3temp)^4) + 
    (m3temp^2*(3*m1temp*m2temp - m3temp*(2*m2temp + m3temp))*Log[m3temp])/
     (3*(m1temp - m3temp)^2*(m2temp - m3temp)^4)
C2func1[0, 0, 0] := -1/(6*m3^2)
 
C2func1[0, 0, m3temp_] := -1/(6*m3temp^2)
 
C2func1[0, m2temp_, 0] := 5/(6*m2temp^2) - Log[m2temp]/(3*m2temp^2) + 
    Log[m3]/(3*m2temp^2)
 
C2func1[0, m2temp_, m2temp_] := -1/(36*m2temp^2)
 
C2func1[0, m2temp_, m3temp_] := (5*m2temp + m3temp)/(6*(m2temp - m3temp)^3) - 
    (m2temp*(m2temp + 2*m3temp)*Log[m2temp])/(3*(m2temp - m3temp)^4) + 
    (m2temp*(m2temp + 2*m3temp)*Log[m3temp])/(3*(m2temp - m3temp)^4)
 
C2func1[m1temp_, 0, 0] := -(m1temp + 3*m3)/(6*m1temp^2*m3) + 
    Log[m1temp]/(3*m1temp^2) - Log[m3]/(3*m1temp^2)
 
C2func1[m1temp_, 0, m1temp_] := -1/(18*m1temp^2)
 
C2func1[m1temp_, 0, m3temp_] := 
   -(m1temp + m3temp)/(6*(m1temp - m3temp)^2*m3temp) + 
    (m1temp*Log[m1temp])/(3*(m1temp - m3temp)^3) + 
    (m1temp*Log[m3temp])/(3*(-m1temp + m3temp)^3)
 
C2func1[m1temp_, m1temp_, 0] := -1/(6*m1temp^2)
 
C2func1[m1temp_, m1temp_, m1temp_] := -1/(60*m1temp^2)
 
C2func1[m1temp_, m1temp_, m3temp_] := 
   -(m1temp^2 + 10*m1temp*m3temp + m3temp^2)/(6*(m1temp - m3temp)^4) + 
    (m1temp*m3temp*(m1temp + m3temp)*Log[m1temp])/(m1temp - m3temp)^5 - 
    (m1temp*m3temp*(m1temp + m3temp)*Log[m3temp])/(m1temp - m3temp)^5
 
C2func1[m1temp_, m2temp_, 0] := -(3*m1temp*m2temp - 3*m2temp^2)^(-1) + 
    Log[m1temp]/(3*(m1temp - m2temp)^2) - Log[m2temp]/(3*(m1temp - m2temp)^2)
 
C2func1[m1temp_, m2temp_, m1temp_] := 
   (-m1temp^2 + 8*m1temp*m2temp + 17*m2temp^2)/(18*(m1temp - m2temp)^4) + 
    (m2temp^2*(3*m1temp + m2temp)*Log[m1temp])/(3*(-m1temp + m2temp)^5) + 
    (m2temp^2*(3*m1temp + m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^5)
 
C2func1[m1temp_, m2temp_, m2temp_] := 
   -(3*m1temp^3 + 13*m1temp^2*m2temp - 5*m1temp*m2temp^2 + m2temp^3)/
     (36*(m1temp - m2temp)^4*m2temp) + (m1temp^3*Log[m1temp])/
     (3*(m1temp - m2temp)^5) + (m1temp^3*Log[m2temp])/(3*(-m1temp + m2temp)^5)
 
C2func1[m1temp_, m2temp_, m3temp_] := 
   (-(m2temp*m3temp^2*(5*m2temp + m3temp)) + 
      m1temp^2*(-2*m2temp^2 - 5*m2temp*m3temp + m3temp^2) + 
      m1temp*m3temp*(9*m2temp^2 + 2*m2temp*m3temp + m3temp^2))/
     (6*(m1temp - m2temp)*(m1temp - m3temp)^2*(m2temp - m3temp)^3) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^2*(m1temp - m3temp)^3) - 
    (m2temp^2*(m2temp^2 - 3*m1temp*m3temp + 2*m2temp*m3temp)*Log[m2temp])/
     (3*(m1temp - m2temp)^2*(m2temp - m3temp)^4) - 
    (m3temp*(3*m1temp^2*m2temp^2 + m2temp*m3temp^2*(m2temp + 2*m3temp) + 
       m1temp*m3temp*(-3*m2temp^2 - 4*m2temp*m3temp + m3temp^2))*Log[m3temp])/
     (3*(m1temp - m3temp)^3*(m2temp - m3temp)^4)
C00func1[0, 0, 0] := -1/(12*m3)
 
C00func1[0, 0, m3temp_] := -1/(12*m3temp)
 
C00func1[0, m2temp_, 0] := -1/(12*m2temp)
 
C00func1[0, m2temp_, m2temp_] := -1/(36*m2temp)
 
C00func1[0, m2temp_, m3temp_] := 
   -(m2temp + m3temp)/(12*(m2temp - m3temp)^2) + (m2temp*m3temp*Log[m2temp])/
     (6*(m2temp - m3temp)^3) - (m2temp*m3temp*Log[m3temp])/
     (6*(m2temp - m3temp)^3)
 
C00func1[m1temp_, 0, 0] := 1/(12*m1temp) - Log[m1temp]/(12*m1temp) + 
    Log[m3]/(12*m1temp)
 
C00func1[m1temp_, 0, m1temp_] := -1/(24*m1temp)
 
C00func1[m1temp_, 0, m3temp_] := (12*m1temp - 12*m3temp)^(-1) - 
    (m1temp*Log[m1temp])/(12*(m1temp - m3temp)^2) + 
    (m1temp*Log[m3temp])/(12*(m1temp - m3temp)^2)
 
C00func1[m1temp_, m1temp_, 0] := -1/(24*m1temp)
 
C00func1[m1temp_, m1temp_, m1temp_] := -1/(48*m1temp)
 
C00func1[m1temp_, m1temp_, m3temp_] := 
   (-m1temp^2 + 5*m1temp*m3temp + 2*m3temp^2)/(24*(m1temp - m3temp)^3) - 
    (m1temp*m3temp^2*Log[m1temp])/(4*(m1temp - m3temp)^4) + 
    (m1temp*m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)^4)
 
C00func1[m1temp_, m2temp_, 0] := (12*m1temp - 12*m2temp)^(-1) - 
    (m1temp*Log[m1temp])/(12*(m1temp - m2temp)^2) + 
    (m1temp*Log[m2temp])/(12*(m1temp - m2temp)^2)
 
C00func1[m1temp_, m2temp_, m1temp_] := 
   (-m1temp^2 + 5*m1temp*m2temp + 2*m2temp^2)/(24*(m1temp - m2temp)^3) - 
    (m1temp*m2temp^2*Log[m1temp])/(4*(m1temp - m2temp)^4) + 
    (m1temp*m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)^4)
 
C00func1[m1temp_, m2temp_, m2temp_] := 
   (11*m1temp^2 - 7*m1temp*m2temp + 2*m2temp^2)/(72*(m1temp - m2temp)^3) - 
    (m1temp^3*Log[m1temp])/(12*(m1temp - m2temp)^4) + 
    (m1temp^3*Log[m2temp])/(12*(m1temp - m2temp)^4)
 
C00func1[m1temp_, m2temp_, m3temp_] := 
   (-(m2temp*m3temp*(m2temp + m3temp)) + m1temp*(m2temp^2 + m3temp^2))/
     (12*(m1temp - m2temp)*(m1temp - m3temp)*(m2temp - m3temp)^2) - 
    (m1temp^3*Log[m1temp])/(12*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
    (m2temp^2*(m1temp*(m2temp - 3*m3temp) + 2*m2temp*m3temp)*Log[m2temp])/
     (12*(m1temp - m2temp)^2*(m2temp - m3temp)^3) + 
    (m3temp^2*(2*m2temp*m3temp + m1temp*(-3*m2temp + m3temp))*Log[m3temp])/
     (12*(m1temp - m3temp)^2*(-m2temp + m3temp)^3)
C11func1[0, 0, 0] := -17/(24*m3^2) - Log[m2]/(4*m3^2) + Log[m3]/(4*m3^2)
 
C11func1[0, 0, m3temp_] := -17/(24*m3temp^2) - Log[m2]/(4*m3temp^2) + 
    Log[m3temp]/(4*m3temp^2)
 
C11func1[0, m2temp_, 0] := 1/(24*m2temp^2)
 
C11func1[0, m2temp_, m2temp_] := 1/(80*m2temp^2)
 
C11func1[0, m2temp_, m3temp_] := (m2temp^2 - 8*m2temp*m3temp - 17*m3temp^2)/
     (24*(m2temp - m3temp)^4) + (m3temp^2*(3*m2temp + m3temp)*Log[m2temp])/
     (4*(m2temp - m3temp)^5) + (m3temp^2*(3*m2temp + m3temp)*Log[m3temp])/
     (4*(-m2temp + m3temp)^5)
 
C11func1[m1temp_, 0, 0] := (m1temp + m3)/(4*m1temp^2*m3) - 
    Log[m1temp]/(4*m1temp^2) + Log[m3]/(4*m1temp^2)
 
C11func1[m1temp_, 0, m1temp_] := 1/(8*m1temp^2)
 
C11func1[m1temp_, 0, m3temp_] := (4*m1temp*m3temp - 4*m3temp^2)^(-1) - 
    Log[m1temp]/(4*(m1temp - m3temp)^2) + Log[m3temp]/(4*(m1temp - m3temp)^2)
 
C11func1[m1temp_, m1temp_, 0] := 1/(48*m1temp^2)
 
C11func1[m1temp_, m1temp_, m1temp_] := 1/(120*m1temp^2)
 
C11func1[m1temp_, m1temp_, m3temp_] := 
   ((m1temp + m3temp)*(m1temp^2 - 8*m1temp*m3temp + 37*m3temp^2))/
     (48*(m1temp - m3temp)^5) - (m3temp^3*(4*m1temp + m3temp)*Log[m1temp])/
     (4*(m1temp - m3temp)^6) + (m3temp^3*(4*m1temp + m3temp)*Log[m3temp])/
     (4*(m1temp - m3temp)^6)
 
C11func1[m1temp_, m2temp_, 0] := (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
     (24*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
     (4*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/(4*(m1temp - m2temp)^4)
 
C11func1[m1temp_, m2temp_, m1temp_] := 
   (3*m1temp^3 + 47*m1temp^2*m2temp + 11*m1temp*m2temp^2 - m2temp^3)/
     (24*(m1temp - m2temp)^5) - (m1temp^2*m2temp*(2*m1temp + 3*m2temp)*
      Log[m1temp])/(2*(m1temp - m2temp)^6) + 
    (m1temp^2*m2temp*(2*m1temp + 3*m2temp)*Log[m2temp])/
     (2*(m1temp - m2temp)^6)
 
C11func1[m1temp_, m2temp_, m2temp_] := 
   (12*m1temp^4 + 77*m1temp^3*m2temp - 43*m1temp^2*m2temp^2 + 
      17*m1temp*m2temp^3 - 3*m2temp^4)/(240*(m1temp - m2temp)^5*m2temp) - 
    (m1temp^4*Log[m1temp])/(4*(m1temp - m2temp)^6) + 
    (m1temp^4*Log[m2temp])/(4*(m1temp - m2temp)^6)
 
C11func1[m1temp_, m2temp_, m3temp_] := 
   (m2temp^3*m3temp*(m2temp^2 - 8*m2temp*m3temp - 17*m3temp^2) - 
      m1temp*m2temp^2*(m2temp - 7*m3temp)*(m2temp^2 + 4*m2temp*m3temp + 
        7*m3temp^2) + m1temp^2*m2temp*(m2temp - 4*m3temp)*
       (5*m2temp^2 + 8*m2temp*m3temp + 11*m3temp^2) + 
      2*m1temp^3*(m2temp^3 - 5*m2temp^2*m3temp + 13*m2temp*m3temp^2 + 
        3*m3temp^3))/(24*(m1temp - m2temp)^3*(m1temp - m3temp)*
      (m2temp - m3temp)^4) - (m1temp^4*Log[m1temp])/
     (4*(m1temp - m2temp)^4*(m1temp - m3temp)^2) + 
    (m2temp*(-4*m1temp^3*m3temp^3 + m2temp^3*m3temp^2*(3*m2temp + m3temp) + 
       2*m1temp*m2temp^2*m3temp*(m2temp^2 - 5*m2temp*m3temp - 2*m3temp^2) + 
       m1temp^2*m2temp*(m2temp^3 - 5*m2temp^2*m3temp + 10*m2temp*m3temp^2 + 
         6*m3temp^3))*Log[m2temp])/(4*(m1temp - m2temp)^4*
      (m2temp - m3temp)^5) + 
    (m3temp^3*(-4*m1temp*m2temp + m3temp*(3*m2temp + m3temp))*Log[m3temp])/
     (4*(m1temp - m3temp)^2*(-m2temp + m3temp)^5)
C12func1[0, 0, 0] := (-25*m2^2 - 3*m2*m3 + m3^2)/(12*m2^2*m3^5) - 
    Log[m2]/m3^5 + Log[m3]/m3^5
 
C12func1[0, 0, m3temp_] := (-25*m2^2 - 3*m2*m3temp + m3temp^2)/
     (12*m2^2*m3temp^5) - Log[m2]/m3temp^5 + Log[m3temp]/m3temp^5
 
C12func1[0, m2temp_, 0] := (m2temp^2 - 3*m2temp*m3 - 25*m3^2)/
     (12*m2temp^5*m3^2) + Log[m2temp]/m2temp^5 - Log[m3]/m2temp^5
 
C12func1[0, m2temp_, m2temp_] := 1/(30*m2temp^5)
 
C12func1[0, m2temp_, m3temp_] := 
   ((m2temp + m3temp)*(m2temp^2 - 8*m2temp*m3temp + m3temp^2))/
     (12*m2temp^2*(m2temp - m3temp)^4*m3temp^2) + 
    Log[m2temp]/(m2temp - m3temp)^5 + Log[m3temp]/(-m2temp + m3temp)^5
 
C12func1[m1temp_, 0, 0] := (6*m1temp^3*m2*m3 + m1temp^2*m2*m3^2 - 
      m1temp*m2*m3^3 - 3*m2*m3^4 + m1temp^4*(14*m2 + m3))/
     (12*m1temp^5*m2*m3^4) + Log[m1temp]/(6*m1temp^5) + 
    ((3*m1temp + m3)*Log[m2])/(6*m1temp^2*m3^4) - 
    ((3*m1temp^4 + m1temp^3*m3 + m3^4)*Log[m3])/(6*m1temp^5*m3^4)
 
C12func1[m1temp_, 0, m1temp_] := (3*m1temp + 62*m2)/(36*m1temp^5*m2) - 
    (2*Log[m1temp])/(3*m1temp^5) + (2*Log[m2])/(3*m1temp^5)
 
C12func1[m1temp_, 0, m3temp_] := 
   (3*m2*m3temp^3 + m1temp*m3temp^2*(3*m2 + m3temp) - 
      2*m1temp^2*m3temp*(11*m2 + m3temp) + m1temp^3*(14*m2 + m3temp))/
     (12*m1temp^2*m2*(m1temp - m3temp)^2*m3temp^4) + 
    Log[m1temp]/(6*m1temp^2*(m1temp - m3temp)^3) + 
    ((3*m1temp + m3temp)*Log[m2])/(6*m1temp^2*m3temp^4) + 
    ((3*m1temp^2 - 8*m1temp*m3temp + 6*m3temp^2)*Log[m3temp])/
     (6*m3temp^4*(-m1temp + m3temp)^3)
 
C12func1[m1temp_, m1temp_, 0] := (3*m1temp + 62*m3)/(36*m1temp^5*m3) - 
    (2*Log[m1temp])/(3*m1temp^5) + (2*Log[m3])/(3*m1temp^5)
 
C12func1[m1temp_, m1temp_, m1temp_] := 1/(180*m1temp^5)
 
C12func1[m1temp_, m1temp_, m3temp_] := 
   (3*m1temp^3 + 47*m1temp^2*m3temp + 11*m1temp*m3temp^2 - m3temp^3)/
     (36*m1temp^2*(m1temp - m3temp)^5*m3temp) - 
    ((2*m1temp + 3*m3temp)*Log[m1temp])/(3*(m1temp - m3temp)^6) + 
    ((2*m1temp + 3*m3temp)*Log[m3temp])/(3*(m1temp - m3temp)^6)
 
C12func1[m1temp_, m2temp_, 0] := 
   (3*m2temp^3*m3 + m1temp*m2temp^2*(m2temp + 3*m3) - 
      2*m1temp^2*m2temp*(m2temp + 11*m3) + m1temp^3*(m2temp + 14*m3))/
     (12*m1temp^2*(m1temp - m2temp)^2*m2temp^4*m3) + 
    Log[m1temp]/(6*m1temp^2*(m1temp - m2temp)^3) + 
    ((3*m1temp^2 - 8*m1temp*m2temp + 6*m2temp^2)*Log[m2temp])/
     (6*m2temp^4*(-m1temp + m2temp)^3) + ((3*m1temp + m2temp)*Log[m3])/
     (6*m1temp^2*m2temp^4)
 
C12func1[m1temp_, m2temp_, m1temp_] := 
   (3*m1temp^3 + 47*m1temp^2*m2temp + 11*m1temp*m2temp^2 - m2temp^3)/
     (36*m1temp^2*(m1temp - m2temp)^5*m2temp) - 
    ((2*m1temp + 3*m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^6) + 
    ((2*m1temp + 3*m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^6)
 
C12func1[m1temp_, m2temp_, m2temp_] := 
   (-3*m1temp^4 + 17*m1temp^3*m2temp - 43*m1temp^2*m2temp^2 + 
      77*m1temp*m2temp^3 + 12*m2temp^4)/(360*m2temp^4*(-m1temp + m2temp)^5) + 
    (m1temp*Log[m1temp])/(6*(m1temp - m2temp)^6) - 
    (m1temp*Log[m2temp])/(6*(m1temp - m2temp)^6)
 
C12func1[m1temp_, m2temp_, m3temp_] := 
   (m2temp*m3temp*(m2temp + m3temp)*(m2temp^2 - 8*m2temp*m3temp + m3temp^2) - 
      2*m1temp^2*(m2temp + m3temp)*(m2temp^2 + 7*m2temp*m3temp + m3temp^2) + 
      m1temp^3*(m2temp^2 + 10*m2temp*m3temp + m3temp^2) + 
      m1temp*(m2temp^4 + 3*m2temp^3*m3temp + 28*m2temp^2*m3temp^2 + 
        3*m2temp*m3temp^3 + m3temp^4))/(12*(m1temp - m2temp)^2*m2temp*
      (m1temp - m3temp)^2*(m2temp - m3temp)^4*m3temp) + 
    (m1temp*Log[m1temp])/(6*(m1temp - m2temp)^3*(m1temp - m3temp)^3) - 
    ((6*m2temp^3 + 3*m1temp^2*(m2temp + m3temp) + 
       m1temp*(-8*m2temp^2 - 5*m2temp*m3temp + m3temp^2))*Log[m2temp])/
     (6*(m1temp - m2temp)^3*(m2temp - m3temp)^5) + 
    ((6*m3temp^3 + 3*m1temp^2*(m2temp + m3temp) + 
       m1temp*(m2temp^2 - 5*m2temp*m3temp - 8*m3temp^2))*Log[m3temp])/
     (6*(m1temp - m3temp)^3*(m2temp - m3temp)^5)
C22func1[0, 0, 0] := 1/(24*m3^2)
 
C22func1[0, 0, m3temp_] := 1/(24*m3temp^2)
 
C22func1[0, m2temp_, 0] := -17/(24*m2temp^2) + Log[m2temp]/(4*m2temp^2) - 
    Log[m3]/(4*m2temp^2)
 
C22func1[0, m2temp_, m2temp_] := 1/(80*m2temp^2)
 
C22func1[0, m2temp_, m3temp_] := (-17*m2temp^2 - 8*m2temp*m3temp + m3temp^2)/
     (24*(m2temp - m3temp)^4) + (m2temp^2*(m2temp + 3*m3temp)*Log[m2temp])/
     (4*(m2temp - m3temp)^5) - (m2temp^2*(m2temp + 3*m3temp)*Log[m3temp])/
     (4*(m2temp - m3temp)^5)
 
C22func1[m1temp_, 0, 0] := (2*m1temp + 11*m3)/(24*m1temp^2*m3) - 
    Log[m1temp]/(4*m1temp^2) + Log[m3]/(4*m1temp^2)
 
C22func1[m1temp_, 0, m1temp_] := 1/(48*m1temp^2)
 
C22func1[m1temp_, 0, m3temp_] := (-2*m1temp^2 - 5*m1temp*m3temp + m3temp^2)/
     (24*m3temp*(-m1temp + m3temp)^3) - (m1temp^2*Log[m1temp])/
     (4*(m1temp - m3temp)^4) + (m1temp^2*Log[m3temp])/(4*(m1temp - m3temp)^4)
 
C22func1[m1temp_, m1temp_, 0] := 1/(8*m1temp^2)
 
C22func1[m1temp_, m1temp_, m1temp_] := 1/(120*m1temp^2)
 
C22func1[m1temp_, m1temp_, m3temp_] := 
   (3*m1temp^3 + 47*m1temp^2*m3temp + 11*m1temp*m3temp^2 - m3temp^3)/
     (24*(m1temp - m3temp)^5) - (m1temp^2*m3temp*(2*m1temp + 3*m3temp)*
      Log[m1temp])/(2*(m1temp - m3temp)^6) + 
    (m1temp^2*m3temp*(2*m1temp + 3*m3temp)*Log[m3temp])/
     (2*(m1temp - m3temp)^6)
 
C22func1[m1temp_, m2temp_, 0] := (4*m1temp*m2temp - 4*m2temp^2)^(-1) - 
    Log[m1temp]/(4*(m1temp - m2temp)^2) + Log[m2temp]/(4*(m1temp - m2temp)^2)
 
C22func1[m1temp_, m2temp_, m1temp_] := 
   ((m1temp + m2temp)*(m1temp^2 - 8*m1temp*m2temp + 37*m2temp^2))/
     (48*(m1temp - m2temp)^5) - (m2temp^3*(4*m1temp + m2temp)*Log[m1temp])/
     (4*(m1temp - m2temp)^6) + (m2temp^3*(4*m1temp + m2temp)*Log[m2temp])/
     (4*(m1temp - m2temp)^6)
 
C22func1[m1temp_, m2temp_, m2temp_] := 
   (12*m1temp^4 + 77*m1temp^3*m2temp - 43*m1temp^2*m2temp^2 + 
      17*m1temp*m2temp^3 - 3*m2temp^4)/(240*(m1temp - m2temp)^5*m2temp) - 
    (m1temp^4*Log[m1temp])/(4*(m1temp - m2temp)^6) + 
    (m1temp^4*Log[m2temp])/(4*(m1temp - m2temp)^6)
 
C22func1[m1temp_, m2temp_, m3temp_] := 
   (m2temp*m3temp^3*(-17*m2temp^2 - 8*m2temp*m3temp + m3temp^2) + 
      m1temp*(7*m2temp - m3temp)*m3temp^2*(7*m2temp^2 + 4*m2temp*m3temp + 
        m3temp^2) - m1temp^2*(4*m2temp - m3temp)*m3temp*
       (11*m2temp^2 + 8*m2temp*m3temp + 5*m3temp^2) + 
      2*m1temp^3*(3*m2temp^3 + 13*m2temp^2*m3temp - 5*m2temp*m3temp^2 + 
        m3temp^3))/(24*(m1temp - m2temp)*(m1temp - m3temp)^3*
      (m2temp - m3temp)^4) - (m1temp^4*Log[m1temp])/
     (4*(m1temp - m2temp)^2*(m1temp - m3temp)^4) + 
    (m2temp^3*(m2temp^2 - 4*m1temp*m3temp + 3*m2temp*m3temp)*Log[m2temp])/
     (4*(m1temp - m2temp)^2*(m2temp - m3temp)^5) + 
    ((m1temp^4/(m1temp - m3temp)^4 + (4*m1temp*m2temp^3*m3temp)/
        (m2temp - m3temp)^5 - (m2temp^4*(m2temp + 3*m3temp))/
        (m2temp - m3temp)^5)*Log[m3temp])/(4*(m1temp - m2temp)^2)
D0func[0, 0, 0, 0] := -(Log[m2]/(m3*m4)) + ((m3 + m4)*Log[m3])/(m3*m4^2) - 
    Log[m4]/m4^2
 
D0func[0, 0, 0, m4temp_] := -(Log[m2]/(m3*m4temp)) + 
    ((m3 + m4temp)*Log[m3])/(m3*m4temp^2) - Log[m4temp]/m4temp^2
 
D0func[0, 0, m3temp_, 0] := -(Log[m2]/(m3temp*m4)) - Log[m3temp]/m3temp^2 + 
    ((m3temp + m4)*Log[m4])/(m3temp^2*m4)
 
D0func[0, 0, m3temp_, m3temp_] := -m3temp^(-2) - Log[m2]/m3temp^2 + 
    Log[m3temp]/m3temp^2
 
D0func[0, 0, m3temp_, m4temp_] := -(Log[m2]/(m3temp*m4temp)) + 
    Log[m3temp]/(m3temp*(-m3temp + m4temp)) + 
    Log[m4temp]/(m3temp*m4temp - m4temp^2)
 
D0func[0, m2temp_, 0, 0] := -(Log[m2temp]/m2temp^2) - Log[m3]/(m2temp*m4) + 
    ((m2temp + m4)*Log[m4])/(m2temp^2*m4)
 
D0func[0, m2temp_, 0, m2temp_] := -m2temp^(-2) + Log[m2temp]/m2temp^2 - 
    Log[m3]/m2temp^2
 
D0func[0, m2temp_, 0, m4temp_] := Log[m2temp]/(m2temp*(-m2temp + m4temp)) - 
    Log[m3]/(m2temp*m4temp) + Log[m4temp]/(m2temp*m4temp - m4temp^2)
 
D0func[0, m2temp_, m2temp_, 0] := -m2temp^(-2) + Log[m2temp]/m2temp^2 - 
    Log[m4]/m2temp^2
 
D0func[0, m2temp_, m2temp_, m2temp_] := 1/(2*m2temp^2)
 
D0func[0, m2temp_, m2temp_, m4temp_] := 1/(m2temp*(-m2temp + m4temp)) + 
    Log[m2temp]/(m2temp - m4temp)^2 - Log[m4temp]/(m2temp - m4temp)^2
 
D0func[0, m2temp_, m3temp_, 0] := Log[m2temp]/(m2temp*(-m2temp + m3temp)) + 
    Log[m3temp]/(m2temp*m3temp - m3temp^2) - Log[m4]/(m2temp*m3temp)
 
D0func[0, m2temp_, m3temp_, m2temp_] := 1/(m2temp*(-m2temp + m3temp)) + 
    Log[m2temp]/(m2temp - m3temp)^2 - Log[m3temp]/(m2temp - m3temp)^2
 
D0func[0, m2temp_, m3temp_, m3temp_] := (m2temp*m3temp - m3temp^2)^(-1) - 
    Log[m2temp]/(m2temp - m3temp)^2 + Log[m3temp]/(m2temp - m3temp)^2
 
D0func[0, m2temp_, m3temp_, m4temp_] := 
   Log[m2temp]/((-m2temp + m3temp)*(m2temp - m4temp)) + 
    Log[m3temp]/((m2temp - m3temp)*(m3temp - m4temp)) + 
    Log[m4temp]/((m2temp - m4temp)*(-m3temp + m4temp))
 
D0func[m1temp_, 0, 0, 0] := -(Log[m1temp]/m1temp^2) - Log[m3]/(m1temp*m4) + 
    ((m1temp + m4)*Log[m4])/(m1temp^2*m4)
 
D0func[m1temp_, 0, 0, m1temp_] := -m1temp^(-2) + Log[m1temp]/m1temp^2 - 
    Log[m3]/m1temp^2
 
D0func[m1temp_, 0, 0, m4temp_] := Log[m1temp]/(m1temp*(-m1temp + m4temp)) - 
    Log[m3]/(m1temp*m4temp) + Log[m4temp]/(m1temp*m4temp - m4temp^2)
 
D0func[m1temp_, 0, m1temp_, 0] := -m1temp^(-2) + Log[m1temp]/m1temp^2 - 
    Log[m4]/m1temp^2
 
D0func[m1temp_, 0, m1temp_, m1temp_] := 1/(2*m1temp^2)
 
D0func[m1temp_, 0, m1temp_, m4temp_] := 1/(m1temp*(-m1temp + m4temp)) + 
    Log[m1temp]/(m1temp - m4temp)^2 - Log[m4temp]/(m1temp - m4temp)^2
 
D0func[m1temp_, 0, m3temp_, 0] := Log[m1temp]/(m1temp*(-m1temp + m3temp)) + 
    Log[m3temp]/(m1temp*m3temp - m3temp^2) - Log[m4]/(m1temp*m3temp)
 
D0func[m1temp_, 0, m3temp_, m1temp_] := 1/(m1temp*(-m1temp + m3temp)) + 
    Log[m1temp]/(m1temp - m3temp)^2 - Log[m3temp]/(m1temp - m3temp)^2
 
D0func[m1temp_, 0, m3temp_, m3temp_] := (m1temp*m3temp - m3temp^2)^(-1) - 
    Log[m1temp]/(m1temp - m3temp)^2 + Log[m3temp]/(m1temp - m3temp)^2
 
D0func[m1temp_, 0, m3temp_, m4temp_] := 
   Log[m1temp]/((-m1temp + m3temp)*(m1temp - m4temp)) + 
    Log[m3temp]/((m1temp - m3temp)*(m3temp - m4temp)) + 
    Log[m4temp]/((m1temp - m4temp)*(-m3temp + m4temp))
 
D0func[m1temp_, m1temp_, 0, 0] := -m1temp^(-2) + Log[m1temp]/m1temp^2 - 
    Log[m4]/m1temp^2
 
D0func[m1temp_, m1temp_, 0, m1temp_] := 1/(2*m1temp^2)
 
D0func[m1temp_, m1temp_, 0, m4temp_] := 1/(m1temp*(-m1temp + m4temp)) + 
    Log[m1temp]/(m1temp - m4temp)^2 - Log[m4temp]/(m1temp - m4temp)^2
 
D0func[m1temp_, m1temp_, m1temp_, 0] := 1/(2*m1temp^2)
 
D0func[m1temp_, m1temp_, m1temp_, m1temp_] := 1/(6*m1temp^2)
 
D0func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   (m1temp + m4temp)/(2*m1temp*(m1temp - m4temp)^2) + 
    (m4temp*Log[m1temp])/(-m1temp + m4temp)^3 + (m4temp*Log[m4temp])/
     (m1temp - m4temp)^3
 
D0func[m1temp_, m1temp_, m3temp_, 0] := 1/(m1temp*(-m1temp + m3temp)) + 
    Log[m1temp]/(m1temp - m3temp)^2 - Log[m3temp]/(m1temp - m3temp)^2
 
D0func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   (m1temp + m3temp)/(2*m1temp*(m1temp - m3temp)^2) + 
    (m3temp*Log[m1temp])/(-m1temp + m3temp)^3 + (m3temp*Log[m3temp])/
     (m1temp - m3temp)^3
 
D0func[m1temp_, m1temp_, m3temp_, m3temp_] := -2/(m1temp - m3temp)^2 + 
    ((m1temp + m3temp)*Log[m1temp])/(m1temp - m3temp)^3 - 
    ((m1temp + m3temp)*Log[m3temp])/(m1temp - m3temp)^3
 
D0func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   1/((-m1temp + m3temp)*(m1temp - m4temp)) + 
    ((m1temp^2 - m3temp*m4temp)*Log[m1temp])/((m1temp - m3temp)^2*
      (m1temp - m4temp)^2) + (m3temp*Log[m3temp])/((m1temp - m3temp)^2*
      (-m3temp + m4temp)) - (m4temp*Log[m4temp])/((m1temp - m4temp)^2*
      (-m3temp + m4temp))
 
D0func[m1temp_, m2temp_, 0, 0] := Log[m1temp]/(m1temp*(-m1temp + m2temp)) + 
    Log[m2temp]/(m1temp*m2temp - m2temp^2) - Log[m4]/(m1temp*m2temp)
 
D0func[m1temp_, m2temp_, 0, m1temp_] := 1/(m1temp*(-m1temp + m2temp)) + 
    Log[m1temp]/(m1temp - m2temp)^2 - Log[m2temp]/(m1temp - m2temp)^2
 
D0func[m1temp_, m2temp_, 0, m2temp_] := (m1temp*m2temp - m2temp^2)^(-1) - 
    Log[m1temp]/(m1temp - m2temp)^2 + Log[m2temp]/(m1temp - m2temp)^2
 
D0func[m1temp_, m2temp_, 0, m4temp_] := 
   Log[m1temp]/((-m1temp + m2temp)*(m1temp - m4temp)) + 
    Log[m2temp]/((m1temp - m2temp)*(m2temp - m4temp)) + 
    Log[m4temp]/((m1temp - m4temp)*(-m2temp + m4temp))
 
D0func[m1temp_, m2temp_, m1temp_, 0] := 1/(m1temp*(-m1temp + m2temp)) + 
    Log[m1temp]/(m1temp - m2temp)^2 - Log[m2temp]/(m1temp - m2temp)^2
 
D0func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   (m1temp + m2temp)/(2*m1temp*(m1temp - m2temp)^2) + 
    (m2temp*Log[m1temp])/(-m1temp + m2temp)^3 + (m2temp*Log[m2temp])/
     (m1temp - m2temp)^3
 
D0func[m1temp_, m2temp_, m1temp_, m2temp_] := -2/(m1temp - m2temp)^2 + 
    ((m1temp + m2temp)*Log[m1temp])/(m1temp - m2temp)^3 - 
    ((m1temp + m2temp)*Log[m2temp])/(m1temp - m2temp)^3
 
D0func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   1/((-m1temp + m2temp)*(m1temp - m4temp)) + 
    ((m1temp^2 - m2temp*m4temp)*Log[m1temp])/((m1temp - m2temp)^2*
      (m1temp - m4temp)^2) + (m2temp*Log[m2temp])/((m1temp - m2temp)^2*
      (-m2temp + m4temp)) - (m4temp*Log[m4temp])/((m1temp - m4temp)^2*
      (-m2temp + m4temp))
 
D0func[m1temp_, m2temp_, m2temp_, 0] := (m1temp*m2temp - m2temp^2)^(-1) - 
    Log[m1temp]/(m1temp - m2temp)^2 + Log[m2temp]/(m1temp - m2temp)^2
 
D0func[m1temp_, m2temp_, m2temp_, m1temp_] := -2/(m1temp - m2temp)^2 + 
    ((m1temp + m2temp)*Log[m1temp])/(m1temp - m2temp)^3 - 
    ((m1temp + m2temp)*Log[m2temp])/(m1temp - m2temp)^3
 
D0func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   (m1temp + m2temp)/(2*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(-m1temp + m2temp)^3 + (m1temp*Log[m2temp])/
     (m1temp - m2temp)^3
 
D0func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   1/((m1temp - m2temp)*(m2temp - m4temp)) + (m1temp*Log[m1temp])/
     ((m1temp - m2temp)^2*(-m1temp + m4temp)) + 
    ((m2temp^2 - m1temp*m4temp)*Log[m2temp])/((m1temp - m2temp)^2*
      (m2temp - m4temp)^2) + (m4temp*Log[m4temp])/((m1temp - m4temp)*
      (m2temp - m4temp)^2)
 
D0func[m1temp_, m2temp_, m3temp_, 0] := 
   Log[m1temp]/((-m1temp + m2temp)*(m1temp - m3temp)) + 
    Log[m2temp]/((m1temp - m2temp)*(m2temp - m3temp)) + 
    Log[m3temp]/((m1temp - m3temp)*(-m2temp + m3temp))
 
D0func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   1/((-m1temp + m2temp)*(m1temp - m3temp)) + 
    ((m1temp^2 - m2temp*m3temp)*Log[m1temp])/((m1temp - m2temp)^2*
      (m1temp - m3temp)^2) + (m2temp*Log[m2temp])/((m1temp - m2temp)^2*
      (-m2temp + m3temp)) - (m3temp*Log[m3temp])/((m1temp - m3temp)^2*
      (-m2temp + m3temp))
 
D0func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   1/((m1temp - m2temp)*(m2temp - m3temp)) + (m1temp*Log[m1temp])/
     ((m1temp - m2temp)^2*(-m1temp + m3temp)) + 
    ((m2temp^2 - m1temp*m3temp)*Log[m2temp])/((m1temp - m2temp)^2*
      (m2temp - m3temp)^2) + (m3temp*Log[m3temp])/((m1temp - m3temp)*
      (m2temp - m3temp)^2)
 
D0func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   1/((m1temp - m3temp)*(-m2temp + m3temp)) - (m1temp*Log[m1temp])/
     ((m1temp - m2temp)*(m1temp - m3temp)^2) + (m2temp*Log[m2temp])/
     ((m1temp - m2temp)*(m2temp - m3temp)^2) + 
    ((-(m1temp*m2temp) + m3temp^2)*Log[m3temp])/((m1temp - m3temp)^2*
      (m2temp - m3temp)^2)
 
D0func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   (m1temp*Log[m1temp])/((m1temp - m2temp)*(m1temp - m3temp)*
      (-m1temp + m4temp)) + (m2temp*Log[m2temp])/((m1temp - m2temp)*
      (m2temp - m3temp)*(m2temp - m4temp)) + (m3temp*Log[m3temp])/
     ((m1temp - m3temp)*(-m2temp + m3temp)*(m3temp - m4temp)) + 
    (m4temp*Log[m4temp])/((m1temp - m4temp)*(-m2temp + m4temp)*
      (-m3temp + m4temp))
D1func[0, 0, 0, 0] := 1/(2*m3*m4) + Log[m2]/(2*m3*m4) - 
    ((m3 + m4)*Log[m3])/(2*m3*m4^2) + Log[m4]/(2*m4^2)
 
D1func[0, 0, 0, m4temp_] := 1/(2*m3*m4temp) + Log[m2]/(2*m3*m4temp) - 
    ((m3 + m4temp)*Log[m3])/(2*m3*m4temp^2) + Log[m4temp]/(2*m4temp^2)
 
D1func[0, 0, m3temp_, 0] := 1/(2*m3temp*m4) + Log[m2]/(2*m3temp*m4) + 
    Log[m3temp]/(2*m3temp^2) - ((m3temp + m4)*Log[m4])/(2*m3temp^2*m4)
 
D1func[0, 0, m3temp_, m3temp_] := m3temp^(-2) + Log[m2]/(2*m3temp^2) - 
    Log[m3temp]/(2*m3temp^2)
 
D1func[0, 0, m3temp_, m4temp_] := 1/(2*m3temp*m4temp) + 
    Log[m2]/(2*m3temp*m4temp) + Log[m3temp]/(2*m3temp^2 - 2*m3temp*m4temp) - 
    Log[m4temp]/(2*m3temp*m4temp - 2*m4temp^2)
 
D1func[0, m2temp_, 0, 0] := 1/(2*m2temp^2) - Log[m2temp]/(2*m2temp^2) + 
    Log[m4]/(2*m2temp^2)
 
D1func[0, m2temp_, 0, m2temp_] := -1/(4*m2temp^2)
 
D1func[0, m2temp_, 0, m4temp_] := (2*m2temp^2 - 2*m2temp*m4temp)^(-1) - 
    Log[m2temp]/(2*(m2temp - m4temp)^2) + Log[m4temp]/(2*(m2temp - m4temp)^2)
 
D1func[0, m2temp_, m2temp_, 0] := -1/(4*m2temp^2)
 
D1func[0, m2temp_, m2temp_, m2temp_] := -1/(12*m2temp^2)
 
D1func[0, m2temp_, m2temp_, m4temp_] := 
   -(m2temp + m4temp)/(4*m2temp*(m2temp - m4temp)^2) + 
    (m4temp*Log[m2temp])/(2*(m2temp - m4temp)^3) + 
    (m4temp*Log[m4temp])/(2*(-m2temp + m4temp)^3)
 
D1func[0, m2temp_, m3temp_, 0] := (2*m2temp^2 - 2*m2temp*m3temp)^(-1) - 
    Log[m2temp]/(2*(m2temp - m3temp)^2) + Log[m3temp]/(2*(m2temp - m3temp)^2)
 
D1func[0, m2temp_, m3temp_, m2temp_] := 
   -(m2temp + m3temp)/(4*m2temp*(m2temp - m3temp)^2) + 
    (m3temp*Log[m2temp])/(2*(m2temp - m3temp)^3) + 
    (m3temp*Log[m3temp])/(2*(-m2temp + m3temp)^3)
 
D1func[0, m2temp_, m3temp_, m3temp_] := (m2temp - m3temp)^(-2) - 
    ((m2temp + m3temp)*Log[m2temp])/(2*(m2temp - m3temp)^3) + 
    ((m2temp + m3temp)*Log[m3temp])/(2*(m2temp - m3temp)^3)
 
D1func[0, m2temp_, m3temp_, m4temp_] := 
   1/(2*(m2temp - m3temp)*(m2temp - m4temp)) + 
    ((-m2temp^2 + m3temp*m4temp)*Log[m2temp])/(2*(m2temp - m3temp)^2*
      (m2temp - m4temp)^2) + (m3temp*Log[m3temp])/(2*(m2temp - m3temp)^2*
      (m3temp - m4temp)) + (m4temp*Log[m4temp])/(2*(m2temp - m4temp)^2*
      (-m3temp + m4temp))
 
D1func[m1temp_, 0, 0, 0] := Log[m1temp]/(2*m1temp^2) + 
    Log[m3]/(2*m1temp*m4) - ((m1temp + m4)*Log[m4])/(2*m1temp^2*m4)
 
D1func[m1temp_, 0, 0, m1temp_] := 1/(2*m1temp^2) - Log[m1temp]/(2*m1temp^2) + 
    Log[m3]/(2*m1temp^2)
 
D1func[m1temp_, 0, 0, m4temp_] := 
   Log[m1temp]/(2*m1temp^2 - 2*m1temp*m4temp) + Log[m3]/(2*m1temp*m4temp) - 
    Log[m4temp]/(2*m1temp*m4temp - 2*m4temp^2)
 
D1func[m1temp_, 0, m1temp_, 0] := 1/(2*m1temp^2) - Log[m1temp]/(2*m1temp^2) + 
    Log[m4]/(2*m1temp^2)
 
D1func[m1temp_, 0, m1temp_, m1temp_] := -1/(4*m1temp^2)
 
D1func[m1temp_, 0, m1temp_, m4temp_] := (2*m1temp^2 - 2*m1temp*m4temp)^(-1) - 
    Log[m1temp]/(2*(m1temp - m4temp)^2) + Log[m4temp]/(2*(m1temp - m4temp)^2)
 
D1func[m1temp_, 0, m3temp_, 0] := 
   Log[m1temp]/(2*m1temp^2 - 2*m1temp*m3temp) - 
    Log[m3temp]/(2*m1temp*m3temp - 2*m3temp^2) + Log[m4]/(2*m1temp*m3temp)
 
D1func[m1temp_, 0, m3temp_, m1temp_] := (2*m1temp^2 - 2*m1temp*m3temp)^(-1) - 
    Log[m1temp]/(2*(m1temp - m3temp)^2) + Log[m3temp]/(2*(m1temp - m3temp)^2)
 
D1func[m1temp_, 0, m3temp_, m3temp_] := 
   -(2*m1temp*m3temp - 2*m3temp^2)^(-1) + 
    Log[m1temp]/(2*(m1temp - m3temp)^2) - Log[m3temp]/(2*(m1temp - m3temp)^2)
 
D1func[m1temp_, 0, m3temp_, m4temp_] := 
   Log[m1temp]/(2*(m1temp - m3temp)*(m1temp - m4temp)) + 
    Log[m3temp]/(2*(m1temp - m3temp)*(-m3temp + m4temp)) + 
    Log[m4temp]/(2*(m1temp - m4temp)*(m3temp - m4temp))
 
D1func[m1temp_, m1temp_, 0, 0] := -1/(4*m1temp^2)
 
D1func[m1temp_, m1temp_, 0, m1temp_] := -1/(12*m1temp^2)
 
D1func[m1temp_, m1temp_, 0, m4temp_] := 
   -(m1temp + m4temp)/(4*m1temp*(m1temp - m4temp)^2) + 
    (m4temp*Log[m1temp])/(2*(m1temp - m4temp)^3) + 
    (m4temp*Log[m4temp])/(2*(-m1temp + m4temp)^3)
 
D1func[m1temp_, m1temp_, m1temp_, 0] := -1/(12*m1temp^2)
 
D1func[m1temp_, m1temp_, m1temp_, m1temp_] := -1/(24*m1temp^2)
 
D1func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   (-m1temp^2 + 5*m1temp*m4temp + 2*m4temp^2)/
     (12*m1temp*(m1temp - m4temp)^3) - (m4temp^2*Log[m1temp])/
     (2*(m1temp - m4temp)^4) + (m4temp^2*Log[m4temp])/(2*(m1temp - m4temp)^4)
 
D1func[m1temp_, m1temp_, m3temp_, 0] := 
   -(m1temp + m3temp)/(4*m1temp*(m1temp - m3temp)^2) + 
    (m3temp*Log[m1temp])/(2*(m1temp - m3temp)^3) + 
    (m3temp*Log[m3temp])/(2*(-m1temp + m3temp)^3)
 
D1func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   (-m1temp^2 + 5*m1temp*m3temp + 2*m3temp^2)/
     (12*m1temp*(m1temp - m3temp)^3) - (m3temp^2*Log[m1temp])/
     (2*(m1temp - m3temp)^4) + (m3temp^2*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
D1func[m1temp_, m1temp_, m3temp_, m3temp_] := 
   -(m1temp + 5*m3temp)/(4*(m1temp - m3temp)^3) + 
    (m3temp*(2*m1temp + m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^4) - 
    (m3temp*(2*m1temp + m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
D1func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   -(m1temp^2 - 3*m3temp*m4temp + m1temp*(m3temp + m4temp))/
     (4*(m1temp - m3temp)^2*(m1temp - m4temp)^2) + 
    ((-3*m1temp^2*m3temp*m4temp + m3temp^2*m4temp^2 + 
       m1temp^3*(m3temp + m4temp))*Log[m1temp])/(2*(m1temp - m3temp)^3*
      (m1temp - m4temp)^3) + (m3temp^2*Log[m3temp])/
     (2*(-m1temp + m3temp)^3*(m3temp - m4temp)) + (m4temp^2*Log[m4temp])/
     (2*(m1temp - m4temp)^3*(m3temp - m4temp))
 
D1func[m1temp_, m2temp_, 0, 0] := -(2*m1temp*m2temp - 2*m2temp^2)^(-1) + 
    Log[m1temp]/(2*(m1temp - m2temp)^2) - Log[m2temp]/(2*(m1temp - m2temp)^2)
 
D1func[m1temp_, m2temp_, 0, m1temp_] := (m1temp - m2temp)^(-2) - 
    ((m1temp + m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    ((m1temp + m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^3)
 
D1func[m1temp_, m2temp_, 0, m2temp_] := 
   -(m1temp + m2temp)/(4*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    (m1temp*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
D1func[m1temp_, m2temp_, 0, m4temp_] := 
   1/(2*(m1temp - m2temp)*(-m2temp + m4temp)) + (m1temp*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m4temp)) + 
    ((-m2temp^2 + m1temp*m4temp)*Log[m2temp])/(2*(m1temp - m2temp)^2*
      (m2temp - m4temp)^2) + (m4temp*Log[m4temp])/(2*(m2temp - m4temp)^2*
      (-m1temp + m4temp))
 
D1func[m1temp_, m2temp_, m1temp_, 0] := (m1temp - m2temp)^(-2) - 
    ((m1temp + m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    ((m1temp + m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^3)
 
D1func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   -(m1temp + 5*m2temp)/(4*(m1temp - m2temp)^3) + 
    (m2temp*(2*m1temp + m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) - 
    (m2temp*(2*m1temp + m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D1func[m1temp_, m2temp_, m1temp_, m2temp_] := 
   (5*m1temp + m2temp)/(4*(m1temp - m2temp)^3) - 
    (m1temp*(m1temp + 2*m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) + 
    (m1temp*(m1temp + 2*m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D1func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   (2*m1temp*m2temp - (m1temp + m2temp)*m4temp)/(2*(m1temp - m2temp)^2*
      (m1temp - m4temp)*(m2temp - m4temp)) + 
    (m1temp*(-(m1temp*(m1temp + m2temp)) + 2*m2temp*m4temp)*Log[m1temp])/
     (2*(m1temp - m2temp)^3*(m1temp - m4temp)^2) + 
    (m2temp*(m2temp*(m1temp + m2temp) - 2*m1temp*m4temp)*Log[m2temp])/
     (2*(m1temp - m2temp)^3*(m2temp - m4temp)^2) + 
    (m4temp^2*Log[m4temp])/(2*(m1temp - m4temp)^2*(m2temp - m4temp)^2)
 
D1func[m1temp_, m2temp_, m2temp_, 0] := 
   -(m1temp + m2temp)/(4*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    (m1temp*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
D1func[m1temp_, m2temp_, m2temp_, m1temp_] := 
   (5*m1temp + m2temp)/(4*(m1temp - m2temp)^3) - 
    (m1temp*(m1temp + 2*m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) + 
    (m1temp*(m1temp + 2*m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D1func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/(12*(m1temp - m2temp)^3*
      m2temp) + (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^4) - 
    (m1temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D1func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   -(m1temp*(m2temp - 3*m4temp) + m2temp*(m2temp + m4temp))/
     (4*(m1temp - m2temp)^2*(m2temp - m4temp)^2) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^3*(m1temp - m4temp)) - 
    ((m1temp*m2temp^2*(m2temp - 3*m4temp) + m2temp^3*m4temp + 
       m1temp^2*m4temp^2)*Log[m2temp])/(2*(m1temp - m2temp)^3*
      (m2temp - m4temp)^3) + (m4temp^2*Log[m4temp])/
     (2*(m1temp - m4temp)*(m2temp - m4temp)^3)
 
D1func[m1temp_, m2temp_, m3temp_, 0] := 
   1/(2*(m1temp - m2temp)*(-m2temp + m3temp)) + (m1temp*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m3temp)) + 
    ((-m2temp^2 + m1temp*m3temp)*Log[m2temp])/(2*(m1temp - m2temp)^2*
      (m2temp - m3temp)^2) + (m3temp*Log[m3temp])/(2*(m2temp - m3temp)^2*
      (-m1temp + m3temp))
 
D1func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   (2*m1temp*m2temp - (m1temp + m2temp)*m3temp)/(2*(m1temp - m2temp)^2*
      (m1temp - m3temp)*(m2temp - m3temp)) + 
    (m1temp*(-(m1temp*(m1temp + m2temp)) + 2*m2temp*m3temp)*Log[m1temp])/
     (2*(m1temp - m2temp)^3*(m1temp - m3temp)^2) + 
    (m2temp*(m2temp*(m1temp + m2temp) - 2*m1temp*m3temp)*Log[m2temp])/
     (2*(m1temp - m2temp)^3*(m2temp - m3temp)^2) + 
    (m3temp^2*Log[m3temp])/(2*(m1temp - m3temp)^2*(m2temp - m3temp)^2)
 
D1func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   -(m1temp*(m2temp - 3*m3temp) + m2temp*(m2temp + m3temp))/
     (4*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^3*(m1temp - m3temp)) - 
    ((m1temp*m2temp^2*(m2temp - 3*m3temp) + m2temp^3*m3temp + 
       m1temp^2*m3temp^2)*Log[m2temp])/(2*(m1temp - m2temp)^3*
      (m2temp - m3temp)^3) + (m3temp^2*Log[m3temp])/
     (2*(m1temp - m3temp)*(m2temp - m3temp)^3)
 
D1func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   -(-2*m2temp*m3temp + m1temp*(m2temp + m3temp))/(2*(m1temp - m2temp)*
      (m1temp - m3temp)*(m2temp - m3temp)^2) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m3temp)^2) - 
    (m2temp*(-2*m1temp*m3temp + m2temp*(m2temp + m3temp))*Log[m2temp])/
     (2*(m1temp - m2temp)^2*(m2temp - m3temp)^3) - 
    (m3temp*(-2*m1temp*m2temp + m3temp*(m2temp + m3temp))*Log[m3temp])/
     (2*(m1temp - m3temp)^2*(-m2temp + m3temp)^3)
 
D1func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   m2temp/(2*(-m1temp + m2temp)*(m2temp - m3temp)*(m2temp - m4temp)) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^2*(m1temp - m3temp)*
      (m1temp - m4temp)) - (m2temp*(m2temp^3 + 2*m1temp*m3temp*m4temp - 
       m2temp*(m3temp*m4temp + m1temp*(m3temp + m4temp)))*Log[m2temp])/
     (2*(m1temp - m2temp)^2*(m2temp - m3temp)^2*(m2temp - m4temp)^2) + 
    (m3temp^2*Log[m3temp])/(2*(m2temp - m3temp)^2*(-m1temp + m3temp)*
      (m3temp - m4temp)) + (m4temp^2*Log[m4temp])/(2*(m2temp - m4temp)^2*
      (-m1temp + m4temp)*(-m3temp + m4temp))
D2func[0, 0, 0, 0] := -(m3 + m4)/(2*m3*m4^2) - Log[m3]/(2*m4^2) + 
    Log[m4]/(2*m4^2)
 
D2func[0, 0, 0, m4temp_] := -(m3 + m4temp)/(2*m3*m4temp^2) - 
    Log[m3]/(2*m4temp^2) + Log[m4temp]/(2*m4temp^2)
 
D2func[0, 0, m3temp_, 0] := 1/(2*m3temp^2) - Log[m3temp]/(2*m3temp^2) + 
    Log[m4]/(2*m3temp^2)
 
D2func[0, 0, m3temp_, m3temp_] := -1/(4*m3temp^2)
 
D2func[0, 0, m3temp_, m4temp_] := (2*m3temp^2 - 2*m3temp*m4temp)^(-1) - 
    Log[m3temp]/(2*(m3temp - m4temp)^2) + Log[m4temp]/(2*(m3temp - m4temp)^2)
 
D2func[0, m2temp_, 0, 0] := 1/(2*m2temp*m4) + Log[m2temp]/(2*m2temp^2) + 
    Log[m3]/(2*m2temp*m4) - ((m2temp + m4)*Log[m4])/(2*m2temp^2*m4)
 
D2func[0, m2temp_, 0, m2temp_] := m2temp^(-2) - Log[m2temp]/(2*m2temp^2) + 
    Log[m3]/(2*m2temp^2)
 
D2func[0, m2temp_, 0, m4temp_] := 1/(2*m2temp*m4temp) + 
    Log[m2temp]/(2*m2temp^2 - 2*m2temp*m4temp) + Log[m3]/(2*m2temp*m4temp) - 
    Log[m4temp]/(2*m2temp*m4temp - 2*m4temp^2)
 
D2func[0, m2temp_, m2temp_, 0] := -1/(4*m2temp^2)
 
D2func[0, m2temp_, m2temp_, m2temp_] := -1/(12*m2temp^2)
 
D2func[0, m2temp_, m2temp_, m4temp_] := 
   -(m2temp + m4temp)/(4*m2temp*(m2temp - m4temp)^2) + 
    (m4temp*Log[m2temp])/(2*(m2temp - m4temp)^3) + 
    (m4temp*Log[m4temp])/(2*(-m2temp + m4temp)^3)
 
D2func[0, m2temp_, m3temp_, 0] := -(2*m2temp*m3temp - 2*m3temp^2)^(-1) + 
    Log[m2temp]/(2*(m2temp - m3temp)^2) - Log[m3temp]/(2*(m2temp - m3temp)^2)
 
D2func[0, m2temp_, m3temp_, m2temp_] := (m2temp - m3temp)^(-2) - 
    ((m2temp + m3temp)*Log[m2temp])/(2*(m2temp - m3temp)^3) + 
    ((m2temp + m3temp)*Log[m3temp])/(2*(m2temp - m3temp)^3)
 
D2func[0, m2temp_, m3temp_, m3temp_] := 
   -(m2temp + m3temp)/(4*(m2temp - m3temp)^2*m3temp) + 
    (m2temp*Log[m2temp])/(2*(m2temp - m3temp)^3) + 
    (m2temp*Log[m3temp])/(2*(-m2temp + m3temp)^3)
 
D2func[0, m2temp_, m3temp_, m4temp_] := 
   1/(2*(m2temp - m3temp)*(-m3temp + m4temp)) + (m2temp*Log[m2temp])/
     (2*(m2temp - m3temp)^2*(m2temp - m4temp)) + 
    ((-m3temp^2 + m2temp*m4temp)*Log[m3temp])/(2*(m2temp - m3temp)^2*
      (m3temp - m4temp)^2) + (m4temp*Log[m4temp])/(2*(m3temp - m4temp)^2*
      (-m2temp + m4temp))
 
D2func[m1temp_, 0, 0, 0] := 1/(2*m1temp*m4) + Log[m1temp]/(2*m1temp^2) + 
    Log[m3]/(2*m1temp*m4) - ((m1temp + m4)*Log[m4])/(2*m1temp^2*m4)
 
D2func[m1temp_, 0, 0, m1temp_] := m1temp^(-2) - Log[m1temp]/(2*m1temp^2) + 
    Log[m3]/(2*m1temp^2)
 
D2func[m1temp_, 0, 0, m4temp_] := 1/(2*m1temp*m4temp) + 
    Log[m1temp]/(2*m1temp^2 - 2*m1temp*m4temp) + Log[m3]/(2*m1temp*m4temp) - 
    Log[m4temp]/(2*m1temp*m4temp - 2*m4temp^2)
 
D2func[m1temp_, 0, m1temp_, 0] := -1/(4*m1temp^2)
 
D2func[m1temp_, 0, m1temp_, m1temp_] := -1/(12*m1temp^2)
 
D2func[m1temp_, 0, m1temp_, m4temp_] := 
   -(m1temp + m4temp)/(4*m1temp*(m1temp - m4temp)^2) + 
    (m4temp*Log[m1temp])/(2*(m1temp - m4temp)^3) + 
    (m4temp*Log[m4temp])/(2*(-m1temp + m4temp)^3)
 
D2func[m1temp_, 0, m3temp_, 0] := -(2*m1temp*m3temp - 2*m3temp^2)^(-1) + 
    Log[m1temp]/(2*(m1temp - m3temp)^2) - Log[m3temp]/(2*(m1temp - m3temp)^2)
 
D2func[m1temp_, 0, m3temp_, m1temp_] := (m1temp - m3temp)^(-2) - 
    ((m1temp + m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^3) + 
    ((m1temp + m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^3)
 
D2func[m1temp_, 0, m3temp_, m3temp_] := 
   -(m1temp + m3temp)/(4*(m1temp - m3temp)^2*m3temp) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m3temp)^3) + 
    (m1temp*Log[m3temp])/(2*(-m1temp + m3temp)^3)
 
D2func[m1temp_, 0, m3temp_, m4temp_] := 
   1/(2*(m1temp - m3temp)*(-m3temp + m4temp)) + (m1temp*Log[m1temp])/
     (2*(m1temp - m3temp)^2*(m1temp - m4temp)) + 
    ((-m3temp^2 + m1temp*m4temp)*Log[m3temp])/(2*(m1temp - m3temp)^2*
      (m3temp - m4temp)^2) + (m4temp*Log[m4temp])/(2*(m3temp - m4temp)^2*
      (-m1temp + m4temp))
 
D2func[m1temp_, m1temp_, 0, 0] := 1/(2*m1temp^2) - Log[m1temp]/(2*m1temp^2) + 
    Log[m4]/(2*m1temp^2)
 
D2func[m1temp_, m1temp_, 0, m1temp_] := -1/(4*m1temp^2)
 
D2func[m1temp_, m1temp_, 0, m4temp_] := (2*m1temp^2 - 2*m1temp*m4temp)^(-1) - 
    Log[m1temp]/(2*(m1temp - m4temp)^2) + Log[m4temp]/(2*(m1temp - m4temp)^2)
 
D2func[m1temp_, m1temp_, m1temp_, 0] := -1/(12*m1temp^2)
 
D2func[m1temp_, m1temp_, m1temp_, m1temp_] := -1/(24*m1temp^2)
 
D2func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   (-m1temp^2 + 5*m1temp*m4temp + 2*m4temp^2)/
     (12*m1temp*(m1temp - m4temp)^3) - (m4temp^2*Log[m1temp])/
     (2*(m1temp - m4temp)^4) + (m4temp^2*Log[m4temp])/(2*(m1temp - m4temp)^4)
 
D2func[m1temp_, m1temp_, m3temp_, 0] := (m1temp - m3temp)^(-2) - 
    ((m1temp + m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^3) + 
    ((m1temp + m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^3)
 
D2func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   -(m1temp + 5*m3temp)/(4*(m1temp - m3temp)^3) + 
    (m3temp*(2*m1temp + m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^4) - 
    (m3temp*(2*m1temp + m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
D2func[m1temp_, m1temp_, m3temp_, m3temp_] := 
   (5*m1temp + m3temp)/(4*(m1temp - m3temp)^3) - 
    (m1temp*(m1temp + 2*m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^4) + 
    (m1temp*(m1temp + 2*m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
D2func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   (2*m1temp*m3temp - (m1temp + m3temp)*m4temp)/(2*(m1temp - m3temp)^2*
      (m1temp - m4temp)*(m3temp - m4temp)) + 
    (m1temp*(-(m1temp*(m1temp + m3temp)) + 2*m3temp*m4temp)*Log[m1temp])/
     (2*(m1temp - m3temp)^3*(m1temp - m4temp)^2) + 
    (m3temp*(m3temp*(m1temp + m3temp) - 2*m1temp*m4temp)*Log[m3temp])/
     (2*(m1temp - m3temp)^3*(m3temp - m4temp)^2) + 
    (m4temp^2*Log[m4temp])/(2*(m1temp - m4temp)^2*(m3temp - m4temp)^2)
 
D2func[m1temp_, m2temp_, 0, 0] := 
   Log[m1temp]/(2*m1temp^2 - 2*m1temp*m2temp) - 
    Log[m2temp]/(2*m1temp*m2temp - 2*m2temp^2) + Log[m4]/(2*m1temp*m2temp)
 
D2func[m1temp_, m2temp_, 0, m1temp_] := (2*m1temp^2 - 2*m1temp*m2temp)^(-1) - 
    Log[m1temp]/(2*(m1temp - m2temp)^2) + Log[m2temp]/(2*(m1temp - m2temp)^2)
 
D2func[m1temp_, m2temp_, 0, m2temp_] := 
   -(2*m1temp*m2temp - 2*m2temp^2)^(-1) + 
    Log[m1temp]/(2*(m1temp - m2temp)^2) - Log[m2temp]/(2*(m1temp - m2temp)^2)
 
D2func[m1temp_, m2temp_, 0, m4temp_] := 
   Log[m1temp]/(2*(m1temp - m2temp)*(m1temp - m4temp)) + 
    Log[m2temp]/(2*(m1temp - m2temp)*(-m2temp + m4temp)) + 
    Log[m4temp]/(2*(m1temp - m4temp)*(m2temp - m4temp))
 
D2func[m1temp_, m2temp_, m1temp_, 0] := 
   -(m1temp + m2temp)/(4*m1temp*(m1temp - m2temp)^2) + 
    (m2temp*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    (m2temp*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
D2func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   (-m1temp^2 + 5*m1temp*m2temp + 2*m2temp^2)/
     (12*m1temp*(m1temp - m2temp)^3) - (m2temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^4) + (m2temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D2func[m1temp_, m2temp_, m1temp_, m2temp_] := 
   -(m1temp + 5*m2temp)/(4*(m1temp - m2temp)^3) + 
    (m2temp*(2*m1temp + m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) - 
    (m2temp*(2*m1temp + m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D2func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   -(m1temp^2 - 3*m2temp*m4temp + m1temp*(m2temp + m4temp))/
     (4*(m1temp - m2temp)^2*(m1temp - m4temp)^2) + 
    ((-3*m1temp^2*m2temp*m4temp + m2temp^2*m4temp^2 + 
       m1temp^3*(m2temp + m4temp))*Log[m1temp])/(2*(m1temp - m2temp)^3*
      (m1temp - m4temp)^3) + (m2temp^2*Log[m2temp])/
     (2*(-m1temp + m2temp)^3*(m2temp - m4temp)) + (m4temp^2*Log[m4temp])/
     (2*(m1temp - m4temp)^3*(m2temp - m4temp))
 
D2func[m1temp_, m2temp_, m2temp_, 0] := 
   -(m1temp + m2temp)/(4*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    (m1temp*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
D2func[m1temp_, m2temp_, m2temp_, m1temp_] := 
   (5*m1temp + m2temp)/(4*(m1temp - m2temp)^3) - 
    (m1temp*(m1temp + 2*m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) + 
    (m1temp*(m1temp + 2*m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D2func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/(12*(m1temp - m2temp)^3*
      m2temp) + (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^4) - 
    (m1temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D2func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   -(m1temp*(m2temp - 3*m4temp) + m2temp*(m2temp + m4temp))/
     (4*(m1temp - m2temp)^2*(m2temp - m4temp)^2) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^3*(m1temp - m4temp)) - 
    ((m1temp*m2temp^2*(m2temp - 3*m4temp) + m2temp^3*m4temp + 
       m1temp^2*m4temp^2)*Log[m2temp])/(2*(m1temp - m2temp)^3*
      (m2temp - m4temp)^3) + (m4temp^2*Log[m4temp])/
     (2*(m1temp - m4temp)*(m2temp - m4temp)^3)
 
D2func[m1temp_, m2temp_, m3temp_, 0] := 
   1/(2*(m1temp - m3temp)*(m2temp - m3temp)) + (m1temp*Log[m1temp])/
     (2*(m1temp - m2temp)*(m1temp - m3temp)^2) + (m2temp*Log[m2temp])/
     (2*(-m1temp + m2temp)*(m2temp - m3temp)^2) + 
    ((m1temp*m2temp - m3temp^2)*Log[m3temp])/(2*(m1temp - m3temp)^2*
      (m2temp - m3temp)^2)
 
D2func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   (m1temp*(m2temp - 2*m3temp) + m2temp*m3temp)/(2*(m1temp - m2temp)*
      (m1temp - m3temp)^2*(m2temp - m3temp)) - 
    (m1temp*(m1temp^2 + m1temp*m3temp - 2*m2temp*m3temp)*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m3temp)^3) + 
    (m2temp^2*Log[m2temp])/(2*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m3temp*(m3temp^2 + m1temp*(-2*m2temp + m3temp))*Log[m3temp])/
     (2*(m1temp - m3temp)^3*(m2temp - m3temp)^2)
 
D2func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   -(-2*m2temp*m3temp + m1temp*(m2temp + m3temp))/(2*(m1temp - m2temp)*
      (m1temp - m3temp)*(m2temp - m3temp)^2) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m3temp)^2) - 
    (m2temp*(-2*m1temp*m3temp + m2temp*(m2temp + m3temp))*Log[m2temp])/
     (2*(m1temp - m2temp)^2*(m2temp - m3temp)^3) - 
    (m3temp*(-2*m1temp*m2temp + m3temp*(m2temp + m3temp))*Log[m3temp])/
     (2*(m1temp - m3temp)^2*(-m2temp + m3temp)^3)
 
D2func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   -(m1temp*(-3*m2temp + m3temp) + m3temp*(m2temp + m3temp))/
     (4*(m1temp - m3temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)*(m1temp - m3temp)^3) + 
    (m2temp^2*Log[m2temp])/(2*(-m1temp + m2temp)*(m2temp - m3temp)^3) + 
    ((m1temp^2*m2temp^2 - 3*m1temp*m2temp*m3temp^2 + (m1temp + m2temp)*
        m3temp^3)*Log[m3temp])/(2*(m1temp - m3temp)^3*(m2temp - m3temp)^3)
 
D2func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   m3temp/(2*(-m1temp + m3temp)*(-m2temp + m3temp)*(m3temp - m4temp)) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)*(m1temp - m3temp)^2*
      (m1temp - m4temp)) + (m2temp^2*Log[m2temp])/(2*(-m1temp + m2temp)*
      (m2temp - m3temp)^2*(m2temp - m4temp)) + 
    (m3temp*(-m3temp^3 + m2temp*m3temp*m4temp + 
       m1temp*(m2temp*(m3temp - 2*m4temp) + m3temp*m4temp))*Log[m3temp])/
     (2*(m1temp - m3temp)^2*(m2temp - m3temp)^2*(m3temp - m4temp)^2) + 
    (m4temp^2*Log[m4temp])/(2*(m3temp - m4temp)^2*(-m1temp + m4temp)*
      (-m2temp + m4temp))
D3func[0, 0, 0, 0] := 1/(2*m4^2) + Log[m3]/(2*m4^2) - Log[m4]/(2*m4^2)
 
D3func[0, 0, 0, m4temp_] := 1/(2*m4temp^2) + Log[m3]/(2*m4temp^2) - 
    Log[m4temp]/(2*m4temp^2)
 
D3func[0, 0, m3temp_, 0] := -(m3temp + m4)/(2*m3temp^2*m4) + 
    Log[m3temp]/(2*m3temp^2) - Log[m4]/(2*m3temp^2)
 
D3func[0, 0, m3temp_, m3temp_] := -1/(4*m3temp^2)
 
D3func[0, 0, m3temp_, m4temp_] := -(2*m3temp*m4temp - 2*m4temp^2)^(-1) + 
    Log[m3temp]/(2*(m3temp - m4temp)^2) - Log[m4temp]/(2*(m3temp - m4temp)^2)
 
D3func[0, m2temp_, 0, 0] := -(m2temp + m4)/(2*m2temp^2*m4) + 
    Log[m2temp]/(2*m2temp^2) - Log[m4]/(2*m2temp^2)
 
D3func[0, m2temp_, 0, m2temp_] := -1/(4*m2temp^2)
 
D3func[0, m2temp_, 0, m4temp_] := -(2*m2temp*m4temp - 2*m4temp^2)^(-1) + 
    Log[m2temp]/(2*(m2temp - m4temp)^2) - Log[m4temp]/(2*(m2temp - m4temp)^2)
 
D3func[0, m2temp_, m2temp_, 0] := m2temp^(-2) - Log[m2temp]/(2*m2temp^2) + 
    Log[m4]/(2*m2temp^2)
 
D3func[0, m2temp_, m2temp_, m2temp_] := -1/(12*m2temp^2)
 
D3func[0, m2temp_, m2temp_, m4temp_] := (m2temp - m4temp)^(-2) - 
    ((m2temp + m4temp)*Log[m2temp])/(2*(m2temp - m4temp)^3) + 
    ((m2temp + m4temp)*Log[m4temp])/(2*(m2temp - m4temp)^3)
 
D3func[0, m2temp_, m3temp_, 0] := 1/(2*m2temp*m3temp) + 
    Log[m2temp]/(2*m2temp^2 - 2*m2temp*m3temp) - 
    Log[m3temp]/(2*m2temp*m3temp - 2*m3temp^2) + Log[m4]/(2*m2temp*m3temp)
 
D3func[0, m2temp_, m3temp_, m2temp_] := 
   -(m2temp + m3temp)/(4*m2temp*(m2temp - m3temp)^2) + 
    (m3temp*Log[m2temp])/(2*(m2temp - m3temp)^3) + 
    (m3temp*Log[m3temp])/(2*(-m2temp + m3temp)^3)
 
D3func[0, m2temp_, m3temp_, m3temp_] := 
   -(m2temp + m3temp)/(4*(m2temp - m3temp)^2*m3temp) + 
    (m2temp*Log[m2temp])/(2*(m2temp - m3temp)^3) + 
    (m2temp*Log[m3temp])/(2*(-m2temp + m3temp)^3)
 
D3func[0, m2temp_, m3temp_, m4temp_] := 
   1/(2*(m2temp - m4temp)*(m3temp - m4temp)) + (m2temp*Log[m2temp])/
     (2*(m2temp - m3temp)*(m2temp - m4temp)^2) + (m3temp*Log[m3temp])/
     (2*(-m2temp + m3temp)*(m3temp - m4temp)^2) + 
    ((m2temp*m3temp - m4temp^2)*Log[m4temp])/(2*(m2temp - m4temp)^2*
      (m3temp - m4temp)^2)
 
D3func[m1temp_, 0, 0, 0] := -(m1temp + m4)/(2*m1temp^2*m4) + 
    Log[m1temp]/(2*m1temp^2) - Log[m4]/(2*m1temp^2)
 
D3func[m1temp_, 0, 0, m1temp_] := -1/(4*m1temp^2)
 
D3func[m1temp_, 0, 0, m4temp_] := -(2*m1temp*m4temp - 2*m4temp^2)^(-1) + 
    Log[m1temp]/(2*(m1temp - m4temp)^2) - Log[m4temp]/(2*(m1temp - m4temp)^2)
 
D3func[m1temp_, 0, m1temp_, 0] := m1temp^(-2) - Log[m1temp]/(2*m1temp^2) + 
    Log[m4]/(2*m1temp^2)
 
D3func[m1temp_, 0, m1temp_, m1temp_] := -1/(12*m1temp^2)
 
D3func[m1temp_, 0, m1temp_, m4temp_] := (m1temp - m4temp)^(-2) - 
    ((m1temp + m4temp)*Log[m1temp])/(2*(m1temp - m4temp)^3) + 
    ((m1temp + m4temp)*Log[m4temp])/(2*(m1temp - m4temp)^3)
 
D3func[m1temp_, 0, m3temp_, 0] := 1/(2*m1temp*m3temp) + 
    Log[m1temp]/(2*m1temp^2 - 2*m1temp*m3temp) - 
    Log[m3temp]/(2*m1temp*m3temp - 2*m3temp^2) + Log[m4]/(2*m1temp*m3temp)
 
D3func[m1temp_, 0, m3temp_, m1temp_] := 
   -(m1temp + m3temp)/(4*m1temp*(m1temp - m3temp)^2) + 
    (m3temp*Log[m1temp])/(2*(m1temp - m3temp)^3) + 
    (m3temp*Log[m3temp])/(2*(-m1temp + m3temp)^3)
 
D3func[m1temp_, 0, m3temp_, m3temp_] := 
   -(m1temp + m3temp)/(4*(m1temp - m3temp)^2*m3temp) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m3temp)^3) + 
    (m1temp*Log[m3temp])/(2*(-m1temp + m3temp)^3)
 
D3func[m1temp_, 0, m3temp_, m4temp_] := 
   1/(2*(m1temp - m4temp)*(m3temp - m4temp)) + (m1temp*Log[m1temp])/
     (2*(m1temp - m3temp)*(m1temp - m4temp)^2) + (m3temp*Log[m3temp])/
     (2*(-m1temp + m3temp)*(m3temp - m4temp)^2) + 
    ((m1temp*m3temp - m4temp^2)*Log[m4temp])/(2*(m1temp - m4temp)^2*
      (m3temp - m4temp)^2)
 
D3func[m1temp_, m1temp_, 0, 0] := m1temp^(-2) - Log[m1temp]/(2*m1temp^2) + 
    Log[m4]/(2*m1temp^2)
 
D3func[m1temp_, m1temp_, 0, m1temp_] := -1/(12*m1temp^2)
 
D3func[m1temp_, m1temp_, 0, m4temp_] := (m1temp - m4temp)^(-2) - 
    ((m1temp + m4temp)*Log[m1temp])/(2*(m1temp - m4temp)^3) + 
    ((m1temp + m4temp)*Log[m4temp])/(2*(m1temp - m4temp)^3)
 
D3func[m1temp_, m1temp_, m1temp_, 0] := -1/(4*m1temp^2)
 
D3func[m1temp_, m1temp_, m1temp_, m1temp_] := -1/(24*m1temp^2)
 
D3func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   -(m1temp + 5*m4temp)/(4*(m1temp - m4temp)^3) + 
    (m4temp*(2*m1temp + m4temp)*Log[m1temp])/(2*(m1temp - m4temp)^4) - 
    (m4temp*(2*m1temp + m4temp)*Log[m4temp])/(2*(m1temp - m4temp)^4)
 
D3func[m1temp_, m1temp_, m3temp_, 0] := (2*m1temp^2 - 2*m1temp*m3temp)^(-1) - 
    Log[m1temp]/(2*(m1temp - m3temp)^2) + Log[m3temp]/(2*(m1temp - m3temp)^2)
 
D3func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   (-m1temp^2 + 5*m1temp*m3temp + 2*m3temp^2)/
     (12*m1temp*(m1temp - m3temp)^3) - (m3temp^2*Log[m1temp])/
     (2*(m1temp - m3temp)^4) + (m3temp^2*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
D3func[m1temp_, m1temp_, m3temp_, m3temp_] := 
   (5*m1temp + m3temp)/(4*(m1temp - m3temp)^3) - 
    (m1temp*(m1temp + 2*m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^4) + 
    (m1temp*(m1temp + 2*m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^4)
 
D3func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   (m1temp*(m3temp - 2*m4temp) + m3temp*m4temp)/(2*(m1temp - m3temp)*
      (m1temp - m4temp)^2*(m3temp - m4temp)) - 
    (m1temp*(m1temp^2 + m1temp*m4temp - 2*m3temp*m4temp)*Log[m1temp])/
     (2*(m1temp - m3temp)^2*(m1temp - m4temp)^3) + 
    (m3temp^2*Log[m3temp])/(2*(m1temp - m3temp)^2*(m3temp - m4temp)^2) + 
    (m4temp*(m4temp^2 + m1temp*(-2*m3temp + m4temp))*Log[m4temp])/
     (2*(m1temp - m4temp)^3*(m3temp - m4temp)^2)
 
D3func[m1temp_, m2temp_, 0, 0] := 1/(2*m1temp*m2temp) + 
    Log[m1temp]/(2*m1temp^2 - 2*m1temp*m2temp) - 
    Log[m2temp]/(2*m1temp*m2temp - 2*m2temp^2) + Log[m4]/(2*m1temp*m2temp)
 
D3func[m1temp_, m2temp_, 0, m1temp_] := 
   -(m1temp + m2temp)/(4*m1temp*(m1temp - m2temp)^2) + 
    (m2temp*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    (m2temp*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
D3func[m1temp_, m2temp_, 0, m2temp_] := 
   -(m1temp + m2temp)/(4*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(2*(m1temp - m2temp)^3) + 
    (m1temp*Log[m2temp])/(2*(-m1temp + m2temp)^3)
 
D3func[m1temp_, m2temp_, 0, m4temp_] := 
   1/(2*(m1temp - m4temp)*(m2temp - m4temp)) + (m1temp*Log[m1temp])/
     (2*(m1temp - m2temp)*(m1temp - m4temp)^2) + (m2temp*Log[m2temp])/
     (2*(-m1temp + m2temp)*(m2temp - m4temp)^2) + 
    ((m1temp*m2temp - m4temp^2)*Log[m4temp])/(2*(m1temp - m4temp)^2*
      (m2temp - m4temp)^2)
 
D3func[m1temp_, m2temp_, m1temp_, 0] := (2*m1temp^2 - 2*m1temp*m2temp)^(-1) - 
    Log[m1temp]/(2*(m1temp - m2temp)^2) + Log[m2temp]/(2*(m1temp - m2temp)^2)
 
D3func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   (-m1temp^2 + 5*m1temp*m2temp + 2*m2temp^2)/
     (12*m1temp*(m1temp - m2temp)^3) - (m2temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^4) + (m2temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D3func[m1temp_, m2temp_, m1temp_, m2temp_] := 
   (5*m1temp + m2temp)/(4*(m1temp - m2temp)^3) - 
    (m1temp*(m1temp + 2*m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) + 
    (m1temp*(m1temp + 2*m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D3func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   (m1temp*(m2temp - 2*m4temp) + m2temp*m4temp)/(2*(m1temp - m2temp)*
      (m1temp - m4temp)^2*(m2temp - m4temp)) - 
    (m1temp*(m1temp^2 + m1temp*m4temp - 2*m2temp*m4temp)*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m4temp)^3) + 
    (m2temp^2*Log[m2temp])/(2*(m1temp - m2temp)^2*(m2temp - m4temp)^2) + 
    (m4temp*(m4temp^2 + m1temp*(-2*m2temp + m4temp))*Log[m4temp])/
     (2*(m1temp - m4temp)^3*(m2temp - m4temp)^2)
 
D3func[m1temp_, m2temp_, m2temp_, 0] := 
   -(2*m1temp*m2temp - 2*m2temp^2)^(-1) + 
    Log[m1temp]/(2*(m1temp - m2temp)^2) - Log[m2temp]/(2*(m1temp - m2temp)^2)
 
D3func[m1temp_, m2temp_, m2temp_, m1temp_] := 
   -(m1temp + 5*m2temp)/(4*(m1temp - m2temp)^3) + 
    (m2temp*(2*m1temp + m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^4) - 
    (m2temp*(2*m1temp + m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D3func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/(12*(m1temp - m2temp)^3*
      m2temp) + (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^4) - 
    (m1temp^2*Log[m2temp])/(2*(m1temp - m2temp)^4)
 
D3func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   -(-2*m2temp*m4temp + m1temp*(m2temp + m4temp))/(2*(m1temp - m2temp)*
      (m1temp - m4temp)*(m2temp - m4temp)^2) + (m1temp^2*Log[m1temp])/
     (2*(m1temp - m2temp)^2*(m1temp - m4temp)^2) - 
    (m2temp*(-2*m1temp*m4temp + m2temp*(m2temp + m4temp))*Log[m2temp])/
     (2*(m1temp - m2temp)^2*(m2temp - m4temp)^3) - 
    (m4temp*(-2*m1temp*m2temp + m4temp*(m2temp + m4temp))*Log[m4temp])/
     (2*(m1temp - m4temp)^2*(-m2temp + m4temp)^3)
 
D3func[m1temp_, m2temp_, m3temp_, 0] := 
   Log[m1temp]/(2*(m1temp - m2temp)*(m1temp - m3temp)) + 
    Log[m2temp]/(2*(m1temp - m2temp)*(-m2temp + m3temp)) + 
    Log[m3temp]/(2*(m1temp - m3temp)*(m2temp - m3temp))
 
D3func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   -(m1temp^2 - 3*m2temp*m3temp + m1temp*(m2temp + m3temp))/
     (4*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
    ((-3*m1temp^2*m2temp*m3temp + m2temp^2*m3temp^2 + 
       m1temp^3*(m2temp + m3temp))*Log[m1temp])/(2*(m1temp - m2temp)^3*
      (m1temp - m3temp)^3) + (m2temp^2*Log[m2temp])/
     (2*(-m1temp + m2temp)^3*(m2temp - m3temp)) + (m3temp^2*Log[m3temp])/
     (2*(m1temp - m3temp)^3*(m2temp - m3temp))
 
D3func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   -(m1temp*(m2temp - 3*m3temp) + m2temp*(m2temp + m3temp))/
     (4*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)^3*(m1temp - m3temp)) - 
    ((m1temp*m2temp^2*(m2temp - 3*m3temp) + m2temp^3*m3temp + 
       m1temp^2*m3temp^2)*Log[m2temp])/(2*(m1temp - m2temp)^3*
      (m2temp - m3temp)^3) + (m3temp^2*Log[m3temp])/
     (2*(m1temp - m3temp)*(m2temp - m3temp)^3)
 
D3func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   -(m1temp*(-3*m2temp + m3temp) + m3temp*(m2temp + m3temp))/
     (4*(m1temp - m3temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)*(m1temp - m3temp)^3) + 
    (m2temp^2*Log[m2temp])/(2*(-m1temp + m2temp)*(m2temp - m3temp)^3) + 
    ((m1temp^2*m2temp^2 - 3*m1temp*m2temp*m3temp^2 + (m1temp + m2temp)*
        m3temp^3)*Log[m3temp])/(2*(m1temp - m3temp)^3*(m2temp - m3temp)^3)
 
D3func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   m4temp/(2*(-m1temp + m4temp)*(-m2temp + m4temp)*(-m3temp + m4temp)) + 
    (m1temp^2*Log[m1temp])/(2*(m1temp - m2temp)*(m1temp - m3temp)*
      (m1temp - m4temp)^2) + (m2temp^2*Log[m2temp])/
     (2*(-m1temp + m2temp)*(m2temp - m3temp)*(m2temp - m4temp)^2) + 
    (m3temp^2*Log[m3temp])/(2*(-m1temp + m3temp)*(-m2temp + m3temp)*
      (m3temp - m4temp)^2) + (m4temp*(-2*m1temp*m2temp*m3temp + 
       m2temp*m3temp*m4temp + m1temp*(m2temp + m3temp)*m4temp - m4temp^3)*
      Log[m4temp])/(2*(m1temp - m4temp)^2*(m2temp - m4temp)^2*
      (m3temp - m4temp)^2)
D00func[0, 0, 0, 0] := Log[m3]/(4*m4) - Log[m4]/(4*m4)
 
D00func[0, 0, 0, m4temp_] := Log[m3]/(4*m4temp) - Log[m4temp]/(4*m4temp)
 
D00func[0, 0, m3temp_, 0] := -Log[m3temp]/(4*m3temp) + Log[m4]/(4*m3temp)
 
D00func[0, 0, m3temp_, m3temp_] := -1/(4*m3temp)
 
D00func[0, 0, m3temp_, m4temp_] := Log[m3temp]/(4*(-m3temp + m4temp)) + 
    Log[m4temp]/(4*m3temp - 4*m4temp)
 
D00func[0, m2temp_, 0, 0] := -Log[m2temp]/(4*m2temp) + Log[m4]/(4*m2temp)
 
D00func[0, m2temp_, 0, m2temp_] := -1/(4*m2temp)
 
D00func[0, m2temp_, 0, m4temp_] := Log[m2temp]/(4*(-m2temp + m4temp)) + 
    Log[m4temp]/(4*m2temp - 4*m4temp)
 
D00func[0, m2temp_, m2temp_, 0] := -1/(4*m2temp)
 
D00func[0, m2temp_, m2temp_, m2temp_] := -1/(8*m2temp)
 
D00func[0, m2temp_, m2temp_, m4temp_] := 1/(4*(-m2temp + m4temp)) + 
    (m4temp*Log[m2temp])/(4*(m2temp - m4temp)^2) - 
    (m4temp*Log[m4temp])/(4*(m2temp - m4temp)^2)
 
D00func[0, m2temp_, m3temp_, 0] := Log[m2temp]/(4*(-m2temp + m3temp)) + 
    Log[m3temp]/(4*m2temp - 4*m3temp)
 
D00func[0, m2temp_, m3temp_, m2temp_] := 1/(4*(-m2temp + m3temp)) + 
    (m3temp*Log[m2temp])/(4*(m2temp - m3temp)^2) - 
    (m3temp*Log[m3temp])/(4*(m2temp - m3temp)^2)
 
D00func[0, m2temp_, m3temp_, m3temp_] := (4*m2temp - 4*m3temp)^(-1) - 
    (m2temp*Log[m2temp])/(4*(m2temp - m3temp)^2) + 
    (m2temp*Log[m3temp])/(4*(m2temp - m3temp)^2)
 
D00func[0, m2temp_, m3temp_, m4temp_] := 
   (m2temp*Log[m2temp])/(4*(m2temp - m3temp)*(-m2temp + m4temp)) + 
    (m3temp*Log[m3temp])/(4*(m2temp - m3temp)*(m3temp - m4temp)) + 
    (m4temp*Log[m4temp])/(4*(m2temp - m4temp)*(-m3temp + m4temp))
 
D00func[m1temp_, 0, 0, 0] := -Log[m1temp]/(4*m1temp) + Log[m4]/(4*m1temp)
 
D00func[m1temp_, 0, 0, m1temp_] := -1/(4*m1temp)
 
D00func[m1temp_, 0, 0, m4temp_] := Log[m1temp]/(4*(-m1temp + m4temp)) + 
    Log[m4temp]/(4*m1temp - 4*m4temp)
 
D00func[m1temp_, 0, m1temp_, 0] := -1/(4*m1temp)
 
D00func[m1temp_, 0, m1temp_, m1temp_] := -1/(8*m1temp)
 
D00func[m1temp_, 0, m1temp_, m4temp_] := 1/(4*(-m1temp + m4temp)) + 
    (m4temp*Log[m1temp])/(4*(m1temp - m4temp)^2) - 
    (m4temp*Log[m4temp])/(4*(m1temp - m4temp)^2)
 
D00func[m1temp_, 0, m3temp_, 0] := Log[m1temp]/(4*(-m1temp + m3temp)) + 
    Log[m3temp]/(4*m1temp - 4*m3temp)
 
D00func[m1temp_, 0, m3temp_, m1temp_] := 1/(4*(-m1temp + m3temp)) + 
    (m3temp*Log[m1temp])/(4*(m1temp - m3temp)^2) - 
    (m3temp*Log[m3temp])/(4*(m1temp - m3temp)^2)
 
D00func[m1temp_, 0, m3temp_, m3temp_] := (4*m1temp - 4*m3temp)^(-1) - 
    (m1temp*Log[m1temp])/(4*(m1temp - m3temp)^2) + 
    (m1temp*Log[m3temp])/(4*(m1temp - m3temp)^2)
 
D00func[m1temp_, 0, m3temp_, m4temp_] := 
   (m1temp*Log[m1temp])/(4*(m1temp - m3temp)*(-m1temp + m4temp)) + 
    (m3temp*Log[m3temp])/(4*(m1temp - m3temp)*(m3temp - m4temp)) + 
    (m4temp*Log[m4temp])/(4*(m1temp - m4temp)*(-m3temp + m4temp))
 
D00func[m1temp_, m1temp_, 0, 0] := -1/(4*m1temp)
 
D00func[m1temp_, m1temp_, 0, m1temp_] := -1/(8*m1temp)
 
D00func[m1temp_, m1temp_, 0, m4temp_] := 1/(4*(-m1temp + m4temp)) + 
    (m4temp*Log[m1temp])/(4*(m1temp - m4temp)^2) - 
    (m4temp*Log[m4temp])/(4*(m1temp - m4temp)^2)
 
D00func[m1temp_, m1temp_, m1temp_, 0] := -1/(8*m1temp)
 
D00func[m1temp_, m1temp_, m1temp_, m1temp_] := -1/(12*m1temp)
 
D00func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   -(m1temp - 3*m4temp)/(8*(m1temp - m4temp)^2) + (m4temp^2*Log[m1temp])/
     (4*(-m1temp + m4temp)^3) + (m4temp^2*Log[m4temp])/(4*(m1temp - m4temp)^3)
 
D00func[m1temp_, m1temp_, m3temp_, 0] := 1/(4*(-m1temp + m3temp)) + 
    (m3temp*Log[m1temp])/(4*(m1temp - m3temp)^2) - 
    (m3temp*Log[m3temp])/(4*(m1temp - m3temp)^2)
 
D00func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   -(m1temp - 3*m3temp)/(8*(m1temp - m3temp)^2) + (m3temp^2*Log[m1temp])/
     (4*(-m1temp + m3temp)^3) + (m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)^3)
 
D00func[m1temp_, m1temp_, m3temp_, m3temp_] := 
   -(m1temp + m3temp)/(4*(m1temp - m3temp)^2) + (m1temp*m3temp*Log[m1temp])/
     (2*(m1temp - m3temp)^3) - (m1temp*m3temp*Log[m3temp])/
     (2*(m1temp - m3temp)^3)
 
D00func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   m1temp/(4*(m1temp - m3temp)*(-m1temp + m4temp)) + 
    (m1temp*(-2*m3temp*m4temp + m1temp*(m3temp + m4temp))*Log[m1temp])/
     (4*(m1temp - m3temp)^2*(m1temp - m4temp)^2) + 
    (m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)^2*(-m3temp + m4temp)) - 
    (m4temp^2*Log[m4temp])/(4*(m1temp - m4temp)^2*(-m3temp + m4temp))
 
D00func[m1temp_, m2temp_, 0, 0] := Log[m1temp]/(4*(-m1temp + m2temp)) + 
    Log[m2temp]/(4*m1temp - 4*m2temp)
 
D00func[m1temp_, m2temp_, 0, m1temp_] := 1/(4*(-m1temp + m2temp)) + 
    (m2temp*Log[m1temp])/(4*(m1temp - m2temp)^2) - 
    (m2temp*Log[m2temp])/(4*(m1temp - m2temp)^2)
 
D00func[m1temp_, m2temp_, 0, m2temp_] := (4*m1temp - 4*m2temp)^(-1) - 
    (m1temp*Log[m1temp])/(4*(m1temp - m2temp)^2) + 
    (m1temp*Log[m2temp])/(4*(m1temp - m2temp)^2)
 
D00func[m1temp_, m2temp_, 0, m4temp_] := 
   (m1temp*Log[m1temp])/(4*(m1temp - m2temp)*(-m1temp + m4temp)) + 
    (m2temp*Log[m2temp])/(4*(m1temp - m2temp)*(m2temp - m4temp)) + 
    (m4temp*Log[m4temp])/(4*(m1temp - m4temp)*(-m2temp + m4temp))
 
D00func[m1temp_, m2temp_, m1temp_, 0] := 1/(4*(-m1temp + m2temp)) + 
    (m2temp*Log[m1temp])/(4*(m1temp - m2temp)^2) - 
    (m2temp*Log[m2temp])/(4*(m1temp - m2temp)^2)
 
D00func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   -(m1temp - 3*m2temp)/(8*(m1temp - m2temp)^2) + (m2temp^2*Log[m1temp])/
     (4*(-m1temp + m2temp)^3) + (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)^3)
 
D00func[m1temp_, m2temp_, m1temp_, m2temp_] := 
   -(m1temp + m2temp)/(4*(m1temp - m2temp)^2) + (m1temp*m2temp*Log[m1temp])/
     (2*(m1temp - m2temp)^3) - (m1temp*m2temp*Log[m2temp])/
     (2*(m1temp - m2temp)^3)
 
D00func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   m1temp/(4*(m1temp - m2temp)*(-m1temp + m4temp)) + 
    (m1temp*(-2*m2temp*m4temp + m1temp*(m2temp + m4temp))*Log[m1temp])/
     (4*(m1temp - m2temp)^2*(m1temp - m4temp)^2) + 
    (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)^2*(-m2temp + m4temp)) - 
    (m4temp^2*Log[m4temp])/(4*(m1temp - m4temp)^2*(-m2temp + m4temp))
 
D00func[m1temp_, m2temp_, m2temp_, 0] := (4*m1temp - 4*m2temp)^(-1) - 
    (m1temp*Log[m1temp])/(4*(m1temp - m2temp)^2) + 
    (m1temp*Log[m2temp])/(4*(m1temp - m2temp)^2)
 
D00func[m1temp_, m2temp_, m2temp_, m1temp_] := 
   -(m1temp + m2temp)/(4*(m1temp - m2temp)^2) + (m1temp*m2temp*Log[m1temp])/
     (2*(m1temp - m2temp)^3) - (m1temp*m2temp*Log[m2temp])/
     (2*(m1temp - m2temp)^3)
 
D00func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   -(-3*m1temp + m2temp)/(8*(m1temp - m2temp)^2) + 
    (m1temp^2*Log[m1temp])/(4*(-m1temp + m2temp)^3) + 
    (m1temp^2*Log[m2temp])/(4*(m1temp - m2temp)^3)
 
D00func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   m2temp/(4*(m1temp - m2temp)*(m2temp - m4temp)) + 
    (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)^2*(-m1temp + m4temp)) + 
    (m2temp*(m1temp*(m2temp - 2*m4temp) + m2temp*m4temp)*Log[m2temp])/
     (4*(m1temp - m2temp)^2*(m2temp - m4temp)^2) + 
    (m4temp^2*Log[m4temp])/(4*(m1temp - m4temp)*(m2temp - m4temp)^2)
 
D00func[m1temp_, m2temp_, m3temp_, 0] := 
   (m1temp*Log[m1temp])/(4*(m1temp - m2temp)*(-m1temp + m3temp)) + 
    (m2temp*Log[m2temp])/(4*(m1temp - m2temp)*(m2temp - m3temp)) + 
    (m3temp*Log[m3temp])/(4*(m1temp - m3temp)*(-m2temp + m3temp))
 
D00func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   m1temp/(4*(m1temp - m2temp)*(-m1temp + m3temp)) + 
    (m1temp*(-2*m2temp*m3temp + m1temp*(m2temp + m3temp))*Log[m1temp])/
     (4*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
    (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)^2*(-m2temp + m3temp)) - 
    (m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)^2*(-m2temp + m3temp))
 
D00func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   m2temp/(4*(m1temp - m2temp)*(m2temp - m3temp)) + 
    (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)^2*(-m1temp + m3temp)) + 
    (m2temp*(m1temp*(m2temp - 2*m3temp) + m2temp*m3temp)*Log[m2temp])/
     (4*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m3temp^2*Log[m3temp])/(4*(m1temp - m3temp)*(m2temp - m3temp)^2)
 
D00func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   m3temp/(4*(m1temp - m3temp)*(-m2temp + m3temp)) - 
    (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)*(m1temp - m3temp)^2) + 
    (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)*(m2temp - m3temp)^2) + 
    (m3temp*(-2*m1temp*m2temp + (m1temp + m2temp)*m3temp)*Log[m3temp])/
     (4*(m1temp - m3temp)^2*(m2temp - m3temp)^2)
 
D00func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   (m1temp^2*Log[m1temp])/(4*(m1temp - m2temp)*(m1temp - m3temp)*
      (-m1temp + m4temp)) + (m2temp^2*Log[m2temp])/(4*(m1temp - m2temp)*
      (m2temp - m3temp)*(m2temp - m4temp)) + (m3temp^2*Log[m3temp])/
     (4*(m1temp - m3temp)*(-m2temp + m3temp)*(m3temp - m4temp)) + 
    (m4temp^2*Log[m4temp])/(4*(m1temp - m4temp)*(-m2temp + m4temp)*
      (-m3temp + m4temp))
D11func[0, 0, 0, 0] := -1/(2*m3*m4) - Log[m2]/(3*m3*m4) + 
    ((m3 + m4)*Log[m3])/(3*m3*m4^2) - Log[m4]/(3*m4^2)
 
D11func[0, 0, 0, m4temp_] := -1/(2*m3*m4temp) - Log[m2]/(3*m3*m4temp) + 
    ((m3 + m4temp)*Log[m3])/(3*m3*m4temp^2) - Log[m4temp]/(3*m4temp^2)
 
D11func[0, 0, m3temp_, 0] := -1/(2*m3temp*m4) - Log[m2]/(3*m3temp*m4) - 
    Log[m3temp]/(3*m3temp^2) + ((m3temp + m4)*Log[m4])/(3*m3temp^2*m4)
 
D11func[0, 0, m3temp_, m3temp_] := -5/(6*m3temp^2) - Log[m2]/(3*m3temp^2) + 
    Log[m3temp]/(3*m3temp^2)
 
D11func[0, 0, m3temp_, m4temp_] := -1/(2*m3temp*m4temp) - 
    Log[m2]/(3*m3temp*m4temp) - Log[m3temp]/(3*m3temp^2 - 3*m3temp*m4temp) + 
    Log[m4temp]/(3*m3temp*m4temp - 3*m4temp^2)
 
D11func[0, m2temp_, 0, 0] := 1/(6*m2temp^2)
 
D11func[0, m2temp_, 0, m2temp_] := 1/(18*m2temp^2)
 
D11func[0, m2temp_, 0, m4temp_] := 
   (m2temp + m4temp)/(6*m2temp*(m2temp - m4temp)^2) + 
    (m4temp*Log[m2temp])/(3*(-m2temp + m4temp)^3) + 
    (m4temp*Log[m4temp])/(3*(m2temp - m4temp)^3)
 
D11func[0, m2temp_, m2temp_, 0] := 1/(18*m2temp^2)
 
D11func[0, m2temp_, m2temp_, m2temp_] := 1/(36*m2temp^2)
 
D11func[0, m2temp_, m2temp_, m4temp_] := 
   (m2temp^2 - 5*m2temp*m4temp - 2*m4temp^2)/
     (18*m2temp*(m2temp - m4temp)^3) + (m4temp^2*Log[m2temp])/
     (3*(m2temp - m4temp)^4) - (m4temp^2*Log[m4temp])/(3*(m2temp - m4temp)^4)
 
D11func[0, m2temp_, m3temp_, 0] := 
   (m2temp + m3temp)/(6*m2temp*(m2temp - m3temp)^2) + 
    (m3temp*Log[m2temp])/(3*(-m2temp + m3temp)^3) + 
    (m3temp*Log[m3temp])/(3*(m2temp - m3temp)^3)
 
D11func[0, m2temp_, m3temp_, m2temp_] := 
   (m2temp^2 - 5*m2temp*m3temp - 2*m3temp^2)/
     (18*m2temp*(m2temp - m3temp)^3) + (m3temp^2*Log[m2temp])/
     (3*(m2temp - m3temp)^4) - (m3temp^2*Log[m3temp])/(3*(m2temp - m3temp)^4)
 
D11func[0, m2temp_, m3temp_, m3temp_] := 
   (m2temp + 5*m3temp)/(6*(m2temp - m3temp)^3) - 
    (m3temp*(2*m2temp + m3temp)*Log[m2temp])/(3*(m2temp - m3temp)^4) + 
    (m3temp*(2*m2temp + m3temp)*Log[m3temp])/(3*(m2temp - m3temp)^4)
 
D11func[0, m2temp_, m3temp_, m4temp_] := 
   (m2temp^2 - 3*m3temp*m4temp + m2temp*(m3temp + m4temp))/
     (6*(m2temp - m3temp)^2*(m2temp - m4temp)^2) - 
    ((-3*m2temp^2*m3temp*m4temp + m3temp^2*m4temp^2 + 
       m2temp^3*(m3temp + m4temp))*Log[m2temp])/(3*(m2temp - m3temp)^3*
      (m2temp - m4temp)^3) + (m3temp^2*Log[m3temp])/
     (3*(m2temp - m3temp)^3*(m3temp - m4temp)) + (m4temp^2*Log[m4temp])/
     (3*(m2temp - m4temp)^3*(-m3temp + m4temp))
 
D11func[m1temp_, 0, 0, 0] := -Log[m1temp]/(3*m1temp^2) - 
    Log[m3]/(3*m1temp*m4) + ((m1temp + m4)*Log[m4])/(3*m1temp^2*m4)
 
D11func[m1temp_, 0, 0, m1temp_] := -1/(3*m1temp^2) + 
    Log[m1temp]/(3*m1temp^2) - Log[m3]/(3*m1temp^2)
 
D11func[m1temp_, 0, 0, m4temp_] := 
   -(Log[m1temp]/(3*m1temp^2 - 3*m1temp*m4temp)) - 
    Log[m3]/(3*m1temp*m4temp) + Log[m4temp]/(3*m1temp*m4temp - 3*m4temp^2)
 
D11func[m1temp_, 0, m1temp_, 0] := -1/(3*m1temp^2) + 
    Log[m1temp]/(3*m1temp^2) - Log[m4]/(3*m1temp^2)
 
D11func[m1temp_, 0, m1temp_, m1temp_] := 1/(6*m1temp^2)
 
D11func[m1temp_, 0, m1temp_, m4temp_] := 
   -(3*m1temp^2 - 3*m1temp*m4temp)^(-1) + 
    Log[m1temp]/(3*(m1temp - m4temp)^2) - Log[m4temp]/(3*(m1temp - m4temp)^2)
 
D11func[m1temp_, 0, m3temp_, 0] := 
   -(Log[m1temp]/(3*m1temp^2 - 3*m1temp*m3temp)) + 
    Log[m3temp]/(3*m1temp*m3temp - 3*m3temp^2) - Log[m4]/(3*m1temp*m3temp)
 
D11func[m1temp_, 0, m3temp_, m1temp_] := 
   -(3*m1temp^2 - 3*m1temp*m3temp)^(-1) + 
    Log[m1temp]/(3*(m1temp - m3temp)^2) - Log[m3temp]/(3*(m1temp - m3temp)^2)
 
D11func[m1temp_, 0, m3temp_, m3temp_] := 
   (3*m1temp*m3temp - 3*m3temp^2)^(-1) - 
    Log[m1temp]/(3*(m1temp - m3temp)^2) + Log[m3temp]/(3*(m1temp - m3temp)^2)
 
D11func[m1temp_, 0, m3temp_, m4temp_] := 
   Log[m1temp]/(3*(m1temp - m3temp)*(-m1temp + m4temp)) + 
    Log[m3temp]/(3*(m1temp - m3temp)*(m3temp - m4temp)) + 
    Log[m4temp]/(3*(m1temp - m4temp)*(-m3temp + m4temp))
 
D11func[m1temp_, m1temp_, 0, 0] := 1/(18*m1temp^2)
 
D11func[m1temp_, m1temp_, 0, m1temp_] := 1/(36*m1temp^2)
 
D11func[m1temp_, m1temp_, 0, m4temp_] := 
   (m1temp^2 - 5*m1temp*m4temp - 2*m4temp^2)/
     (18*m1temp*(m1temp - m4temp)^3) + (m4temp^2*Log[m1temp])/
     (3*(m1temp - m4temp)^4) - (m4temp^2*Log[m4temp])/(3*(m1temp - m4temp)^4)
 
D11func[m1temp_, m1temp_, m1temp_, 0] := 1/(36*m1temp^2)
 
D11func[m1temp_, m1temp_, m1temp_, m1temp_] := 1/(60*m1temp^2)
 
D11func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   (m1temp^3 - 5*m1temp^2*m4temp + 13*m1temp*m4temp^2 + 3*m4temp^3)/
     (36*m1temp*(m1temp - m4temp)^4) + (m4temp^3*Log[m1temp])/
     (3*(-m1temp + m4temp)^5) + (m4temp^3*Log[m4temp])/(3*(m1temp - m4temp)^5)
 
D11func[m1temp_, m1temp_, m3temp_, 0] := 
   (m1temp^2 - 5*m1temp*m3temp - 2*m3temp^2)/
     (18*m1temp*(m1temp - m3temp)^3) + (m3temp^2*Log[m1temp])/
     (3*(m1temp - m3temp)^4) - (m3temp^2*Log[m3temp])/(3*(m1temp - m3temp)^4)
 
D11func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   (m1temp^3 - 5*m1temp^2*m3temp + 13*m1temp*m3temp^2 + 3*m3temp^3)/
     (36*m1temp*(m1temp - m3temp)^4) + (m3temp^3*Log[m1temp])/
     (3*(-m1temp + m3temp)^5) + (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)^5)
 
D11func[m1temp_, m1temp_, m3temp_, m3temp_] := 
   (m1temp^2 - 8*m1temp*m3temp - 17*m3temp^2)/(18*(m1temp - m3temp)^4) + 
    (m3temp^2*(3*m1temp + m3temp)*Log[m1temp])/(3*(m1temp - m3temp)^5) + 
    (m3temp^2*(3*m1temp + m3temp)*Log[m3temp])/(3*(-m1temp + m3temp)^5)
 
D11func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   (m1temp^4 - 11*m3temp^2*m4temp^2 - 5*m1temp^3*(m3temp + m4temp) + 
      7*m1temp*m3temp*m4temp*(m3temp + m4temp) - 
      2*m1temp^2*(m3temp^2 - 5*m3temp*m4temp + m4temp^2))/
     (18*(m1temp - m3temp)^3*(m1temp - m4temp)^3) + 
    ((6*m1temp^2*m3temp^2*m4temp^2 - m3temp^3*m4temp^3 - 
       4*m1temp^3*m3temp*m4temp*(m3temp + m4temp) + 
       m1temp^4*(m3temp^2 + m3temp*m4temp + m4temp^2))*Log[m1temp])/
     (3*(m1temp - m3temp)^4*(m1temp - m4temp)^4) + 
    (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)^4*(-m3temp + m4temp)) + 
    (m4temp^3*Log[m4temp])/(3*(m1temp - m4temp)^4*(m3temp - m4temp))
 
D11func[m1temp_, m2temp_, 0, 0] := 
   (m1temp + m2temp)/(6*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(3*(-m1temp + m2temp)^3) + 
    (m1temp*Log[m2temp])/(3*(m1temp - m2temp)^3)
 
D11func[m1temp_, m2temp_, 0, m1temp_] := 
   -(5*m1temp + m2temp)/(6*(m1temp - m2temp)^3) + 
    (m1temp*(m1temp + 2*m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^4) - 
    (m1temp*(m1temp + 2*m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
D11func[m1temp_, m2temp_, 0, m2temp_] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
     (18*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
     (3*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
D11func[m1temp_, m2temp_, 0, m4temp_] := 
   (m1temp*(m2temp - 3*m4temp) + m2temp*(m2temp + m4temp))/
     (6*(m1temp - m2temp)^2*(m2temp - m4temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(m1temp - m2temp)^3*(-m1temp + m4temp)) + 
    ((m1temp*m2temp^2*(m2temp - 3*m4temp) + m2temp^3*m4temp + 
       m1temp^2*m4temp^2)*Log[m2temp])/(3*(m1temp - m2temp)^3*
      (m2temp - m4temp)^3) + (m4temp^2*Log[m4temp])/
     (3*(m1temp - m4temp)*(-m2temp + m4temp)^3)
 
D11func[m1temp_, m2temp_, m1temp_, 0] := 
   -(5*m1temp + m2temp)/(6*(m1temp - m2temp)^3) + 
    (m1temp*(m1temp + 2*m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^4) - 
    (m1temp*(m1temp + 2*m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
D11func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   (m1temp^2 + 10*m1temp*m2temp + m2temp^2)/(6*(m1temp - m2temp)^4) - 
    (m1temp*m2temp*(m1temp + m2temp)*Log[m1temp])/(m1temp - m2temp)^5 + 
    (m1temp*m2temp*(m1temp + m2temp)*Log[m2temp])/(m1temp - m2temp)^5
 
D11func[m1temp_, m2temp_, m1temp_, m2temp_] := 
   (-17*m1temp^2 - 8*m1temp*m2temp + m2temp^2)/(18*(m1temp - m2temp)^4) + 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^5) - 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^5)
 
D11func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   ((2*m1temp^2)/((m1temp - m2temp)^3*(-m1temp + m4temp)) + 
      (m2temp*(m1temp*(3*m2temp - 5*m4temp) + m2temp*(m2temp + m4temp)))/
       ((-m1temp + m2temp)^3*(m2temp - m4temp)^2))/6 + 
    (m1temp^2*(m1temp^2 + 2*m1temp*m2temp - 3*m2temp*m4temp)*Log[m1temp])/
     (3*(m1temp - m2temp)^4*(m1temp - m4temp)^2) - 
    (m2temp*(2*m1temp*m2temp^2*(m2temp - 2*m4temp) + m2temp^3*m4temp + 
       m1temp^2*(m2temp^2 - 3*m2temp*m4temp + 3*m4temp^2))*Log[m2temp])/
     (3*(m1temp - m2temp)^4*(m2temp - m4temp)^3) - 
    (m4temp^3*Log[m4temp])/(3*(m1temp - m4temp)^2*(-m2temp + m4temp)^3)
 
D11func[m1temp_, m2temp_, m2temp_, 0] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
     (18*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
     (3*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
D11func[m1temp_, m2temp_, m2temp_, m1temp_] := 
   (-17*m1temp^2 - 8*m1temp*m2temp + m2temp^2)/(18*(m1temp - m2temp)^4) + 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^5) - 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^5)
 
D11func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   (3*m1temp^3 + 13*m1temp^2*m2temp - 5*m1temp*m2temp^2 + m2temp^3)/
     (36*(m1temp - m2temp)^4*m2temp) + (m1temp^3*Log[m1temp])/
     (3*(-m1temp + m2temp)^5) + (m1temp^3*Log[m2temp])/(3*(m1temp - m2temp)^5)
 
D11func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   (m1temp*m2temp*(5*m2temp^2 - 10*m2temp*m4temp - 7*m4temp^2) + 
      m2temp^2*(-m2temp^2 + 5*m2temp*m4temp + 2*m4temp^2) + 
      m1temp^2*(2*m2temp^2 - 7*m2temp*m4temp + 11*m4temp^2))/
     (18*(m1temp - m2temp)^3*(m2temp - m4temp)^3) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4*(-m1temp + m4temp)) + 
    ((m1temp*m2temp^3*(m2temp - 4*m4temp)*m4temp + m2temp^4*m4temp^2 - 
       m1temp^3*m4temp^3 + m1temp^2*m2temp^2*(m2temp^2 - 4*m2temp*m4temp + 
         6*m4temp^2))*Log[m2temp])/(3*(m1temp - m2temp)^4*
      (m2temp - m4temp)^4) + (m4temp^3*Log[m4temp])/
     (3*(m1temp - m4temp)*(m2temp - m4temp)^4)
 
D11func[m1temp_, m2temp_, m3temp_, 0] := 
   (m1temp*(m2temp - 3*m3temp) + m2temp*(m2temp + m3temp))/
     (6*(m1temp - m2temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(m1temp - m2temp)^3*(-m1temp + m3temp)) + 
    ((m1temp*m2temp^2*(m2temp - 3*m3temp) + m2temp^3*m3temp + 
       m1temp^2*m3temp^2)*Log[m2temp])/(3*(m1temp - m2temp)^3*
      (m2temp - m3temp)^3) + (m3temp^2*Log[m3temp])/
     (3*(m1temp - m3temp)*(-m2temp + m3temp)^3)
 
D11func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   ((2*m1temp^2)/((m1temp - m2temp)^3*(-m1temp + m3temp)) + 
      (m2temp*(m1temp*(3*m2temp - 5*m3temp) + m2temp*(m2temp + m3temp)))/
       ((-m1temp + m2temp)^3*(m2temp - m3temp)^2))/6 + 
    (m1temp^2*(m1temp^2 + 2*m1temp*m2temp - 3*m2temp*m3temp)*Log[m1temp])/
     (3*(m1temp - m2temp)^4*(m1temp - m3temp)^2) - 
    (m2temp*(2*m1temp*m2temp^2*(m2temp - 2*m3temp) + m2temp^3*m3temp + 
       m1temp^2*(m2temp^2 - 3*m2temp*m3temp + 3*m3temp^2))*Log[m2temp])/
     (3*(m1temp - m2temp)^4*(m2temp - m3temp)^3) - 
    (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)^2*(-m2temp + m3temp)^3)
 
D11func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   (m1temp*m2temp*(5*m2temp^2 - 10*m2temp*m3temp - 7*m3temp^2) + 
      m2temp^2*(-m2temp^2 + 5*m2temp*m3temp + 2*m3temp^2) + 
      m1temp^2*(2*m2temp^2 - 7*m2temp*m3temp + 11*m3temp^2))/
     (18*(m1temp - m2temp)^3*(m2temp - m3temp)^3) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4*(-m1temp + m3temp)) + 
    ((m1temp*m2temp^3*(m2temp - 4*m3temp)*m3temp + m2temp^4*m3temp^2 - 
       m1temp^3*m3temp^3 + m1temp^2*m2temp^2*(m2temp^2 - 4*m2temp*m3temp + 
         6*m3temp^2))*Log[m2temp])/(3*(m1temp - m2temp)^4*
      (m2temp - m3temp)^4) + (m3temp^3*Log[m3temp])/
     (3*(m1temp - m3temp)*(m2temp - m3temp)^4)
 
D11func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   ((2*m3temp^2*(-m2temp + m3temp))/(m1temp - m3temp) + 
      (m2temp*(m2temp - m3temp)*(m1temp*(m2temp - 5*m3temp) + 
         m2temp*(m2temp + 3*m3temp)))/(m1temp - m2temp)^2)/
     (6*(m2temp - m3temp)^4) - (m1temp^3*Log[m1temp])/
     (3*(m1temp - m2temp)^3*(m1temp - m3temp)^2) + 
    ((m1temp*m2temp^4 + 2*m2temp^3*(-2*m1temp + m2temp)*m3temp + 
       m2temp*(3*m1temp^2 - 3*m1temp*m2temp + m2temp^2)*m3temp^2)*
      Log[m2temp])/(3*(m1temp - m2temp)^3*(m2temp - m3temp)^4) + 
    (m3temp^2*(-3*m1temp*m2temp + m3temp*(2*m2temp + m3temp))*Log[m3temp])/
     (3*(m1temp - m3temp)^2*(m2temp - m3temp)^4)
 
D11func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   (m2temp*(m1temp*(m2temp^2 + 5*m3temp*m4temp - 
         3*m2temp*(m3temp + m4temp)) + m2temp*(m2temp^2 - 3*m3temp*m4temp + 
         m2temp*(m3temp + m4temp))))/(6*(m1temp - m2temp)^2*
      (m2temp - m3temp)^2*(m2temp - m4temp)^2) + (m1temp^3*Log[m1temp])/
     (3*(m1temp - m2temp)^3*(m1temp - m3temp)*(-m1temp + m4temp)) + 
    (m2temp*(-3*m2temp^4*m3temp*m4temp + m2temp^2*m3temp^2*m4temp^2 + 
       m2temp^5*(m3temp + m4temp) + m1temp*m2temp*(m2temp^4 + 
         6*m2temp^2*m3temp*m4temp - 3*m3temp^2*m4temp^2 - 
         3*m2temp^3*(m3temp + m4temp) + m2temp*m3temp*m4temp*
          (m3temp + m4temp)) + m1temp^2*(3*m3temp^2*m4temp^2 - 
         3*m2temp*m3temp*m4temp*(m3temp + m4temp) + 
         m2temp^2*(m3temp^2 + m3temp*m4temp + m4temp^2)))*Log[m2temp])/
     (3*(m1temp - m2temp)^3*(m2temp - m3temp)^3*(m2temp - m4temp)^3) + 
    (m3temp^3*Log[m3temp])/(3*(m1temp - m3temp)*(-m2temp + m3temp)^3*
      (m3temp - m4temp)) + (m4temp^3*Log[m4temp])/(3*(m1temp - m4temp)*
      (-m2temp + m4temp)^3*(-m3temp + m4temp))
D12func[0, 0, 0, 0] := (m3 + m4)/(6*m3*m4^2) + Log[m3]/(6*m4^2) - 
    Log[m4]/(6*m4^2)
 
D12func[0, 0, 0, m4temp_] := (m3 + m4temp)/(6*m3*m4temp^2) + 
    Log[m3]/(6*m4temp^2) - Log[m4temp]/(6*m4temp^2)
 
D12func[0, 0, m3temp_, 0] := -1/(6*m3temp^2) + Log[m3temp]/(6*m3temp^2) - 
    Log[m4]/(6*m3temp^2)
 
D12func[0, 0, m3temp_, m3temp_] := 1/(12*m3temp^2)
 
D12func[0, 0, m3temp_, m4temp_] := -(6*m3temp^2 - 6*m3temp*m4temp)^(-1) + 
    Log[m3temp]/(6*(m3temp - m4temp)^2) - Log[m4temp]/(6*(m3temp - m4temp)^2)
 
D12func[0, m2temp_, 0, 0] := -1/(6*m2temp^2) + Log[m2temp]/(6*m2temp^2) - 
    Log[m4]/(6*m2temp^2)
 
D12func[0, m2temp_, 0, m2temp_] := 1/(12*m2temp^2)
 
D12func[0, m2temp_, 0, m4temp_] := -(6*m2temp^2 - 6*m2temp*m4temp)^(-1) + 
    Log[m2temp]/(6*(m2temp - m4temp)^2) - Log[m4temp]/(6*(m2temp - m4temp)^2)
 
D12func[0, m2temp_, m2temp_, 0] := 1/(36*m2temp^2)
 
D12func[0, m2temp_, m2temp_, m2temp_] := 1/(72*m2temp^2)
 
D12func[0, m2temp_, m2temp_, m4temp_] := 
   (m2temp^2 - 5*m2temp*m4temp - 2*m4temp^2)/
     (36*m2temp*(m2temp - m4temp)^3) + (m4temp^2*Log[m2temp])/
     (6*(m2temp - m4temp)^4) - (m4temp^2*Log[m4temp])/(6*(m2temp - m4temp)^4)
 
D12func[0, m2temp_, m3temp_, 0] := -1/(3*(m2temp - m3temp)^2) + 
    ((m2temp + m3temp)*Log[m2temp])/(6*(m2temp - m3temp)^3) - 
    ((m2temp + m3temp)*Log[m3temp])/(6*(m2temp - m3temp)^3)
 
D12func[0, m2temp_, m3temp_, m2temp_] := 
   (m2temp + 5*m3temp)/(12*(m2temp - m3temp)^3) - 
    (m3temp*(2*m2temp + m3temp)*Log[m2temp])/(6*(m2temp - m3temp)^4) + 
    (m3temp*(2*m2temp + m3temp)*Log[m3temp])/(6*(m2temp - m3temp)^4)
 
D12func[0, m2temp_, m3temp_, m3temp_] := 
   -(5*m2temp + m3temp)/(12*(m2temp - m3temp)^3) + 
    (m2temp*(m2temp + 2*m3temp)*Log[m2temp])/(6*(m2temp - m3temp)^4) - 
    (m2temp*(m2temp + 2*m3temp)*Log[m3temp])/(6*(m2temp - m3temp)^4)
 
D12func[0, m2temp_, m3temp_, m4temp_] := 
   (-2*m2temp*m3temp + (m2temp + m3temp)*m4temp)/(6*(m2temp - m3temp)^2*
      (m2temp - m4temp)*(m3temp - m4temp)) + 
    (m2temp*(m2temp*(m2temp + m3temp) - 2*m3temp*m4temp)*Log[m2temp])/
     (6*(m2temp - m3temp)^3*(m2temp - m4temp)^2) + 
    (m3temp*(m3temp*(m2temp + m3temp) - 2*m2temp*m4temp)*Log[m3temp])/
     (6*(-m2temp + m3temp)^3*(m3temp - m4temp)^2) - 
    (m4temp^2*Log[m4temp])/(6*(m2temp - m4temp)^2*(m3temp - m4temp)^2)
 
D12func[m1temp_, 0, 0, 0] := -1/(6*m1temp*m4) - Log[m1temp]/(6*m1temp^2) - 
    Log[m3]/(6*m1temp*m4) + ((m1temp + m4)*Log[m4])/(6*m1temp^2*m4)
 
D12func[m1temp_, 0, 0, m1temp_] := -1/(3*m1temp^2) + 
    Log[m1temp]/(6*m1temp^2) - Log[m3]/(6*m1temp^2)
 
D12func[m1temp_, 0, 0, m4temp_] := -1/(6*m1temp*m4temp) - 
    Log[m1temp]/(6*m1temp^2 - 6*m1temp*m4temp) - Log[m3]/(6*m1temp*m4temp) + 
    Log[m4temp]/(6*m1temp*m4temp - 6*m4temp^2)
 
D12func[m1temp_, 0, m1temp_, 0] := 1/(12*m1temp^2)
 
D12func[m1temp_, 0, m1temp_, m1temp_] := 1/(36*m1temp^2)
 
D12func[m1temp_, 0, m1temp_, m4temp_] := 
   (m1temp + m4temp)/(12*m1temp*(m1temp - m4temp)^2) + 
    (m4temp*Log[m1temp])/(6*(-m1temp + m4temp)^3) + 
    (m4temp*Log[m4temp])/(6*(m1temp - m4temp)^3)
 
D12func[m1temp_, 0, m3temp_, 0] := (6*m1temp*m3temp - 6*m3temp^2)^(-1) - 
    Log[m1temp]/(6*(m1temp - m3temp)^2) + Log[m3temp]/(6*(m1temp - m3temp)^2)
 
D12func[m1temp_, 0, m3temp_, m1temp_] := -1/(3*(m1temp - m3temp)^2) + 
    ((m1temp + m3temp)*Log[m1temp])/(6*(m1temp - m3temp)^3) - 
    ((m1temp + m3temp)*Log[m3temp])/(6*(m1temp - m3temp)^3)
 
D12func[m1temp_, 0, m3temp_, m3temp_] := 
   (m1temp + m3temp)/(12*(m1temp - m3temp)^2*m3temp) + 
    (m1temp*Log[m1temp])/(6*(-m1temp + m3temp)^3) + 
    (m1temp*Log[m3temp])/(6*(m1temp - m3temp)^3)
 
D12func[m1temp_, 0, m3temp_, m4temp_] := 
   1/(6*(m1temp - m3temp)*(m3temp - m4temp)) + (m1temp*Log[m1temp])/
     (6*(m1temp - m3temp)^2*(-m1temp + m4temp)) + 
    ((m3temp^2 - m1temp*m4temp)*Log[m3temp])/(6*(m1temp - m3temp)^2*
      (m3temp - m4temp)^2) + (m4temp*Log[m4temp])/(6*(m1temp - m4temp)*
      (m3temp - m4temp)^2)
 
D12func[m1temp_, m1temp_, 0, 0] := 1/(12*m1temp^2)
 
D12func[m1temp_, m1temp_, 0, m1temp_] := 1/(36*m1temp^2)
 
D12func[m1temp_, m1temp_, 0, m4temp_] := 
   (m1temp + m4temp)/(12*m1temp*(m1temp - m4temp)^2) + 
    (m4temp*Log[m1temp])/(6*(-m1temp + m4temp)^3) + 
    (m4temp*Log[m4temp])/(6*(m1temp - m4temp)^3)
 
D12func[m1temp_, m1temp_, m1temp_, 0] := 1/(72*m1temp^2)
 
D12func[m1temp_, m1temp_, m1temp_, m1temp_] := 1/(120*m1temp^2)
 
D12func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   (m1temp^3 - 5*m1temp^2*m4temp + 13*m1temp*m4temp^2 + 3*m4temp^3)/
     (72*m1temp*(m1temp - m4temp)^4) + (m4temp^3*Log[m1temp])/
     (6*(-m1temp + m4temp)^5) + (m4temp^3*Log[m4temp])/(6*(m1temp - m4temp)^5)
 
D12func[m1temp_, m1temp_, m3temp_, 0] := 
   (m1temp + 5*m3temp)/(12*(m1temp - m3temp)^3) - 
    (m3temp*(2*m1temp + m3temp)*Log[m1temp])/(6*(m1temp - m3temp)^4) + 
    (m3temp*(2*m1temp + m3temp)*Log[m3temp])/(6*(m1temp - m3temp)^4)
 
D12func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   (m1temp^2 - 8*m1temp*m3temp - 17*m3temp^2)/(36*(m1temp - m3temp)^4) + 
    (m3temp^2*(3*m1temp + m3temp)*Log[m1temp])/(6*(m1temp - m3temp)^5) + 
    (m3temp^2*(3*m1temp + m3temp)*Log[m3temp])/(6*(-m1temp + m3temp)^5)
 
D12func[m1temp_, m1temp_, m3temp_, m3temp_] := 
   (m1temp^2 + 10*m1temp*m3temp + m3temp^2)/(12*(m1temp - m3temp)^4) - 
    (m1temp*m3temp*(m1temp + m3temp)*Log[m1temp])/(2*(m1temp - m3temp)^5) + 
    (m1temp*m3temp*(m1temp + m3temp)*Log[m3temp])/(2*(m1temp - m3temp)^5)
 
D12func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   (m1temp^2*m3temp*(m1temp + 5*m3temp) - 
      m1temp*(m1temp^2 + 2*m1temp*m3temp + 9*m3temp^2)*m4temp + 
      (-m1temp^2 + 5*m1temp*m3temp + 2*m3temp^2)*m4temp^2)/
     (12*(m1temp - m3temp)^3*(m1temp - m4temp)^2*(m3temp - m4temp)) - 
    (m1temp*(m1temp^2*m3temp*(m3temp - 4*m4temp) - 3*m1temp*m3temp^2*m4temp + 
       3*m3temp^2*m4temp^2 + m1temp^3*(2*m3temp + m4temp))*Log[m1temp])/
     (6*(m1temp - m3temp)^4*(m1temp - m4temp)^3) + 
    (m3temp^2*(2*m1temp*m3temp + m3temp^2 - 3*m1temp*m4temp)*Log[m3temp])/
     (6*(m1temp - m3temp)^4*(m3temp - m4temp)^2) + 
    (m4temp^3*Log[m4temp])/(6*(m1temp - m4temp)^3*(m3temp - m4temp)^2)
 
D12func[m1temp_, m2temp_, 0, 0] := (6*m1temp*m2temp - 6*m2temp^2)^(-1) - 
    Log[m1temp]/(6*(m1temp - m2temp)^2) + Log[m2temp]/(6*(m1temp - m2temp)^2)
 
D12func[m1temp_, m2temp_, 0, m1temp_] := -1/(3*(m1temp - m2temp)^2) + 
    ((m1temp + m2temp)*Log[m1temp])/(6*(m1temp - m2temp)^3) - 
    ((m1temp + m2temp)*Log[m2temp])/(6*(m1temp - m2temp)^3)
 
D12func[m1temp_, m2temp_, 0, m2temp_] := 
   (m1temp + m2temp)/(12*(m1temp - m2temp)^2*m2temp) + 
    (m1temp*Log[m1temp])/(6*(-m1temp + m2temp)^3) + 
    (m1temp*Log[m2temp])/(6*(m1temp - m2temp)^3)
 
D12func[m1temp_, m2temp_, 0, m4temp_] := 
   1/(6*(m1temp - m2temp)*(m2temp - m4temp)) + (m1temp*Log[m1temp])/
     (6*(m1temp - m2temp)^2*(-m1temp + m4temp)) + 
    ((m2temp^2 - m1temp*m4temp)*Log[m2temp])/(6*(m1temp - m2temp)^2*
      (m2temp - m4temp)^2) + (m4temp*Log[m4temp])/(6*(m1temp - m4temp)*
      (m2temp - m4temp)^2)
 
D12func[m1temp_, m2temp_, m1temp_, 0] := 
   (m1temp + 5*m2temp)/(12*(m1temp - m2temp)^3) - 
    (m2temp*(2*m1temp + m2temp)*Log[m1temp])/(6*(m1temp - m2temp)^4) + 
    (m2temp*(2*m1temp + m2temp)*Log[m2temp])/(6*(m1temp - m2temp)^4)
 
D12func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   (m1temp^2 - 8*m1temp*m2temp - 17*m2temp^2)/(36*(m1temp - m2temp)^4) + 
    (m2temp^2*(3*m1temp + m2temp)*Log[m1temp])/(6*(m1temp - m2temp)^5) + 
    (m2temp^2*(3*m1temp + m2temp)*Log[m2temp])/(6*(-m1temp + m2temp)^5)
 
D12func[m1temp_, m2temp_, m1temp_, m2temp_] := 
   (m1temp^2 + 10*m1temp*m2temp + m2temp^2)/(12*(m1temp - m2temp)^4) - 
    (m1temp*m2temp*(m1temp + m2temp)*Log[m1temp])/(2*(m1temp - m2temp)^5) + 
    (m1temp*m2temp*(m1temp + m2temp)*Log[m2temp])/(2*(m1temp - m2temp)^5)
 
D12func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   (m1temp^2*m2temp*(m1temp + 5*m2temp) - 
      m1temp*(m1temp^2 + 2*m1temp*m2temp + 9*m2temp^2)*m4temp + 
      (-m1temp^2 + 5*m1temp*m2temp + 2*m2temp^2)*m4temp^2)/
     (12*(m1temp - m2temp)^3*(m1temp - m4temp)^2*(m2temp - m4temp)) - 
    (m1temp*(m1temp^2*m2temp*(m2temp - 4*m4temp) - 3*m1temp*m2temp^2*m4temp + 
       3*m2temp^2*m4temp^2 + m1temp^3*(2*m2temp + m4temp))*Log[m1temp])/
     (6*(m1temp - m2temp)^4*(m1temp - m4temp)^3) + 
    (m2temp^2*(2*m1temp*m2temp + m2temp^2 - 3*m1temp*m4temp)*Log[m2temp])/
     (6*(m1temp - m2temp)^4*(m2temp - m4temp)^2) + 
    (m4temp^3*Log[m4temp])/(6*(m1temp - m4temp)^3*(m2temp - m4temp)^2)
 
D12func[m1temp_, m2temp_, m2temp_, 0] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
     (36*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
     (6*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/(6*(m1temp - m2temp)^4)
 
D12func[m1temp_, m2temp_, m2temp_, m1temp_] := 
   (-17*m1temp^2 - 8*m1temp*m2temp + m2temp^2)/(36*(m1temp - m2temp)^4) + 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m1temp])/(6*(m1temp - m2temp)^5) - 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m2temp])/(6*(m1temp - m2temp)^5)
 
D12func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   (3*m1temp^3 + 13*m1temp^2*m2temp - 5*m1temp*m2temp^2 + m2temp^3)/
     (72*(m1temp - m2temp)^4*m2temp) + (m1temp^3*Log[m1temp])/
     (6*(-m1temp + m2temp)^5) + (m1temp^3*Log[m2temp])/(6*(m1temp - m2temp)^5)
 
D12func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   (m1temp*m2temp*(5*m2temp^2 - 10*m2temp*m4temp - 7*m4temp^2) + 
      m2temp^2*(-m2temp^2 + 5*m2temp*m4temp + 2*m4temp^2) + 
      m1temp^2*(2*m2temp^2 - 7*m2temp*m4temp + 11*m4temp^2))/
     (36*(m1temp - m2temp)^3*(m2temp - m4temp)^3) + 
    (m1temp^3*Log[m1temp])/(6*(m1temp - m2temp)^4*(-m1temp + m4temp)) + 
    ((m1temp*m2temp^3*(m2temp - 4*m4temp)*m4temp + m2temp^4*m4temp^2 - 
       m1temp^3*m4temp^3 + m1temp^2*m2temp^2*(m2temp^2 - 4*m2temp*m4temp + 
         6*m4temp^2))*Log[m2temp])/(6*(m1temp - m2temp)^4*
      (m2temp - m4temp)^4) + (m4temp^3*Log[m4temp])/
     (6*(m1temp - m4temp)*(m2temp - m4temp)^4)
 
D12func[m1temp_, m2temp_, m3temp_, 0] := 
   (-2*m2temp*m3temp + m1temp*(m2temp + m3temp))/(6*(m1temp - m2temp)*
      (m1temp - m3temp)*(m2temp - m3temp)^2) - (m1temp^2*Log[m1temp])/
     (6*(m1temp - m2temp)^2*(m1temp - m3temp)^2) + 
    (m2temp*(-2*m1temp*m3temp + m2temp*(m2temp + m3temp))*Log[m2temp])/
     (6*(m1temp - m2temp)^2*(m2temp - m3temp)^3) + 
    (m3temp*(-2*m1temp*m2temp + m3temp*(m2temp + m3temp))*Log[m3temp])/
     (6*(m1temp - m3temp)^2*(-m2temp + m3temp)^3)
 
D12func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   -(m2temp^2*m3temp^2 - m1temp*m2temp*m3temp*(m2temp + m3temp) + 
       m1temp^2*(m2temp^2 - m2temp*m3temp + m3temp^2))/
     (3*(m1temp - m2temp)^2*(m1temp - m3temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^2*(m1temp^2 - 3*m2temp*m3temp + m1temp*(m2temp + m3temp))*
      Log[m1temp])/(6*(m1temp - m2temp)^3*(m1temp - m3temp)^3) + 
    (m2temp^2*(m1temp*(m2temp - 3*m3temp) + m2temp*(m2temp + m3temp))*
      Log[m2temp])/(6*(-m1temp + m2temp)^3*(m2temp - m3temp)^3) + 
    (m3temp^2*(m1temp*(-3*m2temp + m3temp) + m3temp*(m2temp + m3temp))*
      Log[m3temp])/(6*(-m1temp + m3temp)^3*(-m2temp + m3temp)^3)
 
D12func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   ((2*m3temp^2)/((m1temp - m3temp)*(-m2temp + m3temp)^3) + 
      (m2temp*(m1temp*(m2temp - 5*m3temp) + m2temp*(m2temp + 3*m3temp)))/
       ((m1temp - m2temp)^2*(m2temp - m3temp)^3))/12 - 
    (m1temp^3*Log[m1temp])/(6*(m1temp - m2temp)^3*(m1temp - m3temp)^2) + 
    ((m1temp*m2temp^4 + 2*m2temp^3*(-2*m1temp + m2temp)*m3temp + 
       m2temp*(3*m1temp^2 - 3*m1temp*m2temp + m2temp^2)*m3temp^2)*
      Log[m2temp])/(6*(m1temp - m2temp)^3*(m2temp - m3temp)^4) + 
    (m3temp^2*(-3*m1temp*m2temp + m3temp*(2*m2temp + m3temp))*Log[m3temp])/
     (6*(m1temp - m3temp)^2*(m2temp - m3temp)^4)
 
D12func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   ((2*m2temp^2*(m2temp - m3temp))/(m1temp - m2temp) + 
      (m3temp*(-m2temp + m3temp)*(m1temp*(-5*m2temp + m3temp) + 
         m3temp*(3*m2temp + m3temp)))/(m1temp - m3temp)^2)/
     (12*(m2temp - m3temp)^4) + (m1temp^3*Log[m1temp])/
     (6*(m1temp - m2temp)^2*(-m1temp + m3temp)^3) + 
    (m2temp^2*(m2temp^2 - 3*m1temp*m3temp + 2*m2temp*m3temp)*Log[m2temp])/
     (6*(m1temp - m2temp)^2*(m2temp - m3temp)^4) + 
    (m3temp*(3*m1temp^2*m2temp^2 + m2temp*m3temp^2*(m2temp + 2*m3temp) + 
       m1temp*m3temp*(-3*m2temp^2 - 4*m2temp*m3temp + m3temp^2))*Log[m3temp])/
     (6*(m1temp - m3temp)^3*(m2temp - m3temp)^4)
 
D12func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   (m2temp^2/((m1temp - m2temp)*(m2temp - m4temp)) + 
      m3temp^2/((m1temp - m3temp)*(m3temp - m4temp)))/
     (6*(m2temp - m3temp)^2) + (m1temp^3*Log[m1temp])/
     (6*(m1temp - m2temp)^2*(m1temp - m3temp)^2*(-m1temp + m4temp)) + 
    (m2temp^2*(m2temp^3 + m2temp^2*m3temp + 3*m1temp*m3temp*m4temp - 
       m2temp*(2*m3temp*m4temp + m1temp*(2*m3temp + m4temp)))*Log[m2temp])/
     (6*(m1temp - m2temp)^2*(m2temp - m3temp)^3*(m2temp - m4temp)^2) + 
    (m3temp^2*(m3temp*(m3temp*(m2temp + m3temp) - 2*m2temp*m4temp) - 
       m1temp*(2*m2temp*m3temp - 3*m2temp*m4temp + m3temp*m4temp))*
      Log[m3temp])/(6*(m1temp - m3temp)^2*(-m2temp + m3temp)^3*
      (m3temp - m4temp)^2) + (m4temp^3*Log[m4temp])/
     (6*(m1temp - m4temp)*(m2temp - m4temp)^2*(m3temp - m4temp)^2)
D22func[0, 0, 0, 0] := (3*m3 + m4)/(6*m3*m4^2) + Log[m3]/(3*m4^2) - 
    Log[m4]/(3*m4^2)
 
D22func[0, 0, 0, m4temp_] := (3*m3 + m4temp)/(6*m3*m4temp^2) + 
    Log[m3]/(3*m4temp^2) - Log[m4temp]/(3*m4temp^2)
 
D22func[0, 0, m3temp_, 0] := 1/(6*m3temp^2)
 
D22func[0, 0, m3temp_, m3temp_] := 1/(18*m3temp^2)
 
D22func[0, 0, m3temp_, m4temp_] := 
   (m3temp + m4temp)/(6*m3temp*(m3temp - m4temp)^2) + 
    (m4temp*Log[m3temp])/(3*(-m3temp + m4temp)^3) + 
    (m4temp*Log[m4temp])/(3*(m3temp - m4temp)^3)
 
D22func[0, m2temp_, 0, 0] := -1/(2*m2temp*m4) - Log[m2temp]/(3*m2temp^2) - 
    Log[m3]/(3*m2temp*m4) + ((m2temp + m4)*Log[m4])/(3*m2temp^2*m4)
 
D22func[0, m2temp_, 0, m2temp_] := -5/(6*m2temp^2) + 
    Log[m2temp]/(3*m2temp^2) - Log[m3]/(3*m2temp^2)
 
D22func[0, m2temp_, 0, m4temp_] := -1/(2*m2temp*m4temp) - 
    Log[m2temp]/(3*m2temp^2 - 3*m2temp*m4temp) - Log[m3]/(3*m2temp*m4temp) + 
    Log[m4temp]/(3*m2temp*m4temp - 3*m4temp^2)
 
D22func[0, m2temp_, m2temp_, 0] := 1/(18*m2temp^2)
 
D22func[0, m2temp_, m2temp_, m2temp_] := 1/(36*m2temp^2)
 
D22func[0, m2temp_, m2temp_, m4temp_] := 
   (m2temp^2 - 5*m2temp*m4temp - 2*m4temp^2)/
     (18*m2temp*(m2temp - m4temp)^3) + (m4temp^2*Log[m2temp])/
     (3*(m2temp - m4temp)^4) - (m4temp^2*Log[m4temp])/(3*(m2temp - m4temp)^4)
 
D22func[0, m2temp_, m3temp_, 0] := 
   (m2temp + m3temp)/(6*(m2temp - m3temp)^2*m3temp) + 
    (m2temp*Log[m2temp])/(3*(-m2temp + m3temp)^3) + 
    (m2temp*Log[m3temp])/(3*(m2temp - m3temp)^3)
 
D22func[0, m2temp_, m3temp_, m2temp_] := 
   -(5*m2temp + m3temp)/(6*(m2temp - m3temp)^3) + 
    (m2temp*(m2temp + 2*m3temp)*Log[m2temp])/(3*(m2temp - m3temp)^4) - 
    (m2temp*(m2temp + 2*m3temp)*Log[m3temp])/(3*(m2temp - m3temp)^4)
 
D22func[0, m2temp_, m3temp_, m3temp_] := 
   (-2*m2temp^2 - 5*m2temp*m3temp + m3temp^2)/
     (18*m3temp*(-m2temp + m3temp)^3) - (m2temp^2*Log[m2temp])/
     (3*(m2temp - m3temp)^4) + (m2temp^2*Log[m3temp])/(3*(m2temp - m3temp)^4)
 
D22func[0, m2temp_, m3temp_, m4temp_] := 
   (m2temp*(m3temp - 3*m4temp) + m3temp*(m3temp + m4temp))/
     (6*(m2temp - m3temp)^2*(m3temp - m4temp)^2) + 
    (m2temp^2*Log[m2temp])/(3*(m2temp - m3temp)^3*(-m2temp + m4temp)) + 
    ((m2temp*m3temp^2*(m3temp - 3*m4temp) + m3temp^3*m4temp + 
       m2temp^2*m4temp^2)*Log[m3temp])/(3*(m2temp - m3temp)^3*
      (m3temp - m4temp)^3) + (m4temp^2*Log[m4temp])/
     (3*(m2temp - m4temp)*(-m3temp + m4temp)^3)
 
D22func[m1temp_, 0, 0, 0] := -1/(2*m1temp*m4) - Log[m1temp]/(3*m1temp^2) - 
    Log[m3]/(3*m1temp*m4) + ((m1temp + m4)*Log[m4])/(3*m1temp^2*m4)
 
D22func[m1temp_, 0, 0, m1temp_] := -5/(6*m1temp^2) + 
    Log[m1temp]/(3*m1temp^2) - Log[m3]/(3*m1temp^2)
 
D22func[m1temp_, 0, 0, m4temp_] := -1/(2*m1temp*m4temp) - 
    Log[m1temp]/(3*m1temp^2 - 3*m1temp*m4temp) - Log[m3]/(3*m1temp*m4temp) + 
    Log[m4temp]/(3*m1temp*m4temp - 3*m4temp^2)
 
D22func[m1temp_, 0, m1temp_, 0] := 1/(18*m1temp^2)
 
D22func[m1temp_, 0, m1temp_, m1temp_] := 1/(36*m1temp^2)
 
D22func[m1temp_, 0, m1temp_, m4temp_] := 
   (m1temp^2 - 5*m1temp*m4temp - 2*m4temp^2)/
     (18*m1temp*(m1temp - m4temp)^3) + (m4temp^2*Log[m1temp])/
     (3*(m1temp - m4temp)^4) - (m4temp^2*Log[m4temp])/(3*(m1temp - m4temp)^4)
 
D22func[m1temp_, 0, m3temp_, 0] := 
   (m1temp + m3temp)/(6*(m1temp - m3temp)^2*m3temp) + 
    (m1temp*Log[m1temp])/(3*(-m1temp + m3temp)^3) + 
    (m1temp*Log[m3temp])/(3*(m1temp - m3temp)^3)
 
D22func[m1temp_, 0, m3temp_, m1temp_] := 
   -(5*m1temp + m3temp)/(6*(m1temp - m3temp)^3) + 
    (m1temp*(m1temp + 2*m3temp)*Log[m1temp])/(3*(m1temp - m3temp)^4) - 
    (m1temp*(m1temp + 2*m3temp)*Log[m3temp])/(3*(m1temp - m3temp)^4)
 
D22func[m1temp_, 0, m3temp_, m3temp_] := 
   (-2*m1temp^2 - 5*m1temp*m3temp + m3temp^2)/
     (18*m3temp*(-m1temp + m3temp)^3) - (m1temp^2*Log[m1temp])/
     (3*(m1temp - m3temp)^4) + (m1temp^2*Log[m3temp])/(3*(m1temp - m3temp)^4)
 
D22func[m1temp_, 0, m3temp_, m4temp_] := 
   (m1temp*(m3temp - 3*m4temp) + m3temp*(m3temp + m4temp))/
     (6*(m1temp - m3temp)^2*(m3temp - m4temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(m1temp - m3temp)^3*(-m1temp + m4temp)) + 
    ((m1temp*m3temp^2*(m3temp - 3*m4temp) + m3temp^3*m4temp + 
       m1temp^2*m4temp^2)*Log[m3temp])/(3*(m1temp - m3temp)^3*
      (m3temp - m4temp)^3) + (m4temp^2*Log[m4temp])/
     (3*(m1temp - m4temp)*(-m3temp + m4temp)^3)
 
D22func[m1temp_, m1temp_, 0, 0] := -1/(3*m1temp^2) + 
    Log[m1temp]/(3*m1temp^2) - Log[m4]/(3*m1temp^2)
 
D22func[m1temp_, m1temp_, 0, m1temp_] := 1/(6*m1temp^2)
 
D22func[m1temp_, m1temp_, 0, m4temp_] := 
   -(3*m1temp^2 - 3*m1temp*m4temp)^(-1) + 
    Log[m1temp]/(3*(m1temp - m4temp)^2) - Log[m4temp]/(3*(m1temp - m4temp)^2)
 
D22func[m1temp_, m1temp_, m1temp_, 0] := 1/(36*m1temp^2)
 
D22func[m1temp_, m1temp_, m1temp_, m1temp_] := 1/(60*m1temp^2)
 
D22func[m1temp_, m1temp_, m1temp_, m4temp_] := 
   (m1temp^3 - 5*m1temp^2*m4temp + 13*m1temp*m4temp^2 + 3*m4temp^3)/
     (36*m1temp*(m1temp - m4temp)^4) + (m4temp^3*Log[m1temp])/
     (3*(-m1temp + m4temp)^5) + (m4temp^3*Log[m4temp])/(3*(m1temp - m4temp)^5)
 
D22func[m1temp_, m1temp_, m3temp_, 0] := 
   -(5*m1temp + m3temp)/(6*(m1temp - m3temp)^3) + 
    (m1temp*(m1temp + 2*m3temp)*Log[m1temp])/(3*(m1temp - m3temp)^4) - 
    (m1temp*(m1temp + 2*m3temp)*Log[m3temp])/(3*(m1temp - m3temp)^4)
 
D22func[m1temp_, m1temp_, m3temp_, m1temp_] := 
   (m1temp^2 + 10*m1temp*m3temp + m3temp^2)/(6*(m1temp - m3temp)^4) - 
    (m1temp*m3temp*(m1temp + m3temp)*Log[m1temp])/(m1temp - m3temp)^5 + 
    (m1temp*m3temp*(m1temp + m3temp)*Log[m3temp])/(m1temp - m3temp)^5
 
D22func[m1temp_, m1temp_, m3temp_, m3temp_] := 
   (-17*m1temp^2 - 8*m1temp*m3temp + m3temp^2)/(18*(m1temp - m3temp)^4) + 
    (m1temp^2*(m1temp + 3*m3temp)*Log[m1temp])/(3*(m1temp - m3temp)^5) - 
    (m1temp^2*(m1temp + 3*m3temp)*Log[m3temp])/(3*(m1temp - m3temp)^5)
 
D22func[m1temp_, m1temp_, m3temp_, m4temp_] := 
   ((2*m1temp^2)/((m1temp - m3temp)^3*(-m1temp + m4temp)) + 
      (m3temp*(m1temp*(3*m3temp - 5*m4temp) + m3temp*(m3temp + m4temp)))/
       ((-m1temp + m3temp)^3*(m3temp - m4temp)^2))/6 + 
    (m1temp^2*(m1temp^2 + 2*m1temp*m3temp - 3*m3temp*m4temp)*Log[m1temp])/
     (3*(m1temp - m3temp)^4*(m1temp - m4temp)^2) - 
    (m3temp*(2*m1temp*m3temp^2*(m3temp - 2*m4temp) + m3temp^3*m4temp + 
       m1temp^2*(m3temp^2 - 3*m3temp*m4temp + 3*m4temp^2))*Log[m3temp])/
     (3*(m1temp - m3temp)^4*(m3temp - m4temp)^3) - 
    (m4temp^3*Log[m4temp])/(3*(m1temp - m4temp)^2*(-m3temp + m4temp)^3)
 
D22func[m1temp_, m2temp_, 0, 0] := 
   -(Log[m1temp]/(3*m1temp^2 - 3*m1temp*m2temp)) + 
    Log[m2temp]/(3*m1temp*m2temp - 3*m2temp^2) - Log[m4]/(3*m1temp*m2temp)
 
D22func[m1temp_, m2temp_, 0, m1temp_] := 
   -(3*m1temp^2 - 3*m1temp*m2temp)^(-1) + 
    Log[m1temp]/(3*(m1temp - m2temp)^2) - Log[m2temp]/(3*(m1temp - m2temp)^2)
 
D22func[m1temp_, m2temp_, 0, m2temp_] := 
   (3*m1temp*m2temp - 3*m2temp^2)^(-1) - 
    Log[m1temp]/(3*(m1temp - m2temp)^2) + Log[m2temp]/(3*(m1temp - m2temp)^2)
 
D22func[m1temp_, m2temp_, 0, m4temp_] := 
   Log[m1temp]/(3*(m1temp - m2temp)*(-m1temp + m4temp)) + 
    Log[m2temp]/(3*(m1temp - m2temp)*(m2temp - m4temp)) + 
    Log[m4temp]/(3*(m1temp - m4temp)*(-m2temp + m4temp))
 
D22func[m1temp_, m2temp_, m1temp_, 0] := 
   (m1temp^2 - 5*m1temp*m2temp - 2*m2temp^2)/
     (18*m1temp*(m1temp - m2temp)^3) + (m2temp^2*Log[m1temp])/
     (3*(m1temp - m2temp)^4) - (m2temp^2*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
D22func[m1temp_, m2temp_, m1temp_, m1temp_] := 
   (m1temp^3 - 5*m1temp^2*m2temp + 13*m1temp*m2temp^2 + 3*m2temp^3)/
     (36*m1temp*(m1temp - m2temp)^4) + (m2temp^3*Log[m1temp])/
     (3*(-m1temp + m2temp)^5) + (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)^5)
 
D22func[m1temp_, m2temp_, m1temp_, m2temp_] := 
   (m1temp^2 - 8*m1temp*m2temp - 17*m2temp^2)/(18*(m1temp - m2temp)^4) + 
    (m2temp^2*(3*m1temp + m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^5) + 
    (m2temp^2*(3*m1temp + m2temp)*Log[m2temp])/(3*(-m1temp + m2temp)^5)
 
D22func[m1temp_, m2temp_, m1temp_, m4temp_] := 
   (m1temp^4 - 11*m2temp^2*m4temp^2 - 5*m1temp^3*(m2temp + m4temp) + 
      7*m1temp*m2temp*m4temp*(m2temp + m4temp) - 
      2*m1temp^2*(m2temp^2 - 5*m2temp*m4temp + m4temp^2))/
     (18*(m1temp - m2temp)^3*(m1temp - m4temp)^3) + 
    ((6*m1temp^2*m2temp^2*m4temp^2 - m2temp^3*m4temp^3 - 
       4*m1temp^3*m2temp*m4temp*(m2temp + m4temp) + 
       m1temp^4*(m2temp^2 + m2temp*m4temp + m4temp^2))*Log[m1temp])/
     (3*(m1temp - m2temp)^4*(m1temp - m4temp)^4) + 
    (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)^4*(-m2temp + m4temp)) + 
    (m4temp^3*Log[m4temp])/(3*(m1temp - m4temp)^4*(m2temp - m4temp))
 
D22func[m1temp_, m2temp_, m2temp_, 0] := 
   (-2*m1temp^2 - 5*m1temp*m2temp + m2temp^2)/
     (18*m2temp*(-m1temp + m2temp)^3) - (m1temp^2*Log[m1temp])/
     (3*(m1temp - m2temp)^4) + (m1temp^2*Log[m2temp])/(3*(m1temp - m2temp)^4)
 
D22func[m1temp_, m2temp_, m2temp_, m1temp_] := 
   (-17*m1temp^2 - 8*m1temp*m2temp + m2temp^2)/(18*(m1temp - m2temp)^4) + 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m1temp])/(3*(m1temp - m2temp)^5) - 
    (m1temp^2*(m1temp + 3*m2temp)*Log[m2temp])/(3*(m1temp - m2temp)^5)
 
D22func[m1temp_, m2temp_, m2temp_, m2temp_] := 
   (3*m1temp^3 + 13*m1temp^2*m2temp - 5*m1temp*m2temp^2 + m2temp^3)/
     (36*(m1temp - m2temp)^4*m2temp) + (m1temp^3*Log[m1temp])/
     (3*(-m1temp + m2temp)^5) + (m1temp^3*Log[m2temp])/(3*(m1temp - m2temp)^5)
 
D22func[m1temp_, m2temp_, m2temp_, m4temp_] := 
   (m1temp*m2temp*(5*m2temp^2 - 10*m2temp*m4temp - 7*m4temp^2) + 
      m2temp^2*(-m2temp^2 + 5*m2temp*m4temp + 2*m4temp^2) + 
      m1temp^2*(2*m2temp^2 - 7*m2temp*m4temp + 11*m4temp^2))/
     (18*(m1temp - m2temp)^3*(m2temp - m4temp)^3) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^4*(-m1temp + m4temp)) + 
    ((m1temp*m2temp^3*(m2temp - 4*m4temp)*m4temp + m2temp^4*m4temp^2 - 
       m1temp^3*m4temp^3 + m1temp^2*m2temp^2*(m2temp^2 - 4*m2temp*m4temp + 
         6*m4temp^2))*Log[m2temp])/(3*(m1temp - m2temp)^4*
      (m2temp - m4temp)^4) + (m4temp^3*Log[m4temp])/
     (3*(m1temp - m4temp)*(m2temp - m4temp)^4)
 
D22func[m1temp_, m2temp_, m3temp_, 0] := 
   (m1temp*(-3*m2temp + m3temp) + m3temp*(m2temp + m3temp))/
     (6*(m1temp - m3temp)^2*(m2temp - m3temp)^2) + 
    (m1temp^2*Log[m1temp])/(3*(m1temp - m2temp)*(-m1temp + m3temp)^3) + 
    (m2temp^2*Log[m2temp])/(3*(m1temp - m2temp)*(m2temp - m3temp)^3) + 
    ((m1temp^2*m2temp^2 - 3*m1temp*m2temp*m3temp^2 + (m1temp + m2temp)*
        m3temp^3)*Log[m3temp])/(3*(m1temp - m3temp)^3*(-m2temp + m3temp)^3)
 
D22func[m1temp_, m2temp_, m3temp_, m1temp_] := 
   ((2*m1temp^2)/(m1temp - m2temp) + 
      (m3temp*(m3temp*(m2temp + m3temp) + m1temp*(-5*m2temp + 3*m3temp)))/
       (m2temp - m3temp)^2)/(6*(-m1temp + m3temp)^3) + 
    (m1temp^2*(m1temp^2 + 2*m1temp*m3temp - 3*m2temp*m3temp)*Log[m1temp])/
     (3*(m1temp - m2temp)^2*(m1temp - m3temp)^4) + 
    (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)^2*(-m2temp + m3temp)^3) - 
    (m3temp*(m2temp*m3temp^3 + 2*m1temp*m3temp^2*(-2*m2temp + m3temp) + 
       m1temp^2*(3*m2temp^2 - 3*m2temp*m3temp + m3temp^2))*Log[m3temp])/
     (3*(m1temp - m3temp)^4*(-m2temp + m3temp)^3)
 
D22func[m1temp_, m2temp_, m3temp_, m2temp_] := 
   ((2*m2temp^2)/((m1temp - m2temp)*(m2temp - m3temp)^3) + 
      (m3temp*(m1temp*(-5*m2temp + m3temp) + m3temp*(3*m2temp + m3temp)))/
       ((m1temp - m3temp)^2*(-m2temp + m3temp)^3))/6 + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)^2*(-m1temp + m3temp)^3) + 
    (m2temp^2*(m2temp^2 - 3*m1temp*m3temp + 2*m2temp*m3temp)*Log[m2temp])/
     (3*(m1temp - m2temp)^2*(m2temp - m3temp)^4) + 
    (m3temp*(3*m1temp^2*m2temp^2 + m2temp*m3temp^2*(m2temp + 2*m3temp) + 
       m1temp*m3temp*(-3*m2temp^2 - 4*m2temp*m3temp + m3temp^2))*Log[m3temp])/
     (3*(m1temp - m3temp)^3*(m2temp - m3temp)^4)
 
D22func[m1temp_, m2temp_, m3temp_, m3temp_] := 
   (11*m1temp^2*m2temp^2 - 7*m1temp*m2temp*(m1temp + m2temp)*m3temp + 
      2*(m1temp^2 - 5*m1temp*m2temp + m2temp^2)*m3temp^2 + 
      5*(m1temp + m2temp)*m3temp^3 - m3temp^4)/(18*(m1temp - m3temp)^3*
      (-m2temp + m3temp)^3) - (m1temp^3*Log[m1temp])/
     (3*(m1temp - m2temp)*(m1temp - m3temp)^4) + (m2temp^3*Log[m2temp])/
     (3*(m1temp - m2temp)*(m2temp - m3temp)^4) + 
    ((m1temp^3/(m1temp - m3temp)^4 - m2temp^3/(m2temp - m3temp)^4)*
      Log[m3temp])/(3*(m1temp - m2temp))
 
D22func[m1temp_, m2temp_, m3temp_, m4temp_] := 
   (m3temp*(m3temp*(m1temp*(-3*m2temp + m3temp) + m3temp*(m2temp + m3temp)) + 
       (5*m1temp*m2temp - 3*(m1temp + m2temp)*m3temp + m3temp^2)*m4temp))/
     (6*(m1temp - m3temp)^2*(m2temp - m3temp)^2*(m3temp - m4temp)^2) + 
    (m1temp^3*Log[m1temp])/(3*(m1temp - m2temp)*(m1temp - m3temp)^3*
      (-m1temp + m4temp)) + (m2temp^3*Log[m2temp])/(3*(m1temp - m2temp)*
      (m2temp - m3temp)^3*(m2temp - m4temp)) + 
    (m3temp*(m1temp^2*m2temp^2*m3temp^2 - 3*m1temp*m2temp*m3temp^4 + 
       (m1temp + m2temp)*m3temp^5 + m3temp*(-3*m1temp^2*m2temp^2 + 
         m1temp*m2temp*(m1temp + m2temp)*m3temp + 6*m1temp*m2temp*m3temp^2 - 
         3*(m1temp + m2temp)*m3temp^3 + m3temp^4)*m4temp + 
       (3*m1temp^2*m2temp^2 - 3*m1temp*m2temp*(m1temp + m2temp)*m3temp + 
         (m1temp^2 + m1temp*m2temp + m2temp^2)*m3temp^2)*m4temp^2)*
      Log[m3temp])/(3*(m1temp - m3temp)^3*(-m2temp + m3temp)^3*
      (m3temp - m4temp)^3) + (m4temp^3*Log[m4temp])/
     (3*(m1temp - m4temp)*(-m2temp + m4temp)*(-m3temp + m4temp)^3)
