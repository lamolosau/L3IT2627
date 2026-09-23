# Exercice 1

```lex
%%
^[ \t]+     ; /* Supprime tous les espaces en début de ligne (ne fait rien) */
[ \t]+      { printf(" "); } /* Remplace les espaces multiples par un seul */
.|\n        { printf("%s", yytext); } /* Affiche le reste normalement */
%%
```

# Exercice 2

```lex
%{
int nb_mots = 0, nb_nombres = 0;
%}
%%
[0-9]+([ \t][0-9]+)*(,[0-9]+)?   { nb_nombres++; } /* Gère les nombres comme 12 345,45 */
[a-zA-Z]+                        { nb_mots++; }
.|\n                             ; /* On ignore le reste */
%%
int main() {
    yylex();
    printf("Mots = %d, Nombres = %d\n", nb_mots, nb_nombres);
    return 0;
}
```

# Exercice 3

```lex
%{
int voyelles = 0, consonnes = 0, ponctuations = 0;
%}
%%
[aeiouyAEIOUY]                               { voyelles++; }
[bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ]   { consonnes++; }
[.,;:!?]                                     { ponctuations++; }
.|\n                                         ;
%%
int main() {
    yylex();
    printf("Voyelles: %d, Consonnes: %d, Ponctuation: %d\n", voyelles, consonnes, ponctuations);
    return 0;
}
```

# Exercice 4

```lex
%%
begin|end               { printf("mot-clef: %s\n", yytext); }
[0-9]+                  { printf("nombre: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]*    { printf("identificateur: %s\n", yytext); }
"+"|"-"|"*"|"/"         { printf("operateur: %s\n", yytext); }
[ \t\n]+                ; /* ignorer les espaces */
.                       { printf("erreur: %s\n", yytext); }
%%
```

# Exercice 5

```lex
%%
\"([^\"\\]|\\.)*\"      { printf("chaine: %s\n", yytext); } /* Ajout pour les chaines avec " et \" */
begin|end               { printf("mot-clef: %s\n", yytext); }
[0-9]+                  { printf("nombre: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]*    { printf("identificateur: %s\n", yytext); }
"+"|"-"|"*"|"/"         { printf("operateur: %s\n", yytext); }
[ \t\n]+                ; 
.                       { printf("erreur: %s\n", yytext); }
%%
```

# Exercice 6

Pour évaluer du postfixe (ex: `3 4 +`), il faut utiliser une pile en C dans les définitions :

```lex
%{
int pile[100];
int sommet = 0;
void push(int v) { pile[sommet++] = v; }
int pop() { return pile[--sommet]; }
%}
%%
[0-9]+      { push(atoi(yytext)); }
"+"         { push(pop() + pop()); }
"*"         { push(pop() * pop()); }
"-"         { int b = pop(); int a = pop(); push(a - b); }
"/"         { int b = pop(); int a = pop(); push(a / b); }
\n          { printf("Resultat : %d\n", pop()); }
[ \t]+      ;
.           ;
%%
```