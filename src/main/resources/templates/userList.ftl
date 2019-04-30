<#import "parts/common.ftl" as c>

<@c.page>
    List of users:
    <table>
        <thead>
            <tr>
                <td>Name</td>
                <td>Roles</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <td>${user.username}</td>
                    <td>
                        <#list user.roles as role>${role}<#sep>, </#list>
                    </td>
                    <td>
                        <a href="/users/${user.id}">Edit</a>
                    </td>
                </tr>
            </#list>
        </tbody>
    </table>
</@c.page>