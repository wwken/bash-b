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

if [ ! -d "$HOME/.bash/bash-b" ]; then
	mkdir -p $HOME/.bash/bash-b
fi 
curl https://raw.githubusercontent.com/wwken/bash-b/master/b.sh > $HOME/.bash/bash-b/b.sh
chmod 777 $HOME/.bash/bash-b/b.sh       #Optional, in case the b.sh is not executable
if grep -q "bash-b/b.sh" "$HOME/.bash_rc"; then
   :	#do nothing
else
	echo "source $HOME/.bash/bash-b/b.sh" >> $HOME/.bash_rc
fi
