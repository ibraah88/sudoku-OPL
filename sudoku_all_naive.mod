/*********************************************
 * Modèle pour le problème du sudoku nxn
 * Modèle naif
 *********************************************/

using CP;


// --- Parametrage Solveur ---

execute {
         cp.param.searchType="DepthFirst";
         cp.param.workers=1;
       }


// --- Données ---
int n = ...	;		// square order
range rsud = 1..n;
int instance[rsud][rsud] = ...;
// --- Pretraitement ---


int sq = ftoi(sqrt(n));


// --- Modèle ---
dvar int x[1..n][1..n] in 1..n;

subject to {
  forall (i in 1..n, j in 1..n)
    if (instance[i,j] != 0)
      instance[i,j] == x[i,j]; 

  forall (idx in 1..n)
    allDifferent(all (i in 1..n) x[idx,i]) && // horizontale diff
    allDifferent(all (i in 1..n) x[i,idx]) &&  // verticale diff
    allDifferent(all (i in 1..sq, j in 1..sq) x[((idx-1) div sq)*sq + i][((idx-1) % sq)*sq + j]); // 
};
// --- Main (pour trouver toutes les solution + statistiques) ---



// --- PostTraitement --- (affichage solution)


 execute { 
   writeln("        ", x);
 }

