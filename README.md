# bash-b
Enable the bash shell quickly go back to a specific parent directory or N levels up instead of typing cd ../../.. redundantly

# Usage
b -- It allows the script to go back one level up. Essentially it is just a short cut of cd .. in the shell </br>
b 3 -- It allows the script to go back 3 levels up. Essentially it is just typing cd .. and cd .. and cd .. in the shell. However, it is not allowed to go back beyound the home directory, for secruity reasons. </br>
b XXX -- It allows the script to go to parent directory name called 'XXX' </br>

# Example
ken@Kens-MacBook-Pro:~$ mkdir -p a/b/c/d/e/f/g 
ken@Kens-MacBook-Pro:~$ cd a/b/c/d/e/f/g ken@ken-machine-mbp:~/a/b/c/d/e/f/g$ b 4 ken@ken-machine-mbp:~/a/b/c$ cd d/e/f/g/

# Installation
All you need to do is to source b.sh into your .bash_rc (or other file that is configured in your system, it can be .bashrc or something else). Here's the manual installation

mkdir -p $HOME/.bash/bash-b
curl https://raw.githubusercontent.com/wwken/bash-b/master/b.sh > $HOME/.bash/bash-b/b.sh
echo "source $HOME/.bash/bash-b/b.sh" >> $HOME/.bash_rc
Restart your bash shell or type source $HOME/.bash_rc
