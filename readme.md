# A local-CICD-focused workbench approach to general software development

## tl;dr: An easy, simple, & systematic way to establish an easy, simple, robust, & scalable test harnesses that may facilitate the benefits an organization expects and was promised from automation and "Shifting-left."

## Base dependencies

This approach is platform agnostic. Windows, MacOS; beyond minor semantics, they are distinctions without a material difference. At least, that's the way it ought to be. The approach assumes the following is installed on the local development machine: 

- .NET (cli)
- git
- VS Code
- cli scripting (bash, PowerShell, etc.)

This approach illustrates how to implement CI/CD, SOLID, & Agile-related practices in a simple, pragmatic way through the establishment of a **simple**  test harness that manages the various complexities that arise in every development stage. At the root of many complexities is the tension between requiring a robust environment that is also simple and transient. Put another way, "What's the least we can get away with in terms of tools and process ceremony that's flexible, easy to establish and understand while minimizing complexity?"

Regarding quality, the earlier in development we can introduce quality-friendly behaviors and measures, while enhancing overall quality and value, the better. This is the essence of what **Shifting left** is all about.

The following highlights the 3 foundational elements:

### CI/CD

If the goal is to realize the benefits automation has to offer, it's best that as far upstream as is feasible,  processes are consistent with what's needed downstream to efficiently carry on that automation. That's the essence of what "Shifting-left" is all about and this workbench approach implements a simple, local CI/CD pipeline to locally automate the dev, test, build, and deploy cycle.

### SOLID

If you're not familiar with SOLID principles, please start here : <https://en.wikipedia.org/wiki/SOLID>. When placing one or a group of artifacts under test, one of the elements you may be seeking to verify beyond what the software does, but how it does it. How extensible? What is the extensibility model? All of these considerations matter if quality software is the objective.

### Agile

Agile for purposes here is what's enumerated in the Agile Manifesto's values: <https://agilemanifesto.org/>. The primary KPI should always be the spread between the value in what is delivered vs. the value intended to be delivered. The greater the spread, the greater the value. Implied in that value quotient is quality. If something is valuable, quality is implied to the point that it shouldn’t need to be called out. Obviousness to the point of irrelevancy.  How value is measured is up to each organization. One of the organizational efforts this approach is designed to facilitate are the **behaviors necessary** to support an overall **Continuous Improvement, Agile, DevOps, etc.** initiative.

Whether there is a lot of code, some code, or "No-code", the fact of the matter is that somewhere, there are two necessary things for our software to operate. First, there must be some code somewhere. Today, "Code" can be express (C#, Python, Ruby, bash, .NET,  etc.) or implied through configuration or data. Regardless of whatever the artifact is called, if what it does has a "Knock-on" effect to some other process, it's behavior ought to be verified under test before the artifact is placed into service, much less considered for service in the first place.

Drilling down into the Values in the Agile Manifesto and how they apply to this workbench approach to software development and testing:

- **Individuals and interactions over processes and tools**: Through fewer abstractions, there is less initial emphasis on formalized tools and processes so that you may better interact with your software. To sufficiently support and maintain your software in a sustainable way  begins with truly understanding what comprises your software, which includes how it was built, what it does, and how it does it. If we can do that within each, ourselves and if there is a collective fidelity to purpose, then at the team level, there should be no conflict with similar behavior.

- **Working software over comprehensive documentation**: The goal of working software still requires some means to verify whether a given system under test performs as claimed, as expected. This approach **is a means of documenting** that exercise in a way that directly accrues to the benefit of quality, working software. This approach  offers a means to document and record **how** software is being reviewed. The scripts, as they develop, should themselves be versioned and archived under source code control along with clear data to establish which workbench test harness version was used to test a given open-source library because eventually, the review's results and the recommendations therein need to be communicated in a tangible way. Let documentation, in whatever useful form it takes, simply be a by-product of the work, with the express understanding that unless there is working software, despite being superbly drafted, there is no value for that documentation to rest upon.

- **Customer collaboration over contract negotiation**: Regardless of the context, more information and transparency aids, not hinders collaboration. If there is consensus the data proves the software under examination isn't fit for purpose and that conclusion was more quickly and accurately determined than before, that is a value-added exercise. Once software is placed into service and claims then arise over fitness for purpose, the negotiation that quickly ensues is for accommodations to be made that fix the software. The one thing you can never reclaim is the value in the lost time. If there's to be a failing grade delivered, let it be as quickly and as accurately as possible so that meaningful collaboration can exists with a feasible software.

- **Responding to change over following a plan**: This is an approach, not the approach. It's an approach so simple that beyond what this approach was designed to do and support, there's nothing prescriptive here. It is quite likely that each implementation will require its own requisite level of "Nip & Tuck." The 3 foregoing points go to why fewer/no abstractions have been relied upon. If we can stick as close as possible to a "Least Common Denominator", the more likely it will be that a change can be accommodated for what would be appropriate for the problem domain.

## The premise

You have software to build. Generally, you know what it must do, but there are many details and dependencies that either need to be determined or will take time to implement. On one hand, to meet a deadline, development needs to begin. On the other hand, there is uncertainty over all or some aspect of the business requirements. That uncertainty has a knock-on effect of more uncertainty as to deployment production when the software is released to production.

To add to the complexity, the organization has placed a premium on automation. Therefore, if there is a way to automate a repetitive task to further quality, steps should be taken to investigate and if feasible, implement tools and process that facilitate automation as part of core development. 

Finally, because robust monitoring is a requirement, contextual logging must be a first-class feature.


### The challenge

Quality requires that as much as we can verify functionality on the  developer's box, we should strive to do just that - shift left in a way that not only boosts confidence that our software is reliable, but we can also demonstrate **how** that reliability was determined. At the same time, we must endeavor to avoid complexity in favor of simplicity in our solutions.

## Getting started

The following is a quick, simple, and easy approach to getting started.

[Workbench video (mp4)](https://github.com/johnvpetersen/workbench/blob/main/workbench.mp4)


### GitHub repository

<https://github.com/johnvpetersen/workbench>

### The files

**readme.md** - the primary location to document what other contextual information is needed in order to leverage both the testing workbench, but the output it produces as well.

**workbench.sh** - the primary workbench script. Ideally, for an organizational unit, this script remains constant over a given timespan. It contains the base structure and dependencies that will **be the starting point** for all workbench instances and itself ought to be under source code control as that base structure needs to be modified.

**NOTE: once a workbench instance has been created, a copy of the workbench scripts are also copied. From that point on, you may modify the scripts as needed to accommodate the specifics for a given project. To balance flexibility with some standards, the standard pre and post processing scripts are available to handle specific customizations that must be accommodated within a standard approach if that approach is expected to be useful.

**workbench-pre.sh** - a location for your pre-processing needs. By default, workbench-pre.sh references **workbench-remove.sh**. You can organize and refactor the scripts as you see fit. Like any other software, as its used and maintained, it develops and evolves as new circumstances warrant.  As the workbench environment is refined, it must quickly be able to quickly be torn down and re-established under the new specifications.

**workbench-post.sh** - a location for your post-processing needs. a common use case is to establish any dependencies like other libraries, and repos as submodules.

**cicd.sh** - The local build, test, deploy script. 

*install.sh** and **workbench-post-example.txt** are included to illustrate how simple the process can be to get up and running, as well as how to leverage the post processing script to add a submodule, perform some upgrades, and test to ensure no adverse effects; all in a systemized way. 

With the "What of it" out of the way about the files, let's take another step toward implementation by cloning the repository and executing the bits locally to produce a test harness that may be built upon.

### Steps

1. Navigate to https://github.com/johnvpetersen/workbench/blob/main/install.sh and copy the contents to a local script file.
2. Specify the correct target directory in the new script file.
3. Open a terminal instance.
4. Execute the script

We begin with a workbench environment that organizes our workspace around the following concepts:

- **sut** : The System Under Test. These are the primary artifacts under development that will eventually be deployed and released to production. 
- **dependencies** : Anything the SUT requires to operate, those items may be placed here. The items may be dll's, git submodules, content, or a complete project. Dependencies may also include any tooling that is required for automation and testing. 
- **dependencies/submodules** : A specific folder under dependencies to host git submodules.
- **tests** : Testing facilities for the SUT and any dependency under development.  There are two types of tests: **tests/unit** and **tests/integration**. The integration project is the "Integration hub." It is in that project where you may choose to host any service mocks. Or, you can establish those mocks and reference them from another project. Like any other project and any other reasonably flexible development environment, you can restack and rerack as circumstances warrant.

## global.json

Likely, you may have multiple .NET Framework versions on your machine. The global.json file, among other things, allows us to easily fix to a specific version when running CLI commands: <https://learn.microsoft.com/en-us/dotnet/core/tools/global-json>.

## workbench.code-workspace

This is the VS Code workspace file. Depending on your needs, you may need to scope certain configuration settings to certain folders or need finer control that workspaces provide. The best, most comprehensive VS Code Workspace documentation may be found here: <https://code.visualstudio.com/docs/editor/workspaces>.

## The license: GNU General Public License v3.0

<https://github.com/johnvpetersen/workbench/blob/main/LICENSE>

<https://www.gnu.org/licenses/gpl-3.0.en.html>
