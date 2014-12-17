# Copyright (c) 2014 Ken Wu
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#
# -----------------------------------------------------------------------------
#
# Author: Ken Wu
# Date: 2014 December

Initialize the b.sh and create and move into some folders

  $ source "$TESTDIR/../b.sh"
  $ mkdir -p apple/banana/cherry/durian/aa/xx/aa/yy/e
  $ cd apple/banana/cherry/durian/aa/xx/aa

Create an other new folder which is outside the current directory path and "bove" into it

  $ mkdir -p /tmp/hh/ii/jj/kk
  $ b /tmp/hh/ii/jj

Check that it lands on jj folder

  $ ls
  kk

Performs bb to go back to the previous path stack

  $ bb

Check that it lands back on apple/banana/cherry/durian/aa/xx/aa

  $ ls
  yy

Create more different folders and "bove" into one of it
  $ mkdir -p /tmp/mm/nn/oo/pp
  $ mkdir -p /tmp/tt/uu/vv/ww
  $ b /tmp/hh/ii/jj
  $ b /tmp/mm/nn/oo/pp
  $ b /tmp/tt/uu/vv

Check that it lands on /tmp/tt/uu/vv

  $ ls
  ww

Execute bb 2 to go back to the previous previous path stored into the stack (i.e. /tmp/hh/ii/jj)

  $ bb 2

Go back one level up in /tmp/hh/ii/jj and Check that it lands on /tmp/hh/ii

  $ b
  $ ls
  jj

Execute bb 10 (kinda crazy but should be allowed) to go back to the root path stored into the stack (i.e. apple/banana/cherry/durian/aa/xx/aa)

  $ bb 10

Go back one level up in apple/banana/cherry/durian/aa/xx/aa and Check that it lands on apple/banana/cherry/durian/aa/xx

  $ b
  $ ls
  aa
