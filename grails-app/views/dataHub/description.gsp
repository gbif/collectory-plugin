<%@ page import="grails.converters.JSON; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.DataHub" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.skin.layout}" />
        <title><g:message code="dataHub.base.label" default="Edit data hub metadata" /></title>
    </head>
    <body>
        <div class="nav">
        <h1><g:message code="collection.title.editing" />: ${command.name}</h1>
        </div>
        <div id="baseForm" class="body">
            <g:if test="${message}">
            <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${command}">
            <div class="errors">
                <g:renderErrors bean="${command}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="baseForm" action="base">
                <g:hiddenField name="id" value="${command?.id}" />
                <g:hiddenField name="version" value="${command.version}" />
                <div class="dialog">
                    <table class="col-md-12">
                        <tbody>

                        <!-- public description -->
                        <tr class="prop form-group">
                            <td valign="top" class="name col-md-2">
                              <label for="pubDescription"><g:message code="providerGroup.pubDescription.label" default="Public Description" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: command, field: 'pubDescription', 'errors')} col-md-10">
                                <g:textArea name="pubDescription" cols="40" rows="${cl.textAreaHeight(text:command.pubDescription)}" value="${command.pubDescription}" class="form-control" />
                                <cl:helpText code="providerGroup.pubDescription"/>
                              </td>
                              <cl:helpTD/>
                        </tr>

                        <!-- tech description -->
                        <tr class="prop form-group">
                            <td valign="top" class="name col-md-2">
                              <label for="techDescription"><g:message code="providerGroup.techDescription.label" default="Technical Description" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: command, field: 'techDescription', 'errors')} col-md-10">
                                <g:textArea name="techDescription" cols="40" rows="${cl.textAreaHeight(text:command.techDescription)}" value="${command?.techDescription}" class="form-control"/>
                                <cl:helpText code="providerGroup.techDescription"/>
                              </td>
                              <cl:helpTD/>
                        </tr>

                        <!-- focus -->
                        <tr class="prop form-group">
                            <td valign="top" class="name col-md-2">
                              <label for="focus"><g:message code="providerGroup.focus.label" default="Contribution" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: command, field: 'focus', 'errors')} col-md-10">
                                <g:textArea name="focus" cols="40" rows="${cl.textAreaHeight(text:command.focus)}" value="${command?.focus}" class="form-control"/>
                                <cl:helpText code="providerGroup.focus"/>
                            </td>
                          <cl:helpTD/>
                        </tr>

                      </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><input type="submit" name="_action_updateDescription" value="${message(code:"collection.button.update")}" class="save btn btn-default"></span>
                    <span class="button"><input type="submit" name="_action_cancel" value="${message(code:"collection.button.cancel")}" class="cancel btn btn-default"></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
