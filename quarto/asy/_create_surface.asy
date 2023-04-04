include _config;
include _config3d;

currentlight=light(specularfactor=3, (-1, 0.2, 1));
currentprojection=orthographic((1, 1, 1));

real a = 6.0;
real b = 8.0;
real c = 4.0;

triple[][] p = new triple[][] {{    (0, 0, 0),        (0.33a, 0, c),        (0.66a, 0, c),       (a, 0, 0)},
                               {(0, 0.33b, 0), (0.45a, 0.45b, 1.8c), (0.55a, 0.45b, 1.8c), (a, 0.5b, 0.5c)},
                               {(0, 0.66b, 0), (0.45a, 0.55b, 1.8c), (0.55a, 0.55b, 1.8c), (a, 0.5b, 0.5c)},
                               {(0, b, -0.2c),     (0.33a, b, 1.5c),        (0.66a, b, c),    (a, b, -.1c)}};

surface Sigma = surface(patch(p));
draw(Sigma, yellow);

/*
draw_xyz_frame((-0.15a, 0.55b, -c));
draw_xi_eta_axes((0.9a, 0.2b, -0.1c));
*/

label("$\varsigma$", Sigma.s[0].point(0.98, 0.98), align=NW);
