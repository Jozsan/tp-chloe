# On test si un répertoire de sauvegarde existe déjà
if [ ! -d "./sauvegarde" ]; then
  # On crée le répertoire de sauvegarde
  mkdir ./sauvegarde
fi

# Pour chacun des noms de fichier passé en paramètre
for filename in "$@"
do
  # On test si le fichier éxiste
  if [ ! -f "$filename" ] || [ -d $filename ]; then
    echo "Le fichier $filename est absent ou il s'agit d'un répertoire"
  else
    # On copie le fichier dans le répertoire de sauvegarde
    cp "$filename" "./sauvegarde/$filename"
  fi
done
