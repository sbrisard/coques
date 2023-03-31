include _config;

pair A0 = (0.0, 0.0);
pair B0 = (2.0, 0.0);
pair M0 = (0.5, 0.0);
pair A = (2, 2);
pair B = (5, 3);
pair M = (3, 2);

path Gamma = A{(1.0, 0.5)} :: M{(1.0, -1.0)} :: B{(0.5, 1.0)};
path orientation = shift(0.0, 0.6) * Gamma;
path p = M0{(1.0, 0.3)} :: M;

draw(A0 -- M0 -- B0, THICK, MarkFill[0]);
draw(Gamma, THICK);
draw(orientation, THIN + GREEN, ARROW);
draw(A0{(0.2, 1.0)} :: A, BLUE, ARROW);
draw(B0{(1.0, 0.2)} :: B, BLUE, ARROW);
draw(p, BLUE, ARROW);

dot(A);
dot(B);
dot(M);
dot(A0);
dot(B0);
dot(M0);

label("$a$", A0, align=S);
label("$b$", B0, align=S);
label("$t$", M0, align=S);
label("$\mathsf{A}$", A, align=NW);
label("$\mathsf{B}$", B, align=NE);
label("$\mathsf{M}$", M, align=N);
label("$\Gamma$", point(Gamma, 1.5), align=N);
label("$\mathsf{f}$", point(p, 0.5), align=E);
label("+", point(orientation, 1.3), align=N, GREEN);
