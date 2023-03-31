include _create_surface;
import graph3;

pen color_xi = GREEN;
pen color_eta = BLUE;

real xi = 0.3;
real eta = 0.7;

path3 Gamma_xi = Sigma.s[0].uequals(xi);
path3 Gamma_eta = Sigma.s[0].vequals(eta);

triple m = Sigma.s[0].point(xi, eta);
triple a_eta = -2 * dir(Gamma_xi, eta);
triple a_xi = 2 * dir(Gamma_eta, xi); /* On triche un peu ! */
triple n = 2 * unit(cross(a_xi, a_eta));

draw(Gamma_xi, color_xi + THICK);
draw(Gamma_eta, color_eta + THICK);

real alpha = 0.8;
path3 T_m = plane(2 * alpha * a_xi, 2 * alpha * a_eta, m - alpha * (a_xi + a_eta));
draw(surface(T_m), RED + opacity(0.20));
label("$\mathcal T(\mathsf{m}, \Sigma)$", point(T_m, 1.0), align=NW);

draw(m -- (m + a_xi), color_eta, arrow=Arrow3(HookHead2, emissive(color_eta)), L=Label("$\vec{a}_\xi$", position=EndPoint, align=E));
draw(m -- (m + a_eta), color_xi, arrow=Arrow3(HookHead2, emissive(color_xi)), L=Label("$\vec{a}_\eta$", position=EndPoint, align=E));
draw(m -- (m + n), RED, arrow=Arrow3(HookHead2, emissive(RED)), L=Label("$\vec{n}$", position=EndPoint, align=W));

dot(m);
label("$\mathsf{m}$", m + 0.05n, align=SW);

/*
int num_curves = 10;
real delta_theta = pi / num_curves;
real delta_gray = 1.0 / num_curves;
for (int i = 0; i < num_curves; ++i) {
    real theta = i * delta_theta;
    real c = cos(theta);
    real s = sin(theta);
    real x(real t) { return Sigma.s[0].point(xi + c * t, eta + s * t).x; };
    real y(real t) { return Sigma.s[0].point(xi + c * t, eta + s * t).y; };
    real z(real t) { return Sigma.s[0].point(xi + c * t, eta + s * t).z; };
    draw(graph(x, y, z, -0.1, 0.1, operator..), THICK + gray((i+1) * delta_gray));
}
*/