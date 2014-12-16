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

Create and move into some folders, say e

  $ source "$TESTDIR/../b.sh"
  $ mkdir -p apple/banana/cherry/durian/a/b/c/d/e
  $ cd apple/banana/cherry/durian/a/b/c/d/e

Move down to b

  $ b b

Check that it lands on b

  $ ls
  c

Move up to d and then go to banana directory

  $ cd c/d
  $ b banana

Check that it lands on banana and the next directory should be cherry

  $ ls
  cherry

Move up to d and then go to do the fuzzy search: 'ban' and it should land on the banana directory

  $ cd cherry/durian/a/b/c/d
  $ b ban

Check that, again, it lands on banana and the next directory should be cherry

  $ ls
  cherry