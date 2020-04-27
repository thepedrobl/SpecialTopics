function r = projections(f,g)
    plot3(1.5*f.X(:,1)./f.X(:,1), f.X(:,2), f.X(:,3), 'Color', '#0072BD')
    plot3(f.X(:,1), 1.5*f.X(:,2)./f.X(:,2), f.X(:,3), 'Color', '#0072BD')
    plot3(f.X(:,1), f.X(:,2), -0.75*f.X(:,3)./f.X(:,3), 'Color', '#0072BD')

    plot3(1.5*g.X(:,1)./g.X(:,1), g.X(:,2), g.X(:,3), 'Color', '#D95319')
    plot3(g.X(:,1), 1.5*g.X(:,2)./g.X(:,2), g.X(:,3), 'Color', '#D95319')
    plot3(g.X(:,1), g.X(:,2), -0.75*g.X(:,3)./g.X(:,3), 'Color', '#D95319')
end