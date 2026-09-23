# Exercice 1

```c
#include <stdio.h>

int main() {
    int batonnets = 10;
    int joueur = 1;
    int prise;

    while(batonnets > 0) {
        int max = (batonnets < 3) ? batonnets : 3;
        printf("Joueur %d, choisir entre 1 et %d bâtonnets: ", joueur, max);
        scanf("%d", &prise);

        if(prise >= 1 && prise <= max) {
            batonnets -= prise;
            if(batonnets == 0) {
                printf("Le joueur %d a gagné\n", (joueur == 1) ? 2 : 1);
            }

            joueur = (joueur == 1) ? 2 : 1;
        }
    }
    return 0;
}
```

# Exercice 2

```c
#include <stdio.h>

int main() {
    int num1, num2;
    scanf("%d%d", &num1, &num2);
    printf("num1=%d\n", num1);
    printf("num2= %d\n", num2);

    num1 = num1 ^ num2;
    num2 = num1 ^ num2;
    num1 = num1 ^ num2;

    printf("num1 aprés_le_swap = %d\n", num1);
    printf("num2 aprés_le_swap=%d\n", num2);
    return 0;
}
```

(On peut aussi le faire avec l'addition/soustraction : `num1 = num1 + num2; num2 = num1 - num2; num1 = num1 - num2;`)

# Exercice 3

```c
#include <stdio.h>

int main() {
    int n;
    printf("Entrer un nombre: ");
    scanf("%d", &n);

    if (n > 0 && (n & (n - 1)) == 0) {
        printf("C'est une puissance de 2\n");
    } else {
        printf("Ce n'est pas une puissance de 2\n");
    }
    return 0;
}
```

# Exercice 4

```c
#include <stdio.h>

void print_bin(unsigned int n) {
    if (n > 1) {
        print_bin(n / 2);
    }
    printf("%u", n % 2);
}

int main() {
    unsigned int num = 42;
    printf("Num=");
    scanf("%u", &num);

    printf("0b");
    if(num == 0) {
        printf("0");
    } else {
        print_bin(num);
    }
    printf("\n");

    return 0;
}
```

# Exercice 5

```c
#include <stdio.h>

int main() {
    unsigned int num = 42;
    printf("Num=");
    scanf("%u", &num);
    printf("%x\n", num);

    num = ((num >> 1) & 0x55555555) | ((num & 0x55555555) << 1);
    num = ((num >> 2) & 0x33333333) | ((num & 0x33333333) << 2);
    num = ((num >> 4) & 0x0F0F0F0F) | ((num & 0x0F0F0F0F) << 4);
    num = ((num >> 8) & 0x00FF00FF) | ((num & 0x00FF00FF) << 8);
    num = ((num >> 16) & 0x0000FFFF) | ((num & 0x0000FFFF) << 16);

    printf("%x\n", num);
    return 0;
}
```
