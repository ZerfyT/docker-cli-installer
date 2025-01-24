# Docker CLI Installation Script for Ubuntu

This repository contains a bash script to automate the installation of Docker CLI on Ubuntu systems. The script ensures a seamless setup process by handling all necessary prerequisites and configurations.

## Features

- Updates the system's package database.
- Installs required dependencies.
- Adds Docker's official GPG key.
- Configures Docker's stable repository.
- Installs the Docker CLI.
- Verifies the Docker CLI installation.
- Configure Docker CLI as non root user.

## Usage

1. Clone this repository or download the script.
2. Make the script executable:

    ```bash
    sudo chmod +x install.sh
    ```

3. Run the script:

   ```bash
   ./install.sh
   ```

## Troubleshooting

- Ensure your system's package manager is up to date by running:

    ```bash
    sudo apt update && sudo apt upgrade
    ```

- If the script encounters an error, try running it with the set -x option for detailed output:
  
    ```bash
    bash -x install.sh
    ```

## License

This script is open-source and available under the MIT License.
