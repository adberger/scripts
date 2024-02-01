# Copyright 2024 Flatcar Maintainers
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID=246
ACCT_USER_ENFORCE_ID=yes
ACCT_USER_GROUPS=( systemd-bus-proxy )

acct-user_add_deps
