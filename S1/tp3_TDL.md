# Exercice 1

```
%{
int num_ligne = 1;
%}
%%
^[ \t]*\n   { ECHO; } /* Laisse les lignes blanches telles quelles sans les numéroter */
^.+         { printf("%d: %s", num_ligne++, yytext); } /* Numérote les lignes non vides */
\n          { printf("\n"); }
%%

```

# Exercice 2

```
%%
"{"[^}]*"}"   { printf("%s\n", yytext); } /* Affiche tout ce qui est entre { et } */
.|\n          ; /* Ignore tout le reste du texte */
%%

```

# Exercice 3

```
%%
si|sinon|alors          { printf("Mot-clef : %s\n", yytext); }
[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?  { printf("Nombre (scientifique) : %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]*    { printf("Identifiant : %s\n", yytext); }
"<"|">"|"<="|">="|"=="|"!="  { printf("Operateur relationnel : %s\n", yytext); }
[ \t\n]+                ; /* Ignore les espaces, tabulations et sauts de ligne */
.                       { printf("Erreur/Autre : %s\n", yytext); }
%%
int main() {
    yylex();
    return 0;
}

```