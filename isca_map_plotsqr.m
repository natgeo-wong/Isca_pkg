function isca_map_plotsqr (sqrstructure,varargin)



for ii = 1 : length(sqrstructure)
    
    col  = sqrstructure(ii).col;
    breg = sqrstructure(ii).edges;
    blon = breg(1); elon = breg(2); blat = breg(3); elat = breg(4);
    
    x = [ linspace(blon,elon,101) linspace(elon,elon,101) ...
          linspace(elon,blon,101) linspace(blon,blon,101) ];
    y = [ linspace(blat,blat,101) linspace(blat,elat,101) ...
          linspace(elat,elat,101) linspace(elat,blat,101) ];
    if ~isempty(varargin)
        varargin = varargin(:);
        s = size(varargin,1);
        hold on; m_plot(x,y,'k','linewidth',1.5,varargin{1:s}); hold off;
    else
        hold on; m_plot(x,y,'linewidth',1.5,'Color',col); hold off;
    end
    
end

end