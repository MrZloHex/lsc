#!/bin/bash

# making own directory
#sudo mkdir /usr/local/bin/lsc
# adding it into $PATH
#sed -i -e '$a# adding a path for LSC\nexport PATH="$PATH:/usr/local/bin/lsc"' $HOME/.$my_shell"rc"
#source $HOME/.$my_shell"rc"



## INSTALLING COMMANDS

cd ntui/com

# changing extention
for f in *.sh
do
	mv -- "$f" "${f%.sh}"
done

# installing in PATH directory and making they executable
for f in *
do
	chmod +x "$f"
	sudo mv "$f" /usr/local/bin
done

cd ..



## INSTALLING MAN PAGES

sudo mkdir /usr/local/man/man1

cd man

for f in *
do
	sudo mv "$f" /usr/local/man/man1
	sudo gzip /usr/local/man/man1/$f
done

sudo mandb

cd ..
cd ..

rm -rf ntui


echo "DONE!"

rm install.sh
