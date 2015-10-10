# Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; version 2 of the
# License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
# 02110-1301  USA


# NOTE: target_compile_features() is available in CMake 3.1.3

function(target_compile_features TARGET MODE)

if (CMAKE_COMPILER_IS_GNUCXX)
  target_compile_options(${TARGET} ${MODE} "-std=c++11")
  return()
endif()

endfunction()


function(set_interface_options TARGET DEP)

get_property(opts TARGET ${DEP} PROPERTY INTERFACE_COMPILE_OPTIONS)
#message("setting interface options for dependency ${DEP} on ${TARGET} to: ${opts}")
target_compile_options(${TARGET} PRIVATE ${opts})

endfunction()