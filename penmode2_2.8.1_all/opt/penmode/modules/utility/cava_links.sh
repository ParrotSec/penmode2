#!/bin/bash
cd /opt/penmode/output
#script bash per estrarre link da una o piu' pagine web utilizzando il tool lynx
#autore: Stabros

#dichiaro due variabili
filename='url-scanner.txt'
scelta=$1

#con la scelta A ricaviamo tutti i link esistenti di una pagina web	
if [[ $scelta == "A" ]]; then
#	echo "Digita l'url..."
#    read url
	lynx -dump  $url | sed 's/^ *[0-9]*\. [^h]*//' | grep '^http' | sort | uniq > links.txt
#	echo "L'elenco di tutti i link trovati sono nel file links.txt... Buona fortuna!"
    caja /opt/penmode/output/
    exit 0

#con la scelta B ricaviamo tutti i link esistenti da un elenco di pagine web passate come file di testo
else
	if [[ $scelta == "B" ]]; then
		#conto le righe del file contenente i vari indirizzi da testare
		righe=$(wc -l $filename | awk '{print $1}')
#		echo 'Ci sono '$righe 'pagine da testare...'
		while read line; do
		lynx -dump  $line | sed 's/^ *[0-9]*\. [^h]*//' | grep '^http' | sort | uniq >> links.txt
		echo "######################## Please Wait #############################"
		done < $filename
		caja /opt/penmode/output/
#		echo "L'elenco di tutti i link trovati sono nel file links.txt... Buona fortuna!"
		exit 0
	else
		echo "Coccodio make your choice...!!!"
		echo -e "Utilizzo: $BASH_SOURCE [scelta]"
		echo "[*] 'A' Test a page"
		echo "[*] 'B' Test more pages using a file "
		exit
	fi		
fi	
