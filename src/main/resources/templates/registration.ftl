<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    ${message?ifExists}
    <div class="mb-2">Registration:</div>
    <@l.login "/registration" true/>
</@c.page>

