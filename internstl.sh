#!/bin/bash

# internsctl script

# Function to display help
display_help() {
    echo "Usage: internsctl <command> [options] [arguments]"
    echo "Commands:"
    echo "  cpu getinfo                 Display CPU information"
    echo "  memory getinfo              Display Memory information"
    echo "  user create <username>      Create a new user"
    echo "  user list                   List all regular users"
    echo "  user list --sudo-only       List users with sudo permissions"
    echo "  file getinfo <file-name>    Display information about a file"
    echo "    Options:"
    echo "      --size, -s              Print file size"
    echo "      --permissions, -p       Print file permissions"
    echo "      --owner, -o             Print file owner"
    echo "      --last-modified, -m     Print last modified time"
}

# Function to display version
display_version() {
    echo "internsctl v0.1.0"
}

# CPU Information
get_cpu_info() {
    lscpu
}

# Memory Information
get_memory_info() {
    free -m
}

# Create User
create_user() {
    if [ -z "$2" ]; then
        echo "Error: Missing username. Usage: internsctl user create <username>"
    else
        sudo adduser "$2"
    fi
}

# List Users
list_users() {
    if [ "$2" == "--sudo-only" ]; then
        grep -Po '^sudo.+:\K.*$' /etc/group | tr ',' '\n'
    else
        cut -d: -f1 /etc/passwd
    fi
}

# File Information
get_file_info() {
    if [ -z "$2" ]; then
        echo "Error: Missing file name. Usage: internsctl file getinfo <file-name>"
    else
        file_name="$2"
        if [ ! -e "$file_name" ]; then
            echo "Error: File '$file_name' not found."
        else
            echo "File: $file_name"
            stat --format="Access: %A%nSize(B): %s%nOwner: %U%nModify: %y" "$file_name"
        fi
    fi
}

# File Information with Options
get_file_info_with_options() {
    file_name="$2"
    option="$3"
    case "$option" in
        --size | -s)
            stat --format="%s" "$file_name"
            ;;
        --permissions | -p)
            stat --format="%A" "$file_name"
            ;;
        --owner | -o)
            stat --format="%U" "$file_name"
            ;;
        --last-modified | -m)
            stat --format="%y" "$file_name"
            ;;
        *)
            echo "Invalid option. Use --size, --permissions, --owner, or --last-modified"
            ;;
    esac
}

# Main script logic
if [ "$1" == "--help" ]; then
    display_help
elif [ "$1" == "--version" ]; then
    display_version
elif [ "$1" == "cpu" ] && [ "$2" == "getinfo" ]; then
    get_cpu_info
elif [ "$1" == "memory" ] && [ "$2" == "getinfo" ]; then
    get_memory_info
elif [ "$1" == "user" ] && [ "$2" == "create" ]; then
    create_user "$@"
elif [ "$1" == "user" ] && [ "$2" == "list" ]; then
    list_users "$@"
elif [ "$1" == "file" ] && [ "$2" == "getinfo" ]; then
    if [ -z "$4" ]; then
        get_file_info "$@"
    else
        get_file_info_with_options "$@"
    fi
else
    echo "Invalid command. Use 'internsctl --help' for usage information."
fi

# End of script
