ls -d /*/ | grep -v /Users/ | tr '\n' '\n' | while read line; do echo "sudo tmutil addexclusion -p $line"; done
ls -d $HOME/*/  | tr '\n' '\n' | while read line; do echo "sudo tmutil addexclusion -p $line"; done
