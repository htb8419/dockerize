<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${msg("login.title",(realm.displayName!''))}</title>
        <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.png" type="image/x-icon">
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>

        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <script type="text/javascript">
            var captchaUrl = '${properties.captchaEndpointUrl!}';
        </script>
    </head>

    <body>
    <#--  <#nested "header">  -->
    <div class="page-wrapper bg-gra-01 p-t-85">
        <div class="wrapper wrapper--w780">
            <#nested "form">
        </div>
    </div>
    </body>
    </html>
</#macro>