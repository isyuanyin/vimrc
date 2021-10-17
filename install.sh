#!/bin/bash

set -e

ROOT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

# read -t 5 -p "press any key to continue (wait for 3 mins)..." answer

test -d ~/.vim || mkdir -p ~/.vim

link_vimrcs() {
	test -d ~/.vim/vimrcs/ || mkdir -p ~/.vim/vimrcs

	cp -r autoload ~/.vim
	cp -r plugin ~/.vim

	filelist=$(ls vimrcs)

	echo '" DO NOT EDIT THIS FILE' > ~/.vimrc

	for file in $filelist
	do
		link_name=~/.vim/vimrcs/${file}

		test -f ${link_name}  && rm -f ${link_name}

		ln ${ROOT_DIR}/vimrcs/${file} ${link_name}

		echo "source ~/.vim/vimrcs/${file}" >> ~/.vimrc
	done
}

link_install() {
	link_vimrcs
	echo "Link install successfully! Enjoy :-)"
}

normal_install() {
	cp -r ./vimrcs ~/.vim/

	echo '" DO NOT EDIT THIS FILE' > ~/.vimrc

	for file in $filelist
	do
		echo "source ~/.vim/vimrcs/${file}" >> ~/.vimrc
	done


	echo "Installed the vim configuration successfully! Enjoy :-)"
}

direct_install() {
	echo '" DO NOT EDIT THIS FILE' >> ~/.vimrc
	cat vimrcs/basic.vim >> ~/.vimrc
	cat vimrcs/plugins.vim >> ~/.vimrc
}

developp_install() {
	echo "source ${ROOT_DIR}/init.vim" > ~/.vimrc
	echo "Installed the vim configuration successfully!"
}

main() {
	if [ $# == 0 ]
	then
		normal_install
	elif [ $# == 1 ]
	then
		case $1 in
		link)
			link_install
		;;
		dev*)
			developp_install
		;;
		normal)
			normal_install
		;;
		direct)
			direct_install
		;;
		*)
				echo "Error: wrong parameter. Please enter again."
			;;
		esac
	else
		echo "Error: too many parameters!"
	fi

cp -r plugin ~/.vim/
cp -r autoload ~/.vim/
}

main $@

SET_COLOR="export TERM=xterm-256color"
if [ -f ~/.bashrc ]
then
	case "$TERM" in
	xterm-color|*-256color)
		color_prompt=yes
		;;
	*)
		echo ${SET_COLOR} >> ~/.bashrc
		;;
	esac
fi
