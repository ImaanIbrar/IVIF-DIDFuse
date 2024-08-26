% evaluation_script.m
% Add paths to the evaluation functions
cd('D:\Research\IVIF-DIDFuse');
addpath('Evaluation');

% Define the paths to the test images and the fused images
test_data_path = 'Datasets\Test_data_TNO';
fused_image_path = 'Test_result\TNO_IJCAI';

% Determine the number of files
Test_Image_Number = length(dir(fullfile(test_data_path, 'IR*.bmp')));

% Initialize arrays to store the evaluation results
EN_results = zeros(Test_Image_Number, 1);
MI_results = zeros(Test_Image_Number, 1);
Qabf_results = zeros(Test_Image_Number, 1);
FMI_pixel_results = zeros(Test_Image_Number, 1);
FMI_dct_results = zeros(Test_Image_Number, 1);
FMI_w_results = zeros(Test_Image_Number, 1);
Nabf_results = zeros(Test_Image_Number, 1);
SCD_results = zeros(Test_Image_Number, 1);
SSIM_results = zeros(Test_Image_Number, 1);
MS_SSIM_results = zeros(Test_Image_Number, 1);
SD_results = zeros(Test_Image_Number, 1);


for i = 1:Test_Image_Number
    % Load the source images and the fused image
    image_ir = imread(fullfile(test_data_path, ['IR', num2str(i), '.bmp']));
    image_vis = imread(fullfile(test_data_path, ['VIS', num2str(i), '.bmp']));
    image_f = imread(fullfile(fused_image_path, ['F', num2str(i), '.png']));
    
    % Convert images to double precision
    image_ir = im2double(image_ir);
    image_vis = im2double(image_vis);
    image_f = im2double(image_f);
    
    % Evaluate the fused image using the metrics
    [EN, MI, Qabf, FMI_pixel, FMI_dct, FMI_w, Nabf, SCD, SSIM, MS_SSIM, SD] = analysis_Reference(image_f, image_ir, image_vis);
    
    % Store the results
    EN_results(i) = EN;
    MI_results(i) = MI;
    Qabf_results(i) = Qabf;
    FMI_pixel_results(i) = FMI_pixel;
    FMI_dct_results(i) = FMI_dct;
    FMI_w_results(i) = FMI_w;
    Nabf_results(i) = Nabf;
    SCD_results(i) = SCD;
    SSIM_results(i) = SSIM;
    MS_SSIM_results(i) = MS_SSIM;
    SD_results(i) = SD; % Store SD result

end

% Display the results
disp('Evaluation Results:');
disp(['EN: ', num2str(mean(EN_results))]);
disp(['MI: ', num2str(mean(MI_results))]);
disp(['Qabf: ', num2str(mean(Qabf_results))]);
disp(['FMI_pixel: ', num2str(mean(FMI_pixel_results))]);
disp(['FMI_dct: ', num2str(mean(FMI_dct_results))]);
disp(['FMI_w: ', num2str(mean(FMI_w_results))]);
disp(['Nabf: ', num2str(mean(Nabf_results))]);
disp(['SCD: ', num2str(mean(SCD_results))]);
disp(['SSIM: ', num2str(mean(SSIM_results))]);
disp(['MS_SSIM: ', num2str(mean(MS_SSIM_results))]);
disp(['SD: ', num2str(mean(SD_results))]);
