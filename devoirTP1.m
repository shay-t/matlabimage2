I=imread('circuit.tif');%on charge limage circuit.tif a laide de la fonction imread
histo=imhist(I,256);%reccuperation de l'histogramme
%tq a chaque valeur on associe le nbr de pixel dans l'image ayant cette valeur
plot(histo)%affichage de l'histogramme a l'aide de la fct plot
J=imadjust(I);%recadrage de la dynamique de l'image
A=histeq(I);%Egalisation d'histogrammes
B=adapthisteq(I);%Egalisation adaptative d'histogrammes
figure(3);subplot(1,7,1);imshow(I)
figure(3);subplot(1,7,2);plot(histo)
figure(3);subplot(1,7,3);imshow(J)
figure(3);subplot(1,7,4);imhist(I,256)
figure(3);subplot(1,7,5);imshowpair(I,B)
figure(3);subplot(1,7,6);imshow(im_2)
figure(3);subplot(1,7,7);imshow(resultat2)
im_2=I;
seuil1=130;
[l,c]=size(im_2);
for i=1:l
    for j=1:c
        if (im_2(i,j)>seuil1)
            im_2(i,j)=255;
        elseif (im_2(i,j)<seuil1)
            im_2(i,j)=0;
        end 
    end
end
%binarisation de l'image  qst8
resultat2=im2rw(I);

    
  
