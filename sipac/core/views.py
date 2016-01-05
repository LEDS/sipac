from django.shortcuts import render

# Create your views here.
from .models import *
from .serializers import *
from rest_framework import generics

##Restfull View

class EstadoList(generics.ListAPIView):
    queryset = Estado.objects.all()
    serializer_class = EstadoSerializer


