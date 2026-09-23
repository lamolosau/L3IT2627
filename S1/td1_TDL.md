# Exercice 1

# 1
$(0|1)^{*}00$

# 2
$(1|01)^{*}(00)^{*}(11|10)^{*}$
(L'idée c'est d'éviter d'avoir un 11 suivi plus loin d'un 00)

# 3
$0^{*}(11^{*}00^{*})^{*}1^{*}$
(On bloque l'apparition du motif 101)

# 4
$(0|1)^{*}00 | 0$
(Un nombre binaire divisible par 4 se termine forcément par 00, ou bien c'est 0)

# Exercice 2

# 1
Premier langage : $a | b | aa | ab | ba | bb$ (ou $(a|b)(\epsilon | a | b)$ )
Deuxième langage : $a | aa(a)^{*}b$

# 2
$(a | ba | bba)^{*}(b | bb | \epsilon)$
(On ne peut avoir que maximum deux 'b' de suite avant d'être coupé par un 'a' ou la fin du mot)

# 3
$b^{*}(a(bb)^{*}a)^{*}b^{*}$

# Exercice 3

# 1
Taille 0 : $\epsilon$ (le mot vide)
Taille 1 : $a$
Taille 2 : $aa, ba$
Taille 3 : $aaa, aba, baa$
Taille 4 : $aaaa, aaba, abaa, baaa, baba$

# 2
Taille 0 : aucun
Taille 1 : aucun
Taille 2 : $aa$
Taille 3 : aucun (il faut au moins a(aa)a ou a(ba)a donc minimum 4)
Taille 4 : $aaaa, abaa$

# Exercice 4

# 1
$a^{*}b^{*}$
(Tous les 'a' avant tous les 'b', s'il y en a)

# Exercice 5

# 1
10100010 : OUI (c'est $\epsilon$ suivi de 10, puis $\epsilon$ suivi de 10, puis 00 suivi de 10).
01110110 : NON (il y a "111", ce qui est impossible avec des blocs de 0 et de 11).
000111100 : OUI (bloc 00, bloc 011, bloc 11, bloc 00).

# 2
$(1|10)^{*}$ : L'ensemble des mots ne contenant pas deux "0" consécutifs et commençant par "1" (ou le mot vide).
$(0|10)^{*}(1 | \epsilon)$ : L'ensemble des mots ne contenant pas deux "1" consécutifs.

# 3
Mots de longueur 2 sans c : $(a|b)(a|b)$
Nombre impair de c : $(a|b)^{*}c((a|b)^{*}c(a|b)^{*}c)^{*}(a|b)^{*}$
Sans 'ab' comme facteur : $b^{*} (a|c b^{*})^{*} (c|a)^{*}$ (pas évident à écrire d'un coup, en gros on met des a et des c, mais un a ne doit jamais être suivi direct d'un b).

# Exercice 6

# 1
Des mots composés uniquement de 'a' ou uniquement de 'b' (ou le mot vide).

# 2
L'ensemble de tous les mots de longueur paire sur l'alphabet {a, b}.

# 3
Les mots sur {a, b} contenant au moins un 'a' et au moins un 'b', et le 'a' précède le 'b'.

# 4
La chaîne "ab" répétée un certain nombre de fois (ex: ab, abab, ababab...).

# 5
Tous les mots possibles sur l'alphabet {a, b}. (C'est équivalent à $(a|b)^{*}$ ).