<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <g:set var="entityName" value="${entityType}" />
        <g:set var="entityNameLower" value="${cl.controller(type: entityType)}"/>
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <ul>
            <li><span class="menuButton"><cl:homeLink/></span></li>
                <li><span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span></li>
             <g:if test="${grailsApplication.config.gbifRegistrationEnabled == 'true'}">
                <li><span class="menuButton"><g:link class="create" action="updateAllGBIFRegistrations">
                    <g:message code="dataProvider.gbif.update.all" default="Update all existing GBIF registrations" />
                </g:link></span></li>
             </g:if>
            </ul>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="list">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="${message(code: 'dataProvider.name.label', default: 'Name')}" />

                            <g:sortableColumn property="uid" title="${message(code: 'providerGroup.uid.label', default: 'UID')}" />

                            <th style="text-align:center;">${message(code: 'dataProvider.resources.label', default: 'No. resources')}</th>

                            <g:if test="${grailsApplication.config.gbifRegistrationEnabled == 'true'}">
                                <th style="text-align:center;">${message(code: 'dataProvider.gbif.label', default: 'GBIF')}</th>
                            </g:if>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${instanceList}" status="i" var="instance">
                      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link controller="dataProvider" action="show" id="${instance.uid}">${fieldValue(bean: instance, field: "name")}</g:link></td>

                        <td>${fieldValue(bean: instance, field: "uid")}</td>

                        <td style="text-align:center;">${instance.resources.size()}</td>

                        <g:if test="${grailsApplication.config.gbifRegistrationEnabled == 'true'}">

                            <td class="text-nowrap">
                                <g:if test="${fieldValue(bean: instance, field: "gbifRegistryKey")}">
                                    <g:link controller="dataProvider" action="updateGBIF" id="${instance.uid}">
                                        ${message(code: 'dataProvider.gbif.update', default: 'Update')}
                                    </g:link> |
                                    <a href="https://gbif.org/publisher/${instance.gbifRegistryKey}">
                                        ${message(code: 'dataProvider.gbif.show', default: 'Show')}
                                    </a>
                                </g:if>
                                <g:else>
                                    <g:link controller="dataProvider" action="registerGBIF" id="${instance.uid}">
                                        ${message(code: 'dataProvider.gbif.register', default: 'Register')}
                                    </g:link>
                                </g:else>
                            </td>

                        </g:if>

                      </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="paginateButtons">
                <g:paginate controller="dataProvider" action="list" total="${instanceTotal}" />
            </div>
        </div>
    </body>
</html>
