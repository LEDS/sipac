from django.contrib import admin
from .models import *
from core.models import *

class ProdutoAdmin(admin.ModelAdmin):

    list_display = ('nome', 'codigo')


class ProducaoAdmin(admin.ModelAdmin):

    list_display = ('ano', 'mes','preco','produto_nome_display',
                    'municipio_nome_display','microregiao_nome_display',
                    'mesorgiao_nome_display')

    def produto_nome_display(self, obj):

       produto = Produto.objects.get(pk=obj.produto_id)

       return produto.nome

    produto_nome_display.short_description = 'Produto'

    def municipio_nome_display(self, obj):

       municipio = Municipio.objects.get(pk=obj.municipio_id)

       return municipio.nome

    municipio_nome_display.short_description = 'Municipio'


    def microregiao_nome_display(self, obj):

       microregiao = MicroRegiao.objects.get(pk=obj.microregiao_id)

       return microregiao.nome

    microregiao_nome_display.short_description = 'Microregiao'

    def mesorgiao_nome_display(self, obj):

       mesoregiao = MesoRegiao.objects.get(pk=obj.mesoregiao_id)

       return mesoregiao.nome

    mesorgiao_nome_display.short_description = 'Mesoregiao'

admin.site.register(Produto,ProdutoAdmin)
admin.site.register(Producao,ProducaoAdmin)

