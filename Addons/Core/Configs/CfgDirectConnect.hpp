class CfgMainMenuSpotlight {
	class ONI_CORE_Main_server {
		text = "Main Ops Server";
		textIsQuote = 0;
		picture = "x\vs_oni_c\Core\img\Oni-recon.paa";
		//video = ; //Maybe ill make one, one day (Maybe when i have the energy)
		action = "connectToServer [""45.92.44.67"", 2302, """"]"; // Amateur says this goes --> IP, Port, Password
		actionText = "Connect to Main Server";
		condition = true;
	};
	class ONI_CORE_2nd_server { // for the hearts and minds enjoyers
		text = "2BnB Mike Force Server";
		textIsQuote = 0;
		picture = "x\vs_oni_c\Core\img\Oni-recon.paa";
		//video = ; //Yeah, Maybe not
		action = "connectToServer [""45.92.44.67"", 2502, """"]"; // Amateur says this goes --> IP, Port, Password
		actionText = "Connect to 2BnB Server";
		condition = true; //Lies
	};
};