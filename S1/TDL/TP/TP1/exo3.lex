%{
#include <stdio.h>
int nb_voyelles = 0;
int nb_consonnes = 0;
int nb_ponctuations = 0;
%}

VOYELLE [aeiouyAEIOUY]
CONSONNE [bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ]
PONCTUATION [.,!?;:]

%%

{VOYELLE} {
    nb_voyelles++;
  }

{CONSONNE} {
    nb_consonnes++;
  }

{PONCTUATION} {
    nb_ponctuations++;
  }

[ \t\n] {

  }

. {

  }

%%

int main() {

  yylex();
  
  printf("\n--- Bilan de l'analyse ---\n");
  printf("Voyelles : %d\n", nb_voyelles);
  printf("Consonnes : %d\n", nb_consonnes);
  printf("Ponctuations : %d\n", nb_ponctuations);

  return 0;
  }

int yywrap() {
    return 1;
  }

