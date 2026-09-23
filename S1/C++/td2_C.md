# Exercice 1

Pour utiliser un nombre variable de paramètres, il faut utiliser la bibliothèque `<stdarg.h>`. On parcourt les arguments un à un pour calculer le polynôme.

```c
#include <stdio.h>
#include <stdarg.h>

double evaluePoly(int nb_coeffs, double x, ...) {
    va_list args;
    va_start(args, x);

    double resultat = 0.0;
    double puissance_x = 1.0;

    for (int i = 0; i < nb_coeffs; i++) {
        double coeff = va_arg(args, double);
        resultat += coeff * puissance_x;
        puissance_x *= x;
    }

    va_end(args);
    return resultat;
}

int main() {
    printf("%lf\n", evaluePoly(3, 1.0, 1.0, 2.0, 3.0));
    printf("%lf\n", evaluePoly(4, 4.2, 1.0, 2.0, 3.0, 4.0));
    return 0;
}
```

# Exercice 2

```c
#include <stdio.h>

int pgcdIte(int a, int b) {
    int reste;
    while (b != 0) {
        reste = a % b;
        a = b;
        b = reste;
    }
    return a;
}

int pgcdRec(int a, int b) {
    if (b == 0) {
        return a;
    }
    return pgcdRec(b, a % b);
}

int main() {
    printf("%d\n", pgcdIte(252, 105));
    printf("%d\n", pgcdRec(252, 105));
    return 0;
}
```

# Exercice 3

Ici, on va passer des pointeurs de fonctions en paramètres génériques (`void*`) puis les "caster" selon le type avant de les utiliser avec `va_arg`.

```c
#include <stdio.h>
#include <stdarg.h>

int cmpInt(int a, int b) { return a - b; }
void printInt(int a) { printf("%d\n", a); }

int cmpDouble(double a, double b) {
    if (a < b) return -1;
    if (a > b) return 1;
    return 0;
}
void printDouble(double a) { printf("%lf\n", a); }

void searchMin(int n, char type, void* cmp_ptr, void* print_ptr, ...) {
    va_list args;
    va_start(args, print_ptr);

    if (type == 'i') {
        int (*cmp)(int, int) = (int (*)(int, int))cmp_ptr;
        void (*print)(int) = (void (*)(int))print_ptr;

        int min = va_arg(args, int);
        for (int i = 1; i < n; i++) {
            int val = va_arg(args, int);
            if (cmp(val, min) < 0) min = val;
        }
        print(min);
    }
    else if (type == 'd') {
        int (*cmp)(double, double) = (int (*)(double, double))cmp_ptr;
        void (*print)(double) = (void (*)(double))print_ptr;

        double min = va_arg(args, double);
        for (int i = 1; i < n; i++) {
            double val = va_arg(args, double);
            if (cmp(val, min) < 0) min = val;
        }
        print(min);
    }

    va_end(args);
}

int main() {
    searchMin(5, 'i', cmpInt, printInt, 4, 2, 3, 7, 1);
    searchMin(4, 'd', cmpDouble, printDouble, 1.1, 2.7, 3.0, 7.0);
    return 0;
}
```

# Exercice 4

Pour éviter le test "qui joue" dans la boucle principale, la meilleure astuce est d'utiliser un tableau de pointeurs de fonctions qui partagent exactement la même signature (les mêmes paramètres), puis d'appeler l'index correspondant au joueur actuel.

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int tour_humain(int batonnets, int max) {
    int prise;
    do {
        printf("\nIl reste %d bâtonnets.\nJoueur humain, choisir entre 1 et %d : ", batonnets, max);
        scanf("%d", &prise);
    } while (prise < 1 || prise > max);
    return prise;
}

int tour_ia(int batonnets, int max) {
    int prise;

    int cible = (batonnets - 1) % 4;

    if (cible > 0 && cible <= max) {
        prise = cible;
    } else {
        prise = (rand() % max) + 1;
    }
    printf("\nIl reste %d bâtonnets.\nL'IA prend %d bâtonnet(s).\n", batonnets, prise);
    return prise;
}

int main() {
    srand(time(NULL));
    int batonnets = 15;

    int (*joueurs[2])(int, int) = { tour_humain, tour_ia };
    char* noms_joueurs[2] = { "L'Humain", "L'IA" };

    int joueur_actuel = rand() % 2;

    while (batonnets > 0) {
        int max = (batonnets < 3) ? batonnets : 3;

        int prise = joueurs[joueur_actuel](batonnets, max);

        batonnets -= prise;
        if (batonnets == 0) {
            int vainqueur = (joueur_actuel + 1) % 2;
            printf("\n%s a gagné !\n", noms_joueurs[vainqueur]);
        }

        joueur_actuel = (joueur_actuel + 1) % 2;
    }

    return 0;
}
```
