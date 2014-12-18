[![Build Status](https://travis-ci.org/wwken/bash-b.png)](https://travis-ci.org/wwken/bash-b)

# bash-b (a.k.a. bash-back or bb)
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

####Basic use - easily navigations on the same directory path
<pre>
ken@Kens-MacBook-Pro:~$ mkdir -p a/b/c/d/e/f/g
ken@Kens-MacBook-Pro:~$ cd a/b/c/d/e/f/g
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ <b>b 4</b> 
ken@Kens-MacBook-Pro:~/a/b/c$ cd d/e/f/g/
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ <b>b c</b>
ken@Kens-MacBook-Pro:~/a/b/c$
</pre>

####More advanced use - a simplified version of pushd and popd!!!

1) Use case of b '/path/to/dir' and bb
<pre>
ken@Kens-MacBook-Pro:~$ cd a/b/c/d/e/f/g
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ pwd
/Users/ken/a/b/c/d/e/f/g
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ mkdir -p /tmp/mm/nn/oo/pp/
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ <b>b /tmp/mm/nn/oo/pp/</b>
ken@Kens-MacBook-Pro:/tmp/mm/nn/oo/pp$ pwd
/tmp/mm/nn/oo/pp/
	...Do other works
ken@Kens-MacBook-Pro:/tmp/mm/nn/oo/pp$ <b>bb</b>
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ pwd
/Users/ken/a/b/c/d/e/f/g
</pre>

2) Use case of bb n, where n is a number indicating the levels of nth previous stored path
<pre>
ken@Kens-MacBook-Pro:~$ mkdir -p /tmp/tt/uu/vv/ww/
ken@Kens-MacBook-Pro:~$ mkdir -p /tmp/xx/yy/zz
ken@Kens-MacBook-Pro:~$ cd a/b/c/d/e/f/g
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ <b>b /tmp/mm/nn/oo/pp/</b>
...Do other works
ken@Kens-MacBook-Pro:/tmp/mm/nn/oo/pp$ <b>b /tmp/tt/uu/vv/ww/</b>
...Do other works
ken@Kens-MacBook-Pro:/tmp/tt/uu/vv/ww$ <b>b /tmp/xx/yy/zz</b>
...Do other works
ken@Kens-MacBook-Pro:/tmp/xx/yy/zz$ <b>bb 3</b>
ken@Kens-MacBook-Pro:~/a/b/c/d/e/f/g$ pwd
/Users/ken/a/b/c/d/e/f/g
</pre>

3) We can use <b>bb -l</b> (or <b>bb -list</b>/) to list all the paths that are stored into the stack.  (more like peeking all the elements from the pushd, conceptually)
<pre>
ken@Kens-MacBook-Pro:~$ mkdir -p /tmp/a/b/c/d
ken@Kens-MacBook-Pro:~$ mkdir -p /tmp/h/j/k/l
ken@Kens-MacBook-Pro:~$ mkdir -p /tmp/m/n/
ken@Kens-MacBook-Pro:~$ mkdir -p /tmp/p/q/r/s/t
ken@Kens-MacBook-Pro:~$ <b>b /tmp/a/b/c/d/</b>
ken@Kens-MacBook-Pro:/tmp/a/b/c/d$ <b>b /tmp/h/j/k/l/</b>
ken@Kens-MacBook-Pro:/tmp/h/j/k/l$ <b>b /tmp/m/n/</b>
ken@Kens-MacBook-Pro:/tmp/m/n$ <b>b /tmp/p/q/r/s/t/</b>
ken@Kens-MacBook-Pro:/tmp/p/q/r/s/t$ <b>bb -l</b>
---- /tmp/p/q/r/s/t   ---current directory
bb - /tmp/m/n
bb 2 /tmp/h/j/k/l
bb 3 /tmp/a/b/c/d
bb 4 /Users/ken
ken@Kens-MacBook-Pro:/tmp/p/q/r/s/t$ <b>bb 3</b>
ken@Kens-MacBook-Pro:/tmp/a/b/c/d$ pwd
/tmp/a/b/c/d
</pre>

# Installation

###- For first time fresh install

Basically all you need to do is to source b.sh into your .bash_rc (or other file that is configured in your system, it can be .bashrc or something else). Here's the manual installation: 

Step 1a: create a bash-b config folder and download the script and source it as follow:
<pre>
mkdir -p $HOME/.bash/bash-b
curl https://raw.githubusercontent.com/wwken/bash-b/master/b.sh > $HOME/.bash/bash-b/b.sh
chmod 777 $HOME/.bash/bash-b/b.sh       #Optional, in case the b.sh is not executable
echo "source $HOME/.bash/bash-b/b.sh" >> $HOME/.bash_rc
</pre>

OR, alternatively (and recommended too!) you can download the project and run the install.sh from the project root directory as follow:

Step 1b: run the ./install.sh
<pre>
./install.sh
</pre>

Step 2: source the updated .bash_rc 
<pre>
source "$HOME/.bash_rc"
</pre>

###- For update/re-install

Step 1: re-download the script and source it as follow:
<pre>
curl https://raw.githubusercontent.com/wwken/bash-b/master/b.sh > $HOME/.bash/bash-b/b.sh
</pre>

Step 2: source the updated .bash_rc 
<pre>
source "$HOME/.bash_rc"
</pre>

That is. :)

Enjoy! Yay, less and less typing for life!
