include _config;

int num_points = 3;
real delta_t = 1. / (num_points + 2);

pair A = (0, 0);
pair dirA = expi(radians(60));
pair B = (5.3, 3.2);
pair dirB = expi(radians(-30));

path Gamma = A{dirA} :: B{dirB};

draw(Gamma, THICK);

dot(A);
dot(B);
label("$\mathsf{A} = \mathsf{M}_0$", A, S);
label("$\mathsf{B} = \mathsf{M}_n$", B, S);

pair z1 = A;
for (int i = 1; i <= num_points; ++i) {
    pair z2 = point(Gamma, i * delta_t);
    draw(z1 -- z2, BLUE);
    dot(z2, BLUE);
    label(format("$\mathsf{M}_{%d}$", i), z2, SE);
    z1 = z2;
}
draw(z1 -- B, BLUE);
