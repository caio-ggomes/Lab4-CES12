%%
% Import dos dados a serem utlizados

trocoDC40 = load('build/troco_DC40.csv');
trocoDC40(end, :) = [];
trocoGRBR200 = load('build/troco_GR_BR200.csv');
trocoGRBR200(end, :) = [];
trocoGRGRLoses = load('build/troco_GR_GRLoses.csv');
trocoGRGRLoses(end, :) = [];
trocoPDBR200 = load('build/troco_PD_BR200.csv');
trocoPDBR200(end, :) = [];
trocoPDGRLoses = load('build/troco_PD_GRLoses.csv');
trocoPDGRLoses(end, :) = [];

%%
% Algoritmo Divisão e Conquista

figure
hold on;
grid on;
plot(trocoDC40(:, 1), trocoDC40(:, 2), 'LineWidth', 2);
title('Tempo despendido por DC');
xlabel('Valor do troco');
ylabel('Tempo(ms)');
hold off;
print -dpng -r400 dct.png

figure
hold on;
grid on;
plot(trocoDC40(:, 1), trocoDC40(:, 3), 'LineWidth', 2);
title('Quantidade de moedas utlizadas em DC');
xlabel('Valor do troco');
ylabel('Quantidade de moedas');
hold off;
print -dpng -r400 dcq.png

%%
% Algoritmo Greedy
figure
hold on;
grid on;
plot(trocoGRBR200(:, 1), trocoGRBR200(:, 2), 'LineWidth', 2);
title('Tempo despendido por Greedy');
xlabel('Valor do troco');
ylabel('Tempo(ms)');
hold off;
print -dpng -r400 grt.png

figure
hold on;
grid on;
plot(trocoGRBR200(:, 1), trocoGRBR200(:, 3), 'LineWidth', 2);
title('Quantidade de moedas utlizadas em Greedy');
xlabel('Valor do troco');
ylabel('Quantidade de moedas');
hold off;
print -dpng -r400 grq.png

%%
% Algoritmo Programação Dinâmica

figure
hold on;
grid on;
plot(trocoPDBR200(:, 1), trocoPDBR200(:, 2), 'LineWidth', 2);
title('Tempo despendido em PD');
xlabel('Valor do troco');
ylabel('Tempo(ms)');
hold off;
print -dpng -r400 pdt.png

figure
hold on;
grid on;
plot(trocoPDBR200(:, 1), trocoPDBR200(:, 3), 'LineWidth', 2);
title('Quantidade de moedas utlizadas em PD');
xlabel('Valor do troco');
ylabel('Quantidade de moedas');
hold off;
print -dpng -r400 pdq.png

%%
% Análise da Corretude dos algoritmos de PD e GR

figure
hold on;
grid on;
pltgrq = plot(trocoGRGRLoses(:, 1), trocoGRGRLoses(:, 3), 'LineWidth', 2);
pltpdq = plot(trocoPDGRLoses(:, 1), trocoPDGRLoses(:, 3), 'LineWidth', 2);
title('Erro do Algoritmo Greed');
xlabel('Valor do troco');
ylabel('Quantidade de Moedas');
legend([pltgrq, pltpdq], {'Greedy', 'Programação Dinâmica'}, 'Location', 'southeast');
hold off;
print -dpng -r400 grerror.png

