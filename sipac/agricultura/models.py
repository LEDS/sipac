from django.db import models
from core.models import Municipio, MicroRegiao,MesoRegiao,Data

class Produto(models.Model):

    nome = models.CharField(max_length=100)

    codigo = models.IntegerField()

    def __str__(self):
        return self.nome

    class Meta:
        ordering = ['nome']

class Producao(models.Model):

    ano = models.IntegerField()

    mes = models.IntegerField()

    data = models.ForeignKey(Data,on_delete=models.CASCADE)

    preco = models.FloatField()

    produto = models.ForeignKey(Produto,on_delete=models.CASCADE)

    municipio = models.ForeignKey(Municipio,on_delete=models.CASCADE)

    microregiao = models.ForeignKey(MicroRegiao,on_delete=models.CASCADE)

    mesoregiao = models.ForeignKey(MesoRegiao,on_delete=models.CASCADE)

    def __str__(self):
        return "Producao"

    class Meta:
        ordering = ['data']