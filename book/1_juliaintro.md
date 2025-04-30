# Introduction to Julia

## Julia Installation and Setup

- [ ] Julia installation complete
    - [ ] Which version?
- [ ] Jupyter installation complete
- [ ] VSCode

## Julia Basics

### Welcome to the REPL

Julia's REPL (Read-Eval-Print Loop) is an interactive command-line interface that allows users to execute Julia code in real time. It provides a convenient way to experiment with code, test functions, and explore the language's features.

#### Accessing the REPL
- In VSCode, go to the command menu (<kbd>Cmd</kbd> + <kbd>⇧</kbd>+<kbd>P</kbd> on Mac, or <kbd>Ctrl</kbd> on Windows) and type `Julia: Start REPL`
- In your terminal, type `julia` and hit Enter

#### Customization of the REPL
- [`OhMyREPL`](https://github.com/KristofferC/OhMyREPL.jl) is a package that adds some nice defaults for color-coding and syntax highlighting, you can add it to your environment by typing `] add OhMyREPL` from the REPL
- More customization:
    The `startup.jl` file in Julia is an optional file that can be used to execute custom code every time a Julia session starts. It can be useful for setting configurations, loading frequently used packages, or defining custom functions.
    - Location of startup.jl on different operating systems:
        - Linux/macOS:
            ```
            ~/.julia/config/startup.jl
            ```
        - Windows:
            ```
            C:\Users\YourUsername\.julia\config\startup.jl
            ```

- Additional REPL modes:
    - Help mode (accessed by `?`)
    - Shell mode (accessed by `;`)
    - Package mode (accessed by `]`)

- Package management

- Environment setup
    - Julia uses the built-in package manager (which is itself a built-in package called `Pkg`) to manage dependencies and environments (any commands below that use calls of the form `Pkg.function()` can also be accessed in the REPL from `pkg>` mode by prepending with `]` and just calling the function directly)
    - To create a new project, use `]` to enter the package manager mode and then type `generate MyNewProject` to create a new project within the specified directory.
    - Julia uses project-specific environments to manage dependencies by maintaining separate `Project.toml` and `Manifest.toml` files for each environment, ensuring that package versions are isolated and reproducible. You can activate and work within a specific environment using `Pkg.activate("path/to/project")`, allowing for flexible and independent package management across projects.
    - `Pkg.instantiate()` is a Julia function used to install all the dependencies for a project, based on the information stored in the `Project.toml` and `Manifest.toml` files. Here’s what it does:
        - If your project has a `Manifest.toml` file, `Pkg.instantiate()` will install the exact versions of the packages listed there, ensuring that the environment is fully reproduced as specified.
        - If there’s no `Manifest.toml` file, but there’s a `Project.toml`, it will resolve and install the necessary package dependencies based on the `Project.toml` file, generating a new `Manifest.toml` in the process.
    - After doing this in our repo, we can do: `Pkg.status()`, which displays the current status of the project, listing installed packages and their versions.