# Déclaration de la fonction help
help() {
  # On affiche l'aide
  echo -e "Maximum prend en paramètre une liste de nombre et renvoie le plus grand de la liste"
  echo -e "Utilisation: maximum [LISTE DE NOMBRE]"
  exit
}

# On boucle sur toutes les options et on récupère l'option en cours dans la variable option
while getopts "h" option; do
  # Switch case sur le nom de l'option
  case "$option" in
    # Dans le cas ou l'option est h, on appelle la fonction help et on quitte le script
    h) help
      exit
      ;;
  esac
done

# On test si le script à reçu 0 argument
if [ "$#" -eq 0 ]; then
  # On appelle la fonction help et on quitte le script
  help
  exit
fi

# On instancie la variable maxi avec comme première valeur 0
maxi=0

# Pour chacun des nombres passés en arguments
for number in "$@"
do
  # On test si le nombre en cours est plus grand que celui stocké dans maxi
  if [ $number -gt $maxi ]; then
    # On attribue number à maxi
    maxi=$number
  fi
done

# On affiche le résultat
echo "Valeur max : $maxi"
