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


# Django
mng ()
{
    manage.py $1 $2
}


if [ -f ~/._aliases ]
then
    . ~/._aliases
fi

set -o vi

echo $0
echo "PATH = " $PATH
