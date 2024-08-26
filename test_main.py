from fastapi.testclient import TestClient
from main import app

client = TestClient(app)


# This test will fail if the root endpoint does not return a 200 status code or the expected message is not returned.
def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {
        "message": "Wikiopedia API. Call /wiki to get a summary of a wikipedia article or /search to search for articles."
    }


# This test will fail if the search endpoint does not return a 200 status code or the search term "god" is not found in the search results.
def test_read_search():
    response = client.get("/search/god")
    assert response.status_code == 200
    assert any("god" in item.lower() for item in response.json())


# This test will fail if the wiki endpoint does not return a 200 status code or the search term "44th president" is not found in the phrases.
def test_read_phrase():
    response = client.get("/phrase/Barack_Obama")
    assert response.status_code == 200
    assert "44th president" in response.json()["result"]


# This test will fail if the wiki endpoint does not return a 200 status code or the search term "Barack Hussein Obama II" is not found in the wiki summary.
def test_read_wiki():
    response = client.get("/wiki/Barack_Obama")
    assert response.status_code == 200
    assert "Barack Hussein Obama II" in response.json()["result"]
