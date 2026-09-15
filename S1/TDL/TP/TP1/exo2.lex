%{
int nb_mots = 0;
int nb_nombres = 0;
%}

MOT     [a-zA-ZÀ-ÿ]+
NOMBRE  [0-9]+([ \t]+[0-9]+)*(,[0-9]+)?

%%

{NOMBRE} {
  nb_nombres++;
  }

{MOT} {
  nb_mots++;
  }

.|\n {

  };

%%

int main() {
    yylex();
    printf("Nombre de mots : %d\n", nb_mots);
    printf("Nombre de nombres : %d\n", nb_nombres);
    return 0;
}

int yywrap() { 
    return 1; 
}
