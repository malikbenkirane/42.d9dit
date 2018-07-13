usage()
{
	echo 'usage: compare.sh <folder1> folder2>'
	echo 'folder1 and folder2 must end with the character `/`'
	exit 2
}

# test parameters (see usage)
if test ${#@} -ne 2; then usage; fi
if test ! -d $1 -o ! -d $2; then usage; fi
if test ! "${1:$((${#1}-1)):1}" = "/"; then usage; fi
if test ! "${2:$((${#1}-1)):1}" = "/"; then usage; fi

# prepare checksums
c1="${1%/}.md5"
c2="${2%/}.md5"
ls $1*.pdf | xargs md5 | grep pdf | cut -d/ -f2 | tr -d ')=' > $c1
ls $2*.pdf | xargs md5 | grep pdf | cut -d/ -f2 | tr -d ')=' > $c2

# diff
echo diff $c1 $c2
diff $c1 $c2
