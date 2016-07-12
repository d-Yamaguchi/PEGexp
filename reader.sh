#!/bin/sh

echo pick out grammar@@@.nez to grammar%%%.nez
echo input @@@
read start
echo input %%%
read end

filename=grammar.nez

cat<<EOF > ${filename}
//grammar${start}.nez to grammar${end}.nez
EOF

for var in `seq ${start} ${end}`
do
    echo //grammar${var}.nez >> ${filename}
    cat GeneratedGrammars/grammar${var}.nez >> ${filename}
    echo "\n" >> ${filename}
done

java -jar nez.jar format -g ${filename} > grammar${start}-${end}.nez

rm ${filename}
