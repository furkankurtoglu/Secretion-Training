close all
clear
clc

cd output

s=what;
MatFiles = s.mat;
OutMatFiles = MatFiles(contains(MatFiles,'micro'));
OutMatFiles(1) = [];
OutMatFiles(1) = [];
for i = 1:length(OutMatFiles)
    OutMatFiles{i}=OutMatFiles{i}(1:14);
end

%%
CellMatFiles = MatFiles(contains(MatFiles,'physicell'));
CellMatFiles(1:2) = [];
for j = i:length(CellMatFiles)
   CellMatFiles 
end

%%
for i = 1:length(OutMatFiles)

    xmlname=strcat(OutMatFiles{i},'.xml');
    MCDS = read_MultiCellDS_xml( xmlname);
    
    %% Chemical A
    k = find( MCDS.mesh.Z_coordinates == 0 );
    h1 = figure(1);
    filename1="Oxygen.gif";
    contourf( MCDS.mesh.X(:,:,k), MCDS.mesh.Y(:,:,k), MCDS.continuum_variables(1).data(:,:,k) ,20 ) ;
    axis image
    colorbar
    xlabel( sprintf( 'x (%s)' , MCDS.metadata.spatial_units) );
    ylabel( sprintf( 'y (%s)' , MCDS.metadata.spatial_units) );

    title( sprintf('%s (%s) at t = %3.2f %s, z = %3.2f %s', MCDS.continuum_variables(1).name , ...
        MCDS.continuum_variables(1).units , ...
        MCDS.metadata.current_time , ...
        MCDS.metadata.time_units, ...
        MCDS.mesh.Z_coordinates(k), ...
        MCDS.metadata.spatial_units ) );
    frame = getframe(h1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File
    if i == 1
        imwrite(imind,cm,filename1,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename1,'gif','WriteMode','append');
    end

    
    %% Chemical B
    k = find( MCDS.mesh.Z_coordinates == 0 );
    h = figure(2);
    filename="Chemical_A.gif";
    contourf( MCDS.mesh.X(:,:,k), MCDS.mesh.Y(:,:,k), MCDS.continuum_variables(2).data(:,:,k) ,20 ) ;
    axis image
    colorbar
    xlabel( sprintf( 'x (%s)' , MCDS.metadata.spatial_units) );
    ylabel( sprintf( 'y (%s)' , MCDS.metadata.spatial_units) );

    title( sprintf('%s (%s) at t = %3.2f %s, z = %3.2f %s', MCDS.continuum_variables(2).name , ...
        MCDS.continuum_variables(2).units , ...
        MCDS.metadata.current_time , ...
        MCDS.metadata.time_units, ...
        MCDS.mesh.Z_coordinates(k), ...
        MCDS.metadata.spatial_units ) );
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
    
    %% Chemical C
    k = find( MCDS.mesh.Z_coordinates == 0 );
    h = figure(3);
    filename="Chemical_A.gif";
    contourf( MCDS.mesh.X(:,:,k), MCDS.mesh.Y(:,:,k), MCDS.continuum_variables(3).data(:,:,k) ,20 ) ;
    axis image
    colorbar
    xlabel( sprintf( 'x (%s)' , MCDS.metadata.spatial_units) );
    ylabel( sprintf( 'y (%s)' , MCDS.metadata.spatial_units) );

    title( sprintf('%s (%s) at t = %3.2f %s, z = %3.2f %s', MCDS.continuum_variables(3).name , ...
        MCDS.continuum_variables(3).units , ...
        MCDS.metadata.current_time , ...
        MCDS.metadata.time_units, ...
        MCDS.mesh.Z_coordinates(k), ...
        MCDS.metadata.spatial_units ) );
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    % Write to the GIF File
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end



end 

cd ..