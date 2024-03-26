% NaI(Tl)闪烁体宏观截面数据
    % 能量(MeV) 康普顿效应截面(/cm) 光电效应截面(/cm)
    NaI = [
        1.000E-03 2.1712E-02 2.8604E+04
        1.035E-03 2.2915E-02 2.6589E+04
        1.072E-03 2.4171E-02 2.4721E+04  %% (l)
        1.072E-03 2.4174E-02 2.9081E+04  %% (r)
        1.500E-03 3.9086E-02 1.3950E+04
        2.000E-03 5.6555E-02 7.0354E+03
        3.000E-03 9.0245E-02 2.5701E+03
        4.000E-03 1.2082E-01 1.2298E+03 
        4.557E-03 1.3623E-01 8.7603E+02  %% (l)
        4.557E-03 1.3623E-01 2.4167E+03  %% (r)
        4.702E-03 1.4005E-01 2.2629E+03
        4.852E-03 1.4397E-01 2.1191E+03  %% (l)
        4.852E-03 1.4397E-01 2.8329E+03  %% (r)
        5.000E-03 1.4775E-01 2.6707E+03
        5.188E-03 1.5249E-01 2.4262E+03  %% (l)
        5.188E-03 1.5249E-01 2.7907E+03  %% (r)
        6.000E-03 1.7172E-01 1.9440E+03
        8.000E-03 2.1282E-01 9.1346E+02
        1.000E-02 2.4703E-01 5.0463E+02
        1.500E-02 3.0865E-01 1.6772E+02
        2.000E-02 3.4729E-01 7.5675E+01
        3.000E-02 3.9159E-01 2.4248E+01
        3.317E-02 4.0003E-01 1.8247E+01  %% (l)
        3.317E-02 4.0003E-01 1.0922E+02  %% (r)
        4.000E-02 4.1361E-01 6.6941E+01
        5.000E-02 4.2462E-01 3.6920E+01
        6.000E-02 4.2902E-01 2.2427E+01
        8.000E-02 4.2756E-01 1.0078E+01
        1.000E-01 4.1985E-01 5.3655E+00
        1.500E-01 3.9306E-01 1.6853E+00
        2.000E-01 3.6700E-01 7.4097E-01
        3.000E-01 3.2516E-01 2.3785E-01
        4.000E-01 2.9393E-01 1.0962E-01
        5.000E-01 2.6978E-01 6.1803E-02
        6.000E-01 2.5037E-01 3.9599E-02
        8.000E-01 2.2064E-01 2.0508E-02
    ];

    % Al 宏观截面数据
    % 能量(MeV) 康普顿效应截面(/cm) 光电效应截面(/cm)
    Al = [
        1.00E-03 1.7264E+00 1.4310E+05
        1.50E-03 2.9970E+00 4.8411E+04
        1.56E-03 3.1374E+00 4.3551E+04
        1.56E-03 3.1374E+00 4.7844E+05
        2.00E-03 4.0824E+00 2.7351E+05
        3.00E-03 5.7240E+00 9.5148E+04
        4.00E-03 7.0281E+00 4.3443E+04
        5.00E-03 8.2107E+00 2.3252E+04
        6.00E-03 9.3096E+00 1.3821E+04
        8.00E-03 1.1240E+01 5.9886E+03
        1.00E-02 1.2798E+01 3.0915E+03
        1.50E-02 1.5304E+01 9.0909E+02
        2.00E-02 1.6583E+01 3.7503E+02
        3.00E-02 1.7715E+01 1.0552E+02
        4.00E-02 1.8077E+01 4.2390E+01
        5.00E-02 1.8095E+01 2.0779E+01
        6.00E-02 1.7942E+01 1.1570E+01
        8.00E-02 1.7407E+01 4.5765E+00
        1.00E-01 1.6789E+01 2.2262E+00
        1.50E-01 1.5331E+01 6.0399E-01
        2.00E-01 1.4129E+01 2.4219E-01
        3.00E-01 1.2347E+01 6.9471E-02
        4.00E-01 1.1084E+01 2.9997E-02
        5.00E-01 1.0130E+01 1.6257E-02
        6.00E-01 9.3798E+00 1.0163E-02
        8.00E-01 8.2431E+00 5.1435E-03
    ];

% % Plot NaI scatter cross section
% figure(1);
% hold on;
% plot(NaI(:,1), NaI(:,2), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Scatter cross section (/cm)');
% title('NaI(Tl) scatter cross section');
% hold off;



% % Plot Al scatter cross section
% figure(1);
% hold on;
% plot(Al(:,1), Al(:,2), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Scatter cross section (/cm)');
% title('Al scatter cross section');
% hold off;



% % Plot scatter cross section
% figure(1);
% hold on;
% plot(NaI(:,1), NaI(:,2), 'b-');
% plot(Al(:,1), Al(:,2), 'r-');
% legend('NaI(Tl)', 'Al');
% xlabel('Energy (MeV)');
% ylabel('Scatter cross section (/cm)');
% title('Scatter cross section');
% hold off;

% subplot(1, 2, 1);
% hold on;
% plot(NaI(:,1), NaI(:,2), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Scatter cross section (/cm)');
% title('NaI(Tl) scatter cross section');
% hold off;
% subplot(1, 2, 2);
% hold on;
% plot(Al(:,1), Al(:,2), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Scatter cross section (/cm)');
% title('Al scatter cross section');
% hold off;

% subplot(2, 2, 1);
% hold on;
% plot(NaI(:,1), NaI(:,3), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Photoelectric cross section (/cm)');
% title('NaI(Tl) photoelectric cross section');
% hold off;
% subplot(2, 2, 2);
% hold on;
% plot(NaI(1:15,1), NaI(1:15,3), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Photoelectric cross section (/cm)');
% title('NaI(Tl) photoelectric cross section');
% hold off;
% subplot(2, 2, 3);
% hold on;
% plot(Al(:,1), Al(:,3), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Photoelectric cross section (/cm)');
% title('Al photoelectric cross section');
% hold off;
% subplot(2, 2, 4);
% hold on;
% plot(Al(1:15,1), Al(1:15,3), 'b-');
% xlabel('Energy (MeV)');
% ylabel('Photoelectric cross section (/cm)');
% title('Al photoelectric cross section');
% hold off;



subplot(1, 2, 1);
hold on;
plot(NaI(:,1), NaI(:,3), 'b-');
plot(Al(:,1), Al(:,3), 'r-');
legend('NaI(Tl)', 'Al');
xlabel('Energy (MeV)');
ylabel('Photoelectric cross section (/cm)');
title('Photoelectric cross section');
hold off;
subplot(1, 2, 2);
hold on;
plot(NaI(1:15,1), NaI(1:15,3), 'b-');
plot(Al(1:15,1), Al(1:15,3), 'r-');
legend('NaI(Tl)', 'Al');
xlabel('Energy (MeV)');
ylabel('Photoelectric cross section (/cm)');
title('Photoelectric cross section');
hold off;
