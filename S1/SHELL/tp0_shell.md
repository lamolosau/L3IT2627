# 1 et 2 : Login et Password

C'est fait. Je me suis loggé et j'ai changé mon mot de passe avec la commande `yppasswd`.
Ensuite j'ai fait le ssh pour le mot de passe Windows :
`ssh slinux2` puis `smbpasswd` et `exit`.

# 4 Premier Programme Shell

J'ai créé le fichier sh1.sh avec l'éditeur et j'ai tapé le code du TP :

```sh
#!/bin/sh
echo "Salut, voici un p'tit programme, achment util"
```

Ensuite j'ai ajouté les droits d'exécution comme demandé et je l'ai testé :
`chmod ug+x sh1.sh`
`./sh1.sh`
Ça affiche bien la phrase.

# 5 Premier Programme C

J'ai créé le fichier hello.c :

```c
#include <stdio.h>
void main(void)
{
printf("Hello World!");
}
```

Je l'ai compilé avec gcc :
`gcc -o hello hello.c`
Puis je l'ai lancé en tapant `./hello` et ça marche, ça affiche Hello World!.
