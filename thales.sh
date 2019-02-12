#!/bin/bash
#criação das variáveis locais
USUARIO="senac"
TESTE01=$(test A == A ; echo $?)
TESTE02=$(test -f /etc/passwd ; echo $?)
USUARIOS=$(who | awk '{print $1}')

#Utilizando o comando echo para imprimir na tela os valores das variáveis locais
#e variáveis especiais do Shell
echo "impressão na tela...............: Olá, Quebrada!!"
echo "Nome do usuário.................: $USUARIO" 
echo "Nome do arquivo de shell........: $0"
echo "Quantidade de parâmetros........: $#"
echo "Todos os parâmetros.............: $*"
echo "Parâmetro 01....................: $1"
echo "Parâmetro 02....................: $2"
echo "Status do comando anterior......: $?"
echo "PID do processo.................: $$"
echo "Comando: test A == A............: $TESTE01"
echo "Comando: test -f /etc/passwd....: $TESTE02"
echo "Usuários logados................: $USUARIOS"

#Utilizando o comando if para fazer os testes lógicos e 
#validar o ambiente 
if [ $USUARIO == root ]; 
then
    echo "Teste de usuário.............: Usuário é root"
else 			
    echo "Teste de usuário.............: Usuário não é root"
fi	

#Utilizando o comando if encadeado para aumentar a quantidade dos 
#testes lógicos 
if [ $TESTE01 -eq 0 ];
then
	echo "Resultado do comando test é...............: VERDADEIRO"
elif [$TESTE01 -eq 1 ];
then
	echo "Resultado do comando test é...............: FALSO"
fi	

#Utilizando o comando case para fazer os testes lógicos 
#é validar o ambiente 
case $TESTE01 in 
	0) echo "Resultado do comando case é....: 0 - VERDADEIRO";;
	1) echo "Resultado do comando case é....: 1 - FALSO";;
	*) echo "Resultado do comando case é....: NÃO INDENTIFICADO"
esac	

#Utilizando o comando read para receber os valores e 
#fazer o teste lógico com case 
read -p "Digite as letras: A, B ou C..........:" LETRAS;
case $LETRAS in
	A|a) echo "A letra digita foi.............: $LETRAS";;
	B|b) echo "A letra digita foi.............: $LETRAS";;
	C|c) echo "A letra digita foi.............: $LETRAS";;
	*) echo "Letra digitada errada..........: $LETRAS"
esac	

#Utilizando o laço de loop for para verificar ps números digitados 
#junto com o comando read 
read -p"Uma sequência de números........: " NUMEROS;
for VALORES in $NUMEROS;
do 
	echo "Números passados para o Loop..: $VALORES"
done	

#Utilizando o laço de loop for para gerar uma tabuada junto com o
#comando read 
read -p "Digite um Número da tabuada.....: " NUMERO;
for TABUADA in $(seq 0 10);
do 
	echo "$NUMERO X $TABUADA.............: $(($TABUADA * $NUMERO))"
done

#Utilizando o laço de loop white para alcançar os valores
#desejados com o comando read 
read -p "Digite um número de início......: " INICIO;
read -p "Digite um número de fim.........: " FIM;
while [ $INICIO -le $FIM ];
do 
	echo "Valor de sequencia numerica ...: $INICIO"
	let  INICIO=INICIO+1
done















