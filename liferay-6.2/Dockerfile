FROM marrih/naseej-medad:latest

MAINTAINER Marwan Alrihawi <marwan.alrihawi@naseej.com>

RUN ln -s /opt/liferay-portal-6.2-ce-ga6 /opt/liferay-portal

ENV LIFERAY_PATH_DIR=/opt/liferay-portal


# add configuration liferay file
ADD lep/portal-bundle.properties /opt/liferay-portal-6.2-ce-ga6/portal-bundle.properties
ADD lep/portal-bd-MYSQL.properties /opt/liferay-portal-6.2-ce-ga6/portal-bd-MYSQL.properties
ADD lep/portal-bd-POSTGRESQL.properties /opt/liferay-portal-6.2-ce-ga6/portal-bd-POSTGRESQL.properties

ADD lep/portal-ext.properties /opt/liferay-portal-6.2-ce-ga6/portal-ext.properties
ADD lep/portal-setup-wizard.properties /opt/portal-setup-wizard.properties
