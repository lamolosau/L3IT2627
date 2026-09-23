# Partie 1 Commandes de base

## Exercice 1
# 1
echo "premiere phrase du fichier" > fich1
echo "deuxieme phrase du fichier" >> fich1

# 2
cat fich1

# 3
ls -l fich1 
du -b fich1
stat -c %s fich1
(Les commandes renvoient toutes la taille du fichier, stat -c %s donne la taille logique en octets, du donne la taille sur le disque).

## Exercice 2
# 1
cp fich1 fich2

# 2
mv fich2 fich3

## Exercice 3
# 1
mkdir rep1

# 2
mv fich3 rep1/

# 3
cp fich1 rep1/copie

# 4
ls rep1

## Exercice 4
# 1
rmdir rep1
Ça met une erreur "Directory not empty" (le dossier n'est pas vide donc rmdir refuse de le supprimer).

# 2
rm rep1/*

# 3
rmdir rep1


# Partie 2 Application

## Exercice 1
# 1
mkdir Mediatheque

# 2
mkdir Mediatheque/Musique Mediatheque/Films Mediatheque/Livres

# 3
ls -R Mediatheque

## Exercice 2
# 1 (sans éditeur, avec cat >)
cat > Mediatheque/Musique/playlist.txt
(Je tape mes 5 morceaux de musique puis je fais Ctrl+D pour sauvegarder)

# 2
echo "morceau 6" >> Mediatheque/Musique/playlist.txt
echo "morceau 7" >> Mediatheque/Musique/playlist.txt

# 3
cat Mediatheque/Musique/playlist.txt
head -n 3 Mediatheque/Musique/playlist.txt
tail -n 2 Mediatheque/Musique/playlist.txt

## Exercice 3
# 1
ls -l Mediatheque/Musique/playlist.txt
du Mediatheque/Musique/playlist.txt
stat -c %s Mediatheque/Musique/playlist.txt

# 2
touch silence.txt
ls -l silence.txt
du silence.txt
Je constate que la taille "logique" est de 0 octets (le fichier est vide), mais sur le disque il occupe un minimum d'espace (souvent 4Ko selon le système) pour exister physiquement.

## Exercice 4
# 1
cp Mediatheque/Musique/playlist.txt Mediatheque/Musique/playlist_sauvegarde.txt

# 2
mv Mediatheque/Musique/playlist_sauvegarde.txt Mediatheque/Livres/

# 3
mv Mediatheque/Livres/playlist_sauvegarde.txt Mediatheque/Livres/archive.txt

# 4
cp Mediatheque/Livres/archive.txt Mediatheque/Films/archive_films.txt

## Exercice 5
# 1
rmdir Mediatheque/Films
Ça met une erreur parce que rmdir ne supprime que les répertoires vides, et là il y a archive_films.txt dedans.

# 2
rm Mediatheque/Films/archive_films.txt
rmdir Mediatheque/Films

# 3
rm -r Mediatheque