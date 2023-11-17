# clone the workbench repo to the specified directory. 
git clone https://github.com/johnvpetersen/workbench.git <<target directory>>
# remove the git repo since another one will be created.
rm -rf <<target directory>>/workbench/.git
# set the target directory as the working directory
cd <<target directory>>
# invoke the workbench script
sh workbench/workbench.sh
# launch vs code
code .
