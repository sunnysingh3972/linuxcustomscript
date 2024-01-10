Certainly! Here's a README file that explains the purpose and usage of the provided Bash script (`internsctl`):

---

# internsctl Bash Script

## Overview

The `internsctl` script is a command-line utility designed to perform various system-related tasks. It supports commands related to CPU information, memory information, user management, and file information. This README provides an explanation of the script's structure, commands, and usage.

## Usage

### Command Syntax

```
internsctl <command> [options] [arguments]
```

### Commands

#### 1. Display Help

```
internsctl --help
```

Displays usage information and a list of available commands.

#### 2. Display Version

```
internsctl --version
```

Displays the current version of the `internsctl` script.

#### 3. CPU Information

```
internsctl cpu getinfo
```

Displays information about the CPU using the `lscpu` command.

#### 4. Memory Information

```
internsctl memory getinfo
```

Displays information about system memory using the `free -m` command.

#### 5. Create User

```
internsctl user create <username>
```

Creates a new user with the specified username using the `adduser` command. Requires sudo privileges.

#### 6. List Users

```
internsctl user list [--sudo-only]
```

Lists all regular users or, with the `--sudo-only` option, lists users with sudo permissions.

#### 7. File Information

```
internsctl file getinfo <file-name>
```

Displays information about the specified file, including size, permissions, owner, and last modified time.

##### Options:

- `--size, -s`: Print file size
- `--permissions, -p`: Print file permissions
- `--owner, -o`: Print file owner
- `--last-modified, -m`: Print last modified time

### Examples

```bash
internsctl cpu getinfo
internsctl memory getinfo
internsctl user create john_doe
internsctl user list --sudo-only
internsctl file getinfo example.txt
internsctl file getinfo example.txt --size
```

## File Structure

- `internsctl`: The main Bash script file.
- `README.md`: This documentation file.

## FlowChart
![image](https://github.com/sunnysingh3972/linuxcustomscript/assets/76744031/01a6f181-2a58-45de-9bb3-30f06ba75ef9)
![image](https://github.com/sunnysingh3972/linuxcustomscript/assets/76744031/956aafae-e2cf-44df-8f04-db0e1c77dd06)


