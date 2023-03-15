import pytest
from flask_mod import app


def test_flask_simple():
    app.config['TESTING'] = True
    client = app.test_client()
    result = client.get('/')
    assert b'root' == result.data
