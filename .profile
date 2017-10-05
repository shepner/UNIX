

settings_history() {
  #set history behavor
  export HISTCONTROL=erasedups
  export HISTSIZE=10000
  shopt -s histappend
  alias h="history"
}

settings_homebrew() {  # Homebrew
  if [ -d $HOME/homebrew ]; then  #alternative location
    export PATH=$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH
  fi

  if [ -d /usr/local/bin ]; then  #default location
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
  fi
}

settings_macports() {  # MacPorts
  if [ -d $HOME/macports ]; then  #alternative location
    export PATH=$HOME/macports/bin:$HOME/macports/sbin:$PATH
    export MANPATH=$HOME/macports/share/man:$MANPATH
  fi
}

saettings_anaconda() {  # Anaconda
  if [ -d $HOME/anaconda/bin ] ; then
    export PATH=$HOME/anaconda/bin:$PATH
  fi
}

settings_perlbrew() {  # perlbrew
  if [ -d $HOME/perl5/perlbrew ] ; then
    export PERLBREW_ROOT=$HOME/perl5/perlbrew
    source ${PRELBREW_ROOT}/etc/bashrc
    perlbrew switch perl-5.20.1
  fi
}

settings_personal() {  # my personal stuff
  export PATH=$HOME/bin:$PATH
}

case `uname` in
  Darwin)
    echo OSX
    settings_history
    settings_homebrew
    settings_macports
    saettings_anaconda
    settings_perlbrew
    settings_personal
    ;;
  FreeBSD)
    echo FreeBSD
    settings_personal
    ;;
  Linux)
    echo Linux
    settings_history
    settings_personal
    ;;
  *)
    echo unknown OS
    ;;
esac
