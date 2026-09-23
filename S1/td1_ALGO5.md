# 1. Procédure d'adjonction d'un élément dans un tas

L'idée est d'ajouter le nouvel élément à la fin de l'arbre (à l'indice `p + 1`), puis de le faire "remonter" (tamisage) tant qu'il est plus grand que son père.

```c
// On passe p par adresse (pointeur) pour pouvoir modifier la taille du tas
void ajouter(int T[], int *p, int valeur) {
    (*p)++;            // On augmente la taille du tas
    int i = *p;
    T[i] = valeur;     // On place la valeur à la fin

    // Phase de remontée : tant qu'on n'est pas à la racine 
    // et que l'élément est plus grand que son père (i / 2)
    while (i > 1 && T[i] > T[i / 2]) {
        // On échange le fils et le père
        int temp = T[i];
        T[i] = T[i / 2];
        T[i / 2] = temp;
        
        // On remonte l'indice
        i = i / 2;
    }
}
```

# 2. Procédure de suppression du maximum

Le maximum est toujours à la racine (`T[1]`). On le sauvegarde, on met le dernier élément de l'arbre à la racine, on réduit la taille de 1, puis on fait "descendre" la nouvelle racine à sa bonne place.

```c
int supprimer_max(int T[], int *p) {
    int max = T[1];    // Le max est à la racine
    T[1] = T[*p];      // On remplace la racine par le dernier élément
    (*p)--;            // On réduit la taille du tas

    // Phase de descente (tamisage)
    int i = 1;
    while (2 * i <= *p) { // Tant que le noeud a au moins un fils (gauche)
        int fils_max = 2 * i; // Fils gauche par défaut
        
        // Si le fils droit existe et est plus grand que le fils gauche
        if (fils_max < *p && T[fils_max + 1] > T[fils_max]) {
            fils_max++; // On pointe sur le fils droit
        }

        // Si le père est plus grand ou égal au plus grand des fils, c'est bon on s'arrête
        if (T[i] >= T[fils_max]) {
            break;
        }

        // Sinon, on échange avec le plus grand des fils
        int temp = T[i];
        T[i] = T[fils_max];
        T[fils_max] = temp;
        
        // On continue la descente
        i = fils_max;
    }
    
    return max; // On retourne l'ancienne racine
}
```

# 3. Procédure de tri par tas

En utilisant les deux fonctions précédentes, on peut trier un tableau in-place. L'astuce c'est que `supprimer_max` libère une case à la fin du tas, on peut donc y stocker le maximum ! À la fin, le tableau sera trié dans l'ordre croissant.

```c
// n est le nombre total d'éléments dans le tableau T (indexé de 1 à n)
void tri_par_tas(int T[], int n) {
    int p = 0; // Taille actuelle du tas

    // Étape 1 : Transformer le tableau quelconque en Tas
    // On ajoute virtuellement chaque élément un par un dans la partie "Tas" du tableau
    for (int i = 1; i <= n; i++) {
        // Pas besoin de passer i, on fait la remontée directement in-place
        p++;
        int j = p;
        while (j > 1 && T[j] > T[j / 2]) {
            int temp = T[j];
            T[j] = T[j / 2];
            T[j / 2] = temp;
            j = j / 2;
        }
    }

    // Étape 2 : Extraire le maximum un par un
    // A chaque extraction, on le place à la fin du tableau (qui est hors du tas)
    while (p > 1) {
        // Échange entre la racine (max) et le dernier élément du tas
        int temp = T[1];
        T[1] = T[p];
        T[p] = temp;
        
        // On réduit la taille du tas (le max est maintenant à sa place définitive)
        p--;

        // On fait redescendre la nouvelle racine (comme dans supprimer_max)
        int i = 1;
        while (2 * i <= p) {
            int fils_max = 2 * i;
            if (fils_max < p && T[fils_max + 1] > T[fils_max]) {
                fils_max++;
            }
            if (T[i] >= T[fils_max]) {
                break;
            }
            int t = T[i];
            T[i] = T[fils_max];
            T[fils_max] = t;
            i = fils_max;
        }
    }
}
```