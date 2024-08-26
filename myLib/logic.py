import wikipedia


def wiki(name="War Goddess", lenght=1):
    """This is a wikipedia fetcher"""
    myWiki = wikipedia.summary(name, lenght)
    return myWiki

def search_wiki(name):
    """This is a wikipedia name search"""
    results = wikipedia.search(name)
    return results