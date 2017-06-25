%funcao para ler a imagem, redimensiona-la e passar para escala de cinza
function img = rrg(filename)

% read image
im = imread(filename);

%resize image
im = imresize(im,[30 65]);

img = double(rgb2gray(im));
end
