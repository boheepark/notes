back ()
{
    cd $OLDPWD
    echo $PWD
}

reloadrc ()
{
    . ~/.kshrc
}

virc ()
{
    case $1 in
    bash) vi ~/.bashrc ;;
      "") vi ~/.kshrc ;;
    esac
}



# ssh

authssh ()
{
    if [ ! $# == 2 ]; then
        echo "Usage: $0 <user> <host>"
    fi

    user="$1"
    host="$2"

    cat ~/.ssh/id_rsa.pub | ssh $user@$host 'cat >> ~/.ssh/authorized_keys'
}




# python

venv ()
{
    . "$1"venv/bin/activate
}

py ()
{
    case $1 in
    *.py | -*) python $1 ;;
      "") python ;;
       *) python $1".py" ;;
    esac
}

py3 ()
{
    case $1 in
    *.py) python3 $1 ;;
      "") python3 ;;
       *) python3 $1".py" ;;
    esac
}



if [ -f ~/._aliases ]
then
    . ~/._aliases
fi

set -o vi

echo $0
echo "PATH = " $PATH
