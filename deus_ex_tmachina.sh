#!/bin/bash

out=`mktemp`.sh
echo ${out}
echo "#!/bin/bash

# comment the lines for directories you want to back up
" > ${out}
exclude_line='while read line; do echo "sudo tmutil addexclusion -p \"$line\"";done'
ls -d ${HOME}/*/  | tr '\n' '\n' | eval ${exclude_line} >> ${out}
ls -d /*/ | grep -v -E "/(Users|dev|net|home)/" | tr '\n' '\n' | eval ${exclude_line} >> ${out}
echo "echo 'TM exclusions list updated'" >> ${out}

editor=${EDITOR:-${VISUAL:-vi}}
${editor} ${out}
chmod +x ${out}
