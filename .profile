#set history behavor
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Homebrew
if [ -d $HOME/homebrew ]; then
  export PATH=$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH
fi

# MacPorts
if [ -d $HOME/macports ]; then
  export PATH=$HOME/macports/bin:$HOME/macports/sbin:$PATH
  export MANPATH=$HOME/macports/share/man:$MANPATH
fi

# Anaconda
if [ -d $HOME/anaconda/bin ] ; then
  export PATH=$HOME/anaconda/bin:$PATH
fi

# perlbrew
if [ -d $HOME/perl5/perlbrew ] ; then
  export PERLBREW_ROOT=$HOME/perl5/perlbrew
  source ${PRELBREW_ROOT}/etc/bashrc
  perlbrew switch perl-5.20.1
fi

# my personal stuff
export PATH=$HOME/bin:$PATH
alias h="history"
