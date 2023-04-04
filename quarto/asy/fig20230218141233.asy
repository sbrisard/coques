include _create_surface;
draw_xyz_frame((-0.15a, 0.55b, -c));


import graph3;

real X0 = 0.4;
real Y0 = 0.7;

real X(real t) {
     return 0.3 * cos(t) + 0.4;
}

real Y(real t) {
     return 0.2 * sin(t) + 0.7;
}

real Z(real t) { return 0; }

path3 Gamma_ = graph(X, Y, Z, 0, 2pi, operator..);

triple p = (0.9a, 0.2b, -0.1c);
draw_xi_eta_axes(p);
draw(shift(p) * Gamma_, THICK + BLUE, L=Label("$[X(t), Y(t)]$", position=EndPoint, align=S, BLUE));

real x(real t) { return Sigma.s[0].point(X(t), Y(t)).x; }
real y(real t) { return Sigma.s[0].point(X(t), Y(t)).y; }
real z(real t) { return Sigma.s[0].point(X(t), Y(t)).z; }

path3 Gamma = graph(x, y, z, 0, 2pi, operator..);
draw(Gamma, THICK + BLUE);
label("$\mathsf{f}[X(t), Y(t)]$", Sigma.s[0].point(X(6), Y(6)), align=NE, BLUE);

label("$\gamma$", Sigma.s[0].point(X0, Y0), BLUE, align=N);
