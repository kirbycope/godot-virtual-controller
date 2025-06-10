![Thumbnail](/ci/thumbnail.png)

# godot-virtual-controller
A [physical and] virtual controller for the Godot Game Engine.

## Usage
* Configure button/action assignments in [controls.gd](addons/virtual_controller/scripts/controls.gd).
* Change the virtual controller's theme using an `@export` in [virtual_controller.gd](addons/virtual_controller/scripts/virtual_controller.gd)
* Toogle virtual control sticks's using an `@export` in [virtual_controller.gd](addons/virtual_controller/scripts/virtual_controller.gd)
* Press [F3] in-game to see the debug menu.

## Getting Started
1. Install the addon
2. Add the [canvas_layer.tscn](addons/virtual_controller/scenes/canvas_layer.tscn) as a child node to your Player

<details>
<summary>Using Addon</summary>

### Installing the Addon
1. Download [install-virtual-controller.sh](ci/install-virtual-controller.sh)
1. Move the file to a folder named `ci` in your project
1. Open your project in VS Code
1. Open the "Git Bash" terminal
1. Run `bash ci/install-virtual-controller.sh`
	- This script will download the [virtual_controller](/addons/virtual_controller) folder from _its_ repo and then cleanup the `.git` files/folders.

</details>

<details>
<summary>Web Export</summary>

### Export Game as Web App
1. Select "Project" > "Export..."
1. Select the preset "Web (Runnable)"
1. Select "Export Project..."
1. Select the "docs" folder
	- The GitHub Pages config points to the `main` branch and `/docs` directory
1. Enter `index.html`
1. Select "Save"
1. Commit the code to trigger a GitHub Pages deployment (above)

### Export Game as Web App Using Bash
1. Open the root folder using [VS Code](https://code.visualstudio.com/)
	- If you use GitHub Desktop, select the "Open in Visual Studio" button
1. Open the [integrated terminal](https://code.visualstudio.com/docs/editor/integrated-terminal) using the "Git Bash" profile
1. Run the following command, `bash ci/export-web.sh`

</details>

<details>
<summary>Web Hosting with localhost</summary>

### Install and Enable Live Server
[Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) allows you to host web pages, locally, from VSCode.

### Running/Hosting the App Locally
1. In VSCode's Explorer right-click on [docs/index.html](docs/index.html) and select "Open with Live Server"
1. Then you visit [https://127.0.0.1:5500/docs/index.html](https://127.0.0.1:5500/docs/index.html)
1. To get your "Host Local IP Address", use terminal to run:
	- [Windows] `ipconfig`
	- [MacOS] `ipconfig getifaddr en0`
1. On a device connected to the same wifi as the host, navigate to `https://{host.local.ip.address}:5500/docs/index.html`
	- Replace `{host.local.ip.address}` with your "Host Local IP Address" from earlier

</details>

<details>
<summary>Access localhost from Devices on Same Wifi Network</summary>

### Generate HTTPS Certificate
"Secure Context - Check web server configuration (use HTTPS)" The following features required to run Godot projects on the Web. Do the following to setup
1. Download and install the [ssl binary](https://wiki.openssl.org/index.php/Binaries)
	- [Windows] Use [OpenSSL for Windows](https://slproweb.com/products/Win32OpenSSL.html)
	- [MacOS] Use [Homebrew](https://brew.sh/) by running, `brew install openssl@3`
1. Confirm installation by running `openssl -v` in cmd/terminal
1. Open the root folder using [VS Code](https://code.visualstudio.com/)
	- If you use GitHub Desktop, select the "Open in Visual Studio" button
1. Open the [integrated terminal](https://code.visualstudio.com/docs/editor/integrated-terminal)
1. Run `openssl genrsa -aes256 -out localhost.key 2048`
	- You will be prompted for a "PEM pass phrase", remember this for the next step
	- `godot`
1. Run `openssl req -days 3650 -new -newkey rsa:2048 -key localhost.key -x509 -out localhost.pem`
	- You will be prompted for the "PEM pass phrase"
	- Fill out the rest of the information as the prompts request
		- "Country Name (2 letter code) [AU]:"`US`
		- "State or Province Name (full name) [Some-State]:"`WA`
		- "Locality Name (eg, city) []:"`Seattle`
		- "Organization Name (eg, company) [Internet Widgits Pty Ltd]:"`Timothy Cope`
		- "Organizational Unit Name (eg, section) []:"`Development`
		- "Common Name (e.g. server FQDN or YOUR name) []:"`localhost`
		- "Email Address []:"`kirbycope@gmail.com`
1. Open/Create `.vscode/settings.json` in the root of your project
1. Copy+paste the following:
	```
	{
		"liveServer.settings.root": "/",
		"liveServer.settings.https": {
			"enable": true,
			"cert": "{path/to/your/}localhost.pem",
			"key": "{path/to/your/}localhost.key",
			"passphrase": "{PEM pass phrase}"
		}
	}
	```
	- Replace `{PEM pass phrase}` with your "PEM pass phrase" from earlier
1. Restart VSCode (or the terminal, at least)

</details>

<details>
<summary>Web Hosting with GitHub Pages</summary>

### Set Up GitHub Pages
Note: This only needs to be done once.
1. Go to the "Settings" tab of the repo
1. Select "Pages" from left-nav
1. Select `main` branch and `/docs` directory, then select "Save"
	- A GitHub Action will deploy your website
1. On the main page of the GitHub repo, click the gear icon next to "About"
1. Select "Use your GitHub Pages website", then select "Save changes"

</details>
