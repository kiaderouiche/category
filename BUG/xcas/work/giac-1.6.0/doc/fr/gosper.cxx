gosperg(l,n):={
  si (n==0) alors avance(l);
sinon
  gosperg(l/2,n-1);tourne_gauche(60);
  gosperd(l/2,n-1);tourne_gauche(120);
  gosperd(l/2,n-1);tourne_droite(60);
  gosperg(l/2,n-1);tourne_droite(120);
  gosperg(l/2,n-1);gosperg(l/2,n-1);
  tourne_droite(60);
  gosperd(l/2,n-1);
  tourne_gauche(60);
fsi;
};

gosperd(l,n):={
  si (n==0) alors avance(l);
sinon
  tourne_droite(60);gosperg(l/2,n-1);
 tourne_gauche(60);
  gosperd(l/2,n-1);gosperd(l/2,n-1);
  tourne_gauche(120);gosperd(l/2,n-1);
  tourne_gauche(60);gosperg(l/2,n-1);
  tourne_droite(120);gosperg(l/2,n-1);
  tourne_droite(60);gosperd(l/2,n-1);
fsi;
};
gosperg2(l,n):={
  si (n==0) alors avance(l);tourne_droite(60);
sinon
  gosperg2(l/2,n-1);tourne_gauche(60);
  gosperd2(l/2,n-1);tourne_gauche(60);
  gosperd2(l/2,n-1);tourne_droite(60);
  gosperg2(l/2,n-1);tourne_droite(60);
  gosperg2(l/2,n-1);tourne_gauche(60);
  gosperg2(l/2,n-1);tourne_droite(60);
  gosperd2(l/2,n-1);
fsi;
};
gosperd2(l,n):={
  si (n==0) alors tourne_gauche(60);avance(l);
sinon
  gosperg2(l/2,n-1);tourne_gauche(60);
  gosperd2(l/2,n-1);tourne_droite(60);
  gosperd2(l/2,n-1);tourne_gauche(60);
  gosperd2(l/2,n-1);tourne_gauche(60);
  gosperg2(l/2,n-1);tourne_droite(60);
  gosperg2(l/2,n-1);tourne_droite(60);
  gosperd2(l/2,n-1);
fsi;
};
