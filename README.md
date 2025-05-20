# sftp-file-fetcher

This project contains a Bash script that automates the process of collecting multiple specific files from a remote server via SFTP and stores them locally.

## 📁 Script Overview

- Connects to a remote server via `sftp`
- Downloads predefined files from various directories
- Saves the files to a local directory
- Uses `expect` to automate password input

## 🔧 Configuration

The following variables are defined at the beginning of the script:

```bash
REMOTE_USER="root"
REMOTE_HOST="input host ip here"
LOCAL_DIR="/opt/mpg_performance/"
PASSWORD="root"

Replace these values with the actual credentials and paths for your environment.

The script also uses an associative array (declare -A FILES_TO_FETCH) to map remote directories to the filenames to be fetched.

🛠 Dependencies
Ensure the following packages are installed:

expect

openssh-clients (for sftp)

You can install them using your package manager, for example:
sudo apt install expect
# or
sudo yum install expect

🚀 Usage
Make the script executable and run it:

chmod +x fetch_files.sh
./fetch_files.sh


Each file will be downloaded to the directory specified by LOCAL_DIR.

🔐 Security Considerations
Avoid committing passwords to version control.

For improved security, consider switching to SSH key-based authentication and removing the plaintext password from the script.


📄 Output
The script logs output for each downloaded file, confirming the source directory and target path.

File active_pdp.txt downloaded from /gsn/pdp/abuja/active_pdp/ to /opt/mpg_performance/
File attempted_pdp.txt downloaded from /gsn/pdp/abuja/active_pdp/ to /opt/mpg_performance/
...
All files have been downloaded!


📬 Contributions
Feel free to fork and improve the script. Suggestions and pull requests are welcome!


