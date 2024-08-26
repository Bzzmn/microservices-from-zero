import wikipedia
from textblob import TextBlob
import nltk

# Download the punkt tokenizer if not already present
nltk.download('punkt_tab')



def wiki(name="War Goddess", lenght=1):
    """This is a wikipedia fetcher"""
    myWiki = wikipedia.summary(name, lenght)
    return myWiki


def search_wiki(name):
    """This is a wikipedia name search"""
    results = wikipedia.search(name)
    return results


def phrase(name):
    """This is a wikipedia phrase search"""
    myWiki = wikipedia.summary(name, 1)
    blob = TextBlob(myWiki)
    return blob.noun_phrases
