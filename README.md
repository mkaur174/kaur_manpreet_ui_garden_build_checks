package.json is the main setup file or the blueprint of the React project that lists our project's name, version, and metadata, and it records all of the external tools and packages that our UI library depends on.

package-lock.json is a version lock file. It looks at the precise sub-version numbers of every single dependency that we installed in node modules. It guarantees when our Dockerfile run npm install inside the container.

The tsconfig.json file is the TypeScript configuration file. It tells the TypeScript compiler how to convert .tsx or .ts component code into standard JavaScript. It includes the rules like strict type checking or code version and path aliases.

Node module folder is local library cache and it stores all of the downloaded code listed in our package.json and it is never pushed to GitHub because it is git ignored already.

gitignore file is a configuration file that tells Git which files or folders to ignore so they aren't uploaded to your GitHub repository.

#### Total Number of Files: 5 essential root files/folders (plus component files).

1. package.json (Lists project dependencies and npm scripts)
2. package-lock.json (Locks exact package versions for consistency)
3. tsconfig.json (Configures TypeScript compiler rules)
4. Dockerfile (Contains the multi-stage build instructions for Node.js and Nginx)
5. dockerignore (Excludes heavy folders like node_modules from the Docker build)


# The Component Files (Buttons, Cards, Text, etc.):
I built modular, reusable React/TypeScript components that act as building blocks for user interfaces.

# The Subfiles (Types, Styles, and Index files):

1. Each component has its own supporting subfiles (like TypeScript interface/type definitions for props, styling files, and export indices) to keep the code clean, type-safe, and organized.
2. types sets the rules, tsx is the actual code, stories runs it in Storybook, tests checks for bugs, and index makes it easy to import


#        Codin assignment 13        #

# Duplicated the existing project folder using a simple terminal copy command.
cp -r kaur-manpreet-ui-garden kaur_manpreet_ui_garden_build_checks
#  Navigated to the folder:
cd kaur_manpreet_ui_garden_build_checks

# Step 1: INSTALLING HUSKY:
npm install husky --save-dev
# Step 2: INITIALIZE HUSKY:
npx husky init

# Step 3: PRE-COMMIT FILE:
# Step 4: Create the GitHub Actions CI Workflow:
  1. created a folder named .github then a subfolder workflows and then a file: ci.yml

     #ci.yml :ci.yml is the GitHub Actions workflow file that I used. With each push to GitHub, it creates a fresh cloud environment, clones our code from the repository, installs the dependencies required, runs linters and unit tests, and confirms that everything builds properly.

# DOCKERFILE:
Step 1: Build the React application
Stage 2: # Stage 2: Serve the production build using Nginx
all on port 8018
      # Dockerfile for the coding assignment is a multi-stage build. In the first stage, we compile our React component library into production build using Node.js and in the next stage, we pack the static files in a light Nginx image running on port 8018.

# Build the Docker image
docker build -t kaur_manpreet_coding_assignment13 .
# Run the container on port 8018
docker run -p 8018:80 --name kaur_manpreet_coding_assignment13 kaur_manpreet_coding_assignment13
# Stop the container:
docker stop kaur_manpreet_coding_assignment13
# Remove the container:
docker rm kaur_manpreet_coding_assignment13
# Check the containers running:
docker ps


{ Few Changes:
package.json Updates: Added lint and format scripts to execute ESLint and Prettier, along with a prepare script for Husky.}

# GITHUB PUBLIC REPOSITORY:
1. Initialize Git in the project directory:
git init
2. Stage all assignment files and modifications:
git add .
3. Commit the changes (after updating package.json scripts):
git commit -m "feat: complete assignment 13 files" --no-verify
4. Renamed the default branch to main:
git branch -M main
5. Updated the remote origin URL to the new GitHub repository:
git remote set-url origin https://github.com/mkaur174/kaur_manpreet_ui_garden_build_checks.git
6. Push  local commits:
git push origin main


# Simulated CI Failure (Red X Verification)

1. Action: Introduced a syntax error in src/App.tsx and bypassed local pre-commit hooks.
2. Command Executed:
git add .
git commit --no-verify -m "test ci failure"
git push origin main
3. Result: GitHub Actions triggered workflow #2 (test ci failure), which intentionally failed and displayed a red X.

# Root Cause Identification & Local Resolution
Build Log Inspection: Inspected the runner output for job failure details.
 1. Issue Found: ESLint throw an ERR_REQUIRE_ESM error due to CommonJS incompatibility with eslint-plugin-storybook under ESLint 8.
 2. Fix Applied: Removed "plugin:storybook/recommended" from the eslintConfig.extends array inside package.json.

 # CI Pipeline Repair & Passing Build (Green Check Verification)
 Action: Saved package.json, committed the configuration fix, and pushed to the remote repository.
 1. Command Executed:
 git add .
 git commit -m "fix: remove storybook plugin from eslint config" --no-verify
 git push origin main
 2.  Result: GitHub Actions triggered workflow #6 (fix: remove storybook plugin from eslint config), running all linting, formatting, unit tests, and build checks cleanly to achieve a green checkmark in 42 seconds.