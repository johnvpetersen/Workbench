#pull
# git pull <<Remote Repo>> implement as required. 
#clean
dotnet clean
find . -iname "bin" -print0 | xargs -0 rm -rfv
find . -iname "obj" -print0 | xargs -0 rm -rfv
#build
dotnet build -c debug
#test
dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=lcov /p:CoverletOutput=lcov.info
#deploy
dotnet publish
#launch
cd tests/integration/bin/release/net8.0/publish  
dotnet  integration.dll --urls "http://localhost:5001"%  
