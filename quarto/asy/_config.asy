unitsize(1cm);

pen THICK = linewidth(2.0 * linewidth());
pen THIN = linewidth(0.7 * linewidth());

pen RED = red;
pen GREEN = green;
pen BLUE = blue;

arrowbar ARROW = ArcArrow(HookHead);

// void draw_xyz_frame(triple p) {
//     transform3 t = shift(p);
//     draw(t * ((0, 0, 0) -- (2, 0, 0)), arrow=Arrow3(HookHead2, emissive(RED)), p=RED, L=Label("$\vec{e}_x$", position=EndPoint, align=W));
//     draw(t * ((0, 0, 0) -- (0, 2, 0)), arrow=Arrow3(HookHead2, emissive(RED)), p=RED, L=Label("$\vec{e}_y$", position=EndPoint, align=E));
//     draw(t * ((0, 0, 0) -- (0, 0, 2)), arrow=Arrow3(HookHead2, emissive(RED)), p=RED, L=Label("$\vec{e}_z$", position=EndPoint, align=N));
// }

// void draw_xi_eta_axes(triple p) {
//     transform3 t = shift(p);
//     draw(t * ((-0.5, 0, 0) -- (2, 0, 0)), THIN, arrow=Arrow3(HookHead2, emissive(black)), L=Label("$\xi$", position=EndPoint, align=W));
//     draw(t * ((0, -0.5, 0) -- (0, 2, 0)), THIN, arrow=Arrow3(HookHead2, emissive(black)), L=Label("$\eta$", position=EndPoint, align=E));
// }
