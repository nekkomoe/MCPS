% 光子探测效率及能谱测量

% maxN = 100000;
% res = [];
% for totN=10:1000:maxN
%     res = [res photon_detector(totN, false)];
% end
% plot(res);

N = 100000;
useAl = false;
[N, Nm, Np, ED, r] = photon_detector(N, useAl);
detect_eff = Nm/N;
pt_ratio = Np/Nm;
fprintf("探测效率为: η=%.5f\n", detect_eff);
fprintf("峰总比为: f=%.5f\n", pt_ratio);

% Count ED energy, 0~0.8MeV, with 0.003Mev seperate
DeltaE = 0.003;
MaxE = 0.8;
gbN = round(MaxE/DeltaE);
gb = zeros(gbN, 1);
for i=1:gbN
    val = (i-1)*DeltaE;
    gb(i) = sum((ED>val) & (ED<=val+DeltaE));
end
figure;
hold on;
plot(0:DeltaE:MaxE, gb);
xlabel('Energy (MeV)');
ylabel('Count');
title('Energy spectrum(γ)');
hold off;
figure;
hold on;
plot(0:DeltaE:MaxE, gb/(Nm*DeltaE));
xlabel('Energy (MeV)');
ylabel('Probability');
title('Energy spectrum density(γ)');
hold off;

% Calculate FWHM
[mx, idx] = max(gb);
lhs = 1;
rhs = gbN;
for i=idx:-1:1
    if gb(i) < mx/2
        lhs = i;
        break;
    end
end
for i=idx:gbN
    if gb(i) < mx/2
        rhs = i;
        break;
    end
end
fprintf("FWHM: %.5f\n", (rhs-lhs)*DeltaE);

function [N, Nm, Np, ED, r] = photon_detector(N, useAl)
    % N: Number of particles
    % useAl: use Al bottom
    
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

    % γ source
    E0 = 0.662;             % MeV
    lightc = 2.99792458E10; % cm/s

    % Scintillator
    R = 2;      % NaI(Tl) radius (cm)
    H = 4;      % NaI(Tl) height (cm)
    h = 0.1;    % Al bottom (cm)

    % Status of particles, S=(r, E, Ω, t)
    r = zeros(N, 3);      % Position of particles
    E = E0*ones(N, 1);    % Energy of particles
    n = zeros(N, 3);      % Direction of particles
    t = zeros(N, 1);      % Time of particles
    ED = zeros(N, 1);     % Energy of detected particles

    % Counter of particles
    Nm = 0;               % Number of particles that have been detected

    for i = 1:N
        % Initial position
        r(i, :) = [0, 0, H];
        % Initial direction
        n(i, :) = [0, 0, -1];
        % Initial time, begin when particle first enter the scintillator
        t(i) = 0;
        while true
            % Get scatter cross section, photoelectric cross section
            [NaI_s, NaI_p] = calc_sp(NaI, E(i));
            [Al_s, Al_p] = calc_sp(Al, E(i));
            % Get total cross section
            NaI_t = NaI_s + NaI_p;
            Al_t = Al_s + Al_p;

            % Sampling distance
            if not(useAl)
                l = -log(rand) / NaI_t;
            else
                l1 = 0;
                max_t = max(NaI_t, Al_t);
                while true
                    l1 = l1 - log(rand) / max_t;
                    pos = r(i, :) + l1*n(i, :);
                    if pos(3) <= -h || pos(3) >= H || pos(1)^2 + pos(2)^2 >= R^2
                        % Out of bound (in the air)
                        break;
                    end
                    cur_t = 0;
                    if -h < pos(3) && pos(3) <= 0 && pos(1)^2 + pos(2)^2 < R^2
                        % In Al
                        cur_t = Al_t;
                    else
                        % In NaI(Tl)
                        cur_t = NaI_t;
                    end
                    if rand < cur_t/max_t
                        % In the scintillator
                        break;
                    end
                end
                l = l1;
            end

            % Update position
            r(i, :) = r(i, :) + l*n(i, :);
            % Update time
            t(i) = t(i) + l/lightc;

            % Check if particle is out of the scintillator
            if (useAl && r(i, 3) <= -h) || ((not(useAl)) && r(i, 3) <= 0) ...
                || r(i, 3) >= H || r(i, 1)^2 + r(i, 2)^2 >= R^2
                break;
            end

            % Definite reaction type
            if rand < NaI_p/NaI_t
                % Photoelectric effect
                % Update energy
                E(i) = 0;
                break;
            else
                % Compton scattering
                % Sampling energy
                alpha = E(i);
                x = 1; % x = alpha/alpha'
                while true
                    if rand <= 27/(4*alpha+29)
                        x1 = (1+2*alpha)/(1+2*alpha*rand);
                        if 2*rand <= 1+((alpha+1-x1)/alpha)^2
                            x = x1;
                            break;
                        end
                    else
                        x2 = 1+2*alpha*rand;
                        if 4*x2^3*rand <= 27*(x2-1)^2
                            x = x2;
                            break;
                        end
                    end
                end
                E(i) = E(i)/x;

                % Update direction
                muL = 1-1/E(i)+1/alpha; % μL=cos θL
                phi = 2*pi*rand;
                u = n(i, 1);
                v = n(i, 2);
                w = n(i, 3);
                a = muL;
                b = sqrt(1-muL^2);
                c = cos(phi);
                d = sin(phi);
                if u^2+v^2 < 1E-6
                    n(i, 1) = b*c;
                    n(i, 2) = b*d;
                    n(i, 3) = a*w;
                else
                    n(i, 1) = (-b*c*w*u + b*d*v)/sqrt(u^2+v^2) + a*u;
                    n(i, 2) = (-b*c*w*v - b*d*u)/sqrt(u^2+v^2) + a*v;
                    n(i, 3) = b*c*sqrt(u^2+v^2) + a*w;
                end
            end
        end
        % Update energy of detected particles
        ED(i) = E0 - E(i);
        if ED(i) > 0
            Nm = Nm + 1;
        end
    end
    for i=1:N
        if ED(i) > 0
            ED(i) = detect_E(ED(i));
        end
    end
    sig = calc_Sigma(E0);
    Np = sum((ED>=E0-3*sig) & (ED<=E0+3*sig));
    fprintf("σ=%.3f\n", sig);
    fprintf("E±3σ=[%.3f, %.3f]\n", E0-3*sig, E0+3*sig);

    %% Calculate Σs, Σp
    function [ss, sp] = calc_sp(medium, E)
        for j=1:length(medium)-1
            if E >= medium(j, 1) && E < medium(j+1, 1)
                % Get NaI scatter cross section
                ss = medium(j, 2) + (medium(j+1, 2) - medium(j, 2)) / (medium(j+1, 1) - medium(j, 1)) * (E - medium(j, 1));
                % Get NaI photoelectric cross section
                sp = medium(j, 3) + (medium(j+1, 3) - medium(j, 3)) / (medium(j+1, 1) - medium(j, 1)) * (E - medium(j, 1));
                break;
            end
        end
    end
    function [EE] = detect_E(E)
        sig = calc_Sigma(E);
        EE = E + sig*randn;
    end
    function [sig] = calc_Sigma(E)
        sig = 0.4247*(0.01 + 0.05*sqrt(E+0.4*E^2));
    end
end
