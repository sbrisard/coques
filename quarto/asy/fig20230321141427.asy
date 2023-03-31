include _config;

unitsize(2cm);

real r = 1.3;
real dr = 0.1r;
real L = 1.0;
real psi_deg = 30;

pair O = (0.0, 0.0);
pair A = r * dir(psi_deg);
pair dz = (dr, 0.0);

path Sigma = arc(O, r, psi_deg, 180 - psi_deg);
path Pi = (r * dir(180 - psi_deg) - dz) -- (r * dir(psi_deg) + dz);
path n = O -- dir(psi_deg);
path e_psi = O -- dir(psi_deg + 90);
path e_r = O -- (1.0, 0.0);
path e_z = O -- (0.0, 1.0);

draw(Sigma, THICK);

draw((r, -L) -- arc(O, r, 0, psi_deg) ^^ arc(O, r, 180 - psi_deg, 180) -- (-r, -L), THICK + gray(0.75));
draw(Pi, p = THICK + GREEN, L=Label("$\Pi$", position=EndPoint, align=E));

draw(O -- A, THIN, arrow=ARROW, L=Label("$r$", position=0.75, align=S));

draw((-r - dr, 0.0) -- (-0.0, 0.0) ^^ (1.0, 0.0) -- (r + dr, 0.0) ^^ (0.0, 1.0) -- (0.0, r + dr), THIN);

draw(e_r, THICK + RED, arrow=ARROW, L=Label("$\mathbf{e}_r$", position=0.5, align=S));
draw(e_z, THICK + RED, arrow=ARROW, L=Label("$\mathbf{e}_z$", position=0.5, align=W));

draw(shift(A) * n, RED + THICK, arrow=ARROW, L=Label("$\mathbf{n}$", position=EndPoint, align=E));
draw(shift(A) * e_psi, RED + THICK, arrow=ARROW, L=Label("$\mathbf{e}_\psi$", position=EndPoint, align=N));

path p = shift(A) * scale(-1.2) * e_psi;
draw(p, BLUE, arrow=ARROW, L=Label("$N_{\psi\psi}$", position=EndPoint, align=S));
draw(reflect(O, N) * p, BLUE, arrow=ARROW, L=Label("$N_{\psi\psi}$", position=EndPoint, align=S));

draw(arc(O, 0.75, 0.0, psi_deg), THIN, arrow=ARROW, L=Label("$\psi$", position=EndPoint, align=N));

draw((A + S) -- A, THIN);
draw(arc(A, 0.75, -90, -90 + psi_deg), THIN, arrow=ARROW, L=Label("$\psi$", position=1.0, align=E));

label("$\Sigma$", r * dir(120), align=N);

int num_arrows = 4;
real delta_theta = (180 - 2 * psi_deg) / num_arrows;
real r1 = 0.75r;
real r2 = 0.95r;

for (int i = 1; i <= num_arrows; ++i) {
  real theta = psi_deg + (i - 0.5) * delta_theta;
  pair z = dir(theta);
  draw(r1 * z -- r2 * z, p=BLUE, arrow=ARROW, L=Label("$p$", position=BeginPoint, align=theta <= 90 ? W : E));
}
