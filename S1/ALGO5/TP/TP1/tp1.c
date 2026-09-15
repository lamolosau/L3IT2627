#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int *generer_tableau(int taille) {
  if (taille <= 0) {
    return NULL;
  }

  int *tab = (int *)malloc(taille * sizeof(int));

  if (tab == NULL) {
    printf("Erreur d'allocation mémoire.\n");
    return NULL;
  }

  for (int i = 0; i < taille; i++) {
    tab[i] = rand() % 1000;
  }

  return tab;
}

void afficher_tableau(int *tab, int taille) {
  if (tab == NULL)
    return;

  printf("[");
  for (int i = 0; i < taille; i++) {
    printf("%d", tab[i]);
    if (i < taille - 1) {
      printf(", ");
    }
  }
  printf("]\n");
}

bool est_trie(int *tab, int taille) {
  if (tab == NULL || taille <= 1) {
    return true;
  }

  for (int i = 0; i < taille - 1; i++) {
    if (tab[i] > tab[i + 1]) {
      return false;
    }
  }
  return true;
}

int main() {
  int taille = 15;

  printf("--- Test des fonctions utilitaires ---\n");

  int *mon_tableau = generer_tableau(taille);

  if (mon_tableau != NULL) {
    printf("Tableau genere :\n");
    afficher_tableau(mon_tableau, taille);

    if (est_trie(mon_tableau, taille)) {
      printf("-> Le tableau est trie.\n");
    } else {
      printf("-> Le tableau n'est pas trie.\n");
    }

    free(mon_tableau);
  }

  return 0;
}
