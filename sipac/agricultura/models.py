from django.db import models
from core.models import Municipio, MicroRegiao,MesoRegiao
import uuid

class Produto(models.Model):

    nome = models.CharField(max_length=100)

    codigo = models.CharField(max_length=20)

    def __str__(self):
        return self.nome  + " - " + self.codigo

    class Meta:
        ordering = ['nome']

class Producao(models.Model):

    code = uuid.uuid4()

    ano = models.IntegerField()

    mes = models.IntegerField()

    preco = models.FloatField()

    produto = models.ForeignKey(Produto,on_delete=models.CASCADE)

    municipio = models.ForeignKey(Municipio,on_delete=models.CASCADE)

    microregiao = models.ForeignKey(MicroRegiao,on_delete=models.CASCADE)

    mesoregiao = models.ForeignKey(MesoRegiao,on_delete=models.CASCADE)

    def __str__(self):
        produto = Produto.objects.get(pk=self.produto.id)
        return str(produto.nome) + " | " +str(produto.codigo)

    class Meta:
        ordering = ['ano']