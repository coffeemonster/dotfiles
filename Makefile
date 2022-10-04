# Makefile to install dotfiles
BASH_FILES := .bashrc .bash_profile .gitconfig .gitignore .gitmodules .inputrc .screenrc .vim .vimrc
PROJ_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
DEST := ${HOME}

.PHONEY: all backup clean install

all: backup clean install

backup:
	@# If the file exists but isn't a symlink, back it up!
	@for i in ${BASH_FILES}; do 			\
		if [[ ! -L  "${DEST}/$$i" ]]; then 	\
			echo "Backing up ${DEST}/$$i to ${DEST}/$$i.bak"; \
			cp ${DEST}/$$i{,.bak}; 			\
		fi;									\
   	done 

clean:
	@for i in ${BASH_FILES}; do	rm "${DEST}/$$i"; done
 
install:
	@for i in ${BASH_FILES}; do ln -vs "${PROJ_DIR}/$$i" "${DEST}/$$i"; done
