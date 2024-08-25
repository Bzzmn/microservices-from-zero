import wikipedia

def wiki(name="War Goddess", lenght=1):
    """This is a wikipedia fetcher"""
    myWiki = wikipedia.summary(name, lenght)
    return myWiki
