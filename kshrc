back ()
{
    cd $OLDPWD
    echo $PWD
}

if [ -f ~/._aliases ]
then
    . ~/._aliases
fi

set -o vi

echo $0
echo "PATH = " $PATH
