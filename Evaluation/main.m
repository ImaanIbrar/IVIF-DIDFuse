%% Li H, Wu X J. DenseFuse: A Fusion Approach to Infrared and Visible Images[J]. arXiv preprint arXiv:1804.08361, 2018. 
%% https://arxiv.org/abs/1804.08361

fileName_source_ir  = ["infrared image name"];
fileName_source_vis = ["visible image name"];
fileName_fused      = ["fused image name"];

source_image1 = imread(fileName_source_ir);
source_image2 = imread(fileName_source_vis);
fused_image   = imread(fileName_fused);

disp("Start");
disp('---------------------------Analysis---------------------------');
[EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,SSIM, MS_SSIM,SD] = analysis_Reference(fused_image,source_image1,source_image2);

% Display results

fprintf('Entropy (EN): %.4f\n', EN);
fprintf('Mutual Information (MI): %.4f\n', MI);
fprintf('Qabf: %.4f\n', Qabf);
fprintf('FMI (Pixel): %.4f\n', FMI_pixel);
fprintf('FMI (DCT): %.4f\n', FMI_dct);
fprintf('FMI (Wavelet): %.4f\n', FMI_w);
fprintf('Nabf: %.4f\n', Nabf);
fprintf('Structural Content Difference (SCD): %.4f\n', SCD);
fprintf('Structural Similarity Index (SSIM): %.4f\n', SSIM);
fprintf('Multi-Scale Structural Similarity Index (MS_SSIM): %.4f\n', MS_SSIM);
fprintf('Standard Deviation (SD): %.4f\n', SD);

disp('Done');


