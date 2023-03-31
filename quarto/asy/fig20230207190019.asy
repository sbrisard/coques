include _config;

pair A = (0, 0);
pair dirA = expi(radians(60));
pair B = (5.3, 3.2);
pair dirB = expi(radians(-30));

path Gamma = A{dirA} :: B{dirB};

real t = 0.6;
pair M = point(Gamma, t);

pair z1 = dir(Gamma, t);
pair z2 = rotate(90) * z1;
pair M1 = shift(M) * (2 * z1);
pair M2 = shift(M) * (2 * z2);

real r = radius(Gamma, t);
pair C = M - r * z2;

draw(M -- M1, RED, ARROW);
draw(M -- M2, RED, ARROW);
draw(arc(C, r, 50, 180), BLUE);
draw(C -- M, GREEN, ARROW);
draw(Gamma, THICK);

dot(A);
dot(B);
dot(M);
dot(C, GREEN);

label("$\mathsf{A}$", A, S);
label("$\mathsf{B}$", B, S);
label("$\mathsf{C}$", C, S, GREEN);
label("$r$", 0.5 * (M + C), E, GREEN);
label("$\mathbf{t}$", M1, S, RED);
label("$\mathbf{n}$", M2, W, RED);
label("$\Gamma$", point(Gamma, 0.2), N);
