<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    ${message?ifExists}
    <div>Add new user:</div>
    <@l.login "/registration"/>
</@c.page>

