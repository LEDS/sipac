from django.db import models
from core.models import Municipio, MicroRegiao,MesoRegiao
import uuid

class Fonte(models.Model):
    codigo = models.IntegerField()
    nome = models.CharField(max_length=20)

    def __str__(self):
        return self.codigo
    #
    class Meta:
        ordering = ['codigo']
    #
#

class Familia(models.Model):
    nome = models.CharField(max_length=40)

    def __str__(self):
        return self.nome
    #

    class Meta:
        ordering = ['nome']
    #
#

class Produto(models.Model):

    nome = models.CharField(max_length=100)
    codigo = models.CharField(max_length=20)
    #familia = models.ForeignKey(Familia)

    def __str__(self):
        return self.nome  + " - " + self.codigo

    class Meta:
        ordering = ['nome']
    #
#


class Producao(models.Model):

    code = uuid.uuid4()
    ano = models.IntegerField()
    mes = models.IntegerField()
    produto = models.ForeignKey(Produto,on_delete=models.CASCADE)
    municipio = models.ForeignKey(Municipio,on_delete=models.CASCADE)
    fonte = models.ManyToManyField(Fonte)

    #~ data_atualizacao = models.DateTimeField()
    area_plantada = models.IntegerField()
    area_em_producao = models.IntegerField()
    area_colhida = models.IntegerField()
    area_em_formacao = models.IntegerField()
    #irrigado = models.BooleanField(default=False)
    irrigado = models.CharField(max_length = 2)


    def __str__(self):
        produto = Produto.objects.get(pk=self.produto.id)
        return str(produto.nome) + " | " +str(produto.codigo)

    class Meta:
        ordering = ['ano']
#
