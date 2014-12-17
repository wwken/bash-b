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
# 
# This script is to go back to a specific parent directory or N levels up instead of typing cd ../../.. redundantly.  
# Basically, there are three type of usages, as follow:
#
# Example
# b     -- It allows the script to go back one level up.  Essentially it is just a short cut of cd .. in the shell
# b 3   -- It allows the script to go back 3 levels up.  Essentially it is just typing cd .. and cd .. and cd .. in the shell.
#           However, it is not allowed to go back beyound the home directory, for secruity reasons.
# b XXX -- It allows the script to go to parent directory name called 'XXX'

b () {
  (($#==0)) && {
    cd ..
    return 0
  } >&2
  (($#==1)) && {
    if [[ -n ${1//[0-9]/} ]];
    then
        if [[ -z "${1##*\/*}" ]];
        then
            b_move_to_specify_directory $1
        else
            b_back_to_specify_directory $1
        fi
    else                        
        b_back_to_N_directories $1
    fi
    return 0
  } >&2
}

function is_this_home_directory() {
    current_dir=`pwd`
    home_dir=`echo $HOME`
    current_dir=${current_dir////###}
    home_dir=${home_dir////###}
    if [[ "$current_dir" = "$home_dir" ]];
    then
        is_this_home_directory_result=true
    else
        is_this_home_directory_result=false
    fi

}

b_back_to_specify_directory() {
    c_dir=`pwd`
    array=(${c_dir//// })
    r_dir=''
    is_found_exact=false
    for i in "${!array[@]}"
    do
        r_dir="$r_dir/${array[i]}"
        if [[ "$1" == "${array[i]}" ]]; then
            is_found_exact=true
            break
        fi
    done
    if [[ "$is_found_exact" = true ]]; then
        cd $r_dir
    else
        start_pos=`echo "$c_dir" "$1" | awk '{print index($1,$2)}' `
        length=${#1}
        cc_dir=${c_dir:$start_pos-1}
        start_pos_2=`echo "$cc_dir" "/" | awk '{print index($1,$2)}' `
        ccc_dir=${c_dir:0:$start_pos+start_pos_2-1}
        #echo "start_pos: $start_pos, length: $length, start_pos_2: $start_pos_2, cc_dir: $cc_dir, ccc_dir: $ccc_dir"
        if [[ "$length" == "($start_pos_2-1)" ]]; then
            echo "There is no parent directory exactly named: '$1'..."
            echo "Going back to the closest matched one directory instead: $ccc_dir"
        elif [[ "$start_pos_2" = 0 ]]; then
            ccc_dir=`pwd`
        fi
        cd $ccc_dir
    fi
}

b_back_to_N_directories() {
    i=$1
    while [ $i -gt 0 ]
    do
        is_this_home_directory
        if [[ "$is_this_home_directory_result" = true ]];
        then
            echo "Due to secruity reasons, the deepest directory you can go back is home directory."
            echo "Back to home directory: `pwd`"
            break
        fi
        b
        i=$[$i-1]
    done
}

b_move_to_specify_directory() {
    cd "$1"
}

