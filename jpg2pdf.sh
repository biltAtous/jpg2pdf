#! /bin/bash


for i in *.jpg; do 
    echo "processing file: " "$i"
    cp "$i" "dump.jpg"   #copy picture to downgrade in the next step
    mogrify -quality 30% "dump.jpg"      # downgrades copy of the picture
    convert -page 1600x1200 "dump.jpg" "$i".pdf   #converts picture in to pdf
    rm "dump.jpg"  #removes copy of the picture
done


echo "Converting PDF's in a single PDF file."
pdfunite *.pdf FinalPDF.pdf

echo "Deleting PDF files..."
mv FinalPDF.pdf FinalPDF.pdf.jpg #renames to avoid deletion 
rm *.pdf
mv FinalPDF.pdf.jpg FinalPDF.pdf   #back to normal name



echo "program exit"

