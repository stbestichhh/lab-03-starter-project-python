from fastapi import APIRouter
from fastapi.responses import JSONResponse
import numpy

router = APIRouter()


@router.get('')
def hello_world() -> dict:
    return {'msg': 'Hello, World!'}

@router.get('/numpy')
def multiply_matrix():
    A = numpy.random.random_integers(0, 10, (10, 10))
    B = numpy.random.random_integers(0, 10, (10, 10))
    product = A.dot(B);
    return JSONResponse(content={
        'matrix_A': A.tolist(),
        'matrix_B': B.tolist(),
        'product': product.tolist(),
    })
