import json
import argparse

def set_julia_kernel(
        jl_notebook_path : str, # absoluate path
        kernel_name : str,  # e.g. "Julia 1.10.0"
        version : str # e.g. "1.10.0"
    ):

    with open(jl_notebook_path, 'r', encoding="utf-8") as f:
        data = json.load(f)

    data["metadata"]["kernelspec"] = {
        "display_name" : kernel_name,
        "language" : "julia",
        "name" : kernel_name
    }
    data["metadata"]["language_info"] = {
        "file_extension" : ".jl",
        "mimetype" : "application/julia",
        "name": "julia",
        "version": version
    }

    # Overwrite notebook with new json
    with open(jl_notebook_path, 'w') as f:
        data = json.dump(data, f, indent = 4)


def parse_arguments():
    parser = argparse.ArgumentParser(description="Parse arguments for notebook execution.")

    parser.add_argument(
        "--notebook_path",
        type=str,
        required=True,
        help="Path to the Jupyter notebook to be modified."
    )

    parser.add_argument(
        "--kernel_name",
        type=str,
        required=True,
        help="Name of the Jupyter kernel to be used for execution."
    )

    parser.add_argument(
        "--version",
        type=str,
        required=False,
        default="latest",
        help="Version identifier (default: latest)."
    )

    return parser.parse_args()

if __name__ == "__main__":
    args = parse_arguments()

    set_julia_kernel(
                     args.notebook_path,
                     args.kernel_name, 
                     args.version
                    )
