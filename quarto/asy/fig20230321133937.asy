include _config;

unitsize(2cm);

real r = 1.3;
real L = 1.0;

path Sigma = (r, -L) -- (r, 0.0) .. (0.0, r) .. (-r, 0.0) -- (-r, -L);
draw(Sigma, THICK);
label(point(Sigma, 1.5), "$\Sigma'$", align=NE);

path Pi = (-1.1 * r, 0.0) -- (1.1 * r, 0.0);
draw(shift(0.0, -L) * Pi, THICK + GREEN, L=Label("$\Pi$", position=EndPoint, align=S));

draw((r, -L) -- (r, -L - 1.0), p=BLUE, arrow=ARROW, L=Label("$N_{zz}$", position=EndPoint, align=E));
draw((-r, -L) -- (-r, -L - 1.0), p=BLUE, arrow=ARROW, L=Label("$N_{zz}$", position=EndPoint, align=W));

int num_arrows = 5;
real delta_s =(0.5pi * r + L) / num_arrows;
real r1 = 0.75r;
real r2 = 0.95r;

for (int i = 1; i <= num_arrows; ++i) {
  real s = (i - 0.5) * delta_s - L;
  if (s <= 0) {
    draw((r1, s) -- (r2, s), p=BLUE, arrow=ARROW, L=Label("$p$", position=BeginPoint, align=W));
    draw((-r1, s) -- (-r2, s), p=BLUE, arrow=ARROW, L=Label("$p$", position=BeginPoint, align=E));
  } else {
    pair z = expi(s / r);
    draw(r1 * z -- r2 * z, p=BLUE, arrow=ARROW, L=Label("$p$", position=BeginPoint, align=W));
    z = expi(pi - s / r);
    draw(r1 * z -- r2 * z, p=BLUE, arrow=ARROW, L=Label("$p$", position=BeginPoint, align=E));
  }
}

path e_r = (0.0, 0.0) -- (1.0, 0.0);
path e_z = (0.0, 0.0) -- (0.0, 1.0);

draw(shift(0.0, -L) * e_r, RED + THICK, arrow=ARROW, L=Label("$\mathbf{e}_r$", position=EndPoint, align=SE));

draw(shift(0.0, -L) * e_z, RED + THICK, arrow=ARROW, L=Label("$\mathbf{e}_z$", position=EndPoint, align=N));
