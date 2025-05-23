#!/usr/bin/env -S bash -euo pipefail
# -------------------------------------------------------------------------------------------------------------------- #
# UNIVERSAL MIRRORING REPOSITORY TOOL
# -------------------------------------------------------------------------------------------------------------------- #
# @package    Bash
# @author     Kai Kimera
# @license    MIT
# @version    0.1.0
# @link       https://github.com/ghastore
# -------------------------------------------------------------------------------------------------------------------- #

(( EUID != 0 )) && { echo >&2 'This script should be run as root!'; exit 1; }

# Parameters.
SRC_REPO="${1:?}"; readonly SRC_REPO
SRC_USER="${2:?}"; readonly SRC_USER
SRC_TOKEN="${3:?}"; readonly SRC_TOKEN
DST_REPO="${4:?}"; readonly DST_REPO
DST_USER="${5:?}"; readonly DST_USER
DST_TOKEN="${6:?}"; readonly DST_TOKEN

# Variables.
d_src='/root/git/src'

# -------------------------------------------------------------------------------------------------------------------- #
# -----------------------------------------------------< SCRIPT >----------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------------- #

function _pushd() {
  command pushd "$@" > '/dev/null' || exit 1
}

function _popd() {
  command popd > '/dev/null' || exit 1
}

function _title() {
  echo '' && echo "${1}" && echo ''
}

function mirror() {
  _title "--- [GIT] CLONE: ${SRC_REPO#https://}"
  local src; src="https://${SRC_USER}:${SRC_TOKEN}@${SRC_REPO#https://}"
  local dst; dst="https://${DST_USER}:${DST_TOKEN}@${DST_REPO#https://}"

  git clone --mirror "${src}" "${d_src}" && _pushd "${d_src}" || exit 1
  git remote add 'dst' "${dst}"
  git push -f --mirror 'dst'

  _popd || exit 1
}

function main() { mirror; }; main "$@"
