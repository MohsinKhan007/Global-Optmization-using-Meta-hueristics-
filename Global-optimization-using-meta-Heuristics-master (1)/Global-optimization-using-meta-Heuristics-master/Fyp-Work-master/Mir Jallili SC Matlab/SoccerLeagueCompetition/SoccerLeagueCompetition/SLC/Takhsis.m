function League=Takhsis(League);


    global SCASettings;

    

    nTeam=SCASettings.nTeam;
    nMainPlayer=SCASettings.nMainPlayer;
    nReservePlayer=SCASettings.nReservePlayer;
    
    for jj=1:nTeam
    MainPlayer(:,jj)=League(jj,1).MPlayer;
    RvrsPlayer(:,jj)=League(jj,1).RPlayer;
    end

   
    Player=[MainPlayer;
            RvrsPlayer];
    PlayerCost=[Player.Cost];
    
    [a1, SortOrder]=sort(PlayerCost);

    Player=Player(SortOrder);
    

    kk=0;
    for jj=1:nTeam
    kk=kk+nMainPlayer;
    League(jj,1).MPlayer=Player(kk-nMainPlayer+1:kk)';
    kk=kk+nReservePlayer;
    League(jj,1).RPlayer=Player(kk-nReservePlayer+1:kk)';
    end
    
end
