from app import somar

def test_somar():
    assert somar(2, 3) == 5
    assert somar(-1, 1) == 0