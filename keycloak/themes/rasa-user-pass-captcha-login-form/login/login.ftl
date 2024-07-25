<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
    <#--${msg("login.title",(realm.displayName!''))}-->
    <#elseif section = "form">
        <div class="card card-3">

        <#if realm.password>
            <div class="card-body">
            <div style="text-align:center;">
                <img src="${url.resourcesPath}/img/ihio-logo.png" alt="logo" style="width:200px;">
            </div>
            <h2 class="title" style="text-align:center;">${msg("login.title")}
                <#switch client.clientId?lower_case>
                    <#case "wfm">
                        ${msg("wfm.panel.title")}
                        <#break>
                    <#case "hcp">
                        ${msg("hcp.panel.title")}
                        <#break>
                    <#case "insured">
                        ${msg("insured.panel.title")}
                        <#break>
                    <#case "insurer">
                        ${msg("insurer.panel.title")}
                        <#break>
                    <#case "assessor">
                        ${msg("asr.panel.title")}
                        <#break>
                    <#case "msu">
                        ${msg("msu.panel.title")}
                        <#break>
                    <#case "tpa">
                        ${msg("tpa.panel.title")}
                        <#break>
                    <#default>
                        ${msg("user.title")}
                </#switch>
            </h2>
            <#if message?has_content>
                <div class="alert alert-${message.type}">
                    <span class="message-text">${message.summary?no_esc}</span>
                </div>
            </#if>
            <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;"
                  action="${url.loginAction}" method="post">
                <div class="input-group">
                    <label for="username">${msg("username.title")}</label>
                    <div>
                        <input id="username" class="input--style-3 input-width" type="text"
                               placeholder="${msg("username.title")}" name="username" autocomplete="off">
                    </div>
                </div>
                <div class="input-group">
                    <label for="txtPassword">${msg("password.title")}</label>
                    <div>
                        <input class="input--style-3 input-width" id="txtPassword" type="password"
                               placeholder="${msg("password.title")}" name="password" autocomplete="off">
                    </div>
                </div>
                <#if realm.rememberMe && !usernameEditDisabled??>
                    <div class="checkbox">
                        <label>
                            <#if login.rememberMe??>
                                <input id="rememberMe" name="rememberMe" type="checkbox"
                                       checked> ${msg("rememberMe.title")}
                            <#else>
                                <input id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe.title")}
                            </#if>
                        </label>
                    </div>
                </#if>

                <#if recaptchaRequired??>
                    <div id="botDetectCaptchaId" class="input-group"
                         data-captchastylename="botDetectCaptchaStyle"></div>
                    <label for="botDetectCaptchaUserInput">${msg("captcha.title")}</label>
                    <input id="botDetectCaptchaUserInput" type="text" class="input--style-3 input-width" maxlength="8" autocomplete="off"/>
                    <input id="captchaCodeId" type="hidden" name="userEnteredCaptchaCode"/>
                    <input id="captchaId" type="hidden" name="captchaId"/>
                </#if>
                <div class="p-t-20 p-b-20" style="text-align:center;">
                    <button class="submit" value="${msg('doLogIn.title')}" type="submit">${msg('doLogIn.title')}</button>
                </div>
            </form>
        </#if>
        <#if social.providers??>
            <div style="display: flex;justify-content: center;align-items: baseline;">
                <div id="social-providers">
                    <p><span>${msg('login.with.title')}</span></p>
                </div>
                <#list social.providers as p>
                    <div style="display: flex;justify-content: center;align-items: center;margin-top: 15px;">
                        <input class="${p.displayName}"
                               style="cursor: pointer;color: #425feb;border: none;background-color: #f0f8ff;font-weight: bold;font-size: 15px;"
                               type="button" onclick="location.href='${p.loginUrl}';"
                               value="<#if p.displayName=='gov-oidc'>${msg("govOidc.title")}<#else>${p.displayName}</#if>"/>
                    </div>
                </#list>
            </div>
        </#if>
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div style="margin-top:10px;text-align:center;margin-bottom: 3px;">
                <#--<a href="${url.registrationUrl}" style="color:#425feb;">${msg('doRegister.title')}</a>-->
                <a href="${properties.baseUrl!}/nonsec/user/register"
                   style="color:#425feb;text-decoration: none;cursor: pointer;border: none;background-color: #f0f8ff;">${msg('doRegister.title')}</a>
            </div>
        </#if>
        <div style="text-align: center">
            <#if realm.resetPasswordAllowed>
            <#--<span><a style="color:#425feb;"
                     href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword.title")}</a></span>-->
                <span><a style="color:#425feb;text-decoration: none;cursor: pointer;border: none;background-color: #f0f8ff;"
                         href="${properties.baseUrl!}/nonsec/changePass/steps">${msg("doForgotPassword.title")}</a></span>
            </#if>
        </div>
    </#if>
    <div style="text-align: center;margin-top: 10px">
        <a href="${properties.baseUrl!}${properties.landingPath!}"
           style="text-decoration: none;cursor: pointer;color: #425feb;border: none;background-color: #f0f8ff;">${msg('back.title')}</a>
    </div>
    </div>
    <div class="card-heading"
         style="background: url('${url.resourcesPath}/img/login-icon.jpg') top right/cover no-repeat;background-position: center;background-size: 50rem"></div>
</@layout.registrationLayout>