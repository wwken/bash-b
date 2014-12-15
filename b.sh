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
    if [[ -n ${1//[0-9]/} ]];   #if the argument contains a non-digit
    then
        b_back_to_specify_directory $1
    else                        #Otherwise, the argument is just a number
        #echo "Going back to $1 directories"
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
    #c_dir=${c_dir:0:5}
    start_pos=`echo "$c_dir" "$1" | awk '{print index($1,$2)}' `
    length=${#1}
    cc_dir=${c_dir:$start_pos-1}
    start_pos_2=`echo "$cc_dir" "/" | awk '{print index($1,$2)}' `
    ccc_dir=${c_dir:0:$start_pos+start_pos_2-1}
    #echo "start_pos: $start_pos, length: $length, start_pos_2: $start_pos_2, cc_dir: $cc_dir, ccc_dir: $ccc_dir"
    echo "Going back to '$1' directory!"
    if [[ "$length" == "($start_pos_2-1)" ]]; then
        echo "There is no parent directory exactly named: '$1'..."
        echo "Going back to the closest matched one directory instead: $ccc_dir"
    elif [[ "$start_pos_2" = 0 ]]; then
        ccc_dir=`pwd`
    fi
    cd $ccc_dir
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