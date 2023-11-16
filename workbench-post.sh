echo "Workbench: Post-processing begin"
echo "*******************************"

git submodule add https://github.com/johnvpetersen/DynamicLambda.git dependencies/submodules/dynamiclambda

dotnet sln add dependencies/submodules/dynamiclambda/Core/Core.csproj
dotnet sln add dependencies/submodules/dynamiclambda/Core.Test/Core.Test.csproj

dotnet add tests/unit/unit.csproj reference dependencies/submodules/dynamiclambda/Core/Core.csproj
dotnet add tests/integration/integration.csproj reference dependencies/submodules/dynamiclambda/Core/Core.csproj

echo "*******************************"
echo "Workbench: Post-processing end"