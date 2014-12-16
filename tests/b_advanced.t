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