# Exercice 1

J'ai fixé les dimensions à 256x256. J'utilise la fonction `rand()` pour générer des couleurs aléatoires.

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int w = 256, h = 256;
    srand(time(NULL));

    printf("P3\n%d %d\n255\n", w, h);

    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            printf("%d %d %d\n", rand() % 256, rand() % 256, rand() % 256);
        }
    }
    return 0;
}
```

# Exercice 2

Pour le triangle rectangle, c'est la diagonale inversée, donc l'équation `x + y < largeur`. Couleur Cyan (0 255 255) et fond noir.

```c
#include <stdio.h>

int main() {
    int w = 256, h = 256;
    printf("P3\n%d %d\n255\n", w, h);

    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            if (x + y < w) {
                printf("0 255 255\n");
            } else {
                printf("0 0 0\n");
            }
        }
    }
    return 0;
}
```

# Exercice 3

Pour le triangle isocèle, on part du centre (`w/2`). Plus on descend en `y` (vers le bas de l'image), plus la largeur autorisée en `x` augmente.

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int w = 256, h = 256;
    printf("P3\n%d %d\n255\n", w, h);

    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            int dist_centre = abs(x - (w / 2));
            if (dist_centre <= (y * w / 2) / h) {
                printf("0 255 255\n");
            } else {
                printf("0 0 0\n");
            }
        }
    }
    return 0;
}
```

# Exercice 4

Drapeau (Vert, Jaune, Rouge). J'ai pris 300x200 pour avoir un ratio classique. On divise simplement la largeur par 3.

```c
#include <stdio.h>

int main() {
    int w = 300, h = 200;
    printf("P3\n%d %d\n255\n", w, h);

    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            if (x < w / 3) {
                printf("0 255 0\n");
            } else if (x < 2 * w / 3) {
                printf("255 255 0\n");
            } else {
                printf("255 0 0\n");
            }
        }
    }
    return 0;
}
```

# Exercice 5

L'échiquier. On utilise le modulo 2 sur la somme des coordonnées des cases pour alterner blanc et noir.

```c
#include <stdio.h>

int main() {
    int w = 256, h = 256;
    int taille_case = 32;
    printf("P3\n%d %d\n255\n", w, h);

    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            int colonne = x / taille_case;
            int ligne = y / taille_case;

            if ((colonne + ligne) % 2 == 0) {
                printf("255 255 255\n");
            } else {
                printf("0 0 0\n");
            }
        }
    }
    return 0;
}
```

# Exercice 6

Le cercle. On utilise l'équation classique du cercle : $(x - cx)^2 + (y - cy)^2 \le r^2$.

```c
#include <stdio.h>

int main() {
    int w = 256, h = 256;
    int cx = 100, cy = 150, r = 50;

    printf("P3\n%d %d\n255\n", w, h);

    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            if ((x - cx) * (x - cx) + (y - cy) * (y - cy) <= r * r) {
                printf("255 255 255\n");
            } else {
                printf("0 0 0\n");
            }
        }
    }
    return 0;
}
```
