#!/bin/bash
# ============================================
# OpenFishTools - User CEP Deploy (macOS)
# ============================================
# Equivalent of Installer/Windows/deploy.bat
# User-level deployment (no admin / sudo needed).
# Double-click this file in Finder to run.
# ============================================

set -e

EXTENSION_NAME="OpenFishTools"
EXTENSION_ID="com.cutefish.tools"
REG_KEY="PlayerDebugMode"

# Resolve project root (two levels up from this script)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Target paths (user-level, no admin required)
CEP_DIR="$HOME/Library/Application Support/Adobe/CEP/extensions"
TARGET_DIR="$CEP_DIR/$EXTENSION_NAME"
OLD_ADMIN_DIR="/Library/Application Support/Adobe/CEP/extensions/$EXTENSION_NAME"

# Colors / formatting
GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

ok()    { printf "            ${GREEN}[OK]${RESET} %s\n" "$1"; }
fail()  { printf "            ${RED}[FAIL]${RESET} %s\n" "$1"; }
warn()  { printf "        ${YELLOW}[WARNING]${RESET} %s\n" "$1"; }
info()  { printf "        ${CYAN}[*]${RESET} %s\n" "$1"; }

printf "\n"
printf "========================================\n"
printf "   OpenFishTools - User CEP Deploy\n"
printf "========================================\n"
printf "\n"

# ----------------------------------------
# Step 0: Check for old admin installation
# ----------------------------------------
if [ -d "$OLD_ADMIN_DIR" ]; then
    warn "Old OpenFishTools installation found in admin folder:"
    printf "        %s\n\n" "$OLD_ADMIN_DIR"
    printf "        Delete old installation from admin folder (will request Admin password)? [y/N] "
    read -r REPLY || REPLY=""
    case "$REPLY" in
        [yY]|[yY][eE][sS])
            info "Requesting administrator privileges to remove old admin folder..."
            if sudo rm -rf "$OLD_ADMIN_DIR"; then
                ok "Old admin folder removed."
            else
                warn "Could not remove old admin folder automatically."
            fi
            ;;
        *)
            info "Kept old admin installation."
            ;;
    esac
    printf "\n"
fi

# ----------------------------------------
# Step 1: Check & Enable PlayerDebugMode
#         CEP 7-16 (per-user setting, no sudo needed)
# ----------------------------------------
printf "[1/3] Checking PlayerDebugMode...\n"
printf "        CEP Versions: 7 through 16\n"
printf "        (CC 2017 to CC 2027+)\n"
printf "\n"

DEBUG_ALL_OK=1

enable_debug() {
    local csxs_version="$1"
    local label="$2"
    local domain="com.adobe.CSXS.${csxs_version}"

    printf "        [CSXS.%s] %s...\n" "$csxs_version" "$label"

    current="$(defaults read "$domain" "$REG_KEY" 2>/dev/null || echo "")"
    if [ "$current" = "1" ]; then
        ok "Already enabled."
        return 0
    fi

    if defaults write "$domain" "$REG_KEY" -string "1" 2>/dev/null; then
        ok "Enabled successfully."
    else
        fail "Could not enable."
        DEBUG_ALL_OK=0
    fi
}

enable_debug "7"  "CC 2017"
enable_debug "8"  "CC 2018"
enable_debug "9"  "CC 2019"
enable_debug "10" "CC 2020"
enable_debug "11" "CC 2021-2024"
enable_debug "12" "CC 2023-2026"
enable_debug "13" "CSXS.13"
enable_debug "14" "CSXS.14"
enable_debug "15" "CSXS.15"
enable_debug "16" "CSXS.16"

printf "\n"
if [ "$DEBUG_ALL_OK" = "1" ]; then
    printf "        ${GREEN}[OK]${RESET} All PlayerDebugMode settings are enabled.\n"
else
    warn "Some keys failed to enable."
fi

printf "\n"

# ----------------------------------------
# Step 2: Prepare User CEP extensions directory
# ----------------------------------------
printf "[2/3] Preparing user target directory...\n"

mkdir -p "$CEP_DIR"

if [ -d "$TARGET_DIR" ]; then
    info "Removing old user version from: $TARGET_DIR"
    rm -rf "$TARGET_DIR"
fi

ok "Target directory ready: $TARGET_DIR"
printf "\n"

# ----------------------------------------
# Step 3: Copy clean extension files (no sudo)
# ----------------------------------------
printf "[3/3] Copying fresh extension files...\n"

mkdir -p "$TARGET_DIR"

info "Copying extension files..."
rsync -a \
    --exclude=".git" \
    --exclude=".gitignore" \
    --exclude=".agents" \
    --exclude=".github" \
    --exclude="Installer" \
    --exclude="scripts" \
    --exclude="skills" \
    --exclude="README.md" \
    --exclude="changelog.md" \
    --exclude="LICENSE" \
    --exclude="AGENTS.md" \
    --exclude="Logo.svg" \
    --exclude="*.sh" \
    --exclude="*.command" \
    --exclude="*.bat" \
    --exclude="*.iss" \
    --exclude="*.ico" \
    "$PROJECT_ROOT/" \
    "$TARGET_DIR/"

ok "All files copied successfully!"

printf "\n"
printf "========================================\n"
printf "   Deploy Complete!\n"
printf "========================================\n"
printf "\n"
printf "   Extension: %s\n" "$EXTENSION_NAME"
printf "   Location:  %s\n" "$TARGET_DIR"
printf "\n"
printf "   Next steps:\n"
printf "   1. Restart After Effects\n"
printf "   2. Go to Window > Extensions > Fish Tools\n"
printf "\n"
printf "========================================\n"
printf "\n"

if [ -t 0 ]; then
    :
else
    printf "Press any key to close...\n"
    read -n 1 -s || true
fi
