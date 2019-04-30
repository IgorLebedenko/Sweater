<#import "parts/common.ftl" as c>

<@c.page>
    <div>User editor:</div>
    <div>
        <form action="/users" method="post">
            <input type="text" name="name" value="${user.username}"/>
            <#list roles as role>
                <div>
                    <label>
                        <input type="checkbox" name="${role}"
                            ${user.roles?seq_contains(role)?string("checked", "")}/>
                        ${role}
                    </label>
                </div>
            </#list>
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Save change</button>
        </form>
    </div>
</@c.page>