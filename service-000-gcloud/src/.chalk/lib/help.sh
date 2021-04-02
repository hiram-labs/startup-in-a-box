#!/bin/sh

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
    echo -e "${YELLOW}gcloud${RESET_COLOR}"
    echo -e "    python init      Start python dev environment with pipenv  "
    echo -e "                     managing dependencies.                    "
    echo -e "                                                               "
    echo -e "    python pretty    Prettifies all python files in /python    "
    echo -e "                                                               "
    echo -e "    python isort     Sort all python imports in /python        "
    echo -e "                                                               "
    echo -e "    python lint      Lint all python files in /python          "
    echo -e
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################

help_fn
