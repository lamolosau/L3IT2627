%{
int nb_nombres = 0;
int nb_mots_clefs = 0;
int nb_identificateurs = 0;
int nb_operateurs = 0;
int nb_ponctuations = 0;
int nb_erreurs = 0;
%}

NOMBRE  [0-9]+
MOTCLEF (begin|end)
IDENT   [a-zA-Z][a-zA-Z0-9]*
OP      (\+|-|\*|\/|==|=|<=|<|>=|>|!=)
PONCT   (;|,|\(|\))

%%

{NOMBRE} {
  nb_nombres++;
}

{MOTCLEF} {
  nb_mots_clefs++;
}

{IDENT} {
  nb_identificateurs++;
}

{OP} {
  nb_operateurs++;
}

{PONCT} {
  nb_ponctuations++;
}

[ \t\n]+ {

}

. {
  nb_erreurs++;
  printf("Erreur : caractere non reconnu '%s'\n", yytext);
}

%%

int main() {
  yylex();
  printf("Nombres : %d\n", nb_nombres);
  printf("Mots-clefs : %d\n", nb_mots_clefs);
  printf("Identificateurs : %d\n", nb_identificateurs);
  printf("Operateurs : %d\n", nb_operateurs);
  printf("Ponctuations : %d\n", nb_ponctuations);
  printf("Erreurs : %d\n", nb_erreurs);
  return 0;
}

int yywrap() {
  return 1;
}
