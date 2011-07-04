SOURCE=apartment.bitprophet.org:~/Music/iTunes/
TARGET=~/Music/iTunes/
rsync -av --exclude=Podcasts --exclude="Mobile Applications" $SOURCE $TARGET
