#!/bin/bash

# Usage of the script, helper function
function usage {
	echo "Usage: ./$(basename $0) [-n | -x]"
	echo "   -x   execute -> executes the game after build"
	echo "   -n   No prompt -> dosn't show promt"
	exit 1
}

# Parsing of script parameter options
nflag=
xflag=
optstring=":nx"
while getopts ${optstring} arg; do
	case ${arg} in
	n) nflag=1 ;;
	x) xflag=1 ;;
	:) usage ;;
	?) usage ;;
	esac
done

# Build options. Used to find path to PTSD engine to build
printmsg() {
	printf "Build options: \n"
	printf "[1] : Build PTSD Engine from scratch\n"
	printf "[2] : I have already built PTSD Engine\n"
	printf "[3] : Cancel\n"
}

#Moves assets to corresponding folders in bin
move_assets() {
	rm -rf ./bin/assets/scripts/Client # We don't want Client example scripts from Engine
	cp -rT "./bin" "./GlockTheClock"
	cp "-rT" "./bin/assets/scripts/Engine" "./GlockTheClock/assets/scripts/Engine"
	rm -r ./bin
}

#Gets the path to the engine by param, builds it and moves assets and scritps to its corresponding places
build() {
	local current=$(echo $PWD)
	local path_to_engine=$1
	#build engine
	echo $path_to_engine
	cd $path_to_engine
	./build.bash "-b"
	cd $current
	#Move assets and scripts
	cp -r $path_to_engine"/bin" ./
	move_assets
}

#Make sure there is a .bin directory
if [[ ! -d "./bin" ]]; then
	echo "Creating bin directory"
	mkdir bin
fi

op=
#if no prompt flag not specified, prompt for isntructions
if [[ -z $nflag ]]; then
	printmsg
	read -p 'Input:' op
fi
if [[ $op == 3 ]]; then exit 0; fi

#We found a build config and option is not 1
if [[ -r build_config.txt && option != 1 ]]; then
	path_to_engine=$(cat build_config.txt)

#If Engine already build ask for path (if -n was not specified)
elif [[ $op == 2 && -z $nflag ]]; then
	read -p "Set path to PTSD Engine: " path_to_engine
	echo $path_to_engine >build_config.txt

#Either we splicitly ask for engine to be built locally in the engine repo or is the only possible outcome with the given options
else
	git submodule update --remote --init
	path_to_engine=PTSD-Engine
fi

#We have now path_to_engine set to the engine repo in some way or form, we build it
build $path_to_engine

#If execute flag is set, execute the game after build
if [[ ! -z $xflag ]]; then
	cd GlockTheClock
	./PTSD_Core
fi
exit 0
