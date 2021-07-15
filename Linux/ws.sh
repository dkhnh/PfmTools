# .ws
# Command: ws [PROJECT]
function ws() {
	if [ "$1" != "" ]; then
		cd $WS_HOME/Projects/$1
	else
		cd $WS_HOME
	fi
}

# ws2
# Command: ws2 [PROJECT]
function ws2() {
	if [ "$1" != "" ]; then
		cd $WS_HOME/Projects/$1
	else
		cd $WS_HOME/Projects
	fi
}

# wsp
# Command: wsp [PROJECT]
function wsp() {
	if [ "$1" != "" ]; then
		cd $WS_HOME/Projects/$1
	else
		cd $WS_HOME/Projects
	fi
}

# Evil
# evil [BRANCH] [URL]
function evil() {
	if [ "$1" = "" ]; then
	  echo "evil <BRANCH> <URL>"
	  return
	fi

	if [ "$2" = "" ]; then
	  echo "<URL> nil"
		return
	fi

	PROJECT_NAME=$2
	PROJECT_NAME="${PROJECT_NAME##*/}"
	PROJECT_NAME="${PROJECT_NAME%.git}"

	cd $WS_HOME/Projects
	if [ -d $PROJECT_NAME ]; then
		echo "-> rm -rf $PROJECT_NAME"
		rm -rf $PROJECT_NAME
	fi
	echo "-> mkdir $PROJECT_NAME"
	mkdir $PROJECT_NAME
	echo "-> cd $PROJECT_NAME"
	cd $PROJECT_NAME
	echo "-> git init"
	git init
	echo "-> git checkout -b $1"
	git checkout -b $1
	echo "-> git remote add origin $2"
	git remote add origin $2
	echo "-> git pull origin $1 -r"
	git pull origin $1 -r
	echo "Done!"
	echo -e "\033[32mDon't forget to create new brach.\e[0m"
}

function demon() {
	if [ "$1" = "" ]; then
		echo "demon <URL>"
		return
	fi

	PROJECT_NAME=$1
	PROJECT_NAME="${PROJECT_NAME##*/}"
	PROJECT_NAME="${PROJECT_NAME%.git}"

	cd $WS_HOME/Projects
	if [ -d $PROGJECT_NAME ]; then
		echo "-> rm -rf $PROJECT_NAME"
		rm -rf $PROJECT_NAME
	fi

	echo "-> git clone $1"
	git clone $1
	echo "Done!"
	echo -e "\033[32mDon't forget to create new brach.\e[0m"
}
