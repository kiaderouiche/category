from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceCheck


class PostgreSQLServerLogConnectionsEnabled(BaseResourceCheck):
    def __init__(self):
        name = "Ensure server parameter 'log_connections' is set to 'ON' for PostgreSQL Database Server"
        id = "CKV_AZURE_31"
        supported_resources = ['azurerm_postgresql_configuration']
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf['name'][0] == 'log_connections' and conf['value'][0] == 'off':
            return CheckResult.FAILED
        return CheckResult.PASSED


check = PostgreSQLServerLogConnectionsEnabled()
