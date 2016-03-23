/*********************************************
 * Modèle pour le problème du sudoku nxn
 * Modèle naif
 *********************************************/

using CP;


// --- Parametrage Solveur ---




// --- Données ---
int n = ...	;		// square order
range rsud = 1..n;
int instance[rsud][rsud] = ...;
int sq = Math.sqrt(n);

// --- Pretraitement ---


// --- Modèle ---
dvar int x[1..9][1..9] in 1..9; // unfixed variables

subject to {
  forall (i in 1..9, j in 1..9)
    if (instance[i,j] != 0)
      instance[i,j] == x[i,j]; // fix variables

  forall (idx in 1..9)
    allDifferent(all (i in 1..9) x[idx,i]) && // horizontal
    allDifferent(all (i in 1..9) x[i,idx]) &&  // vertical
    allDifferent(all (i in 1..sq, j in 1..sq) x[((idx-1) div sq)*sq + i][((idx-1) % sq)*sq + j]); // 3x3
};
// --- Main (pour trouver toutes les solution + statistiques) ---



// --- PostTraitement --- (affichage solution)
execute {
         cp.param.searchType="DepthFirst";
         cp.param.workers=1;
       }

 execute {
   writeln("  ", x);
 }

