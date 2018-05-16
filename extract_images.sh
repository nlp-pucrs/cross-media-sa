# Comando para contar postagens existentes
find tier-1/16* -type f | grep -v self | wc -l

# Substitue > por quebra de linha (uma imagem por linha)
find tier-1/16* -type f | xargs sed -i 's/>/\n/g'

# Comando para salvar lista de imagens dos posts
grep -Ro "http[^\"]*.jpg" tier-1/16* > tier-1-images/images.log

# Comando para salvar lista de posts com só uma imagem s1600
grep -Roc "http[^\"]*blogspot[^\"]*s1600[^\"]*.jpg" tier-1/16* | grep ":1" > tier-1-images/posts.log

# Extrai somente links das imagens s1600 do tier16
grep -Roc "http[^\"]*blogspot[^\"]*s1600[^\"]*.jpg" tier-1/16* | grep ":1" | awk '{split($0,a,":"); print a[1]}' | xargs grep -o -m11
 "http[^\"]*blogspot[^\"]*s1600[^\"]*.jpg" > tier-1-images/images.log

# Comando para fazer download das imagens
cat images.log | awk '{split($0,a,"n:"); print a[2]}' > images.list
wget -nc -T 2 -t 1 -x -i images.list

# Salva Lista de Posts
cat tier-16-images/images.log | awk '{split($0,a,"."); print a[1]}' > post.list
cat post.list | awk '{split($0,a,"/"); print a[4]}' > post.log