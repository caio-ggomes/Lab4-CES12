%% Utils

x0 = [0];

f1 = @(x, xdata) x(1) * xdata.^2;
f2 = @(x, xdata) x(1) * xdata.^4;
f3 = @(x, xdata) x(1) * xdata.^3 .* vecexp(2, xdata);
f4 = @(x, xdata) x(1) * xdata .* vecexp(sqrt(2), xdata);

%% Load files

bb_avis = load('build/SSP_Tests_AlunoTimed2_BB_AVIS.dat');
bb_todd = load('build/SSP_Tests_AlunoTimed2_BB_TODD.dat');
bb_evod = load('build/SSP_Tests_AlunoTimed1_BB_EVOD.dat');
bb_p1 = load('build/SSP_Tests_AlunoTimed1_BB_P1.dat');
bb_p2 = load('build/SSP_Tests_AlunoTimed1_BB_P2.dat');
bb_p3 = load('build/SSP_Tests_AlunoTimed1_BB_P3.dat');
bb_p4 = load('build/SSP_Tests_AlunoTimed1_BB_P4.dat');
bb_p5 = load('build/SSP_Tests_AlunoTimed1_BB_P5.dat');
bb_p6 = load('build/SSP_Tests_AlunoTimed1_BB_P6.dat');
bb_rand = load('build/SSP_Tests_AlunoTimed1_BB_RAND.dat');
pd_avis = load('build/SSP_Tests_AlunoTimed2_PD_AVIS.dat');
pd_todd = load('build/SSP_Tests_AlunoTimed2_PD_TODD.dat');
pd_evod = load('build/SSP_Tests_AlunoTimed1_PD_EVOD.dat');
pd_p1 = load('build/SSP_Tests_AlunoTimed1_PD_P1.dat');
pd_p2 = load('build/SSP_Tests_AlunoTimed1_PD_P2.dat');
pd_p3 = load('build/SSP_Tests_AlunoTimed1_PD_P3.dat');
pd_p4 = load('build/SSP_Tests_AlunoTimed1_PD_P4.dat');
pd_p5 = load('build/SSP_Tests_AlunoTimed1_PD_P5.dat');
pd_p6 = load('build/SSP_Tests_AlunoTimed1_PD_P6.dat');
pd_rand = load('build/SSP_Tests_AlunoTimed1_PD_RAND.dat');

%% Fits

fitbbavis = lsqcurvefit(f4, x0, bb_avis(:, 1), bb_avis(:, 2));
fitbbtodd = lsqcurvefit(f4, x0, bb_todd(:, 1), bb_todd(:, 2));
fitbbevod = lsqcurvefit(f4, x0, bb_evod(:, 1), bb_evod(:, 2));
fitbbrand = lsqcurvefit(f4, x0, bb_rand(:, 1), bb_rand(:, 2));
fitbbp1 = lsqcurvefit(f4, x0, bb_p1(:, 1), bb_p1(:, 2));
fitbbp2 = lsqcurvefit(f4, x0, bb_p2(:, 1), bb_p2(:, 2));
fitbbp3 = lsqcurvefit(f4, x0, bb_p3(:, 1), bb_p3(:, 2));
fitbbp4 = lsqcurvefit(f4, x0, bb_p4(:, 1), bb_p4(:, 2));
fitbbp5 = lsqcurvefit(f4, x0, bb_p5(:, 1), bb_p5(:, 2));
fitbbp6 = lsqcurvefit(f4, x0, bb_p6(:, 1), bb_p6(:, 2));


fitpdavis = lsqcurvefit(f2, x0, pd_avis(:, 1), pd_avis(:, 2));
fitpdtodd = lsqcurvefit(f3, x0, pd_todd(:, 1), pd_todd(:, 2));
fitpdevod = lsqcurvefit(f1, x0, pd_evod(:, 1), pd_evod(:, 2));
fitpdrand = lsqcurvefit(f1, x0, pd_rand(:, 1), pd_rand(:, 2));
fitpdp1 = lsqcurvefit(f1, x0, pd_p1(:, 1), pd_p1(:, 2));
fitpdp2 = lsqcurvefit(f1, x0, pd_p2(:, 1), pd_p2(:, 2));
fitpdp3 = lsqcurvefit(f1, x0, pd_p3(:, 1), pd_p3(:, 2));
fitpdp4 = lsqcurvefit(f1, x0, pd_p4(:, 1), pd_p4(:, 2));
fitpdp5 = lsqcurvefit(f1, x0, pd_p5(:, 1), pd_p5(:, 2));
fitpdp6 = lsqcurvefit(f1, x0, pd_p6(:, 1), pd_p6(:, 2));

%% Plot BB

figure

hold on;
pltbbavis = plot(bb_avis(:, 1), bb_avis(:, 2), 'LineWidth', 2);
pltfitbbavis = plot(bb_avis(:, 1), f4(fitbbavis, bb_avis(:, 1)), 'LineWidth', 2);
title('Meet in the Middle AVIS');
xlabel('Número de elementos');
xlim([4, 16]);
ylabel('Tempo(ms)');
legend([pltbbavis, pltfitbbavis], {'Curva obtida', 'Ajuste à O(n* 2 ^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbavis.png
hold off;


figure

hold on;
pltbbtodd = plot(bb_todd(:, 1), bb_todd(:, 2), 'LineWidth', 2);
pltfitbbtodd = plot(bb_todd(:, 1), f4(fitbbtodd, bb_todd(:, 1)), 'LineWidth', 2);
title('Meet in the Middle TODD');
xlabel('Número de elementos');
xlim([4, 16]);
ylabel('Tempo(ms)');
legend([pltbbtodd, pltfitbbtodd], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbtodd.png
hold off;


figure

hold on;
pltbbevod = plot(bb_evod(:, 1), bb_evod(:, 2), 'LineWidth', 2);
pltfitbbevod = plot(bb_evod(:, 1), f4(fitbbevod, bb_evod(:, 1)), 'LineWidth', 2);
title('Meet in the Middle EVOD');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltbbevod, pltfitbbevod], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbevod.png
hold off;


figure

hold on;
pltbbp1 = plot(bb_p1(:, 1), bb_p1(:, 2), 'LineWidth', 2);
pltfitbbp1 = plot(bb_p1(:, 1), f4(fitbbp1, bb_p1(:, 1)), 'LineWidth', 2);
title('Meet in the Middle P1');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltbbp1, pltfitbbp1], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbp1.png
hold off;


figure

hold on;
pltbbp2 = plot(bb_p2(:, 1), bb_p2(:, 2), 'LineWidth', 2);
pltfitbbp2 = plot(bb_p2(:, 1), f4(fitbbp2, bb_p2(:, 1)), 'LineWidth', 2);
title('Meet in the Middle P2');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltbbp2, pltfitbbp2], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbp2.png
hold off;


figure

hold on;
pltbbp3 = plot(bb_p3(:, 1), bb_p3(:, 2), 'LineWidth', 2);
pltfitbbp3 = plot(bb_p3(:, 1), f4(fitbbp3, bb_p3(:, 1)), 'LineWidth', 2);
title('Meet in the Middle P3');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltbbp3, pltfitbbp3], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbp3.png
hold off;


figure

hold on;
pltbbp4 = plot(bb_p4(:, 1), bb_p4(:, 2), 'LineWidth', 2);
pltfitbbp4 = plot(bb_p4(:, 1), f4(fitbbp4, bb_p4(:, 1)), 'LineWidth', 2);
title('Meet in the Middle P4');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltbbp4, pltfitbbp4], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbp4.png
hold off;


figure

hold on;
pltbbp5 = plot(bb_p5(:, 1), bb_p5(:, 2), 'LineWidth', 2);
pltfitbbp5 = plot(bb_p5(:, 1), f4(fitbbp5, bb_p5(:, 1)), 'LineWidth', 2);
title('Meet in the Middle P5');
xlim([4, 28]);
xlabel('Número de elementos');
ylabel('Tempo(ms)');
legend([pltbbp5, pltfitbbp5], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbp5.png
hold off;


figure

hold on;
pltbbp6 = plot(bb_p6(:, 1), bb_p6(:, 2), 'LineWidth', 2);
pltfitbbp6 = plot(bb_p6(:, 1), f4(fitbbp6, bb_p6(:, 1)), 'LineWidth', 2);
title('Meet in the Middle P6');
xlim([4, 28]);
xlabel('Número de elementos');
ylabel('Tempo(ms)');
legend([pltbbp6, pltfitbbp6], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbp6.png
hold off;


figure

hold on;
pltbbrand = plot(bb_rand(:, 1), bb_rand(:, 2), 'LineWidth', 2);
pltfitbbrand = plot(bb_rand(:, 1), f4(fitbbrand, bb_rand(:, 1)), 'LineWidth', 2);
title('Meet in the Middle RAND');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltbbrand, pltfitbbrand], {'Curva obtida', 'Ajuste à O(n*2^{n/2})'}, 'Location', 'northwest');
print -dpng -r400 images/bbrand.png
hold off;

%% Plot PD

figure

hold on;
pltpdavis = plot(pd_avis(:, 1), pd_avis(:, 2), 'LineWidth', 2);
pltfitpdavis = plot(pd_avis(:, 1), f2(fitpdavis, pd_avis(:, 1)), 'LineWidth', 2);
title('Programacao dinamica AVIS');
xlabel('Número de elementos');
xlim([4, 16]);
ylabel('Tempo(ms)');
legend([pltpdavis, pltfitpdavis], {'Curva obtida', 'Ajuste à O(n^4)'}, 'Location', 'northwest');
print -dpng -r400 images/pdavis.png
hold off;


figure

hold on;
pltpdtodd = plot(pd_todd(:, 1), pd_todd(:, 2), 'LineWidth', 2);
pltfitpdtodd = plot(pd_todd(:, 1), f3(fitpdtodd, pd_todd(:, 1)), 'LineWidth', 2);
title('Programacao dinamica TODD');
xlabel('Número de elementos');
xlim([4, 16]);
ylabel('Tempo(ms)');
legend([pltpdtodd, pltfitpdtodd], {'Curva obtida', 'Ajuste à O(n^3 * 2^n)'}, 'Location', 'northwest');
print -dpng -r400 images/pdtodd.png
hold off;


figure

hold on;
pltpdevod = plot(pd_evod(:, 1), pd_evod(:, 2), 'LineWidth', 2);
pltfitpdevod = plot(pd_evod(:, 1), f1(fitpdevod, pd_evod(:, 1)), 'LineWidth', 2);
title('Programacao dinamica EVOD');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltpdevod, pltfitpdevod], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdevod.png
hold off;


figure

hold on;
pltpdp1 = plot(pd_p1(:, 1), pd_p1(:, 2), 'LineWidth', 2);
pltfitpdp1 = plot(pd_p1(:, 1), f1(fitpdp1, pd_p1(:, 1)), 'LineWidth', 2);
title('Programacao dinamica P1');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltpdp1, pltfitpdp1], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdp1.png
hold off;


figure

hold on;
pltpdp2 = plot(pd_p2(:, 1), pd_p2(:, 2), 'LineWidth', 2);
pltfitpdp2 = plot(pd_p2(:, 1), f1(fitpdp2, pd_p2(:, 1)), 'LineWidth', 2);
title('Programacao dinamica P2');
xlim([4, 28]);
xlabel('Número de elementos');
ylabel('Tempo(ms)');
legend([pltpdp2, pltfitpdp2], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdp2.png
hold off;


figure

hold on;
pltpdp3 = plot(pd_p3(:, 1), pd_p3(:, 2), 'LineWidth', 2);
pltfitpdp3 = plot(pd_p3(:, 1), f1(fitpdp3, pd_p3(:, 1)), 'LineWidth', 2);
title('Programacao dinamica P3');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltpdp3, pltfitpdp3], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdp3.png
hold off;


figure

hold on;
pltpdp4 = plot(pd_p4(:, 1), pd_p4(:, 2), 'LineWidth', 2);
pltfitpdp4 = plot(pd_p4(:, 1), f1(fitpdp4, pd_p4(:, 1)), 'LineWidth', 2);
title('Programacao dinamica P4');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltpdp4, pltfitpdp4], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdp4.png
hold off;


figure

hold on;
pltpdp5 = plot(pd_p5(:, 1), pd_p5(:, 2), 'LineWidth', 2);
pltfitpdp5 = plot(pd_p5(:, 1), f1(fitpdp5, pd_p5(:, 1)), 'LineWidth', 2);
title('Programcao dinamica P5');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltpdp5, pltfitpdp5], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdp5.png
hold off;


figure

hold on;
pltpdp6 = plot(pd_p6(:, 1), pd_p6(:, 2), 'LineWidth', 2);
pltfitpdp6 = plot(pd_p6(:, 1), f1(fitpdp6, pd_p6(:, 1)), 'LineWidth', 2);
title('Programacao dinamica P6');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltpdp6, pltfitpdp6], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdp6.png
hold off;


figure

hold on;
pltpdrand = plot(pd_rand(:, 1), pd_rand(:, 2), 'LineWidth', 2);
pltfitpdrand = plot(pd_rand(:, 1), f1(fitpdrand, pd_rand(:, 1)), 'LineWidth', 2);
title('Programacao dinamica RAND');
xlabel('Número de elementos');
xlim([4, 28]);
ylabel('Tempo(ms)');
legend([pltpdrand, pltfitpdrand], {'Curva obtida', 'Ajuste à O(n^2)'}, 'Location', 'northwest');
print -dpng -r400 images/pdrand.png
hold off;
