if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

if which rbenv > /dev/null ; then 
eval "$(rbenv init -)"
fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl) --with-readline-dir=$(brew --prefix readline) $RUBY_CONFIGURE_OPTS"

export PATH="$HOME/.cargo/bin:$PATH"
