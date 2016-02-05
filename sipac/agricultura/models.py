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

    code = uuid.uuid4() # Pra quê isso <--
    ano = models.IntegerField()
    mes = models.IntegerField()
    produto = models.ForeignKey(Produto,on_delete=models.CASCADE)
    municipio = models.ForeignKey(Municipio,on_delete=models.CASCADE)

    #~ data_atualizacao = models.DateTimeField()
    area_plantada = models.DecimalField(max_digits = 10, decimal_places=2)
    area_em_producao = models.DecimalField(max_digits = 10, decimal_places=2)
    area_colhida = models.DecimalField(max_digits = 10, decimal_places=2)
    area_em_formacao = models.DecimalField(max_digits = 10, decimal_places=2)
    irrigado = models.BooleanField(default=False)


    def __str__(self):
        produto = Produto.objects.get(pk=self.produto.id)
        return str(produto.nome) + " | " +str(produto.codigo)

    class Meta:
        ordering = ['ano']
