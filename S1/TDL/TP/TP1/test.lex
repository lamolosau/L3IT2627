/* ==================================================
 * PARTIE 1 : LES DÉFINITIONS
 * ================================================== */
%{
/* 1.A : Le code C (inclusions et variables globales) */
/* Tout ce qui est entre %{ et %} sera copié tel quel au début du programme C final. */
#include <stdio.h>
int ma_variable_globale = 0;
%}

/* 1.B : Les définitions Lex (Macros) */
/* C'est ici qu'on donne des noms faciles à mémoriser à des expressions régulières. */
NOM_DE_MACRO    [a-zA-Z]+

%%
/* ==================================================
 * PARTIE 2 : LES RÈGLES
 * ================================================== */
/* C'est le cœur du programme. Format : Motif { Action C } */

{NOM_DE_MACRO}  { 
                  /* Code C exécuté quand la macro est trouvée. */ 
                  /* On utilise yytext pour récupérer le texte exact lu. */
                }
[0-9]+          { 
                  /* On peut aussi mettre l'expression régulière directement */ 
                }
.               { 
                  /* Le point représente "n'importe quel autre caractère". */
                  /* Souvent utilisé pour ignorer ce qu'on ne cherche pas. */
                }

%%
/* ==================================================
 * PARTIE 3 : LE CODE UTILISATEUR (CODE C)
 * ================================================== */
/* C'est un programme C classique qui contient la fonction principale main(). */

int main() {
    // 1. On peut faire des choses avant l'analyse
    printf("Lancement de l'analyse...\n");

    // 2. On appelle obligatoirement yylex() pour démarrer la lecture
    yylex(); 

    // 3. On affiche les résultats après la fin de la lecture
    printf("Analyse terminée. Résultat : %d\n", ma_variable_globale);
    
    return 0;
}

// Fonction obligatoire : indique ce que fait Lex à la fin du fichier lu.
// Renvoyer 1 signifie "Le fichier est fini, arrête-toi".
int yywrap() {
    return 1;
}
