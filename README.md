# Discord Oauth2 with [NiceGUI](https://github.com/zauberzeug/nicegui)
### Log in and out using Discord Oauth2 ([Zenora](https://github.com/ahnaf-zamil/zenora)) and [NiceGUI](https://github.com/zauberzeug/nicegui). 

A simple  **Discord Login** using ** [NiceGUI](https://github.com/zauberzeug/nicegui)** and **[Zenora](https://github.com/ahnaf-zamil/zenora)**. 
<p align="center">
  <img src="https://styles.redditmedia.com/t5_7sogo1/styles/communityIcon_7ms8p9yd6eda1.png" />
</p>

# Create Discord Application
Head to [Discord Developer Portal](https://discord.com/developers/applications) and create a new application.
After creating the app, go to OAuth2 tab.
Get ClientID, Client Secret from there (we'll need those later). 

- Head to Bot Tab and reset the Token (save the Token for later, we'll need it as well). 
- Set Redirects to http://localhost:8000/oauth/callback (8000 port for Native, 8080 for Web) 
- Set the default auth link to the redirect we've just created. 
<p align="center">
  <img src="https://i.imgur.com/s1h9fq1.png" />
</p>

- Now head to URL Generator under OAuth2 tab. Select the scopes that your web/standalone application needs.
- Select the Redirect Link as the one we've set before. 
<p align="center">
  <img src="https://i.imgur.com/t3WYLRd.png" />
</p>

- Copy the Generated URL, we'll need this later as well. 

# Required Libs 
> pip install nicegui

> pip install Zenora

[Zenora Discord REST API in Python ](https://github.com/ahnaf-zamil/zenora#zenora) (Read More) 

# Configuring Login (CONFIG PY)
- Open the config (CONFIG PY file):
- TOKEN : Discord Bot Token
- CLIENT_SECRET: Discord App Token 
- REDIRECT_URL: The one we set in Discord Dev Portal (Remember 8000 Port for Native, 8080 for Web) 
- OAUTH_URL: From the 0Auth2 URL Generator

# Run App (AUTH PY)
### If all set right, we'll have a proper Login!
<p align="center">
  <img src="https://i.imgur.com/C3Theco.png" />
</p>
<p align="center">
  <img src="https://i.imgur.com/lhy19X9.png" />
</p>
<p align="center">
  <img src="https://i.imgur.com/qLtRlt9.png" />
</p>

