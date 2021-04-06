#!/bin/bash

# set -x
# set -euo pipefail

################################################################################
#                              Chalk Mysql CLI                                 #
#                                                                              #
# Containerised development environment for a mysql database with access to    #
# the debian core                                                              #
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
    echo -e "Chalk commands to make Mysql automation a breeze"
    echo -e
    echo -e "${YELLOW}mysql${RESET_STYLE}"
    echo -e "    client           Starts mysql client interface as root       "
    echo -e "                                                                 "
    echo -e "    populate         Push a *.sql file into an existing database "
    echo -e "                     [/src/dump]                                 "
    echo -e "                                                                 "
    echo -e "    backup           Save an existing database to a *.sql file   "
    echo -e "                     [/src/backup]                               "
    echo -e "                                                                 "
    echo -e
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################

help_fn
