import three;
import graph3;

include _config;
size(8cm);
settings.prc = false;
settings.render = 8;

currentlight=light(specularfactor=1, (0, 4, 10));
//currentprojection=orthographic((1, 1, 0.5));

real a = 3.0;
real b = 4.0;
real c = 1.0;

real f(pair xy) {
    return - c * ((xy.x / a)**2 + (xy.y / b)**2);
}

surface Sigma = surface(f, (-a, -b), (a, b), nx=10, ny=10, xsplinetype=Spline);
draw(Sigma, yellow);

pair _m = (a / 2, b / 2);
real z = f(_m);
triple m = (_m.x, _m.y, z);
dot(m);

real eps = 1e-8;
triple a_x = 2 * unit((1, 0, (f(_m + eps * (1, 0)) - z) / eps));
triple a_y = 2 * unit((0, 1, (f(_m + eps * (0, 1)) - z) / eps));
triple n = 2 * unit(cross(a_x, a_y));

real alpha = 0.8;

triple g1(real t) { return (t, _m.y, f((t, _m.y))); }
path3 Gamma1 = graph(g1, -a, a, operator..);
surface Pi1 = surface(plane(2alpha * a_x, 2alpha * n, m - alpha * (a_x + n)));

draw(m -- (m + a_x), BLUE, arrow=Arrow3(HookHead2, emissive(BLUE)), L=Label("$\vec{t}_1$", position=EndPoint, align=W));
draw(Gamma1, BLUE + THICK);
draw(Pi1, BLUE + opacity(0.3));
label("$\pi_1$", m + alpha * (n - a_x), BLUE, align=NE);
label("$\gamma_1$", g1(-0.75a), BLUE, align=N);

triple g2(real t) { return (_m.x, t, f((_m.x, t))); }
path3 Gamma2 = graph(g2, -b, b, operator..);
surface Pi2 = surface(plane(2alpha * a_y, 2alpha * n, m - alpha * (a_y + n)));

draw(m -- (m + a_y), GREEN, arrow=Arrow3(HookHead2, emissive(GREEN)), L=Label("$\vec{t}_2$", position=EndPoint, align=E));
draw(Gamma2, GREEN + THICK);
draw(Pi2, GREEN + opacity(0.3));
label("$\pi_2$", m + alpha * (n - a_y), GREEN, align=NW);
label("$\gamma_2$", g2(-b), GREEN, align=N);

draw(m -- (m + n), RED, arrow=Arrow3(HookHead2, emissive(RED)), L=Label("$\vec{n}$", position=EndPoint, align=N));
