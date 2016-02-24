from django.contrib import admin
from .models import *
from core.models import *

class ProdutoAdmin(admin.ModelAdmin):

    list_display = ('nome', 'codigo', 'produto_subgrupo_display')
    list_filter = ['nome','codigo']
    search_fields = ['nome']

    def produto_subgrupo_display(self, obj):
      subgrupo = Subgrupo.objects.get(pk=obj.subgrupo_id)
      return subgrupo.nome_subgrupo
    #
    produto_subgrupo_display.short_description = 'Subgrupo'
#

class ProducaoAdmin(admin.ModelAdmin):

    list_display = ('produto_nome_display','municipio_nome_display', 'area_plantada', 'producao')

    def produto_nome_display(self, obj):

       produto = Produto.objects.get(pk=obj.produto_id)

       return produto.nome


    #def data_display(self, obj):

       #data = Data.objects.get(pk=obj.data_id)

       #return data

    #data_display.short_description = 'Data'

    def municipio_nome_display(self, obj):

       municipio = Municipio.objects.get(pk=obj.municipio_id)

       return municipio.nome

    municipio_nome_display.short_description = 'Municipio'
#
admin.site.register(Produto,ProdutoAdmin)
admin.site.register(Producao,ProducaoAdmin)
#admin.site.register(Familia)
admin.site.register(Fonte)
admin.site.register(Grupo)
admin.site.register(Subgrupo)

