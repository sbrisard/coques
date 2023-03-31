include _config;

unitsize(2cm);

real r = 1.3;
real r1 = 0.75r;
real r2 = 0.95r;

path Sigma = scale(r) * (E .. N .. W);
draw(Sigma, THICK);
draw(scale(r) * (W .. S .. E), THICK + gray(0.75));

path Pi = (-1.1 * r, 0.0) -- (1.1 * r, 0.0);
draw(Pi, THICK + GREEN, L=Label("$\Pi$", position=EndPoint, align=S));

draw((0.0, 0.0) -- r * dir(50), p=THIN, arrow=ARROW, L=Label("$r$", position=MidPoint, align=N));
label(r * dir(30), "$\Sigma'$", align=NE);


draw((r, 0.0) -- (r, -1.0), p=BLUE, arrow=ARROW, L=Label("$N$", position=EndPoint, align=E));
draw((-r, 0.0) -- (-r, -1.0), p=BLUE, arrow=ARROW, L=Label("$N$", position=EndPoint, align=W));

int num_arrows = 7;
real delta_theta = pi / num_arrows;
for (int i = 1; i <= num_arrows; ++i) {
  pair z = expi((i - 0.5) * delta_theta);
  draw(r1 * z -- r2 * z, p=BLUE, arrow=ARROW, L=Label("$p$", position=BeginPoint, align=S));
}
