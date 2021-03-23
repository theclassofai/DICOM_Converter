%% OPEN AND SAVE DICOM DATA AS AN IMAGE FILE
%Variables
%filename = enclosed by 'filename', name of the dicom file to be converted
%imagetype = enclose by 'imagetype', name of the output image type (png,bmp,jpg,png,tiff,gif etc..)

function dicom2image(filename,imagetype,outname)
%%%%%%%%%%%%%%%%%%%%%%% input name %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~exist('filename','var') % doesn't exist
error('You need an input name!');
end
%%%%%%%%%%%%%%%%%%%%%%% image type %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~exist('imagetype','var') % doesn't exist
error('Please specify image type!');
end
%% Read and DICOM data
dcmfile = dicomread(filename);
%% Show Original DICOM(.dcm) Image
figure ()
imshow(dcmfile,[]);
title('Original DICOM Image');

%% Convert DICOM to image file
dcmImagei = uint8(255 * mat2gray(dcmfile)); %Convert to uint8 format
if(imagetype == 'png')
imwrite(dcmImagei,outname, imagetype);% Save Image to specified image type
display('Finished saving .png image');
elseif(imagetype == 'bmp')
imwrite(dcmImagei,outname, imagetype);
display('Finished saving .bmp image');
elseif(imagetype == 'jpg')
imwrite(dcmImagei,outname, imagetype);
display('Finished saving .jpg image');
elseif(imagetype == 'gif')
imwrite(dcmImagei,outname, imagetype);
display('Finished saving .gif image');
else
Display('Saving error');
end

end