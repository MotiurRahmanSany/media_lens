#!/bin/bash

# Flutter Project Structure Generator
# Creates a clean architecture Flutter project structure

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}
╔══════════════════════════════════════════════════════════════════╗
║                Flutter Directory Structure Generator             ║
║                     Based on EMI Locker Structure               ║
║                        (Directories Only)                       ║
╚══════════════════════════════════════════════════════════════════╝${NC}"
}

# Check if we're in a Flutter project
check_flutter_project() {
    if [ ! -f "pubspec.yaml" ]; then
        print_error "This doesn't appear to be a Flutter project (no pubspec.yaml found)"
        print_error "Please run this script from your Flutter project root directory"
        exit 1
    fi
    print_status "Flutter project detected ✓"
}

# Create directory if it doesn't exist
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        print_status "Created directory: $1"
    else
        print_warning "Directory already exists (skipping): $1"
    fi
}

# Get feature names from user
get_features() {
    echo ""
    echo -e "${BLUE}Feature Configuration${NC}"
    echo "Enter all feature names separated by spaces in one line."
    echo "Examples: auth home profile dashboard settings"
    echo "Or: user_management customer_management token_balance"
    echo ""
    
    echo -n "Enter feature names (space-separated): "
    read -r feature_input
    
    # Check if input is empty
    if [ -z "$feature_input" ]; then
        print_error "No features provided. At least one feature is required."
        exit 1
    fi
    
    # Split input into array
    read -ra features <<< "$feature_input"
    
    # Validate each feature name
    valid_features=()
    for feature_name in "${features[@]}"; do
        # Remove any extra whitespace
        feature_name=$(echo "$feature_name" | xargs)
        
        # Skip empty names
        if [ -z "$feature_name" ]; then
            continue
        fi
        
        # Validate feature name (only letters, numbers, underscore)
        if [[ ! "$feature_name" =~ ^[a-z_][a-z0-9_]*$ ]]; then
            print_error "Invalid feature name: '$feature_name'. Use only lowercase letters, numbers, and underscores. Start with a letter or underscore."
            exit 1
        fi
        
        valid_features+=("$feature_name")
        print_status "Added feature: $feature_name"
    done
    
    # Update features array with valid features
    features=("${valid_features[@]}")
    
    if [ ${#features[@]} -eq 0 ]; then
        print_error "No valid features provided. At least one feature is required."
        exit 1
    fi
    
    echo ""
    echo -e "${BLUE}Features to create (${#features[@]} total):${NC}"
    printf "  • %s\n" "${features[@]}"
    echo ""
    
    echo -n "Proceed with creating these features? (y/N): "
    read -r confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        print_status "Operation cancelled by user"
        exit 0
    fi
}

# Create core structure
create_core_structure() {
    print_status "Creating core directory structure..."
    
    # Config directory
    create_dir "lib/config"

    # Core structure
    create_dir "lib/core/common/constants"
    create_dir "lib/core/common/controllers"
    create_dir "lib/core/common/models"
    create_dir "lib/core/common/repositories"
    create_dir "lib/core/common/screens"
    create_dir "lib/core/common/widgets"
    
    create_dir "lib/core/providers"
    create_dir "lib/core/utils"
}

# Create feature structure
create_feature_structure() {
    local feature_name="$1"
    print_status "Creating feature directories: $feature_name"
    
    # Feature base directory
    local feature_dir="lib/features/$feature_name"
    
    # Create data layer
    create_dir "$feature_dir/data"
    
    # Create domain layer
    create_dir "$feature_dir/domain"
    
    # Create presentation layer
    create_dir "$feature_dir/presentation/controllers"
    create_dir "$feature_dir/presentation/screens"
    create_dir "$feature_dir/presentation/widgets"
}

# Main execution
main() {
    print_header
    
    print_status "Starting Flutter project structure generation..."
    
    # Validate environment
    check_flutter_project
    
    # Get user input
    get_features
    
    # Create structure
    echo ""
    print_status "Creating project directory structure..."
    
    # Create core structure
    create_core_structure
    
    # Create feature structures
    echo ""
    print_status "Creating feature directory structures..."
    for feature in "${features[@]}"; do
        create_feature_structure "$feature"
    done
    
    # Create features directory if it doesn't exist
    create_dir "lib/features"
    
    echo ""
    print_status "Directory structure creation completed! ✨"
    
    echo ""
    echo -e "${BLUE}Next Steps:${NC}"
    echo "1. Add your own files to the created directories"
    echo "2. Implement your features in the respective folders"
    echo "3. Follow Clean Architecture patterns:"
    echo "   - data/ : Repositories, data sources"
    echo "   - domain/ : Models, entities"  
    echo "   - presentation/ : UI controllers, screens, widgets"
    echo "4. Add required packages to pubspec.yaml as needed"
    
    echo ""
    echo -e "${GREEN}🎉 Happy coding!${NC}"
}

# Run main function
main "$@"