<p align="center">
	<img src="https://github.com/Viking-Studios-Arma/ONI_Recon_Essentials/blob/5d17ad1523638d20144793f82f990c9eececcb5a/Falcon%20flight%20banner%20W-logo.png" alt="ONI Recon Banner Banner" />
	<br />
	<a href="https://discord.gg/9pJTHHzaFC">
		<img src="https://img.shields.io/discord/1032437213100777502.svg?label=Discord&logo=Discord&colorB=7289da&style=for-the-badge" alt="Discord Server">
	</a>
	<a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3016023028">
		<img src="https://img.shields.io/steam/subscriptions/3016023028?style=for-the-badge" alt="Steam Subscriptions">
	</a>
	
</p>
</p>
<p align="center">
	<a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3016023028">
		<img src="https://img.shields.io/steam/size/3016023028?label=Download&logo=steam" alt="Download" />
	</a>
	<a href="https://github.com/Viking-Studios-Arma/ONI_Recon_Core/releases">
		<img src="https://img.shields.io/github/release/Viking-Studios-Arma/ONI_Recon_Core.svg?label=Version" alt="Version" />
	</a>
	<a href="https://github.com/Viking-Studios-Arma/ONI_Recon_Core/issues">
		<img src="http://img.shields.io/github/issues-raw/Viking-Studios-Arma/ONI_Recon_Core.svg?label=Issues&style=flat" alt="Issues" />
	</a>
	<a href="Viking-Studios-Arma/ONI_Recon_Core/blob/main/LICENSE">
		<img src="https://img.shields.io/github/license/Viking-Studios-Arma/ONI_Recon_Core.svg?style=flat&label=Licence" alt="License">
	</a>
</p>

<p align="center"><sup><strong>Introducing a new Non-Canon UNSC ONI Faction to OPTRE and making life easier for members of ONI Recon.</strong></sup></p>

## Dependencies
### Required
- [CBA A3](https://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
- [Operation TREBUCHET](https://steamcommunity.com/workshop/filedetails/?id=769440155)
- [Operation TREBUCHET First Contact](https://steamcommunity.com/workshop/filedetails/?id=1572627279)
- [ONI Recon - Factions and Equipment](https://steamcommunity.com/sharedfiles/filedetails/?id=2877010969)

### Recommended Mods
Whilst ONI Recon Essentials doesn't depend on the following mods, some individual functionality will be missing without them:
- [ACE](https://steamcommunity.com/workshop/filedetails/?id=463939057)
- [Operation TREBUCHET ACE Compat](https://steamcommunity.com/workshop/filedetails/?id=1267657613)
- [Operation TREBUCHET First Contact ACE Compat](https://steamcommunity.com/workshop/filedetails/?id=1572642262)
- [Task Force Arrowhead Radio (BETA!!!)](https://steamcommunity.com/workshop/filedetails/?id=894678801)
- [ACE3 Arsenal Extended - Core](https://steamcommunity.com/sharedfiles/filedetails/?id=2522638637)
- [Ace Arsenal Category Framework](https://steamcommunity.com/sharedfiles/filedetails/?id=2850254784)

# For Developers of this mod
## Install
We have a build system to allow for key signing and addon compiling.

### Requirements
1. [Git for Windows](https://git-scm.com/download/win)
1. Windows PowerShell v5.1 or higher

To set up your system to use the build script:
- Open Windows PowerShell as Administrator and execute `set-executionpolicy remotesigned`
- In the future, always use PowerShell as Admin

### Windows
If on Windows, use the `tools\make.ps1` file to build the mod for you. It will build the mod, sign the addons, include the public key in the `keys` folder, and also copy across all files found in the `extras` folder, as well as the files specified in the file `tools\support-files.txt`.

The build script will NOT leave the private key in the `keys` folder. It will delete it instead, to avoid any accidental uploading or distribution.

Be aware, that the names of the `.bisign` and `.bikey` files depend on the latest tag on git. This means that, if you wish to upload a release, it is advised to first tag the latest git commit, and then build the mod. That way you have a nice version, such as `VS_ONI_C_v1.0.0.bikey` rather than `VS_ONI_C_-gae17a97.bikey`.
## Naming conventions
For standardisation between class names and to prevent any possible future conflicts with class names the following naming convention has been developed:
- for code: ONI_Recon
- for presentation: ONI Recon - {Addon Name}

## Credits

Thank you to Arend and the 2Bnb for a lot of the scripts i have modified and used in this mod for a lot of the cool features.

</p>
<br />
