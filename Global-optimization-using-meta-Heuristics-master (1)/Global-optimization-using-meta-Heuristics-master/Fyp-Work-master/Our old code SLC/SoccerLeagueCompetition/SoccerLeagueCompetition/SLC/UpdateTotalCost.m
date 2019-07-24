function League=UpdateTotalCost(League)

    global SCASettings;
    nTeam=SCASettings.nTeam;
    SSay=SCASettings.SSay;
    nMainPlayer=SCASettings.nMainPlayer;
    nReservePlayer=SCASettings.nReservePlayer;

    for k=1:nTeam
        for jj=1:nMainPlayer
            x(jj)=League(k,1).MPlayer(jj,1).Cost;
        end
        League(k).TotalCost=1/mean(x);      
    end

end