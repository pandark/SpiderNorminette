echo "\n\033[38;5;167m  Thanks for using SpiderNorminette v0.1\033[0m"

# This programs checks some common norm mistakes.
# Feel free to suggest improvements :)
# ~avannest

# /!\ PUT THE PATH OF THE REPERTORY YOU WANT TO CHECK HERE! /!\
# The script tests all files present in the given repertory.
DIR="../Rendu/libft/*.c"

function		ft_grep {
grep -n "$1" $DIR | grep -v ":[\*][\*]\|/[\*]"
}
function		category {
	echo "\033[38;5;36m\n  $1:\033[0m"
}
function		check {
	echo "\033[38;5;30m- Checking $1...\033[0m"
}

category "SPACING & PUNCTUATION"
check "spacing at end of lines"
ft_grep " $\|\t$" 
check "spacing at the beginning of lines"
ft_grep "\n " 
check "mixed tabs and spaces"
ft_grep " \t|\t "
check "spacing after keywords"
ft_grep "if(\|else(i\|return(" 
check "spacing around punctuation marks"
ft_grep "( \| )" 
ft_grep "{ \| {\|{\t"
ft_grep " ," 
check "parenthesis around return value"
ft_grep "return " | grep -v "return ("
check "spacing around any = operator"
ft_grep "=" | grep -v " = \| == \| != \| -= \| += \| *= \| /= \| >= \| <= "

category "REQUIRED CASTS"
check "casts before mallocs"
ft_grep " malloc(" 
check "// commentaries"
ft_grep "//"

category "MISC"
check "more than one instruction per line"
ft_grep ";.*;"

echo ""

