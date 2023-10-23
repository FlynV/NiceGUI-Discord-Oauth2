from zenora import APIClient
from nicegui import Tailwind, ui
from nicegui import native_mode, ui
from nicegui import app, ui
import config
from urllib.parse import urlparse
from urllib.parse import parse_qs
from nicegui import app, Client


discordClient = APIClient(config.TOKEN, client_secret=config.CLIENT_SECRET)
discordId = '' #Leave empty
discordName = '' #Leave empty


def logOut():
  ui.open('/')
  
  
@ui.page('/')
async def main_page(client:Client):
 await client.connected()

 with ui.card().classes('absolute-center'):
    with ui.link(target=config.OAUTH_URL): #Button that links us to our Oauth Link.
     ui.button('Log in')


@ui.page('/logged_in')
async def app_page(client:Client):
 await client.connected()
 with ui.card().classes('absolute-center'):
     ui.label('Logged In.')
     ui.label(f' Welcome Back: {discordName}') # Show our new Discord Name
     ui.button('Log Out', on_click=logOut)



@ui.page('/oauth/callback') #Set up a page for Oauth Callback
async def index(client:Client):
    await client.connected()
    url = await ui.run_javascript('window.location.href') #Call Run JS to get the current Url 
    try: 
     parsed_url = urlparse(url) # Retreive the the entire URL (including the code from the  Discord Oauth processs)
     code = parse_qs(parsed_url.query)['code'][0] # Get just the code portion from the url
     access_token = discordClient.oauth.get_access_token(code, config.REDIRECT_URL).access_token #Get Discord Access token using the code retreived. 
     bearer_client = APIClient(access_token, bearer=True) 
     current_user = bearer_client.users.get_current_user() # Our logged in user
     global discordName
     global discordId
     discordName = current_user.username # set Discord name string to our current user name
     discordId = current_user.id  # set Discord name string to our current user id
     ui.open('/logged_in') # Open logged in
    except Exception as e: 
      print(e)
      ui.notify(f'Error Encountered: {e}') # Catch error.


   
   











ui.run( host= 'localhost', native=True) #Native, set false for web. Port used will be 8000, change to 8080 in config and Discord Dev Portal for web app.

