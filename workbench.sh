source workbench/workbench-pre.sh

# A simple workbench-type, test-first approach for dotnet CLI-based project setups
# run this script *from* the new project root.  Or, customize with options or parameters as your see fit! :-)

mkdir -v sut                     # Home directory for whatever system(s) are under test.
mkdir -v dependencies            # Any project specific depdencies. Often, this will include parallel development on features and the tools used to development the feature.
mkdir -v workbench				 # Workbench scripts and related files.
mkdir -v dependencies/submodules # A place to add any other git repos as submodules.
mkdir -v tests
mkdir -v tests/unit        # Unit tests (xunit).
mkdir -v tests/integration # Integration tests (web api (min)).

dotnet new web -o tests/integration
dotnet new xunit -o tests/unit

dotnet new sln # The solution is used as a means to consolidate buids for the sut, depndencies, and their associated tests.
dotnet sln add tests/integration/integration.csproj
dotnet sln add tests/unit/unit.csproj

dotnet add tests/unit/unit.csproj package bogus
dotnet add tests/unit/unit.csproj package coverlet.msbuild
dotnet add tests/unit/unit.csproj package Faker.Net
dotnet add tests/unit/unit.csproj package FluentAssertions
dotnet add tests/unit/unit.csproj package Microsoft.Extensions.Logging
dotnet add tests/unit/unit.csproj package Microsoft.Extensions.Logging.Console
dotnet add tests/unit/unit.csproj package moq

dotnet new gitignore

dotnet new globaljson


git init

dotnet build # Build the new project artfacts




workspace=$(cat <<EOF
{\n
	"folders": [\n
		{\n
			"name": "root",\n
			"path": "."\n
		},\n
		{\n
			"name": "dependencies",\n
			"path": "./dependencies"\n
		},\n
		{\n
			"name": "submodules",\n
			"path": "./dependencies/submodules"\n
		},\n		
		{\n
			"name": "sut",\n
			"path": "./sut"\n
		},\n
		{\n
			"name": "unit tests",\n
			"path": "./tests/unit"\n
		},\n
		{\n
		   "name": "integration tests",\n
		   "path": "./tests/integration"\n
		}\n
	],\n
	"settings": {\n
	}\n
}\n
EOF
)

export workspace

echo $workspace > workbench.code-workspace

source workbench/workbench-post.sh

git add .
git commit -m"Initial commit, Workbench created."

