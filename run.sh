
rm -rf docs

npm run clear
npm run dl


mv DATA/html/fahrplan.zeteco.ch docs
cp -r public/* docs


# -----------------------------------------
# copy original files to DATA
# -----------------------------------------

soure="docs"
destination="DATA/fahrplan.zeteco.ch"

rm -rf "$destination"
mkdir -p "$destination"

destination=$(cd -- "$destination" && pwd) # make it an absolute path
cd -- "$source" &&
find "$soure" -type f -name "*.orig" -exec sh -c '

  dest_dir="${1#docs/}"
  dest_dir="$0/$dest_dir"
  dest_dir="${dest_dir%/*}"

  echo "$1 --- $dest_dir"
  mkdir -p "$dest_dir"
  mv "$1" "$dest_dir"

' "$destination" {} \;
# -----------------------------------------