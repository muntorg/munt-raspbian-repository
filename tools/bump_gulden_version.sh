### Creating a package ###
cd gulden

### Update the files ###
cp ../../GuldenD files/opt/gulden/gulden/
cp ../../Gulden-cli files/opt/gulden/gulden/
cp ../../Gulden-tx files/opt/gulden/gulden/


### Edit debian/control ###
dch -im

### Build the package ###
dpkg-buildpackage

### Create the repo (Raspbian Jessie) ###
#cd ..
#cp gulden_*.deb repo/
#cd repo/
#rm dists/jessie/main/binary-armhf/Packages.gz
#mv *.deb pool/main/n
#dpkg-scanpackages -m pool | gzip > dists/jessie/main/binary-armhf/Packages.gz

### Check the repo ###
#zcat dists/jessie/main/binary-armhf/Packages.gz

### Create the repo (Raspbian Stretch) ###
cd ..
cp gulden_*.deb repo/
cd repo/
rm dists/stretch/main/binary-armhf/Packages.gz
mv *.deb pool/main/n
dpkg-scanpackages -m pool | gzip > dists/stretch/main/binary-armhf/Packages.gz

### Check the repo ###
zcat dists/stretch/main/binary-armhf/Packages.gz

### Repo address ###
#https://gulden.github.io/gulden-raspbian-repository/repo/
