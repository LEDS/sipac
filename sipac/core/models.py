from django.db import models

# Modelos que são comuns para todos os modulos

class Estado(models.Model):

    nome = models.CharField(max_length=50)

    codigo = models.IntegerField()

    def __str__(self):
        return self.nome

    class Meta:
        ordering = ['nome']


class MesoRegiao(models.Model):

    nome = models.CharField(max_length=50)

    codigo = models.IntegerField()

    estado = models.ForeignKey(Estado,on_delete=models.CASCADE)

    def __str__(self):
        return self.nome

    class Meta:
        ordering = ['nome']


class MicroRegiao(models.Model):

    nome = models.CharField(max_length=50)

    codigo = models.IntegerField()

    mesoregiao = models.ForeignKey(MesoRegiao,on_delete=models.CASCADE)

    def __str__(self):
        return self.nome

    class Meta:
        ordering = ['nome']

class Municipio (models.Model):

    nome = models.CharField(max_length=50)

    codigo = models.IntegerField()

    codigo_completo = models.BigIntegerField()

    microregiao = models.ForeignKey(MicroRegiao,on_delete=models.CASCADE)

    def __str__(self):
        return self.nome

    class Meta:
        ordering = ['nome']