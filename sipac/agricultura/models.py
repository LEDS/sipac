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

class Grupo(models.Model):
    nome_grupo = models.CharField(max_length=25)
    grupo = models.ForeignKey("self", blank=True, null=True, related_name="children")

    def __str__(self):
        return self.nome_grupo
    #
#

"""class Subgrupo(models.Model):
    nome_subgrupo = models.CharField(max_length=25)
    grupo = models.ForeignKey(Grupo)


    def __str__(self):
        return self.nome_subgrupo
    #
#
"""

class Produto(models.Model):

    nome = models.CharField(max_length=100)
    codigo = models.CharField(max_length=20)
    grupo = models.ForeignKey(Grupo)

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

    area_plantada = models.IntegerField(null=True)
    producao = models.IntegerField(null=True)
    valido = models.BooleanField(default=True, blank=True)
    area_colhida = models.IntegerField(null=True)
    area_em_formacao = models.IntegerField(null=True)
    irrigado = models.CharField(max_length = 2, null=True)


    def __str__(self):
        produto = Produto.objects.get(pk=self.produto.id)
        return str(produto.nome) + " | " +str(produto.codigo)

    class Meta:
        ordering = ['ano']
#


