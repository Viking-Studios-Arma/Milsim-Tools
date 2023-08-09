class CfgMainMenuSpotlight {
	class VS_ONI_C_Main_server {
		text = "Main Ops Server";
		textIsQuote = 0;
		picture = "x\VS_ONI_C\Core\image\ONI_Recon.paa";
		//video = ; //Maybe ill make one, one day (Maybe when i have the energy)
		action = "connectToServer [""45.92.44.67"", 2502, ""password""]"; // Amateur says this goes --> IP, Port, Password
		actionText = "Connect to Main Server";
		condition = true;
	};
	class VS_ONI_C_HM_server { // for the hearts and minds enjoyers
		text = "Hearts and Minds Server";
		textIsQuote = 0;
		picture = "x\VS_ONI_C\Core\image\ONI_Recon.paa";
		//video = ; //Yeah, Maybe not
		action = "connectToServer [""45.92.44.67"", 2602, ""password""]"; // Amateur says this goes --> IP, Port, Password
		actionText = "Connect to H&M Server";
		condition = true; //Lies
	};
};