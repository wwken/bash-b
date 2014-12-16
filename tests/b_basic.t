Create and move into some folders, say d

  $ source "$TESTDIR/../b.sh"
  $ mkdir -p a/b/c/d
  $ cd a/b/c/d

Move down to b

  $ b b

Check that it lands on b

  $ ls
  c

Move up to d and then down 4 levels

  $ cd c/d
  $ b 4

Check that it lands on a (since a is the root folder)

  $ ls
  a