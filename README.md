# bash-b
Enable the bash shell quickly go back to a specific parent directory or N levels up instead of typing cd ../../.. redundantly

# Usage
<pre>
b     -- It allows the script to go back one level up. 
        Essentially it is just a short cut of cd .. in the shell
b 3   -- It allows the script to go back 3 levels up. 
        Essentially it is just typing cd .. and cd .. and cd .. in the shell. 
        However, it is not allowed to go back beyound the home directory, for secruity reasons. 
b XXX -- It allows the script to go to parent directory name called 'XXX' 
</pre>

# Example
<pre>
ken@Kens-MacBook-Pro:~$ mkdir -p a/b/c/d/e/f/g
ken@Kens-MacBook-Pro:~$ cd a/b/c/d/e/f/g
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ <b>b 4</b> 
ken@Kens-MacBook-Pro:~/a/b/c$ cd d/e/f/g/
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ <b>b c</b>
Going back to 'c' directory!
ken@Kens-MacBook-Pro:~/a/b/c$
</pre>

# Installation
All you need to do is to source b.sh into your .bash_rc (or other file that is configured in your system, it can be .bashrc or something else). Here's the manual installation

<pre>
mkdir -p $HOME/.bash/bash-b
curl https://raw.githubusercontent.com/wwken/bash-b/master/b.sh > $HOME/.bash/bash-b/b.sh
chmod 777 $HOME/.bash/bash-b/b.sh       #Optional, in case the b.sh is not executable
echo "source $HOME/.bash/bash-b/b.sh" >> $HOME/.bash_rc
</pre>

That is. The last step of course is to restart your bash shell or type source $HOME/.bash_rc

Enjoy! Yay, less and less typing for life!
