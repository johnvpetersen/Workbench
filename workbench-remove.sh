echo "Workbench: Remove begin"
echo "*******************************"
rm -rfv .git
rm -fv .gitignore
rm -fv .gitmodules
rm -fv cicd.sh
rm -fv global.json
rm -fv readme.md
rm -fv workbench.code-workspace
rm -rfv tests
rm -rfv dependencies
rm -rfv sut
rm  -fv $(basename $(pwd).sln)
echo "*******************************"
echo "Workbench: Remove end"