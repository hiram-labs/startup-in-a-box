#!/bin/bash

# set -x
# set -euo pipefail

################################################################################
#                              Chalk Selenium CLI                              #
#                                                                              #
# Containerised development environment for managing                          #
# gcloud kubernetes cluster                                                    #
#                                                                              #
#                                                                              #
# Change History                                                               #
# 01/01/2020  Owusu K    Original code.                                        #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C) 2021 Owusu K                                                  #
#  hiramlabs.com                                                               #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 2 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################
################################################################################
################################################################################

################################################################################
# Help                                                                         #
################################################################################
help_fn() {
    chalk prompt 101
    echo -e "Chalk commands to make gcloud cluster management a breeze"
    echo -e
    echo -e "${YELLOW}gcloud${RESET_STYLE}"
    echo -e "    connect          Connect to a cluster                      "
    echo -e "                                                               "
    echo -e "    cluster          Creates a cluster different form          "
    echo -e "                    [chalk cluster <install|uninstal|upgrade>] "
    echo -e "                                                               "
    echo -e "    static-ip        Provisions or gets already existing IP    "
    echo -e "                     static ip address                         "
    echo -e "                                                               "
    echo -e
    echo -e "${YELLOW}cluster${RESET_STYLE}"
    echo -e "    install      Installs k8s helm charts and manifests        "
    echo -e "                                                               "
    echo -e "    uninstall    Uninstalls k8s helm charts and manifests      "
    echo -e "                                                               "
    echo -e "    upgrade      Patches k8s helm charts and manifest          "
    echo -e "                                                               "
    echo -e " Check out the docs on resources available through chalk       "
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################

help_fn
