from django.contrib import admin
from .models import *


# Register your models here.

class EstadoAdmin(admin.ModelAdmin):
    list_display = ('nome', 'codigo')

admin.site.register(Estado, EstadoAdmin)

class MesoRegiaoAdmin(admin.ModelAdmin):
    list_display = ('nome', 'codigo')

admin.site.register(MesoRegiao,MesoRegiaoAdmin)

class MicroRegiaoAdmin(admin.ModelAdmin):
    list_display = ('nome', 'codigo')

admin.site.register(MicroRegiao,MicroRegiaoAdmin)


class MunicipioAdmin(admin.ModelAdmin):
    list_display = ('nome', 'codigo','codigo_completo')

admin.site.register(Municipio,MunicipioAdmin)