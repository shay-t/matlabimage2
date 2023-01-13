 %lire image
img=imread("circuit.tif");
%recuperer histogramme
histo=imhist(img,256);
%affichage
figure(1);
plot(histo);
%question 4
%Exploitation de l'histogramme en effectuant plusieurs operations:

%Recadrage de la dynamique de l'image 
img2= imadjust(img);   %d'ajuster les valeurs de l'intensitÃ© ou la palette de couleurs d'une image
%katle3 contraste de limage //valeur deretour image
%Egalisation de l'histogramme 
img3 = histeq(img,256); %accentuer le contraste , retourne image
%Egalisation adaptive d'histogrammes 
%imshow(img)->pour afficher image
img4= adapthisteq(img);  %adaptation avec histogramme Ã  contraste limitÃ©
%affichage de toutes les images avec subplot
%imshowpair la comparaison
figure(2);
subplot(2,2,1) ; imshow(img) ; title('originiale');
subplot(2,2,2) ; imshow(img2) ; title('Recadrage dynamique');
subplot(2,2,3) ; imshow(img3) ; title('Egalisation');
subplot(2,2,4) ; imshow(img4) ; title('Egalisation adaptive');
figure(3);
histo2=imhist(img2,256);
histo3=imhist(img3,256);
histo4=imhist(img4,256);
subplot(2,2,1) ; plot(histo); title('originiale');
subplot(2,2,2) ; plot(histo2) ; title('Recadrage dynamique');
subplot(2,2,3) ; plot(histo3)  ; title('Egalisation');
subplot(2,2,4) ; plot(histo4)  ; title('Egalisation adaptive');
%seuillage
%size ->retourne 2 valeurs 
[l,c]=size(img);
seuil=100;
for i=1:l
    for j=1:c
        if(img(i,j)>100)
            img(i,j)=255;
        else
            img(i,j)=0;
        end
    end
end 
figure(4);imshow(img);
%binearisation
%recharger la meme image
I=imread("circuit.tif");
result=im2bw(I);
figure(5);imshow(result);
%nouvel image en fixanr un seuil 
girl=seuillage(I,60);
figure(6);imshow(girl);
%quantification->espace de couleur
%quantifiaction agit sur lintensité 

X=imread("circuit.tif");
figure(7);
subplot(2,4,1); imshow(X, [0 1]);title('2 niveaux');

subplot(2,4,2); imshow(X, [0 3]);title('4 niveaux');%intervalle de 4 niveaux de gris
subplot(2,4,3); imshow(X, [0 7]);title('8 niveaux');%intervalle de 8 niveaux de gris
%afficher son histo
%n=8
%d=256/n
%imshow(floor(I*255/d)/(n-1));title("8niveaux")
%imhist(floor(I*255/d)/(n-1));title("histo 8niveaux")
subplot(2,4,4); imshow(X, [0 15]);title('16 niveaux');%intervalle de 16 niveaux de gris
subplot(2,4,5); imshow(X, [0 31]);title('32 niveaux');%intervalle de 32 niveaux de gris
subplot(2,4,6); imshow(X, [0 63]);title('64 niveaux');%intervalle de 64 niveaux de gris
subplot(2,4,7); imshow(X, [0 127]);title('128 niveaux');%intervalle de 128 niveaux de gris
subplot(2,4,8); imshow(X, [0 255]);title('256 niveaux');%intervalle de 256 niveaux de gris
%figure();imshow(I);
%J=double(I1/50);
%figure(7);imshow(J);
%echantillonage->ghaybda ykber ou ysgher
I=imread("circuit.tif");
[l,c]=size(I); %on stocke les dimensions de l'image
%n=256/m
%8=m
I1=I(1:8:l,1:8:c);%pas de sous-echantillonnage n=32
I2=I(1:16:l,1:16:c);%pas de sous-echantillonnage n=16
I3=I(1:32:l,1:32:c);%pas de sous-echantillonnage n=8
I4=I(1:64:l,1:64:c);%pas de sous-echantillonnage n=4
I5=I(1:128:l,1:128:c);%pas de sous-echantillonnage n=2
I6=I(1:256:l,1:256:c);%pas de sous-echantillonnage n=1

%affichage du résultat
figure(8);
subplot(2,3,1); imshow(I1);title('n=32');
subplot(2,3,2); imshow(I2);title('n=16');
subplot(2,3,3); imshow(I3);title('n=8');
subplot(2,3,4); imshow(I4);title('n=4');
subplot(2,3,5); imshow(I5);title('n=2');
subplot(2,3,6); imshow(I6);title('n=1');

%decomposition dune image RGB en 3 niveaux
%cest une image indexé
[img ,map]=imread('trees.tif');
I=ind2rgb(img,map);
R=I(:,:,1);
hir=imhist(R,256);
G=I(:,:,1);
hig=imhist(G,256);
B=I(:,:,1);
hib=imhist(B,256);
figure(9);
subplot(1,3,1);imshow(R);title('rouge');
subplot(1,3,2);imshow(G);title('vert');
subplot(1,3,3);imshow(B);title('bleu');


%creation de fonction ->akhir haja f file 
function R=seuillage(Im,n)
[li,co]=size(Im);
for i=1:li
    for j=1:co
        if(Im(i,j)>n)
            Im(i,j)=255;
        else
            Im(i,j)=0;
        end
    end
    R=Im;
end 
end

