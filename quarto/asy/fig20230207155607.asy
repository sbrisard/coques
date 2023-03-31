include _config;

int num_secants = 5;
real r = 4.0;
real theta_0 = radians(-10);
real delta_theta = radians(10);
real delta_gray = 1 / (num_secants + 1);

pair A = (0, 0);
pair dirA = expi(radians(60));
pair B = (5.3, 3.2);
pair dirB = expi(radians(50));
pair M = (2, 1);
pair dirM = expi(radians(-20));
pair M_prime;

path Gamma = A{dirA} :: M{dirM} :: B{dirB};
draw(Gamma, THICK);

for (int i = -1; i < num_secants; ++i) {
    pair z = i == -1 ? dir(Gamma, 1.0) : expi(theta_0 + i * delta_theta);
    path p = shift(M) * ((0, 0) -- r * z);
    draw(p, gray((i + 1) * delta_gray));
    if (i != -1) {
        M_prime = intersectionpoints(p, Gamma)[1];
        dot(M_prime);
    }
}

dot(M);
label("$\mathsf{M} = \mathsf{f}(t)$", M, NW);
label("$\mathsf{M}' = \mathsf{f}(t')$", M_prime, NW);
label("$\Gamma$", B, NE);
