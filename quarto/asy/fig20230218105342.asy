include _create_surface;
draw_xyz_frame((-0.15a, 0.55b, -c));

real xi = 0.3;
real eta = 0.7;

draw(Sigma.s[0].uequals(xi), GREEN + THICK, L=Label("$\xi = \mathrm{Cte}$", position=0.9, align=NW));
draw(Sigma.s[0].vequals(eta), BLUE + THICK, L=Label("$\eta = \mathrm{Cte}$", position=0.9, align=W));

triple m2 = Sigma.s[0].point(xi, eta);
dot(m2);
label("$\mathsf{M} = \mathsf{f}(\xi, \eta)$", m2, align=NW);

triple p1 = (2 * xi, 0, 0);
triple p3 = (0, 2 * eta, 0);
triple p2 = (p1.x, p3.y, 0);

triple p4 = (0.9a, 0.2b, -0.1c);
draw_xi_eta_axes(p4);
transform3 t4 = shift(p4);
draw(t4 * (p1 -- p2), GREEN + THICK);
draw(t4 * (p2 -- p3), BLUE + THICK);
dot(t4 * p2);
label("$(\xi, \eta)$", t4 * p2, align=S);

draw ((t4 * p2) .. (1.1a, 0.3b, 0) .. m2, arrow=Arrow3(HookHead2, emissive(black)));
