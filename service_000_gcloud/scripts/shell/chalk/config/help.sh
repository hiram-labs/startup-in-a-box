#! /bin/sh

# set -x
# set -euo pipefail

################################################################################
#                              scriptTemplate                                  #
#                                                                              #
# Use this template as the beginning of a new program. Place a short           #
# description of the script here.                                              #
#                                                                              #
# Change History                                                               #
# 11/11/2019  David Both    Original code. This is a template for creating     #
#                           new Bash shell scripts.                            #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C) 2021 Owusu K                                                  #
#  LinuxGeek46@both.org                                                        #
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
    prompt_intro_msg
    echo "Add description of the script functions here."
    echo
    echo "Syntax: scriptTemplate [-g|h|t|v|V]"
    echo "options:"
    echo "  g     Print the GPL license notification."
    echo "  h     Print this Help."
    echo "  v     Verbose mode."
    echo "  V     Print software version and exit."
    echo
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################

help_fn
