# Exercice 1

- $A=\{x\in\mathbb{R}/x>0\}$ et $B=\{x\in\mathbb{R}/x\le|x|\}$
Non, $A \neq B$. Pour tout $x$ dans $\mathbb{R}$, on a toujours $x \le |x|$. Donc $B = \mathbb{R}$, alors que $A = ]0, +\infty[$.

- $A=\{x\in\mathbb{R}/x>0\}$ et $B=\{x\in\mathbb{R}/x\ge|x|\}$
Non, $A \neq B$. La condition $x \ge |x|$ n'est vraie que pour les nombres positifs ou nuls. Donc $B = [0, +\infty[$, alors que $A = ]0, +\infty[$ (le zéro est exclu de $A$ mais inclus dans $B$).

- $A = \mathbb{Z}$ et $B=\{x\in\mathbb{Z}/x^{2}-x \text{ pair}\}$
Oui, $A = B$. $x^2 - x = x(x-1)$. C'est le produit de deux entiers consécutifs, c'est donc toujours pair. $B$ correspond bien à tout $\mathbb{Z}$.

# Exercice 2

- Est-ce que $\{a\}\in\{a,b,c\}$ ? 
Non. L'élément $a$ appartient à l'ensemble ($a \in \{a,b,c\}$), mais le sous-ensemble $\{a\}$ est inclus dans l'ensemble ($\{a\} \subset \{a,b,c\}$).

- Quels sont les éléments de $\mathcal{P}(\{a,b,c\})$ ?
Il y a $2^3 = 8$ éléments : $\{ \emptyset, \{a\}, \{b\}, \{c\}, \{a,b\}, \{a,c\}, \{b,c\}, \{a,b,c\} \}$.

# Exercice 3

On suppose que $A \subset B$. 
Soit $X \in \mathcal{P}(A)$. Par définition, $X \subset A$.
Comme $X \subset A$ et $A \subset B$, par transitivité on a $X \subset B$.
Donc $X \in \mathcal{P}(B)$. 
Conclusion : $\mathcal{P}(A) \subset \mathcal{P}(B)$.

# Exercice 4

$\mathbb{B}=\{0,1\}$
- Éléments de $\mathcal{P}(\mathbb{B})$ : 
$\{ \emptyset, \{0\}, \{1\}, \{0,1\} \}$

- Éléments de $\mathcal{P}(\mathcal{P}(\mathbb{B}))$ : 
Il y en a $2^4 = 16$. Ce sont toutes les combinaisons des 4 éléments du dessus :
$\emptyset$, 
$\{\emptyset\}, \{\{0\}\}, \{\{1\}\}, \{\{0,1\}\}$, 
$\{\emptyset, \{0\}\}, \{\emptyset, \{1\}\}, \{\emptyset, \{0,1\}\}, \{\{0\}, \{1\}\}, \{\{0\}, \{0,1\}\}, \{\{1\}, \{0,1\}\}$, 
$\{\emptyset, \{0\}, \{1\}\}, \{\emptyset, \{0\}, \{0,1\}\}, \{\emptyset, \{1\}, \{0,1\}\}, \{\{0\}, \{1\}, \{0,1\}\}$, 
$\{ \emptyset, \{0\}, \{1\}, \{0,1\} \}$.

# Exercice 5

- $\mathcal{P}(\emptyset) = \{ \emptyset \}$ (1 élément)
- $\mathcal{P}(\mathcal{P}(\emptyset)) = \mathcal{P}(\{ \emptyset \}) = \{ \emptyset, \{\emptyset\} \}$ (2 éléments)
- $\mathcal{P}(\mathcal{P}(\mathcal{P}(\emptyset))) = \{ \emptyset, \{\emptyset\}, \{\{\emptyset\}\}, \{\emptyset, \{\emptyset\}\} \}$ (4 éléments)

# Exercice 6

# 1
$\mathcal{P}(A\setminus B)=\mathcal{P}(A)\setminus\mathcal{P}(B)$ ? 
Non. L'ensemble vide $\emptyset$ appartient toujours à $\mathcal{P}(A\setminus B)$. Mais il est retiré dans $\mathcal{P}(A)\setminus\mathcal{P}(B)$ car il appartient aussi à $\mathcal{P}(B)$.

# 2
$\mathcal{P}(A)\subseteq\mathcal{P}(\mathcal{P}(A))$ ? 
Non. Contre-exemple avec $A=\{1\}$. 
$\mathcal{P}(A) = \{\emptyset, \{1\}\}$. L'élément $\{1\}$ appartient à $\mathcal{P}(A)$, mais n'appartient pas à $\mathcal{P}(\mathcal{P}(A))$ (qui contient des ensembles d'ensembles, comme $\{\{1\}\}$).

# Exercice 7

# 1
$\mathcal{P}(A\cup B)=\mathcal{P}(A)\cup\mathcal{P}(B)$ ? 
Non. Si $A=\{1\}$ et $B=\{2\}$, alors $A\cup B = \{1,2\}$. L'élément $\{1,2\}$ est dans $\mathcal{P}(A\cup B)$ mais n'est ni dans $\mathcal{P}(A)$ ni dans $\mathcal{P}(B)$.

# 2
$\mathcal{P}(A\cap B)=\mathcal{P}(A)\cap\mathcal{P}(B)$ ? 
Oui. 
$X \in \mathcal{P}(A\cap B) \iff X \subset (A\cap B) \iff (X \subset A \text{ et } X \subset B) \iff (X \in \mathcal{P}(A) \text{ et } X \in \mathcal{P}(B)) \iff X \in \mathcal{P}(A)\cap\mathcal{P}(B)$.

# 3
$\mathcal{P}(A\times B)=\mathcal{P}(A)\times\mathcal{P}(B)$ ? 
Non. Les objets n'ont pas la même forme. Un élément de $\mathcal{P}(A\times B)$ est un ensemble de couples, alors qu'un élément de $\mathcal{P}(A)\times\mathcal{P}(B)$ est un couple d'ensembles.

# Exercice 8

# 1
$A\Delta B=\overline{A}\Delta\overline{B}$
VRAI. $\overline{A}\Delta\overline{B} = (\overline{A} \setminus \overline{B}) \cup (\overline{B} \setminus \overline{A}) = (\overline{A} \cap B) \cup (\overline{B} \cap A) = (B \setminus A) \cup (A \setminus B) = A\Delta B$.

# 2
$A\Delta(B\cap C)=(A\Delta B)\cap(A\Delta C)$
FAUX. Prenons $A=\{1\}, B=\{1\}, C=\{2\}$. 
À gauche : $B\cap C = \emptyset$, donc $A\Delta \emptyset = \{1\}$.
À droite : $A\Delta B = \emptyset$ et $A\Delta C = \{1,2\}$. L'intersection est $\emptyset$. 
$\{1\} \neq \emptyset$.