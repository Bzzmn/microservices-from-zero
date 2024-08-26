from fastapi import FastAPI
import uvicorn
from myLib.logic import wiki as search_name, search_wiki, phrase as search_phrase

app = FastAPI()


@app.get("/")
async def root():
    """Root endpoint"""
    return {
        "message": "Wikiopedia API. Call /wiki to get a summary of a wikipedia article or /search to search for articles."
    }


@app.get("/search/{name}")
async def search(name: str):
    """Search for a wikipedia article by name"""
    return search_wiki(name)


@app.get("/wiki/{name}")
async def get_name(name: str):
    """Retrieve wikipedia page and return phrases"""
    result = search_name(name)
    return {"result": result}


@app.get("/phrase/{name}")
async def get_phrase(name: str):
    """Retrieve wikipedia page and return phrases"""
    result = search_phrase(name)
    return {"result": result}


if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)
